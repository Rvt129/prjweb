<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Okane Kanri - Homepage</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="icon" type="image/png" href="img/logo1.png">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .menu-button {
            margin: 20px;
            padding: 1rem;
            width: 200px;
            height: 200px;
            border: none;
            border-radius: 1rem;
            background-color: #0076BE; /* Main color */
            overflow: hidden;
            position: relative;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1), 0 6px 12px rgba(0, 0, 0, 0.08);
            text-align: center;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .menu-button:hover {
            background-color: #007bff; /* Darker shade on hover */
            transform: translateY(-5px);
        }
        .menu-button i {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        .button-name {
            font-size: 1.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="./MainController?action=wallet" class="menu-button">
            <i class="fas fa-wallet"></i>
            <div class="button-name">Wallet</div>
        </a>
        <a href="./MainController?action=tracking" class="menu-button">
            <i class="fas fa-chart-line"></i>
            <div class="button-name">Expenses Tracking</div>
        </a>
        <a href="./MainController?action=report" class="menu-button">
            <i class="fas fa-chart-bar"></i>
            <div class="button-name">Dashboard</div>
        </a>
        <a href="contact.jsp" class="menu-button">
            <i class="fas fa-envelope"></i>
            <div class="button-name">Contact</div>
        </a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
