<%-- 
    Document   : wallet
    Created on : Mar 1, 2024, 12:01:10 PM
    Author     : 84933
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="generator" content="Mobirise v5.9.13, mobirise.com">
        <link rel="stylesheet" href="assets/web/assets/mobirise-icons2/mobirise2.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">

        <link rel="stylesheet" href="assets/socicon/css/styles.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="preload" href="https://fonts.googleapis.com/css?family=Inter+Tight:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload = null;this.rel = 'stylesheet'">
        <link rel="icon" type="image/png" href="img/logo1.png">
        <title>Okane Kanri - Wallet details</title>
        <noscript><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter+Tight:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap"></noscript>
        <link rel="preload" as="style" href="assets/mobirise/css/mbr-additional.css?v=tPj5oE"><link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css?v=tPj5oE" type="text/css">
        <script src="https://kit.fontawesome.com/c1e0573822.js" crossorigin="anonymous"></script>
        <style>

              body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, rgba(50, 148, 230, 0.1), transparent);
            background-color: #f5f5f5;
            }
            
/*            ///////////////AMOUNT HEADER//////////////////*/
            .amount {
                margin-top: 0px;
                text-align: center;
            }
            .amount table {
                width: 50%; /* Adjusted width for better responsiveness */
                margin: auto;
                border-collapse: separate;
                border-spacing: 0;
/*                background-color:#91CFFF ;*/
                border-radius: 20px; /* Applied border-radius to the table */
                overflow: hidden;
            }
            .amount th,
            .amount td{
                border: none; /* Updated border style */
                padding: 10px; /* Increased padding for better spacing */
                font-size: 25px;
            }
            .amount th {
                color: #0076BE; /* Adjusted color for Total balance */
            }
            .amount td.total-expense {
                color: red; /* Adjusted color for Total expense */
            }
            
/*            /////////////3 MAIN BUTTONS////////*/
            .buttonfun {
                text-align: center;
                display: flex;
                justify-content: center;
                padding: 20px;
                margin-left: 20%;
                margin-right: 20%;
            }
            .buttonfun button {
                transition: transform 0.2s ease-out;
                margin: 0 20px; /* Reduced horizontal margin */
                padding: 12px 24px; /* Increased padding for better button size */
                font-size: 18px; /* Increased font size for better readability */
                background-color: #0076BE;
                color: white;
                border: none;
                border-radius: 25px; /* Changed border-radius for rounded corners */
                cursor: pointer;
                width: 200px;
            }
            .buttonfun button:hover {
                transform: scale(1.05);
                background-color:#005ac4 ;
            }
            .buttonfun button:nth-child(2):hover {
                background-color: #005ac4;
            }
            .buttonfun button:last-child:hover {
                background-color: #005ac4;
            }

            /*//////////////////OVERLAY////////////////////////*/
            .overlay {
                display: none; /* Mặc định ẩn, chỉ hiển thị khi form được kích hoạt */
                position: fixed; /* Fixed position để nó nằm đè lên toàn bộ nội dung khác */
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Màu đen nhẹ, đục */
                z-index: 10; /* Z-index cao để nằm trên các thành phần khác */
            }

            /*//////////////////CREATE ACC FORM////////////////////////*/
            .CreateAccount {
                display: none; /* Mặc định ẩn, chỉ hiển thị khi kích hoạt */
                position: fixed; /* Sử dụng fixed position để nằm giữa trang */
                top: 50%; /* Vị trí theo chiều dọc ở giữa */
                left: 50%; /* Vị trí theo chiều ngang ở giữa */
                transform: translate(-50%, -50%); /* Dùng transform để chính xác đặt giữa */
                background-color: #fff; /* Màu nền trắng cho form */
                padding: 30px; /* Padding xung quanh nội dung của form */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Thêm bóng cho form */
                z-index: 11; /* Z-index cao hơn overlay để form nằm trên overlay */
                width: 400px; /* Đặt chiều rộng cố định cho form */
                border-radius: 15px; /* Làm tròn góc cho form */
            }
            .CreateAccount h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #007bff;
            }
            .CreateAccount label {
                display: block; /* Hiển thị dạng block cho mỗi label */
                margin-bottom: 8px; /* Khoảng cách dưới mỗi label */
                font-weight: bold; /* Làm đậm chữ cho label */
                color: #333; /* Màu chữ */
            }

            /* Thiết kế cho các trường nhập liệu */
            .CreateAccount input[type="text"],
            .CreateAccount select {
                width: calc(100% - 20px); /* Chiếm toàn bộ chiều rộng có sẵn */
                padding: 10px; /* Padding để tạo khoảng cách bên trong */
                margin-bottom: 15px; /* Khoảng cách dưới mỗi trường nhập */
                border: 1px solid #ccc; /* Viền màu xám nhạt */
                border-radius: 4px; /* Làm tròn góc */
                box-sizing: border-box; /* Đảm bảo padding không làm thay đổi kích thước tổng thể */
            }
            .CreateAccount input[type="submit"] {
                width: 100%; /* Chiếm toàn bộ chiều rộng có sẵn */
                padding: 12px; /* Padding cho nút */
                border: none; /* Loại bỏ viền */
                border-radius: 5px; /* Làm tròn góc */
                background-color: #007bff; /* Màu nền */
                color: white; /* Màu chữ */
                cursor: pointer; /* Con trỏ khi di chuyển vào */
                font-size: 16px; /* Cỡ chữ */
            }
            .CreateAccount input[type="submit"]:hover {
                background-color: #0056b3; /* Màu nền khi hover */
            }
            .CreateAccount select {
                background-color: white; /* Nền trắng cho dropdown */
                -webkit-appearance: none; /* Loại bỏ giao diện mặc định trên Safari */
                -moz-appearance: none;    /* Loại bỏ giao diện mặc định trên Firefox */
                appearance: none;         /* Loại bỏ giao diện mặc định */
            }
            .CreateAccount th{
                width: 30%;
            }
            .fa-xmark {
                position: absolute;
                top: 10px;
                right: 10px;
                color: #6b6b6b;
                cursor: pointer;
            }

            
            /*//////////////////EDIT ACCOUNT FORM////////////////////////*/
            .UpdateAccount {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 30px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                z-index: 11; /* Z-index để form nằm trên overlay */
                width: 400px;
                border-radius: 15px;
            }
            .UpdateAccount h1 {
                color: #007bff;
                margin-bottom: 20px;
                text-align: center;
            }
            .UpdateAccount label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #333;
            }
            .UpdateAccount input[type="text"],
            .UpdateAccount select {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .UpdateAccount input[type="submit"] {
                width: 100%;
                padding: 12px;
                border: none;
                border-radius: 5px;
                background-color: #007bff;
                color: white;
                cursor: pointer;
                font-size: 16px;
            }
            .UpdateAccount input[type="submit"]:hover {
                background-color: #7540e3;
            }

            /*//////////////////ADD FUND FORM////////////////////////*/
            .AddFund {
                display: none; /* Mặc định ẩn, chỉ hiển thị khi kích hoạt */
                position: fixed; /* Sử dụng fixed position để nằm giữa trang */
                top: 50%; /* Vị trí theo chiều dọc ở giữa */
                left: 50%; /* Vị trí theo chiều ngang ở giữa */
                transform: translate(-50%, -50%); /* Dùng transform để chính xác đặt giữa */
                background-color: #fff; /* Màu nền trắng cho form */
                padding: 30px; /* Padding xung quanh nội dung của form */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Thêm bóng cho form */
                z-index: 11; /* Z-index cao hơn overlay để form nằm trên overlay */
                width: 400px; /* Đặt chiều rộng cố định cho form */
                border-radius: 15px; /* Làm tròn góc cho form */
            }
            .AddFund h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #007bff;
            }
            .AddFund label {
                display: block; /* Hiển thị dạng block cho mỗi label */
                margin-bottom: 8px; /* Khoảng cách dưới mỗi label */
                font-weight: bold; /* Làm đậm chữ cho label */
                color: #333; /* Màu chữ */
            }

            .AddFund input[type="text"],
            .AddFund select {
                width: calc(100% - 20px); /* Chiếm toàn bộ chiều rộng có sẵn */
                padding: 10px; /* Padding để tạo khoảng cách bên trong */
                margin-bottom: 15px; /* Khoảng cách dưới mỗi trường nhập */
                border: 1px solid #ccc; /* Viền màu xám nhạt */
                border-radius: 4px; /* Làm tròn góc */
                box-sizing: border-box; /* Đảm bảo padding không làm thay đổi kích thước tổng thể */
            }
            .AddFund input[type="submit"] {
                width: 100%; /* Chiếm toàn bộ chiều rộng có sẵn */
                padding: 12px; /* Padding cho nút */
                border: none; /* Loại bỏ viền */
                border-radius: 5px; /* Làm tròn góc */
                background-color: #007bff; /* Màu nền */
                color: white; /* Màu chữ */
                cursor: pointer; /* Con trỏ khi di chuyển vào */
                font-size: 16px; /* Cỡ chữ */
            }
            .AddFund input[type="submit"]:hover {
                background-color: #0056b3; /* Màu nền khi hover */
            }
            .AddFund select {
                background-color: white; /* Nền trắng cho dropdown */
                -webkit-appearance: none; /* Loại bỏ giao diện mặc định trên Safari */
                -moz-appearance: none;    /* Loại bỏ giao diện mặc định trên Firefox */
                appearance: none;         /* Loại bỏ giao diện mặc định */
            }
            .AddFund th{
                width: 30%;
            }
            
            /*//////////////////TRANSFER FORM////////////////////////*/
            .Transfer {
                display: none; /* Mặc định ẩn, chỉ hiển thị khi kích hoạt */
                position: fixed; /* Sử dụng fixed position để nằm giữa trang */
                top: 50%; /* Vị trí theo chiều dọc ở giữa */
                left: 50%; /* Vị trí theo chiều ngang ở giữa */
                transform: translate(-50%, -50%); /* Dùng transform để chính xác đặt giữa */
                background-color: #fff; /* Màu nền trắng cho form */
                padding: 30px; /* Padding xung quanh nội dung của form */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Thêm bóng cho form */
                z-index: 11; /* Z-index cao hơn overlay để form nằm trên overlay */
                width: 400px; /* Đặt chiều rộng cố định cho form */
                border-radius: 15px; /* Làm tròn góc cho form */
            }
            .Transfer h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #007bff;
            }
            .Transfer label {
                display: block; /* Hiển thị dạng block cho mỗi label */
                margin-bottom: 8px; /* Khoảng cách dưới mỗi label */
                font-weight: bold; /* Làm đậm chữ cho label */
                color: #333; /* Màu chữ */
            }

            /* Thiết kế cho các trường nhập liệu */
            .Transer input[type="text"],
            .Transfer select {
                width: calc(100% - 20px); /* Chiếm toàn bộ chiều rộng có sẵn */
                padding: 10px; /* Padding để tạo khoảng cách bên trong */
                margin-bottom: 15px; /* Khoảng cách dưới mỗi trường nhập */
                border: 1px solid #ccc; /* Viền màu xám nhạt */
                border-radius: 4px; /* Làm tròn góc */
                box-sizing: border-box; /* Đảm bảo padding không làm thay đổi kích thước tổng thể */
            }
            .Transfer input[type="submit"] {
                width: 100%; /* Chiếm toàn bộ chiều rộng có sẵn */
                padding: 12px; /* Padding cho nút */
                border: none; /* Loại bỏ viền */
                border-radius: 5px; /* Làm tròn góc */
                background-color: #007bff; /* Màu nền */
                color: white; /* Màu chữ */
                cursor: pointer; /* Con trỏ khi di chuyển vào */
                font-size: 16px; /* Cỡ chữ */
            }
            .Transfer input[type="submit"]:hover {
                background-color: #0056b3; /* Màu nền khi hover */
            }
            .Transfer select {
                background-color: white; /* Nền trắng cho dropdown */
                -webkit-appearance: none; /* Loại bỏ giao diện mặc định trên Safari */
                -moz-appearance: none;    /* Loại bỏ giao diện mặc định trên Firefox */
                appearance: none;         /* Loại bỏ giao diện mặc định */
            }
            .Transfer th{
                width: 30%;
            }

            
            .accedit{
                margin-left: 20%;
                margin-right: 20%;
                display: flex;
                justify-content: center;                
            }
            .listaccount {
                width: 100%;
                border-collapse: collapse;
                margin-top:20px ;

            }
             .listaccount tbody tr:hover {
                background-color: #f0f0f0;
            }
            .listaccount tbody tr {
                border-bottom: 1px solid #ddddd;
                transition: background-color 0.3s ease;
            }


            .listaccount tbody tr:nth-of-type(even) {
                background-color: #f9f9f9;
            }

            .listaccount tbody tr.active-row {
                font-weight: bold;
                color: #0076BE;
            }

            .listaccount td a {
                color: #0076BE;
                text-decoration: none;
                margin-right: 10px;
            }

            .listaccount td a:hover {
                text-decoration: underline;
            }

            .listaccount td{
                padding: 12px;
            color: #333;
            }
            .listaccount th {
                border: 1px solid #00607f;
                padding: 12px;
                text-align: center;
                color: #fff;
                background-color: #0076BE;
                font-weight: bold;
            }
            .listaccount th:first-child,
            .listaccount td:first-child {
                border-left: none;
            }

            .listaccount th:last-child,
            .listaccount td:last-child {
                border-right: none;
            }
        </style>


</style>
</head>
<body>
    <div class="overlay" id="overlay"></div>
    <jsp:include page="/menu.jsp" /><br>
    <h1 class="text-center">Wallet</h1>
    <main>
        <!--            //////////////////////AMOUNT HEADER///////////////////-->
        <div class="amount">
            <table style="font-size: 30px">
                <tr>
                    <th style="color: #228e75">Total balance</th>
                    <th style="color: red">Total expense</th>
                </tr>
                <tr style="color:black">
                    <td >$ ${requestScope.user.getCurrentBalance()}</td>
                    <td>$ ${requestScope.user.getExpenseAmount()}</td>
                </tr>
            </table>
        </div>

        <!--            //////////////////////3 MAIN BUTTONS///////////////////-->
        <div class="buttonfun">
            <button id="createAccBtn" >Create Account</button>
            <button id="addFundBtn" >Add Fund</button>
            <p></p>
            <button id="transferBtn" class="transferBtn">Transfer</button>
        </div>
        <!--            //////////////////////CREATE ACCOUNT FORM///////////////////-->
        <form name="CreateAccount" class="CreateAccount" 
              action="MainController?action=createaccount" method="POST" onsubmit="return saveFormValues()" >
            <i class="fa-solid fa-xmark" ></i>
            <h1> Create Account </h1>

            <h5 style="color: red" id="warning"></h5>
            <label for="CreateName">Name</label>
            <input type="text" name="Name" id="CreateName">

            <label for="wallettype">Type</label>
            <select id="wallettype" name="wallettype" onchange="selectWallet(this)">
                <c:forEach var="walletDTO" items="${sessionScope.walletList}">
                    <option value="${walletDTO.getWalletTypeID()}">${walletDTO.getTypeName()}</option>
                </c:forEach>
            </select>

            <div id="choosebank1" style="display: none">
                <label for="banktype">Bank</label>
                <select id="banktype" name="banktype">
                    <c:forEach var="bankDTO" items="${sessionScope.bankList}">
                        <option value="${bankDTO.getBankID()}">${bankDTO.getBankName()}</option>
                    </c:forEach>
                </select>
            </div>

            <div id="chooseewallet1" style="display: none">
                <label for="ewallettype">E-Wallet</label>
                <select id="ewallettype" name="ewallettype">
                    <c:forEach var="ewalletDTO" items="${sessionScope.ewalletList}">
                        <option value="${ewalletDTO.getEWalletID()}">${ewalletDTO.getEWalletName()}</option>
                    </c:forEach>
                </select>
            </div>

            <label for="Note">Note</label>
            <input type="text" name="Note">

            <input class="submit" type="submit" value="Submit">
        </form>

        <div class="accedit">
            <table class="listaccount">
                <thead>
                    <tr>
                        <th style="display: none">Account ID</th>
                        <th>Account Name</th>
                        <th>Wallet Type</th>
                        <th style="display: none">User ID</th>
                        <th>Bank/E-Wallet</th>
                        <th>Balance</th>
                        <th>Note</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="account" items="${requestScope.accountList}">
                        <tr>
                            <td style="display: none" name="AccountID">${account.getAccountID()}</td>
                            <td name="AccountName">${account.getAccountName()}</td>
                            <td style="text-align: center" name="WalletType" data-wallet-type-id="${account.getWalletType()}">
                                <c:forEach var="walletDTO" items="${sessionScope.walletList}">
                                    <c:if test="${account.getWalletType() == walletDTO.getWalletTypeID() }">
                                        ${walletDTO.getTypeName()}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td style="display: none" name="UserID">${account.getUserID()}</td>
                            <td style="text-align: center" name="TypeName" data-bank-id="${account.getBankID()}" data-ewallet-id="${account.getEWalletID()}" >
                                <c:choose>
                                    <c:when test="${account.getWalletType() == 2}">
                                       
                                        <c:forEach var="bankDTO" items="${sessionScope.bankList}">
                                            <c:if test="${account.getBankID() == bankDTO.getBankID()}">
                                                ${bankDTO.getBankName()}
                                            </c:if>
                                        </c:forEach>
                                    </c:when>
                                    <c:when test="${account.getWalletType()== 3}">
                                       
                                        <c:forEach var="ewalletDTO" items="${sessionScope.ewalletList}">

                                            <c:if test="${account.getEWalletID() == ewalletDTO.getEWalletID()}">
                                                ${ewalletDTO.getEWalletName()}
                                            </c:if>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td style="text-align: center" name="Balance">${account.getBalance()}</td>
                            <td name="Note" >${account.getNote()}</td>
                            <td style="text-align: right"><a href="#" onclick="updateAccount(this)">Edit</a>
                                <form action="MainController?action=deleteAccount" method="POST" >
                                    <input type="hidden" name="id" value="${account.getAccountID()}"/>
                                    <input type="hidden" name="balance" value="${account.getBalance()}"/>
                                    <a href="#" onclick="DeleteAccount(this)">Delete</a>

                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>


        <form style="width: 600px" name="UpdateAccount" class="UpdateAccount" action="MainController?action=updateaccount" method="POST" onsubmit="return formupdatevalues()" >
            <i class="fa-solid fa-xmark" ></i>
            <h1 id="update"> Update Account </h1>
            <h5 style="color: red" id="updatewarning"></h5>
            <table>
                <tr style="display: none"><td>
                        <input name="AccountID" type="text" >
                        <input name="UserID" type="text" >                            
                    </td>
                </tr>
                <tr><th>Balance</th>
                    <td name="Balance"></td></tr>

                <tr>
                    <th>Name</th>
                    <td><input type="text" name="Name"></td>
                </tr>
                <tr> <th>Type</th>
                    <td>  <select  id="wallettype_update" name="wallettype" onchange="selectWalletUpdate(this)">
                            <c:forEach var="walletDTO" items="${sessionScope.walletList}">

                                <option value="${walletDTO.getWalletTypeID()}">${walletDTO.getTypeName()}</option>
                            </c:forEach>
                        </select></td>
                </tr> 
                <tr id="b_update" style="display: none">
                    <th style="width: 220px;">Bank</th>
                    
                    <td style="width:100px;"><select id="banktype_update" name="bankupdates">
                            <c:forEach var="bankDTO" items="${sessionScope.bankList}">
                                <option value="${bankDTO.getBankID()}">${bankDTO.getBankName()}</option>
                            </c:forEach>
                        </select></td>
                </tr>
                <tr id="e_update" style="display: none">
                    <th>E-Wallet</th>
                    <td><select id="ewallettype_update" name="ewallettype_updates">
                            <c:forEach var="ewalletDTO" items="${sessionScope.ewalletList}">
                                <option value="${ewalletDTO.getEWalletID()}">${ewalletDTO.getEWalletName()}</option>
                            </c:forEach>
                        </select></td>
                </tr>
                <tr>
                <tr>
                    <th>Note</th>
                    <td><input type="text" name="Note"></td>
                </tr>
                <tr>
                    <th><input class="submit" type="submit" value="submit"></th>

                </tr>
            </table>
        </form>

        <!--            //////////////////////ADD FUND FORM///////////////////-->




        <form name="AddFund" class="AddFund" action="MainController?action=addfund" method="POST" onsubmit="return fundformvalues()" >
            <i class="fa-solid fa-xmark" onclick="closeaddfund()"></i>
            <h1 id="create"> Adding fund </h1>
            Amount
            <input name="balance" type="number" >
            <br>
            Transaction Name
            <input name="incomeName" type="text">
            Date
            <input name="date" type="date" required>
            <br>
            Choose Account <select id="accountlist" name="accountlist">
                <c:forEach var="acc" items="${requestScope.accountList}">

                    <option value="${acc.getAccountID()}" >${acc.getAccountName()}</option>
                </c:forEach>
            </select>
            <br> 
            Select Category <select id="category" name="category">
                <c:forEach var="cate" items="${sessionScope.category}">

                    <option value="${cate.getCategoryID()}">${cate.getName()}</option>
                </c:forEach>
            </select>
               Note <input name="note" type="text">
            <h5 style="color: red" id="errorMessage"></h5>
            <h5 style="color: red" id="errorAmount"></h5>
            <input class="submit" type="submit" value="submit">
        </form>

        <!--            //////////////////////TRANSFER FORM///////////////////-->

        <form name="Transfer" id="transfer" class="Transfer" action="MainController?action=transfer" method="POST" onsubmit="return transferformvalues()">
            <i class="fa-solid fa-xmark" onclick="closetransfer()"></i>
            <h1 id="transfer"> Transfer </h1>
            Amount
            <input name="balance" id="balance" type="number" required>
            <br>
            Sending account <select id="fromaccountlist" name="fromaccount" required>
                <c:forEach var="account" items="${requestScope.accountList}">
                    <option value="${account.getAccountID()}">${account.getAccountName()}</option>
                </c:forEach>
            </select>
            <br>
            Receiving account<select id="toaccountlist" name="toaccount" required>
                <c:forEach var="account" items="${requestScope.accountList}">
                    <option value="${account.getAccountID()}">${account.getAccountName()}</option>
                </c:forEach>
            </select>
            <br>
            <h5 style="color: red" id="errorTransfer"></h5>
            <h5 style="color: red" id="errorTransferamount"></h5>
            <br>
            <input class="submit" type="submit" value="submit">
        </form>
        <script>
            var errorMsg = "<c:out value='${requestScope.error}'/>";
            if (errorMsg !== "null" && errorMsg.length > 0) {
                alert(errorMsg);
            }
        </script>

    </main>
    <br></br>
    <br></br>
    <jsp:include page="/footer.jsp" />
</body>
<script>

    function selectWallet(select) {
        // Lấy giá trị được chọn
        var value = select.value;
        var bankRow = document.getElementById('choosebank1');
        var ewalletRow = document.getElementById('chooseewallet1');

        if (value === '2') { 
            bankRow.style.display = '';
            ewalletRow.style.display = 'none';
        } else if (value === '3') { 
            ewalletRow.style.display = ''; 
            bankRow.style.display = 'none';
        } else {
           
            bankRow.style.display = 'none';
            ewalletRow.style.display = 'none';
        }
    }
    function saveFormValues() {
        var nameInput = document.getElementById('CreateName').value.trim();
        var warningText = document.getElementById('warning');

        if (nameInput === '') {
            // Hiển thị thông báo lỗi
            warningText.innerHTML = 'Please fill in the name field before submitting.';
            // Ngăn form không được submit
            return false;
        }

        // Xóa thông báo lỗi nếu đã điền tên và cho phép form submit
        warningText.innerHTML = '';
        return true; // Cho phép form submit
    }
    document.getElementById('createAccBtn').addEventListener('click', createAcc);
    document.getElementById('addFundBtn').addEventListener('click', Addfund);
    document.getElementById('transferBtn').addEventListener('click', Transfer);

// Gán sự kiện cho nút đóng trên mỗi modal
    document.querySelectorAll('.fa-xmark').forEach(button => {
        button.addEventListener('click', function () {
            closeModal('.CreateAccount');
            closeModal('.AddFund');
            closeModal('.Transfer');
            closeModal('.UpdateAccount');
        });
    });

    // Hàm này được gọi khi người dùng bấm vào nút "Create Account"
    function createAcc() {
        // Hiển thị overlay
        let overlay = document.getElementById('overlay');
        overlay.style.display = 'block';

        // Hiển thị modal "Create Account"
        let createAccountModal = document.querySelector('.CreateAccount');
        createAccountModal.style.display = 'block';
    }
    function selectWalletUpdate(select) {
        // Lấy giá trị được chọn
        var value = select.value; // Get the selected wallet type value
        var bankRow = document.getElementById('b_update');
        var ewalletRow = document.getElementById('e_update');

    
        if (value === '2') { 
            bankRow.style.display = ''; 
            ewalletRow.style.display = 'none'; 
        } else if (value === '3') { 
            ewalletRow.style.display = ''; 
            bankRow.style.display = 'none'; 
        } else {

            bankRow.style.display = 'none';
            ewalletRow.style.display = 'none';
        }
    }



// Hàm này được gọi khi người dùng bấm vào nút "Add Fund"
    function Addfund() {
        let overlay = document.getElementById('overlay');
        overlay.style.display = 'block';

        let addFundModal = document.querySelector('.AddFund');
        addFundModal.style.display = 'block';
    }

// Hàm này được gọi khi người dùng bấm vào nút "Transfer"
    function Transfer() {
        let overlay = document.getElementById('overlay');
        overlay.style.display = 'block';

        let transferModal = document.querySelector('#transfer');
        transferModal.style.display = 'block';
    }

// Hàm này được gọi khi người dùng muốn đóng modal
    function closeModal(className) {
        let overlay = document.getElementById('overlay');
        overlay.style.display = 'none';

        let modal = document.querySelector(className);
        modal.style.display = 'none';
    }


    function updateAccount(e) {
        let overlay = document.getElementById('overlay');
        overlay.style.display = 'block';

        let updateAccountModal = document.querySelector('.UpdateAccount');
        updateAccountModal.style.display = 'block';

        // Cập nhật dữ liệu vào form 
        let tr = e.closest('tr');
        let AccountID = tr.querySelector('td[name="AccountID"]').innerHTML;
        let AccountName = tr.querySelector('td[name="AccountName"]').innerHTML;
        let WalletType = tr.querySelector('td[name="WalletType"]').getAttribute('data-wallet-type-id').trim();
        let UserID = tr.querySelector('td[name="UserID"]').innerHTML;
        let Balance = tr.querySelector('td[name="Balance"]').innerHTML;
        let Note = tr.querySelector('td[name="Note"]').innerHTML;
        let bankId = tr.querySelector('[name="TypeName"]').getAttribute('data-bank-id');
        let eWalletId = tr.querySelector('[name="TypeName"]').getAttribute('data-ewallet-id');
        let form = document.querySelector(".UpdateAccount");
        form.querySelector('input[name="AccountID"]').value = AccountID;
        form.querySelector('input[name="UserID"]').value = UserID;
        form.querySelector('td[name="Balance"]').innerHTML = Balance;
        form.querySelector('input[name="Name"]').value = AccountName;
        form.querySelector('input[name="Note"]').value = Note;

        var bankRow = document.getElementById('b_update');
        var ewalletRow = document.getElementById('e_update');

        setSelectedOption(document.getElementById('wallettype_update'), WalletType);

        // Hiển thị hoặc ẩn select box banktype hoặc ewallettype dựa trên loại của wallet
        if (WalletType === '2' && bankId) {
            bankRow.style.display = 'block';
            ewalletRow.style.display = 'none';

            setSelectedOption(document.getElementById('banktype_update'), bankId);
        } else if (WalletType === '3' && eWalletId) {
            bankRow.style.display = 'none';
            ewalletRow.style.display = 'block';

            setSelectedOption(document.getElementById('ewallettype_update'), eWalletId);
        } else {
            bankRow.style.display = 'none';
            ewalletRow.style.display = 'none';
        }

    }

    function setSelectedOption(selectElement, value) {
        for (let i = 0; i < selectElement.options.length; i++) {
            if (selectElement.options[i].value === value) {
                selectElement.selectedIndex = i;
                break;
            }
        }
    }


    function formupdatevalues() {
        let name = document.forms["UpdateAccount"]["Name"].value;
        if (name === "") {
            document.getElementById("updatewarning").innerHTML = "Please fill in the name field before submitting.";
            return false;
        }
        // Xóa bất kỳ thông báo cảnh báo trước đó nào
        document.getElementById("updatewarning").innerHTML = "";
        return true;
    }

    function fundformvalues() {
        // Lấy giá trị từ các trường biểu mẫu
        let balance = document.forms["AddFund"]["balance"].value;
        let incomeName = document.forms["AddFund"]["incomeName"].value;

        if (balance === "" || incomeName === "") {
            document.getElementById("errorMessage").innerHTML = "Please fill in the necessarry field before submitting.";
            return false;
        }

        // Kiểm tra xem balance có chứa kí tự ngoài số hay không
        if (balance<=0) {
            document.getElementById("errorAmount").innerHTML = "Balance have to be number of money.";
            return false;
        }

        // Xóa bất kỳ thông báo lỗi trước đó nào
        document.getElementById("errorMessage").innerHTML = "";
        document.getElementById("errorAmount").innerHTML = "";
        return true;
    }
    function DeleteAccount(e) {
        let form = e.closest('form');
        let Balance = form.querySelector('input[name="balance"]').value;
        if (Balance === "0") {
            form.submit();
        } else {
            alert("Can not delete!!!\n\Please transfer the maintain blance to another the account to excecute the process");
        }

    }

    function transferformvalues() {
        var fromAccount = document.getElementById("fromaccountlist").value;
        var toAccount = document.getElementById("toaccountlist").value;

        if (fromAccount === "" || toAccount === "") {
            document.getElementById("errorTransfer").innerText = "Please fill in all fields.";
            return false;
        }

        if (fromAccount === toAccount) {
            document.getElementById("errorTransfer").innerText = "Sending and receiving accounts must be different.";
            return false;
        }
        let balance = document.getElementById("balance");
        if(balance<=0){
            document.getElementById("errorTransfer").innerText = "Balance have to be number of money.";
            return false;
        }
        
        return true;
    }
</script>

</html>
