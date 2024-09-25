var currentUser = '';

function setCurrentUser(userId){
    currentUser = userId;
}

function onDeletUsereSubmit(){
    $("#deletUserWanningModal").modal('hide');
    //ajax
    $.ajax({
        url:'http://localhost:5000/users/'+ currentUser,
        type:'DELETE',
        success:function (data){
            console.log(data)
            loadUserManage()
        },
        error:function (data) {
            console.log(data)
        }
    })
}

function onResetPasswordSubmit(){
    $("#resetPasswordWanningModal").modal('hide');
    //ajax
    $.ajax({
        url:'http://localhost:5000/users/'+ currentUser,
        type:'PUT',
        success:function (data){
            console.log(data)
            loadUserManage()
        },
        error:function (data) {
            console.log(data)
        }
    })
}

function onSearchUserClick(){
    let username = $("#usernameInput").val();
    console.log(username);
    //ajax
}