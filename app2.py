import flask
import pytest
import requests
from flask import Flask, request, render_template, session, abort, flash
import fixture

from extension import db, cors
from flask.views import MethodView
from werkzeug.utils import secure_filename, redirect
from models import Book, borrowInfo, User
import numpy
import config
from sqlalchemy import create_engine, false, and_
from sqlalchemy import exists
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

import os
import openai

from booktype import BookType

app = Flask(__name__)
app.config.from_object(config)
app.config['SECRET_KEY'] = '123abc456'
db.init_app(app)
cors.init_app(app)


@app.route('/')
def hello_world():  # put application's code here
    return 'welcome to library'


# manage page
@app.route('/manage/')
def manage():
    return render_template('managerPage.html')

# qrcode test
@app.route('/qrcode')
def qrcode():
    return render_template('QRcode.html')


# index page
@app.route('/library')
def library():
    books: [Book] = Book.query.all()
    results = [
        {
            'bookId': book.bookId,
            'bookName': book.bookName,
            'author': book.author,
            'ISBN': book.ISBN,
            'category': BookType.getString(book.category),
            'quantity': book.quantity,
        } for book in books
    ]
    return render_template('user/categoryPage.html',books=results)

@app.route('/userInfo/')
def userInfo():
    if not session.get('username'):
        return redirect('/signIn/')
    user = User.query.filter_by(username=session.get('username')).first()
    return render_template('user/userInfo.html',user=user)

# signIn page
@app.route('/signIn/', methods=['GET', 'POST'])
def signin():
    if request.method == 'GET':
        return render_template('signInPage.html', message='')
    else:
        if request.form.get('username'):
            username = request.form.get('username')
            password = request.form.get('password')
            user = User.query.filter_by(username=username, password=password).first()
            if user:
                session['userId'] = user.userId
                session['username'] = user.username
                session['name'] = user.name
                return redirect('/userInfo/')
                # return 'yes'
            else:
                flash('用户名或密码错误',category='error')
                return redirect('/signIn/')
                # return 'no'
        else:
            admin_username = request.form.get('admin_username')
            admin_password = request.form.get('admin_password')
            user = User.query.filter_by(username=admin_username, password=admin_password).first()
            if user:
                if user.admin == 1:
                    session['userId'] = user.userId
                    session['username'] = user.username
                    session['name'] = user.name
                    return redirect('/manage/')
                    # return 'yes'
                else:
                    flash('您不是管理员',category='error')
                    return redirect('/signIn/')
                    # return 'no admin'
            else:
                flash('用户名或密码错误',category='error')
                return redirect('/signIn/')
                # return 'no'


# register page
@app.route('/register/', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template('registerPage.html')
    else:
        name = request.form.get('name')
        username = request.form.get('username')
        password = request.form.get('password')
        user = User()
        user.name = name
        user.username = username
        user.password = password
        user.admin = 0
        db.session.add(user)
        db.session.commit()
        session['userId'] = user.userId
        session['username'] = user.username
        session['name'] = user.name
        return redirect('/library')



# signOut
@app.route('/signOut/')
def signOut():
    session.clear()
    return redirect('/signIn/')


# category page
@app.route('/library/<string:btype>/')
def category(btype):
    if BookType.getString(btype) == 'error':
        abort(404)
    typestr = BookType.getString(btype)
    books: [Book] = Book.query.filter_by(category=BookType.getValue(btype)).all()
    results = [
        {
            'bookId': book.bookId,
            'bookName': book.bookName,
            'author': book.author,
            'ISBN': book.ISBN,
            'category': typestr,
            'quantity': book.quantity,
        } for book in books
    ]
    return render_template('user/categoryPage.html', books=results, btype = btype)  # 前端用btype请求categoryAPI
    # return 'yes'


# -------------------user check API------------------- #
@app.route('/register/usernameExit', methods=['GET', ])
def usernameExit():
    username = request.args.get('username')
    user = User.query.filter_by(username=username).first()
    if user:
        return 'yes'
    else:
        return 'no'

# -----------------user check API end----------------- #


# --------------------category API-------------------- #
# 获取所有分类
@app.route('/categories/', methods=['GET', ])
def get_all_categories():
    return {
        'status': 'success',
        'message': '所有分类查询成功',
        'results': [
            {
                'bookType': BookType.getString(i),
                'bookTypeId': i
            } for i in range(1, 6)
        ]
    }


# 获取特定分类书籍
@app.route('/categories/<int:book_type>', methods=['GET', ])
def get_categories(book_type):
    if BookType.getString(book_type) == 'error':
        abort(404)
    books: [Book] = Book.query.filter_by(category=book_type).all()
    book_type = BookType.getString(book_type)
    results = [
        {
            'bookId': book.bookId,
            'bookName': book.bookName,
            'author': book.author,
            'ISBN': book.ISBN,
            'category': book_type,
            'quantity': book.quantity,
        } for book in books
    ]
    return {
        'status': 'success',
        'message': book_type + '类查询成功',
        'results': results
    }


# ------------------category API end------------------ #


# ----------------------book API---------------------- #
class BookApi(MethodView):
    @staticmethod
    def get(book_id):

        if not book_id:
            books: [Book] = Book.query.all()
            results = [
                {
                    'bookId': book.bookId,
                    'bookName': book.bookName,
                    'author': book.author,
                    'ISBN': book.ISBN,
                    'category': book.category,
                    'quantity': book.quantity,
                } for book in books
            ]
            return {
                'status': '返回所有书本',
                'message': '数据查询成功',
                'results': results
            }
        book: Book = Book.query.get(book_id)
        return {
            'status': '返回指定ID书本',
            'message': '数据查询成功',
            'result': {
                'bookId': book.bookId,
                'bookName': book.bookName,
                'author': book.author,
                'ISBN': book.ISBN,
                'category': book.category,
                'quantity': book.quantity,
            }
        }

    # 从网页表单添加书本至数据库中
    @staticmethod
    def post():
        book = Book()
        book.bookName = request.form.get('bookName')
        book.author = request.form.get('author')
        book.ISBN = request.form.get('ISBN')
        book.category = request.form.get('category')
        book.quantity = request.form.get('quantity')
        db.session.add(book)
        db.session.commit()

        return {
            'status': 'success',
            'message': '添加书本成功',
        }

    # 更新书本信息
    @staticmethod
    def put(book_id):
        book = Book.query.get(book_id)
        print(request.form.get('bookName'))
        if request.form.get('bookName') != '':
            book.bookName = request.form.get('bookName')
            print("书本名:" + book.bookName)
        # book.author = request.form.get('author')
        if request.form.get('ISBN') != '':
            book.ISBN = request.form.get('ISBN')
            print("ISBN:" + book.ISBN)
        if request.form.get('category') != '':
            book.category = request.form.get('category')
            print("种类:" + book.category)
        if request.form.get('quantity') != '':
            book.quantity = request.form.get('quantity')
            print("数量:" + book.quantity)
        print("书本信息:" + book.bookName + book.ISBN + book.category + book.author)
        db.session.commit()
        return {
            'status': 'success',
            'message': '书本信息修改成功',
        }

    # 删除书本
    @staticmethod
    def delete(book_id):
        book = Book.query.get(book_id)
        db.session.delete(book)
        db.session.commit()
        return {
            'status': 'success',
            'message': '书本删除成功',
        }

    # 获得分类数据
    @staticmethod
    def sort_by_month():
        info = numpy.zeros(5)
        books: [Book] = Book.query.all()
        for book in books:
            if book.category == '文学艺术':
                info[0] += 1
            if book.category == '人文社科类':
                info[1] += 1
            if book.category == '哲学':
                info[2] += 1
            if book.category == '历史地理':
                info[3] += 1
            if book.category == '自然应用科学':
                info[4] += 1
        return {
            'status': '返回所有书本',
            'message': '数据查询成功',
            'results': info
        }


# bookAPI注册
book_view = BookApi.as_view('book_api')
# 获取全部书籍
app.add_url_rule('/books/', view_func=book_view, methods=['GET', ], defaults={'book_id': None})
# 根据bookId 获取 更新或删除书本
app.add_url_rule('/books/<int:book_id>', view_func=book_view, methods=['GET', 'PUT', 'DELETE'])
# 添加书本
app.add_url_rule('/books/', view_func=book_view, methods=['POST', ])


# --------------------book API end-------------------- #


# ----------------------user API---------------------- #
class UserApi(MethodView):
    # 获取全部用户
    @staticmethod
    def get():
        users: [User] = User.query.all()
        results = [
            {
                'userId': user.userId,
                'name': user.name,
                'username': user.username,
                'password': user.password,
                'admin': user.admin,
            } for user in users
        ]
        return {
            'status': '返回所有用户',
            'message': '数据查询成功',
            'results': results
        }

    # 删除用户
    @staticmethod
    def delete(user_id):
        user = User.query.get(user_id)
        db.session.delete(user)
        db.session.commit()
        return {
            'status': 'success',
            'message': '用户删除成功',
        }

    # 更新用户信息
    @staticmethod
    def put(user_id):
        user: User = User.query.get(user_id)
        # form = request.json
        # user.username = form.get('username')
        # user.password = form.get('password')
        # user.admin = form.get('admin')
        user.password = '123456'
        db.session.commit()
        return {
            'status': 'success',
            'message': '用户信息修改成功',
        }

    # 添加用户
    @staticmethod
    def post():
        form = request.json
        user = User()
        user.name = form.get('name')
        user.username = form.get('username')
        user.password = form.get('password')
        user.admin = form.get('admin')
        db.session.add(user)
        db.session.commit()

        return {
            'status': 'success',
            'message': '添加用户成功',
        }


# userAPI注册
user_view = UserApi.as_view('user_api')
# 获取全部user
app.add_url_rule('/users/', view_func=user_view, methods=['GET', ])
# 删除指定user_id的用户以及更新用户数据
app.add_url_rule('/users/<int:user_id>', view_func=user_view, methods=['PUT', 'DELETE'])
# 添加用户
app.add_url_rule('/users/', view_func=user_view, methods=['POST', ])


# ----------------------user API end---------------------- #


@app.route('/record', methods=['POST', 'GET'])
def record():
    user_id = session.get('userId')
    borrows = db.session.query(borrowInfo).filter_by(userId=user_id).all()
    print(borrows)
    return flask.render_template("user/borrowingBooksRecord.html", borrows=borrows)


@app.route('/bookdetail/<book_id>', methods=['POST', 'GET'])
def findBook(book_id):
    book = db.session.query(Book).filter_by(bookId=book_id).first()
    return flask.render_template('user/book_detail.html', book=book)


@app.route('/returnbook/<book_id>', methods=['GET', 'POST'])
def returnBook(book_id):
    user_id = session.get('userId')
    db.session.query(borrowInfo).filter_by(bookId=book_id).filter_by(userId=user_id).delete()
    Book.query.filter(Book.bookId == book_id).update({'quantity': Book.quantity + 1})
    db.session.commit()


    return record()


@app.route('/borrowbook/<book_id>', methods=['POST','GET' ])
def borrowBook(book_id):
    user_id = session.get('userId')
    date = request.form.get('date')
    if(date == None ):
        date = 14
    count = db.session.query(borrowInfo).filter_by(bookId=book_id).filter_by(userId=user_id).count()
    if (count == 0):
        borrowinfo = borrowInfo()
        borrowinfo.bookId = book_id
        borrowinfo.bookName = db.session.query(Book).filter_by(bookId=book_id).first().bookName
        borrowinfo.userId = user_id
        borrowinfo.userName = db.session.query(User).filter_by(userId=user_id).first().username
        borrowinfo.date = date
        db.session.add(borrowinfo)
        db.session.commit()

        Book.query.filter(Book.bookId == book_id).update({'quantity' : Book.quantity - 1})
        db.session.commit()
    return record()
messages = []
messages.append({"role": "system", "content": "你是一个书籍方面的专家，使用中文回答我的问题"})

@app.route('/search',methods=['GET','POST'])
def search():
    searchString = request.form.get('keyword')
    print(searchString)
    Books = Book.query.filter(Book.bookName.like('%' + searchString + '%')).all();
    return flask.render_template('user/categoryPage.html', books=Books)

class ChatApi(MethodView):
    @staticmethod
    def post(sentence):
        openai.api_key = "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"
        openai.organization = "org-zunSdePjLsbZpPylrslJaCm0"

        content = sentence
        messages.append({"role": "user", "content": content})

        completion = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=messages
        )

        chat_response = completion
        answer = chat_response.choices[0].message.content
        messages.append({"role": "assistant", "content": answer})
        return answer;


# chatAPI注册
chat_view = ChatApi.as_view('chat_api')
# 获取回答
app.add_url_rule('/chat/<sentence>', view_func=chat_view, methods=['POST', 'GET'])

class borrowInfoAPI(MethodView):
    #归还书籍信息录入
    @staticmethod
    def post():
        borrowinfo = borrowInfo()
        borrowinfo.bookName = request.form.get('bookName')
        borrowinfo.bookId = request.form.get('bookId')
        borrowinfo.userId = request.form.get('userId')
        borrowinfo.month = request.form.get('month')
        db.session.add(borrowinfo)
        db.session.commit()

        return {
            'status': 'success',
            'message': '借阅信息录入成功',
        }

    @staticmethod
    def delete(user_name, book_name):
        print(user_name + book_name)
        borrows = borrowInfo.query.filter_by(userName=user_name, bookName=book_name).all()
        for borrow in borrows:
            db.session.delete(borrow)
            db.session.commit()
        books = Book.query.filter_by(bookName=book_name).all()
        for book in books:
            book.quantity += 1
            db.session.commit()
        return {
            'status': 'success',
            'message': '书本归还成功',
        }

#borrowApi注册
borrow_view = borrowInfoAPI.as_view('borrow_view')
#  还书
app.add_url_rule('/borrow/<user_name>/<book_name>/', view_func=borrow_view, methods=['DELETE', ])


@app.route('/test')
def test():
    with app.test_request_context():
        return flask.render_template('desktopPetPage.html')

@app.route('/letters', methods=['POST', 'GET'])
def letters():
    return render_template("user/letters.html")

@app.route('/tips', methods=['POST', 'GET'])
def tips():
    return render_template("user/tips.html")



if __name__ == '__main__':
    app.run()
