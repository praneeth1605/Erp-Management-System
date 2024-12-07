<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eduverse - Account Blocked</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            max-width: 500px;
            width: 100%;
            position: relative;
            overflow: hidden;
        }
        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, #4e73df, #224abe);
        }
        h2 {
            color: #d9534f;
            font-weight: 600;
            margin-bottom: 15px;
            font-size: 1.8rem;
        }
        .message {
            color: #6c757d;
            font-weight: 300;
            margin-bottom: 25px;
            line-height: 1.6;
        }
        .back-link {
            display: inline-block;
            background: linear-gradient(to right, #4e73df, #224abe);
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 30px;
            font-weight: 400;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .back-link:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(78, 115, 223, 0.4);
        }
        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
                margin: 0 10px;
            }
            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Account Blocked</h2>
        <p class="message">Your account has been temporarily suspended. Please contact the Administrator for further assistance and resolution.</p>
        <a href="login" class="back-link">Back to Login</a>
    </div>
</body>
</html>