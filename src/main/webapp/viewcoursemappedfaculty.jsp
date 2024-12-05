<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Mapped Faculty</title>
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

<%@ include file="adminnav.jsp" %> 


<div class="content">
    <div class="container table-container">
        <h2 class="mb-4">Courses with Mapped Faculty</h2>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Course Code</th>
                    <th>Section</th>
                    <th>Department</th>
                    <th>Faculty Id</th>
                    <th>Faculty Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="fcm" items="${courses}">
                    <tr>
                        <td>${fcm.course.name}</td>
                        <td>${fcm.course.code}</td>
                        <td>${fcm.section}</td>
                        <td>${fcm.course.department}</td>
                        <td>${fcm.instructor.id}</td>
                        <td>${fcm.instructor.name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
