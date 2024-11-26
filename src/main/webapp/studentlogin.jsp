<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login - EduVerse</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1ABC9C;
            --secondary-color: #16A085;
            --dark-color: #34495E;
            --light-color: #f9f9f9;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: url('/images/student_bg1.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            padding: 20px;
        }
        .login-wrapper {
            display: flex;
            box-shadow: 0 15px 35px rgba(50,50,93,.1), 0 5px 15px rgba(0,0,0,.07);
            border-radius: 15px;
            overflow: hidden;
            max-width: 900px;
            width: 100%;
            background-color: white;
        }
        .login-image {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0; /* Remove padding to make image fit fully */
            overflow: hidden;
        }
        .login-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .login-form {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .login-form h2 {
            color: var(--dark-color);
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }
        .form-control {
            border-radius: 50px;
            padding: 12px 20px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 15px rgba(26,188,156,0.2);
        }
        .btn-custom {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            border: none;
            border-radius: 50px;
            padding: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: transform 0.3s ease;
        }
        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 14px rgba(50,50,93,.1), 0 3px 6px rgba(0,0,0,.08);
        }
        .login-links {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }
        .login-links a {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.9rem;
        }
        @media (max-width: 768px) {
            .login-wrapper {
                flex-direction: column;
            }
            .login-image {
                height: 200px; /* Adjust for smaller screens */
            }
            .login-image img {
                height: 100%; 
                object-fit: cover; 
            }
        }
    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    
    <div class="login-container">
        <div class="login-wrapper">
            <div class="login-image">
                <img src="/images/student_login.jpeg" alt="Student Login">
            </div>
            <div class="login-form">
                <h2>Student Login</h2>
                <form action="checklogin" method="POST">
                    <div class="form-group">
                        <input type="text" class="form-control" id="id" name="id" 
                               placeholder="Enter Student ID" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" 
                               name="password" placeholder="Password" required>
                    </div>
                    <button type="submit" class="btn btn-custom">Login</button>
                    <div class="login-links">
                        <a href="#">Forgot Password?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
