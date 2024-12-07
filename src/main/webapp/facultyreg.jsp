<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Faculty Registration</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
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

        /* Placeholder styling */
        .form-control::placeholder {
            color: #95a5a6;
            opacity: 0.7;
        }
        
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
    </style>
</head>
<body>

<%@ include file="adminnav.jsp" %>

<div class="content">
    <div class="form-container">
        <h1>Faculty Registration</h1>
        <form action="addfaculty" method="POST">

            <div class="form-group">
                <label for="id">Faculty ID</label>
                <input type="number" class="form-control" id="id" name="id" placeholder="Enter faculty ID" required>
            </div>

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter full name" required>
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
                <label for="designation">Designation</label>
                 <select class="form-control" id="dept" name="dept" required>
                    <option value="">Select Designation</option>
                    <option value="Assistant Professor">Assistant Professor</option>
                    <option value="Associate Professor">Associate Professor</option>
                    <option value="HOD">HOD</option>
                </select>
            </div>

            <button type="submit" class="btn btn-custom">Register</button>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
