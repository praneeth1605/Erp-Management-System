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
        
       /* Table Styles */
         .table-container {
            padding: 2rem;
            justify-content: center; /* Aligns the table horizontally */
    align-items: center; /* Aligns the table vertically */
    flex-direction: column;
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
        
        .btn-action {
            font-size: 0.9rem;
            padding: 5px 10px;
            color: #fff;
            border: none;
            border-radius: 4px;
        }

        .btn-update {
            background-color: #5DADE2; /* Update button color */
        }
        
        
        
        
    </style>
</head>
<body>

<%@ include file="facultynav.jsp" %> <!-- Include top navbar -->


<div class="content">
    <div class="container table-container" style="
    margin-top: 100px;
    margin-left: 260px;
">
        <h2 class="mb-4">Post Attendance</h2>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Course Code</th>
                    <th>Credits</th>
                    <th>Department</th>
                    <th>Section</th>
                    <th>Action</th>
                    
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
                        <td>
                            <a href='<c:url value="postinternals/${fcm.course.id}/${fcm.section}" />' 
                               class="btn-action btn-update">
                               <i class="fa-solid fa-marker"></i> Post Internals
                            </a>
                        </td>
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
