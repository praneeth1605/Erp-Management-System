<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* Sidebar */
        .sidebar {
            background-color: #34495E;
            color: #FFFFFF;
            height: 100vh;
            position: fixed;
            width: 200px;
            padding-top: 70px; /* Adjust for navbar height */
            transition: margin-left 0.3s ease;
        }

        .sidebar-hidden {
            margin-left: -200px;
        }
        
        .sidebar .nav-link {
            color: #FFFFFF;
        }

       
</style>
<body>
<!--Sidebar-->
<div id="sidebar" class="sidebar d-flex flex-column">
    <h5 class="text-center py-2">Admin Tasks</h5>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link" href="home">Dashboard</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="postattendance">Post Attendance</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="mycourses">My Courses</a>
        </li>
    </ul>
</div>


</body>

</html>