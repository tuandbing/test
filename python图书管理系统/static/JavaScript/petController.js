var isShowing = false;

function onPetEnter(){
    //console.log(111);
    $("#petImage").attr("src","../../static/image/hover.png");
}

function onPetLeave(){
    //console.log(222);
    if(!isShowing){
        $("#petImage").attr("src","../../static/image/normal.png");
    }
    
}

function onPetClick(){
    isShowing = true;
    $("#chatArea").removeClass("invisible");
}

function onHideBtnClick(){
    $("#chatArea").addClass("invisible");
    isShowing = false;
    $("#petImage").attr("src","../../static/image/normal.png");
}

function sendChat(){
    let chatString = $("#inputFrame").val();
    $("#inputFrame").val('');
    if(chatString !== ''){
        console.log(chatString);
        $("#chatFrame").append( `<div class="mt-2 me-1 userChat align-self-end">${chatString}</div>`);
        $("#sendButton").text('等待回复');
        $("#sendButton").attr("disabled","disabled");//禁用按钮
        //ajax
        $.ajax({
            url:`http://localhost:5000//chat/${chatString}`,
            type:'POST',
            success:function(data){
                $("#chatFrame").append( `<div class="mt-2 ms-1 gptChat align-self-start">${data}</div>`);
                $("#sendButton").text('发送');
                $("#sendButton").removeAttr("disabled"); 
            },
            error: function(error){
                console.log(error);
                $("#chatFrame").append( `<div class="mt-2 ms-1 gptChat align-self-start" style="background-color:red;">服务器错误，请更换节点或稍后再试.</div>`);
                $("#sendButton").text('发送');
                $("#sendButton").removeAttr("disabled"); 
            }
        });
        //$("sendButton").removeAttr("disabled"); //复启用按钮
    } 
}