<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Students</title>
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

        /* Table Styles */
        .table-container {
            padding: 2rem;
        }

        .table {
            width: 100%; /* Ensures table occupies full width */
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #34495E;
            color: #fff;
            min-width: 100px; /* Sets default minimum width for all columns */
        }
        
        th:nth-child(10) {
            min-width: 150px; /* Increases column width for these columns */
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

        .btn-delete {
            background-color: #E74C3C; /* Delete button color */
        }

        /* Hover Effects */
        .btn-update:hover {
            background-color: #3498DB;
        }

        .btn-delete:hover {
            background-color: #C0392B;
        }

        /* Status Badge Styles */
        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            
            
        }

        .status-active {
            background-color: #28a745;
            color: white;
        }

        .status-inactive {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>

<%@ include file="adminnav.jsp" %> <!-- Include top navbar -->


<div class="content">
    <div class="container table-container">
        <h2 class="mb-4">Manage Students</h2>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Date of Birth</th>
                    <th>Father's Name</th>
                    <th>Mother's Name</th>
                    <th>Gender</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>${student.email}</td>
                        <td>${student.contactno}</td>
                        <td>${student.dob}</td>
                        <td>${student.fname}</td>
                        <td>${student.mname}</td>
                        <td>${student.gender}</td>
                        <td>
                            <span class="status-badge ${student.status.toLowerCase() eq 'active' ? 'status-active' : 'status-inactive'}">
                                ${student.status}
                            </span>
                        </td>
                        <td>
                            <a href='<c:url value="updatestudent/${student.id}"/>' 
                               class="btn-action btn-update">
                               <i class="fas fa-edit"></i> Update
                            </a><br><br>
                            <a href='<c:url value="deletestudent/${student.id}"/>' 
                               class="btn-action btn-delete" 
                               onclick="return confirm('Are you sure you want to delete this student?');">
                               <i class="fas fa-trash-alt"></i> Delete
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