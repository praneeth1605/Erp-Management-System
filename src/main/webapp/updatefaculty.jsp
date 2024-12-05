<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Faculty</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>

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
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px; /* Increased width from 500px to 600px */
            margin-top: 0px; /* Add top margin to align closer to the navbar */
            margin-left: 250px;
        }

        .form-container h1 {
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
    </style>
</head>
<body>

<%@ include file="adminnav.jsp" %> <!-- Include top navbar -->


<!-- Main Content -->
<div class="content">
    <div class="form-container">
        <h1>Update Faculty Details</h1>
        <form action="/admin/updatefac" method="POST">

            <div class="form-group">
                <label for="id">Faculty ID</label>
                <input type="number" class="form-control" id="id" name="id" value="${id}" readonly required>
            </div>

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            
            

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            
            
            <div class="form-group">
                <label for="dept">Department</label>
                <select class="form-control" id="dept" name="dept" required>
                    <option>Select Department</option>
                    <option value="CSE">CSE</option>
                    <option value="CSIT">CSIT</option>
                    <option value="AIDS">AIDS</option>
                    <option value="ECE">ECE</option>
                    <option value="EEE">EEE</option>
                    <option value="Mech">Mech</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="des">Designation</label>
                <select class="form-control" id="des" name="des" required>
                    <option>Select Designation</option>
                    <option value="Assistant Professor">Assistant Professor</option>
                    <option value="Associate Professor">Associate Professor</option>
                    <option value="HOD">Head of the Department</option>
                    <option value="Dean">Dean</option>
                </select>
            </div>
            
            
            <div class="form-group">
                <label for="status">Status</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="">Select Status</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>
            
             
            <div class="form-group">
                <label for="contactno">Contact Number</label>
                <input type="text" class="form-control" id="contactno" name="contactno" required>
            </div>
            
            
            <button type="submit" class="btn btn-custom">Update</button>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
