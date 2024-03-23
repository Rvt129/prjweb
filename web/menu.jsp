<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .menu-container {
                background-color: #0076BE;
                color: white;
                height: 60px;
                 width: 100%;
            }     

            .menu-left,
            .menu-right {
                display: flex;
                align-items: center;
                height: 100%;
            }

            .menu-left ul,
            .menu-right ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                height: 100%;
            }

            .menu-left li{
                margin-right: 20px;
                font-size: 14px;
            }

            .menu-left li i,
            .menu-right li i {
                margin-right: 5px;
            }

            .menu-right button {
                background-color: #0076BE;
                color: #ffffff;
                padding: 5px;
                border: none;
                text-align: center;
                text-decoration: none;
                font-size: 14px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                height: 60px;
                width: 122px;
            }

            .menu-right button:hover {
                background-color: #084298;
            }

            #home img {
                max-width: 40px;
                max-height: 40px;
                
            }
        
            
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row menu-container">
                <div class="col-md-5">
                    <div class="menu-left align-items-center">
                        <ul>
                            <li><i class="fa-solid fa-phone"></i>+84933643212</li>
                            <li><i class="fa-regular fa-envelope"></i>support@okanekanri.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2 d-flex justify-content-center align-items-center">
                    <a id="home" href="homepage.jsp"><img src="img/logo.png" alt="Logo"></a>
                </div>
                <div class="col-md-5">
                    <div class="menu-right align-items-center">
                        <ul>
                            <li><button onclick="window.location.href = './MainController?action=wallet'">Wallet</button></li>
                            <li><button onclick="window.location.href = './MainController?action=tracking'">Expenses Tracking</button></li>
                            <li><button onclick="window.location.href = './MainController?action=report'">Dashboard</button></li>
                            <li><button onclick="window.location.href = 'contact.jsp'">Contact</button></li>
                        </ul>
                        <form action="MainController" class="user" >
                            <input type="hidden" name="action" value="logout">
                            <button type="submit" style="width:60px;display:block">                                
                                <i class="fa-solid fa-right-from-bracket"></i> 
                            </button>
                        </form>
                        <form action="MainController" class="user" >
                            <input type="hidden" name="action" value="account">
                            <button type="submit" id="submitBtn" style="width: 60px">
                                <i class="fa-regular fa-user"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
