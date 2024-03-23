<%-- 
    Document   : dashboard
    Created on : Mar 8, 2024, 3:08:31 AM
    Author     : 84933
--%>

<%@page import="java.util.List"%>
<%@page import="expense_category.ExpenseCategoryDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
    Map<Integer, Long> categorySpending = (Map<Integer, Long>) request.getAttribute("categorySpending");
    List<ExpenseCategoryDTO> cate = (List<ExpenseCategoryDTO>) session.getAttribute("category");
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="generator" content="Mobirise v5.9.13, mobirise.com">
        <link rel="stylesheet" href="assets/web/assets/mobirise-icons2/mobirise2.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">

        <link rel="icon" type="image/png" href="img/logo1.png">

        <link rel="stylesheet" href="assets/socicon/css/styles.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="preload" href="https://fonts.googleapis.com/css?family=Inter+Tight:100,200,300,400,500,600,700,800,900,100i,200i,300i,400i,500i,600i,700i,800i,900i&display=swap" as="style" onload="this.onload = null; this.rel = 'stylesheet'">

        <title>Okane Kanri - Dashboard</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="preload" as="style" href="assets/mobirise/css/mbr-additional.css?v=tPj5oE"><link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css?v=tPj5oE" type="text/css">
        <script src="https://kit.fontawesome.com/c1e0573822.js" crossorigin="anonymous"></script>
        <style>
            *{
                box-sizing: border-box;
            }
            body {
                background-image: linear-gradient(
                    to bottom,  
                    rgba(50, 148, 230, 0.1),
                    transparent
                    );
            }
            .head1 {
                color: #000066;
                padding: 10px;
                margin-left: 10px;
            }

            .head1 ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: flex-start;
            }

            .head1 li {
                margin-right: 20px;
            }
            .head1 li i {
                margin-right: 5px;
            }

            .head2 {
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 60px; /* Chiều cao của thanh home */
                background-color: #1a727b;
                color: white;
                padding: 0;

            }

            #home {
                max-width: 40px;
                max-height: 40px;
                margin-bottom: 5px;
                margin-left: 10px;
            }
            #home img {
                max-width: 100%;
            }

            .head2 nav{
                height: 100%;
                align-items: center;
            }

            .head2 nav ul {
                display: flex;
                justify-content: center;
                list-style-type: none;
                padding: 0;
                margin: 0;
                height: 100%
            }
            .head2 i {
                display: flex;
                justify-content: flex-end;
            }
            .head2 button {
                background-color: #1a727b;
                color: #ffffff;
                padding: 10px 20px;
                border: none;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
                height: 100%;
            }

            .head2 li button:hover {
                background-color: #23a0ac;
            }
            footer{
                height: 100%;
            }
            .footer {
                margin-top: 100px;
                background-color: #003756; /* Light grey background */
                padding: 40px 0;
                text-align: center;

            }
            .social-row {
                display: flex;
                justify-content: center;
                padding-top: 40px;
                gap: 20px;
            }
            .soc-item a {
                color: white; /* Black color icons */
                font-size: 24px;
                text-decoration: none;
            }
            .soc-item a:hover {
                color: #007bff; 
            }
            .footer p {
                font-size: 16px;
                color: white; 
                margin: 0;
                line-height: 1.5;

            }
            .year{
                width: 70%;
                top: 10px;
                right: 10px;
                display: flex;
                align-items: center;
                justify-content: flex-end; 
                margin-top: 80px;
                margin-bottom: 20px;
            }

            #myChart {
                display: block;
                margin: 50px auto;        
                max-width: 70%;
                max-height: 70%;
                font-size: 20px;
            }
            #myPie{
                display: block;
                margin: 50px auto; 
                max-width: 70%;
                max-height: 70%;
                font-size: 20px;
                
            }

            h3{
                text-align: center;
                margin-top: 100px;
                font-family: Verdana;
            }
            .listcate{
                display: flex;
                justify-content: center;
                margin-top: 30px;
            }
            .sublist{
                border-radius: 10px;
                height: 95px;
                width: 120px;
                padding: 7px;
                border-width: 1px;
                border-color: black;
                margin: 6px;
            }
            #shopping{
                background-color: #a0e2e1;
            }
            #food{
                background-color: #bfd1ec;
            }
            #transport{
                background-color: #f2e7c3;
            }
            #rent{
                background-color: #dfc2c4;
            }

            #edu{
                background-color: peachpuff;
            }
            #entertain{
                background-color: #25cff2;
            }
            #other{
                background-color: #adb5bd;
            }
            #health{
                background-color: moccasin;
            }
            #income{
                background-color: #eccccf;
            }
            #nor{
                text-align: center;
                color: red;
                font-size: 20px;
                font-family: monospace;
                
            }
        </style>
    </head>
    <body>
        <jsp:include page="/menu.jsp" /><br><br>
         <h1 class="text-center">Dashboard</h1>
       

        </div>
        <div class="year">
            <form action="MainController?action=reportyear" method="POST">
                <i  class="fa-regular fa-calendar"></i> 
                <select style="font-size: 15px;" name="year"  id="yearSelect" onchange="submitSelect(this)" >
                    <!-- Các tùy chọn sẽ được thêm vào đây bởi JavaScript -->
                    <option>${requestScope.yearselect}</option>
                </select>
            </form>
        </div>

        <script>
            // Lấy năm hiện tại
            let namHienTai = new Date().getFullYear();
            // Tham chiếu đến phần tử select trong HTML
            let select = document.getElementById('yearSelect');
            // Vòng lặp từ 2000 đến năm hiện tại 
            for (var i = namHienTai - 10; i <= namHienTai; i++) {
            // Tạo một tùy chọn mới
            let option = document.createElement('option');
            option.value = i;
            option.text = i;
            select.appendChild(option); // Thêm tùy chọn vào select
            }
        </script>
        <h3>Year report </h3>
        <canvas id="myChart" width="650" height="450"></canvas>
        <script>
            let bar = document.getElementById('myChart').getContext('2d');
            const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            let bardata = '<%= request.getAttribute("dataJs")%>';
            let data = JSON.parse(bardata);
            let chart = new Chart(bar, {
            type: 'bar',
                    data: {
                    labels: months,
                            datasets: [{
                            label: 'Monthly Expenses',
                                    data: data,
                                    backgroundColor: 'rgba(121 ,205, 205, 0.8)',
                                    borderColor: 'rgba(102, 205, 170, 1)',
                                    borderWidth: 2,
                            }]
                    },
                    options: {
                    maintainAspectRatio: false, // Set to false to control width and height
                            responsive: false,
                            scales: {
                            y: {
                            beginAtZero: true
                            }
                            }
                    }
            });
        </script>
        <h3> Category Distribution</h3>
        <canvas id="myPie" width="350" height="350" ></canvas>
        <script>
            let pie = document.getElementById('myPie').getContext('2d');
            let piechart = new Chart(pie, {
            type: 'pie',
                    data: {
                    labels: [
            <%
                for (Map.Entry<Integer, Long> entry : categorySpending.entrySet()) {
                    int categoryId = entry.getKey();
                    // Lấy tên category từ cơ sở dữ liệu hoặc đặt tên category tĩnh
                    String categoryName = "";
                    for (ExpenseCategoryDTO catename : cate) {
                        if (categoryId == catename.getCategoryID()) {
                            categoryName = catename.getName();
                        }
                    }
            %>
                    '<%= categoryName%>',
            <%
                }
            %>
                    ],
                            datasets: [{
                            data: [
            <%
                for (Long spending : categorySpending.values()) {
            %>
            <%= spending%>,
            <%
                }
            %>
                            ],
                                    backgroundColor: [
                                            // Màu nền cho các phần tử pie chart
                                            'rgba(255, 99, 132, 0.8)',
                                            'rgba(54, 162, 235, 0.8)',
                                            'rgba(255, 206, 86, 0.8)',
                                            'rgba(75, 192, 192, 0.8)',
                                            'rgba(255, 228, 196, 1)',
                                            'rgba(255, 193 ,193, 1)',
                                            'rgba(198, 226 ,255), 0.8)',
                                            'rgba(230,230, 250), 0.8)'
                                    ],
                                    borderColor: [
                                            // Màu viền cho các phần tử pie chart
                                            'rgba(255, 99, 132, 1)',
                                            'rgba(54, 162, 235, 1)',
                                            'rgba(255, 206, 86, 1)',
                                            'rgba(75, 192, 192, 1)',
                                            'rgba(255, 228, 196, 1)',
                                            'rgba(255, 193 ,193, 1)',
                                            'rgba(198, 226 ,255), 1)',
                                            'rgba(230,230, 250), 1)'
                                    ],
                                    borderWidth: 1
                            }]
                    },
                    options: {
                    responsive: false,
                            maintainAspectRatio: false,
                            plugins: {
                            title: {
                            display: true,
                                    text: 'Expense category'
                            },
                                    legend: {
                                    display: true,
                                            position: 'right', // Đặt vị trí của legend ở bên phải biểu đồ
                                            align: 'start', // Điều chỉnh căn lề của legend
                                            labels: {
                                            boxWidth: 10,
                                                    padding: 10
                                            }
                                    }
                            },
                            layout: { 
                            padding: {
                            right: 100 
                            }
                            }
                    }
            });</script>
        <div id="nor">${requestScope.notice}</div>
        <div class="listcate">
            <div class="sublist" id="shopping">
                <h4>Food</h4>
                <br>
                <h5>${requestScope.shopping}</h5>
            </div>
            <div class="sublist" id="food"><h5>Shopping</h5>
                <br>
                <h5>${requestScope.food}</h5>
            </div >
            <div class="sublist" id="transport"><h5>Transportation</h5>
                <br>
                <h5>${requestScope.transport}</h5>
            </div >
            <div class="sublist" id="rent"><h5>Rent/Mortgage</h5>
                <br>
                <h5>${requestScope.rent}</h5>
            </div>
            <div class="sublist" id="entertain"><h5>Entertainment</h5>
                <br>
                <h5>${requestScope.entertain}</h5>
            </div>
            <div class="sublist" id="edu"><h5>Education</h5>
                <br>
                <h5>${requestScope.edu}</h5>
            </div>
            <div class="sublist" id="health"><h5>Health care</h5>
                <br>
                <h5>${requestScope.health}</h5>
            </div>
            <div class="sublist" id="income"><h5>Income</h5>
                <br>
                <h5>${requestScope.income}</h5>
            </div>
            <div class="sublist" id="other"><h5>Other</h5>
                <br>
                <h5>${requestScope.other}</h5>
            </div>                            
        </div>
            <br></br>
                      <br></br>
                <jsp:include page="/footer.jsp" />
    </body>
    <script>
        function submitSelect(e) {
        let form = e.closest('form');
        form.submit(); }
    </script>

</html>