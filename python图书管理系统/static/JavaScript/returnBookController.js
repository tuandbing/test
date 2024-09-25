var lastResult, countResults = 0;
function onScanSuccess(decodedText, decodedResult) {
    console.log("扫描成功");
    if (decodedText !== lastResult) {
        ++countResults;
        lastResult = decodedText;
        window.alert(`扫描成功!书名:${decodedText}`);
        // Handle on success condition with the decoded message.
        //console.log(`Scan result ${decodedText}`, decodedResult);
        $("#returnBookName").val(decodedText);
        $("#returnBookBtn").removeAttr("disabled");
    }
}

function initReturnBookPage(){
    var resultContainer = document.getElementById('qr-reader-results');
    var html5QrcodeScanner = new Html5QrcodeScanner(
    "qr-reader", { fps: 10, qrbox: 250 });
    html5QrcodeScanner.render(onScanSuccess);
}

function onReturnBookClick(){
    let returnBookName = "《"+$("#returnBookName").val()+"》";
    let people = $("#borrower").val();
    console.log(returnBookName+" "+people);

    if(returnBookName !== '' || people !== ''){
        $.ajax({
            url:'http://localhost:5000/borrow/'+ people + '/' + returnBookName + '/',
            type:'DELETE',
            success:function (data){
                console.log(data)
                window.alert('归还成功!未逾期')
            },
            error:function (data) {
                console.log(data)
            }
        })
    }
}