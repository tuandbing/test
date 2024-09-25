var currentBook = '';
function onTakeDownBookClick(bookId){
    currentBook = bookId;
}

function onReviseBookClick(bookId){
    currentBook = bookId;
}

function onSubmitReviseClick(){
    let bookName = $("#modal_BookName").val();
    let ibsn = $("#modal_IBSN").val();
    let bookType = $("#modal_Booktype").val();
    let number = $("#modal_BookNumber").val();
    $("#editBookInfoModal").modal('hide');
    //console.log(bookName+" "+ibsn+" "+bookType+" "+number)
    let update_data = {
        "bookName": bookName,
        "ISBN": ibsn,
        "category": bookType,
        "quantity": number
    };
    //ajax
    //修改书本信息 PUT方法
    $.ajax({
        url:'http://localhost:5000/books/'+ currentBook,
        type:'PUT',
        data:update_data,
        success:function (data){
            console.log(data)
            loadBookManage()
        },
        error:function (data) {
            console.log(data)
        }
    })
}

// 删除书本
function onSubmitTakeDownClcik(){
    console.log('delete');
    $("#takedownWanningModal").modal('hide');
    console.log(currentBook)
    //ajax
    $.ajax({
        url:'http://localhost:5000/books/'+ currentBook,
        type:'DELETE',
        success:function (data){
            console.log(data)
            loadBookManage()
        },
        error:function (data) {
            console.log(data)
        }
    })
}

function onAddNewBookClick(){
    let bookName = $("#newBookName").val();
    let isbn = $("#newIbsnCode").val();
    let writer = $("#newWriter").val();
    let bookType = $("#newBookType").val();
    let number = $("#newBookNumber").val();
    let description = $("#newDescription").val();
    //console.log(bookName+" "+ibsn+" "+bookType+" "+number+" "+writer);
    let my_data = {
        "bookName": bookName,
        "ISBN": isbn,
        "author": writer,
        "category": bookType,
        "quantity": number
    };
    if(description !== '')
        my_data['description'] = description;

    //ajax
    $.ajax({
        url:'http://localhost:5000/books',
        type:'POST',
        data:my_data,
        success:function(data){
            console.log('success')
            console.log(data)
            loadBookManage()
        },
        error: function(msg){
            console.log('fail')
            console.log(msg);
        }
    })
}

function onSearchBookClick(){
    let searchString = $("#searchInput").val();
    let searchType = $("#searchType").val();
    console.log(searchString+" "+searchType);
    if(searchType === 1){
        //按作者
    }else if(searchType === 2){
        //按ISBN
    }else{
        //按书名
    }
}