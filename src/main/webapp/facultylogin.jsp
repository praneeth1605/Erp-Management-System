<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Login - EduVerse</title>
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
            background: linear-gradient(135deg, var(--light-color) 0%, #e0e4e8 100%);
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
            padding: 0;
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
        /* Toast Notification Styles */
        #toast {
            visibility: hidden;
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #dc3545;
            color: #fff;
            text-align: center;
            border-radius: 10px;
            padding: 16px;
            z-index: 1100;
            min-width: 250px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transform: translateX(100%);
            transition: transform 0.5s ease-in-out;
        }
        #toast.show {
            visibility: visible;
            transform: translateX(0);
        }
        #toast.hide {
            transform: translateX(100%);
        }
        .captcha-container {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.2rem;
            width: 100%;
        }
        #captcha {
            flex: 0 0 auto;
            height: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin: 0; 
        }
        @media (max-width: 768px) {
            .login-wrapper {
                flex-direction: column;
            }
            .login-image {
                height: 200px;
            }
            .login-image img {
                height: 100%; 
                object-fit: cover; 
            }
            #toast {
                top: 10px;
                right: 10px;
                left: 10px;
                width: calc(100% - 20px);
                min-width: auto;
            }
        }
    </style>
</head>
<body onload="loadcaptcha(); checkUrlMessage();">
    <%@include file="mainnavbar.jsp" %>
    
    <!-- Toast Notification -->
    <div id="toast"></div>

    <div class="login-container">
        <div class="login-wrapper">
            <div class="login-image">
                <img src="/images/faculty_login.jpeg" alt="Faculty Login">
            </div>
            <div class="login-form">
                <h2>Faculty Login</h2>
                <form action="/faculty/checklogin" method="POST">
                    <div class="form-group">
                        <input type="text" class="form-control" id="id" name="id" 
                               placeholder="Enter Faculty ID" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" 
                               name="password" placeholder="Password" required>
                    </div>
                    <div class="captcha-container">
                        <img id="captcha" alt="captcha" onclick="loadcaptcha()" src=""/>
                        <input type="text" name="Captcha" placeholder="Enter Captcha" required="required">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-custom">Login</button>
                    <div class="login-links">
                        <a href="forgotpassword">Forgot Password?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
    function loadcaptcha() {
        var url = "/faculty/getcaptcha/6"
        callApi("GET", url, "", getCaptcha);
    }

    function getCaptcha(res) {
        captcha.src = "data:image/png;base64," + res;
    }

    // Call API
    function callApi(method, url, data, responseHandler) {
        var options;
        if(method == "GET" || method == "DELETE")
            options = {method: method, headers:{'Content-Type':'application/json'} };
        else
            options = {method: method, headers:{'Content-Type':'application/json'}, body: data };
        
        fetch(url, options)
            .then(response => {
                if(!response.ok)
                    throw new Error(response.status + ": " + response.statusText);
                return response.text();
            })
            .then(data => responseHandler(data))
            .catch(error => alert(error));
    }

    // Function to check URL for message and show toast
    function checkUrlMessage() {
        // Get the message from URL parameter
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');
        
        // If message exists, show toast
        if (message) {
            const toast = document.getElementById('toast');
            toast.textContent = decodeURIComponent(message);
            toast.classList.add('show');
            
            // Remove toast after animation completes
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }
    }
    </script>
</body>
</html>