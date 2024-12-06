<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - EduVerse</title>
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

        .password-container {
            width: 100%;
            max-width: 500px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
        }

        .password-header {
            background: var(--primary-color);
            color: var(--text-light);
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            color: var(--text-light);
            text-decoration: none;
            font-size: 1.2rem;
            transition: var(--transition);
        }

        .back-button:hover {
            color: var(--accent-color);
            transform: translateX(-5px);
        }

        .password-form {
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

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 42px;
            cursor: pointer;
            color: var(--text-muted);
            transition: var(--transition);
        }

        .password-toggle:hover {
            color: var(--accent-color);
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
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
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

    <div class="password-container">
        
        <div class="password-header">
            <h1>Change Password</h1>
            <i class="fas fa-lock" style="font-size: 1.5rem;"></i>
        </div>
        
        <form class="password-form" id="changePasswordForm" method="post" action="forgotpasswordupdate">
        
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input 
                    type="password" 
                    id="newPassword" 
                    name="password" 
                    required 
                    placeholder="Enter new password"
                >
                
                <span class="password-toggle" onclick="togglePasswordVisibility('newPassword', this)">
                    <i class="fas fa-eye" style="padding-top: 10px;"></i>
                </span>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input 
                    type="password" 
                    id="confirmPassword" 
                    name="cpassword" 
                    required 
                    placeholder="Confirm new password" 
                >
                <span class="password-toggle" onclick="togglePasswordVisibility('confirmPassword', this)">
                    <i class="fas fa-eye"  style="padding-top: 10px;"></i>
                </span>
            </div>

            <button type="submit" class="submit-btn">
                <i class="fas fa-save"></i> Update Password
            </button>
        </form>
    </div>

    <!-- Toast Notification -->
    <div id="toast"></div>

    <script>
 
   
    function togglePasswordVisibility(inputId, toggleElement) {
        const input = document.getElementById(inputId);
        const icon = toggleElement.querySelector('i');
        
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }

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
    

    if (status === 'success') {
        showToast('Password updated successfully!');
    } else if (status === 'error') {
        showToast('Failed to update password. Please try again.');
    }
    
    document.getElementById('changePasswordForm').onsubmit = function(event) {
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPassword) {
            showToast('Passwords do not match. Please try again.','error');
            event.preventDefault(); // Prevent the form from submitting
        }
    };
    </script>
</body>
</html>