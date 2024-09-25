//注册界面逻辑功能


//全局变量区域
var username=document.getElementById("username");//用户名
var realName=document.getElementById("realName");//姓名
var password=document.getElementById("password");//密码
var repassword=document.getElementById("repassword");//重复密码
var tips=document.getElementById("tips");//提示信息
var xhr='';//xhr对象
var isUsernameValid=false;
var isNameValid=false;
var isPasswordValid=false;
var formlabel=document.getElementById('signUp-from');//表单

//添加监听器区域
username.addEventListener("blur",checkUsernameValid,false);
realName.addEventListener("blur",checkNameValid,false);
password.addEventListener("blur",checkPasswordValid,false);
repassword.addEventListener("blur",checkPasswordValid,false);

function checkNameValid()
{
    if(realName.value=='' || realName.value==null || realName.value==undefined){
        tips.innerHTML='';
        tips.innerHTML+='<h4 style="line-height:25px ;color: red;">姓名不能为空!</h4>';
        isNameValid=false;
        return isNameValid;

    }else{
        tips.innerHTML='';
        tips.innerHTML+='<h4 style="line-height:25px ;">欢迎注册!</h4>';
        isNameValid=true;
        return isNameValid;
    }
}

//检查用户名是否合法：先判空，不为空的话判是否存在
function checkUsernameValid(){
    if(username.value == '' || username.value==null || username.value==undefined){
        tips.innerHTML='';
        tips.innerHTML+='<h4 style="line-height:25px ;color: red;">用户名不能为空!</h4>';
        isUsernameValid=false;
        return isUsernameValid;

    }else{
         tips.innerHTML='';
         tips.innerHTML+='<h4 style="line-height:25px ;">欢迎注册!</h4>';
        checkIsExit(username.value);
        return isUsernameValid;
    }

}

//异步请求验证用户名是否存在
function checkIsExit(usernameStr){
    xhr=new XMLHttpRequest();
    xhr.onreadystatechange = usernameExitProcess;
    xhr.open('GET','usernameExit?username='+usernameStr);
    xhr.send(null);
}

function usernameExitProcess(){
    if(xhr.readyState === 4) {
        if(xhr.status === 200) {
            var responseText = xhr.responseText;
            console.log(responseText)
            if(responseText==="no"){
                isUsernameValid=true;
                if(checkPasswordValid())//检查密码状态是否合法
                {
                    tips.innerHTML = '';
                    tips.innerHTML += '<h4 style="line-height:25px ;">欢迎注册!</h4>';
                }

            }else{
                isUsernameValid=false;
                tips.innerHTML='';
                tips.innerHTML+='<h4 style="line-height:25px ;color: red;">用户名已经存在!</h4>';
            }
        }
    }
}
//****

//检查密码是否合法
function checkPasswordValid(){
    if(isUsernameValid === false)//确保先检验用户名
    {
        return ;
    }
    if(password.value === ""||repassword.value === "")//如果密码栏有未填写，判断状态合法
    {
        return true;
    }
    if(password.value==='' || password.value===null || password.value===undefined){
        tips.innerHTML='';
        tips.innerHTML+='<h4 style="line-height:25px ;color: red;">密码不能为空!</h4>';
        isPasswordValid=false;
        return isPasswordValid;

    }else if(repassword.value!==password.value&&repassword.value!=='' && repassword.value!==null){
        tips.innerHTML='';
        tips.innerHTML+='<h4 style="line-height:25px ;color: red;">两次输入的密码不一致!</h4>';
        isPasswordValid=false;
        return isPasswordValid;

    }
    tips.innerHTML='';
    tips.innerHTML+='<h4 style="line-height:25px ;">欢迎注册!</h4>';

    isPasswordValid=true
    return isPasswordValid;
}

var btn_signup = document.getElementById('btn-signup');
btn_signup.addEventListener('click',onSignUpClick);

//点击注册按钮
function onSignUpClick(){
    if(isUsernameValid && isPasswordValid && isNameValid){
        formlabel.submit();
    }
}



//显示信息框
function showAlert(alertId){
    $("#"+alertId).removeClass("invisible");
}

//隐藏信息框
function hideAlert(alertId){
    $("#"+alertId).addClass("invisible");
}