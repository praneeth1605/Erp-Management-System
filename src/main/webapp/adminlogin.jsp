<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - ERP Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #ecf0f1;
            color: #34495E;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f9f9f9;
        }

        .login-form {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-form h2 {
            color: #34495E;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .form-control {
            border-radius: 4px;
            border: 1px solid #ddd;
            margin-bottom: 1rem;
        }

        .form-control:focus {
            border-color: #1ABC9C;
            box-shadow: 0 0 8px rgba(26, 188, 156, 0.3);
        }

        .btn-custom {
            background-color: #1ABC9C;
            color: #fff;
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            font-size: 1.1rem;
        }

        .btn-custom:hover {
            background-color: #16A085;
        }

        .footer {
            text-align: center;
            color: #34495E;
            font-size: 0.85rem;
            margin-top: 2rem;
        }

    </style>
</head>
<body>

<%@include file="mainnavbar.jsp" %>
    <!-- Admin Login Section -->
    <div class="login-container">
        <div class="login-form">
            <h2>Admin Login</h2>
            <form action="/admin/checklogin" method="POST">
                <div class="form-group">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-custom">Login</button>
            </form>
        </div>
    </div>

    <%@include file="footer.jsp" %>

    
</body>
</html>
