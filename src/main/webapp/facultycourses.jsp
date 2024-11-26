<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Courses</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            background-color: #ecf0f1;
            color: #34495E;
            margin: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Top Navbar */
        .navbar {
            background-color: #34495E;
            color: #FFFFFF;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 10;
        }
        
        .navbar .nav-link {
            color: #FFFFFF !important;
        }
        
        /* Sidebar */
        .sidebar {
            background-color: #34495E;
            color: #FFFFFF;
            height: 100vh;
            position: fixed;
            width: 200px;
            padding-top: 70px;
            transition: margin-left 0.3s ease;
        }

        .sidebar-hidden {
            margin-left: -200px;
        }
        
        .sidebar .nav-link {
            color: #FFFFFF;
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
        }

        .btn-moved {
            left: 10px;
        }
        
       /* Table Styles */
         .table-container {
            padding: 2rem;
        }

        .table {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #34495E;
            color: #fff;
        }
        
    </style>
</head>
<body>

<%@ include file="facultynav.jsp" %> <!-- Include top navbar -->
<%@ include file="facultysidenav.jsp" %>

<!-- Sidebar Toggle Button -->
<button id="toggle-btn" class="toggle-btn"><i class="fas fa-chevron-left"></i></button>

<div class="content">
    <div class="container table-container">
        <h2 class="mb-4">My Courses</h2>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Course Code</th>
                    <th>Credits</th>
                    <th>Department</th>
                    <th>Section</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="fcm" items="${mycourselist}">
                    <tr>
                        <td>${fcm.course.name}</td>
                        <td>${fcm.course.code}</td>
                        <td>${fcm.course.credits}</td>
                        <td>${fcm.course.department}</td>
                        <td>${fcm.section}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
document.getElementById('toggle-btn').addEventListener('click', function () {
    const sidebar = document.getElementById('sidebar');
    const toggleBtnIcon = this.querySelector('i');

    sidebar.classList.toggle('sidebar-hidden');
    this.classList.toggle('btn-moved');

    toggleBtnIcon.classList.toggle('fa-chevron-right');
    toggleBtnIcon.classList.toggle('fa-chevron-left');
});
</script>
</body>
</html>
