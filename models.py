from extension import db


class User(db.Model):
    __tablename__ = 'user'
    userId = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # varchar, null = 0
    name = db.Column(db.String(20), nullable=False)
    username = db.Column(db.String(10), nullable=False)
    password = db.Column(db.String(20), nullable=False)
    admin = db.Column(db.Integer, nullable=True)


class Book(db.Model):
    __tablename__ = 'book'
    bookId = db.Column(db.Integer, primary_key=True, autoincrement=True)
    bookName = db.Column(db.String(30), nullable=False)
    author = db.Column(db.String(30), nullable=False)
    ISBN = db.Column(db.String(30), nullable=False)
    category = db.Column(db.Integer, nullable=False)
    quantity = db.Column(db.Integer, nullable=False)
    description = db.Column(db.String(255), nullable=True)


class borrowInfo(db.Model):
    __tablename__ = 'borrowinfo'
    borrowId = db.Column(db.Integer, primary_key=True, autoincrement=True)
    userId = db.Column(db.Integer, nullable=False)
    bookId = db.Column(db.Integer, nullable=False)
    bookName = db.Column(db.String(30), nullable=False)
    userName = db.Column(db.String(30), nullable=False)
    date = db.Column(db.String(30), nullable=False)

