<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        /* Main Content */
        .content {
            margin-left: 200px;
            margin-top: 60px; 
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        .content-expanded {
            margin-left: 0;
        }

        /* Toggle Button */
        .toggle-btn {
            position: fixed;
            top: 50%;
            transform: translateY(-50%);
            left: 210px;
            font-size: 1.5rem;
            cursor: pointer;
            color: #34495E;
            background-color: #FFFFFF;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            transition: left 0.3s ease;
            z-index: 20;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .btn-moved {
            left: 10px;
        }
        
        /* Form styling */
        .form-container {
            background-color: #ffffff;
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            margin: 20px auto;
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-5px);
        }

        .form-container h1 {
            color: #34495E;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2.2rem;
            font-weight: 600;
            position: relative;
            padding-bottom: 15px;
        }

        .form-container h1:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: #1ABC9C;
            border-radius: 2px;
        }

        /* Form Group Styling */
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            color: #34495E;
            font-weight: 600;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
            display: block;
            transition: color 0.3s ease;
        }

        .form-control {
            border-radius: 8px;
            border: 2px solid #e9ecef;
            padding: 0.75rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            color: #2c3e50;
            background-color: #ffffff;
        }

        .form-control:focus {
            border-color: #1ABC9C;
            box-shadow: 0 0 0 0.2rem rgba(26, 188, 156, 0.25);
            outline: none;
        }

        /* Select Styling */
select.form-control {
    appearance: none;
    padding-right: 2.5rem;
    padding-top: 1rem;
    padding-bottom: 1rem;
    height: 3.5rem;  /* Increased height */
    background: #ffffff url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e")
        no-repeat;
    background-position: right 1rem center;
    background-size: 1em;
    cursor: pointer;
}

select.form-control option {
    color: #2c3e50;
    padding: 1rem;
    height: 3rem;  /* Added height for options */
}

        /* Input types specific styling */
        input[type="date"].form-control {
            padding: 0.6rem 0.75rem;
        }

        input[type="password"].form-control {
            letter-spacing: 0.1em;
        }

        /* Button styling */
        .btn-custom {
            background-color: #1ABC9C;
            color: #ffffff;
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
        }

        .btn-custom:hover {
            background-color: #16A085;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 188, 156, 0.3);
        }

        .btn-custom:active {
            transform: translateY(0);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .form-container {
                margin: 10px;
                padding: 1.5rem;
            }

            .content {
                margin-left: 0;
                padding: 1rem;
            }
        }

        /* Form validation visual feedback - Modified to exclude select elements */
        input.form-control:valid {
            border-color: #2ecc71;
        }

        input.form-control:invalid:not(:placeholder-shown) {
            border-color: #e74c3c;
        }
        
        input[type="date"].form-control:invalid {
    border-color: #e9ecef;
}
        
        
        /* Placeholder styling */
        .form-control::placeholder {
            color: #95a5a6;
            opacity: 0.7;
        }
        
        /* Animation for form elements */
        .form-group {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s ease forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Stagger animation for form groups */
        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }
        .form-group:nth-child(5) { animation-delay: 0.5s; }
        .form-group:nth-child(6) { animation-delay: 0.6s; }
        .form-group:nth-child(7) { animation-delay: 0.7s; }
        .form-group:nth-child(8) { animation-delay: 0.8s; }
        .form-group:nth-child(9) { animation-delay: 0.9s; }
        .form-group:nth-child(10) { animation-delay: 1s; }
    </style>
</head>
<body>

<%@ include file="adminnav.jsp" %>

<div class="content">
    <div class="form-container">
        <h1>Student Registration</h1>
        <form action="addstudent" method="POST">

            <div class="form-group">
                <label for="id">Student ID</label>
                <input type="number" class="form-control" id="id" name="id" placeholder="Enter student ID" required>
            </div>

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter full name" required>
            </div>
            
            <div class="form-group">
                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            </div>
             
            <div class="form-group">
                <label for="dept">Department</label>
                <select class="form-control" id="dept" name="dept" required>
                    <option value="">Select Department</option>
                    <option value="CSE">CSE</option>
                    <option value="CSIT">CSIT</option>
                    <option value="AIDS">AIDS</option>
                    <option value="ECE">ECE</option>
                    <option value="EEE">EEE</option>
                    <option value="Mech">Mech</option>
                </select>
            </div>
             
            <div class="form-group">
                <label for="contactno">Contact Number</label>
                <input type="text" class="form-control" id="contactno" name="contactno" placeholder="Enter contact number" required>
            </div>

            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob" required>
            </div>

            <div class="form-group">
                <label for="fname">Father's Name</label>
                <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter father's name" required>
            </div>

            <div class="form-group">
                <label for="mname">Mother's Name</label>
                <input type="text" class="form-control" id="mname" name="mname" placeholder="Enter mother's name" required>
            </div>
            
            <button type="submit" class="btn btn-custom">Register</button>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
const icon = this.querySelector('i');
if (sidebar.classList.contains('sidebar-hidden')) {
    icon.classList.remove('fa-bars');
    icon.classList.add('fa-bars-staggered');
} else {
    icon.classList.remove('fa-bars-staggered');
    icon.classList.add('fa-bars');
}
</script>
</body>
</html>