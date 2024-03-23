<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Okane Kanri - Sign Up</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" type="image/png" href="img/logo1.png">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            text-align: center;
            margin-top: 5rem;
        }
        h1 {
            color: #0076BE; /* Main color */
            margin-bottom: 2rem;
        }
        .error {
            color: #dc3545;
            margin-bottom: 1rem;
        }
        .form-control {
            margin-bottom: 1.5rem; /* Increased spacing */
            border-radius: 5px; /* Rounded input fields */
            border-color: #ced4da; /* Default border color */
        }
        .btn-primary {
            background-color: #0076BE; /* Main color */
            border-color: #0076BE; /* Main color */
            border-radius: 5px; /* Rounded buttons */
        }
        .btn-primary:hover {
            background-color: #005b91; /* Darker shade on hover */
            border-color: #005b91; /* Darker shade on hover */
        }
        .options {
            margin-top: 1rem;
            color: #0076BE; /* Main color */
        }
        .options a {
            text-decoration: none;
            color: #0076BE; /* Main color */
            margin-right: 0.5rem;
            font-weight: bold; /* Bold font weight */
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="img/logo1.png" alt="Logo" class="img-fluid mb-4" style="max-width: 70px;">
        <h1>Sign Up</h1>
        <% String err = (String) request.getAttribute("error");
        if (err != null) { %>
            <div class="error"><%= err %></div>
        <% } %>
        <form action="MainController?action=signup" method="POST">
            <input type="email" name="email" class="form-control" placeholder="Email" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <input type="text" name="name" class="form-control" placeholder="Name" required>
            <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
        </form>
        <div class="options">
            <a href="login.jsp">Already have an account? Login</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
