<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification - EduVerse</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #34495E;
            --secondary-color: #2C3E50;
            --accent-color: #1ABC9C;
            --text-light: #ECF0F1;
            --text-muted: #95A5A6;
            --transition: all 0.3s ease;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --success-color: #2ecc71;
            --error-color: #e74c3c;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: var(--primary-color);
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .otp-container {
            width: 100%;
            max-width: 500px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
        }

        .otp-header {
            background: var(--primary-color);
            color: var(--text-light);
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .otp-form {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--secondary-color);
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: var(--transition);
            font-family: 'Poppins', sans-serif;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(26, 188, 156, 0.1);
        }

        .submit-btn {
            display: block;
            width: 100%;
            padding: 15px;
            background: var(--accent-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            transition: var(--transition);
        }

        .submit-btn:hover {
            background: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        
        /* Toast Notification Styles */
        #toast {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 20px;
            border-radius: 8px;
            color: white;
            background-color: var(--error-color);
            font-weight: 500;
            font-size: 14px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            opacity: 0;
            visibility: hidden;
            transition: all 0.5s ease;
            z-index: 1000;
        }

        #toast.show {
            opacity: 1;
            visibility: visible;
        }
        
        #toast.success {
            background-color: var(--success-color);
        }

        #toast.error {
            background-color: var(--error-color);
        }
    </style>
</head>
<body>
    <div class="otp-container">
        <div class="otp-header">
            <h1>OTP Verification</h1>
            <i class="fas fa-shield-alt" style="font-size: 1.5rem;"></i>
        </div>

        <form class="otp-form" id="otpVerificationForm" method="post" action="otp">
            <div class="form-group">
                <label for="otpCode">Enter OTP</label>
                <input 
                    type="text" 
                    id="otpCode" 
                    name="otp" 
                    required 
                    placeholder="Enter 6-digit OTP" 
                    maxlength="6"
                >
            </div>

            <button type="submit" class="submit-btn">
                <i class="fas fa-check-circle"></i> Verify OTP
            </button>
        </form>
    </div>

    <!-- Toast Notification -->
    <div id="toast"></div>

    <script>
    function showToast(message, type) {
        const toast = document.getElementById('toast');
        toast.textContent = message;
        toast.className = `show ${type}`;
        
        setTimeout(() => {
            toast.className = '';
        }, 3000);
    }
    
    const urlParams = new URLSearchParams(window.location.search);
    const status = urlParams.get('msg');
    
    if (status === 'invalid') {
        showToast('Invalid OTP. Please try again.', 'error');
    } else if (status === 'expired') {
        showToast('OTP has expired. Request a new one.', 'error');
    }
    
    document.getElementById('otpVerificationForm').onsubmit = function(event) {
        const otpCode = document.getElementById('otpCode').value;

        if (otpCode.length !== 6) {
            showToast('Please enter a valid 6-digit OTP.', 'error');
            event.preventDefault(); 
        }
    };
    </script>
</body>
</html>