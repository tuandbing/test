var currentNavId = 'bookManageNav';
loadBookManage();

function onNavClick(click_id){
    //console.log(clcik_id);
    if(currentNavId !== click_id){
       $("#"+currentNavId).removeClass("myactive");
       currentNavId = click_id;
       $("#"+click_id).addClass("myactive");
       loadPage(click_id);
    }
}

function loadPage(page){
    if(page === 'bookManageNav'){
        loadBookManage();
    }else if(page === 'userManageNav'){
        loadUserManage();
    }else if(page === 'borrowStatNav'){
        loadBorrowStat();
    }else if(page === 'returnBookNav'){
        loadReturnBook();
    }else{
        //bookStatNav
        loadBookStat();
    }
}

function loadBookManage(){
    //渲染页面
    $("#innerHtml").html(`<div class="row" id="bookManage">
                    <div class="col-9 bookTableArea">
                        <h1 class="text-center">图书总览</h1>
                        <!--搜索栏开始-->
                        <div class="row">
                            <div class="col-3">
                                <select class="form-select" id="searchType">
                                    <option value="1">按作者查询</option>
                                    <option value="2">按ISBN查询</option>
                                    <option value="3">按书名查询</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <input type="search" class="form-control" placeholder="查询" id="searchInput">
                            </div>
                            <div class="col-3 d-grid">
                                <button type="button" class="btn btn-primary btn-block"
                                    onclick="onSearchBookClick()">查询</button>
                            </div>
                        </div>
                        <!--搜索栏结束-->
                        <div class="bookTable mt-2">
                            <!--表格开始-->
                            <table class="table table-bordered border border-2">
                                <!--芝士表头-->
                                <thead class="table-light" id="bookTableHead">
                                    <tr>
                                        <th class="text-center">书名</th>
                                        <th class="text-center">作者</th>
                                        <th class="text-center">ISBN号</th>
                                        <th class="text-center">类型</th>
                                        <th class="text-center">存书数量</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <!--芝士表身-->
                                <tbody id="bookTableBody">
                                    <!--一行数据-->
<!--                                    <tr>-->
<!--                                        <td class="text-center">《离散数学》</td>-->
<!--                                        <td class="text-center">大费</td>-->
<!--                                        <td class="text-center">ISBN-123456</td>-->
<!--                                        <td class="text-center">人文社科类</td>-->
<!--                                        <td class="text-center">10</td>-->
<!--                                        <td class="text-center">-->
<!--                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"-->
<!--                                                data-bs-target="#takedownWanningModal"-->
<!--                                                onclick="onTakeDownBookClick(1)">下架书本</button>-->
<!--                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"-->
<!--                                                data-bs-target="#editBookInfoModal"-->
<!--                                                onclick="onReviseBookClick(1)">修改信息</button>-->
<!--                                        </td>-->
<!--                                    </tr>-->
                                </tbody>
                            </table>
                            <!--表格结束-->
                        </div>
                    </div>
                    <!--添加图书区域开始-->
                    <div class="col-3 addBookArea">
                        <h1 class="text-center">新增图书</h1>
                        <div class="mt-5">
                            <label for="newBookName" class="form-label mb-1">书名:</label>
                            <input type="text" placeholder="书名" name="newBookName" id="newBookName"
                                class="form-control">
                        </div>
                        <div class="mt-4">
                            <label for="newIbsnCode" class="form-label mb-1">ISBN号:</label>
                            <input type="text" placeholder="ISBN号" name="newIbsnCode" id="newIbsnCode"
                                class="form-control">
                        </div>
                        <div class="mt-4">
                            <label for="newWriter" class="form-label mb-1">作者:</label>
                            <input type="text" placeholder="作者" name="newWriter" id="newWriter" class="form-control">
                        </div>
                        <div class="mt-4">
                            <label for="newBookNumber" class="form-label mb-1">存书数量:</label>
                            <input type="number" placeholder="请输入数量" name="newBookNumber" id="newBookNumber"
                                class="form-control" min="1" value="1">
                        </div>
                        <div class="mt-4">
                            <label for="newBookType" class="form-label mb-1">类型:</label>
                            <select class="form-select" id="newBookType" name="newBookType">
                                <option value='哲学'>哲学</option>
                                <option value='人文社会科学'>人文社会科学</option>
                                <option value='文学艺术'>文学艺术</option>
                                <option value='历史地理'>历史地理</option>
                                <option value='自然应用科学'>自然应用科学</option>
                            </select>
                        </div>
                        <div class="mt-4">
                            <label for="newDescription" class="form-label mb-1">描述:</label>
                            <input type="text" placeholder="描述" name="newDescription" id="newDescription" class="form-control">
                        </div>
                        <div class="d-grid mt-5">
                            <button class="btn btn-primary btn-block" onclick="onAddNewBookClick()">提交</button>
                        </div>
                    </div>
                    <!--添加图书区域结束-->
                </div>`);
    //ajax请求
    $.ajax({
        url:'http://localhost:5000/books/',
        type:'GET',
        success: function(data){
            if(currentNavId === 'bookManageNav'){
                let result = data.results;
                console.log(result);
                for(i = 0; i < result.length; i++){
                $("#bookTableBody").append("<tr>\n" +
                    "                                        <td class=\"text-center\">"+result[i].bookName+"</td>\n" +
                    "                                        <td class=\"text-center\">"+result[i].author+"</td>\n" +
                    "                                        <td class=\"text-center\">"+result[i].ISBN+"</td>\n" +
                    "                                        <td class=\"text-center\">"+result[i].category+"</td>\n" +
                    "                                        <td class=\"text-center\">"+result[i].quantity+"</td>\n" +
                    "                                        <td class=\"text-center\">\n" +
                    "                                            <button type=\"button\" class=\"btn btn-danger\" data-bs-toggle=\"modal\"\n" +
                    "                                                data-bs-target=\"#takedownWanningModal\"\n" +
                    "                                                onclick=\"onTakeDownBookClick("+result[i].bookId+")\">下架书本</button>\n" +
                    "                                            <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\"\n" +
                    "                                                data-bs-target=\"#editBookInfoModal\"\n" +
                    "                                                onclick=\"onReviseBookClick("+result[i].bookId+")\">修改信息</button>\n" +
                    "                                        </td>\n" +
                    "                                    </tr>");
                }

                console.log(data)
            }
        }
    });
}

function loadUserManage(){
    //渲染页面
    $("#innerHtml").html(`<div class="row" id="userManager">
                    <div class="col-12 userTableArea">
                        <h1 class="text-center">用户信息</h1>
                        <!--搜索栏开始-->
                        <div class="row">
                            <div class="col-7">
                                <input type="search" class="form-control" placeholder="输入用户名" id="usernameInput">
                            </div>
                            <div class="col-5 d-grid">
                                <button type="button" class="btn btn-primary btn-block" onclick="onSearchUserClick()">查询</button>
                            </div>
                        </div>
                        <!--搜索栏结束-->
                        <div class="userTable mt-2">
                            <!--表格开始-->
                            <table class="table table-bordered border border-2">
                                <!--芝士表头-->
                                <thead class="table-light" id="userTableHead">
                                    <tr>
                                        <th class="text-center">姓名</th>
                                        <th class="text-center">学号</th>
                                        <th class="text-center">类型</th>
                                        <th class="text-center">密码</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <!--芝士表身-->
                                <tbody id="userTableBody">
                                    <!--一行数据-->
<!--                                    <tr>-->
<!--                                        <td class="text-center">admin</td>-->
<!--                                        <td class="text-center">管理员</td>-->
<!--                                        <td class="text-center">123456</td>-->
<!--                                        <td class="text-center">-->
<!--                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"-->
<!--                                                data-bs-target="#deletUserWanningModal" onclick="setCurrentUser(1)">删除用户</button>-->
<!--                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"-->
<!--                                                data-bs-target="#resetPasswordWanningModal" onclick="setCurrentUser(1)">重置密码</button>-->
<!--                                        </td>-->
<!--                                    </tr>-->
                                </tbody>
                            </table>
                            <!--表格结束-->
                        </div>
                    </div>
                </div>`);
    //ajax请求
     $.ajax({
        url:'http://localhost:5000/users/',
        type:'GET',
        success: function(data){
            if(currentNavId === 'userManageNav'){
                let result = data.results;
                console.log(result);
                for(i = 0; i < result.length; i++){
                    let adminString;
                    if(result[i].admin === 1) adminString='管理员';
                    else adminString='普通用户';
                $("#userTableBody").append("<tr>\n" +
                    "                                        <td class=\"text-center\">"+result[i].name+"</td>\n" +
                    "                                        <td class=\"text-center\">"+result[i].username+"</td>\n" +
                    "                                        <td class=\"text-center\">"+adminString+"</td>\n" +
                    "                                        <td class=\"text-center\">"+result[i].password+"</td>\n" +
                    "                                        <td class=\"text-center\">\n" +
                    "                                            <button type=\"button\" class=\"btn btn-danger\" data-bs-toggle=\"modal\"\n" +
                    "                                                data-bs-target=\"#deletUserWanningModal\"\n" +
                    "                                                onclick=\"setCurrentUser("+result[i].userId+")\">删除用户</button>\n" +
                    "                                            <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\"\n" +
                    "                                                data-bs-target=\"#resetPasswordWanningModal\"\n" +
                    "                                                onclick=\"setCurrentUser("+result[i].userId+")\">重置密码</button>\n" +
                    "                                        </td>\n" +
                    "                                    </tr>");
                }

                console.log(data)
            }
        }
    });
}

function loadBorrowStat(){
    //渲染页面
    $("#innerHtml").html(`<p>按下&nbsp<kbd>ctrl&nbsp+&nbspp</kbd>&nbsp打印此页面</p>
                <!--在此区域显示网页主体-->
                <div class="col-4 borrowStatsFrame" style="border-right: 1px;border-right-color: gray;border-right-style: solid;">
                    <h5>各类书籍借阅总数</h5>
                    <canvas id="borrowNumber" style="width: 100%;height:70%;"></canvas>
                </div>
                <div class="col-4 borrowStatsFrame" style="border-right: 1px;border-right-color: gray;border-right-style: solid;">
                    <h5>各类书籍借阅占比</h5>
                    <canvas id="borrowRate" style="width: 100%;height:70%;"></canvas>
                </div>
                <div class="col-4 borrowStatsFrame">
                    <h5>各月借阅情况</h5>
                    <canvas id="borrowPerMonth" style="width: 100%;height:70%;"></canvas>
                </div>`);
    //ajax请求
    // $.ajax({
    //     url:``,
    //     type:'GET',
    //     success: function(data){
    //         if(currentNavId === 'borrowStatNav'){

    //         }
    //     }
    // });
    createBorrowChart()
}

function loadBookStat(){
    //渲染页面
    $("#innerHtml").html(`<p>按下&nbsp<kbd>ctrl&nbsp+&nbspp</kbd>&nbsp打印此页面</p>
                <!--在此区域显示网页主体-->
                <div class="col-6 bookStatsFrame" style="border-right: 1px;border-right-color: gray;border-right-style: solid;">
                    <h5>书籍总数统计</h5>
                    <canvas id="bookTotalNumber" style="width: 100%;height:70%;"></canvas>
                </div>
                <div class="col-6 bookStatsFrame">
                    <h5>本月新增书籍统计</h5>
                    <canvas id="bookNewNumber" style="width: 100%;height:70%;"></canvas>
                </div>`);
    //ajax请求
    // $.ajax({
    //     url:``,
    //     type:'GET',
    //     success: function(data){
    //         if(currentNavId === 'bookStatNav'){

    //         }
    //     }
    // });
    createBookChart();
}

function hideModal(modalId){
    $("#"+modalId).modal('hide');
}

function loadReturnBook(){
    $("#innerHtml").html(`<div class="row" id="returnBook">
                    <div class="col-9 bookTableArea">
                        <h1 class="text-center">扫描二维码</h1>
                        <div id="qr-reader" style="width:500px;left:50%;transform: translateX(-50%); "></div>
                        <div id="qr-reader-results"></div>
                    </div>
                    <!--归还图书区域开始-->
                    <div class="col-3 addBookArea" style="border-left: 1px; border-left-style:solid; border-left-color: black;">
                        <h1 class="text-center">归还图书</h1>
                        <div class="mt-5">
                            <label for="returnBookName" class="form-label mb-1">书名:</label>
                            <input type="text" placeholder="请扫描书本二维码" name="returnBookName" id="returnBookName"
                                class="form-control" disabled>
                        </div>
                        <div class="mt-4">
                            <label for="borower" class="form-label mb-1">借阅者:</label>
                            <input type="text" placeholder="请输入借阅者账号" name="borrower" id="borrower" class="form-control">
                        </div>
                        <div class="d-grid mt-5">
                            <button class="btn btn-primary btn-block" onclick="onReturnBookClick()" disabled id="returnBookBtn">提交</button>
                        </div>
                    </div>
                    <!--归还图书区域结束-->
                </div>`);
    initReturnBookPage();
}