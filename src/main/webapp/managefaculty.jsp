<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Faculty</title>
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
        
        
         
        th:nth-child(9) {
            min-width: 150px; /* Increases column width for action columns */
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
<%@ include file="adminsidenav.jsp" %> <!-- Include sidebar -->

<div class="content">
    <div class="container table-container">
        <h2 class="mb-4">Manage Faculty</h2>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Department</th>
                    <th>Contact</th>
                    <th>Designation</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="faculty" items="${flist}">
                    <tr>
                        <td>${faculty.id}</td>
                        <td>${faculty.name}</td>
                        <td>${faculty.email}</td>
                        <td>${faculty.gender}</td>
                        <td>${faculty.department}</td>
                        <td>${faculty.contact}</td>
                        <td>${faculty.designation}</td>
                        <td>
                            <span class="status-badge ${faculty.status.toLowerCase() eq 'active' ? 'status-active' : 'status-inactive'}">
                                ${faculty.status}
                            </span>
                        </td>
                        <td>
                            <a href='<c:url value="updatefaculty/${faculty.id}" />' 
                               class="btn-action btn-update">
                               <i class="fas fa-edit"></i> Update
                            </a><br><br>
                            <a href='<c:url value="deletefaculty/${faculty.id}" />' 
                               class="btn-action btn-delete" 
                               onclick="return confirm('Are you sure you want to delete this Faculty?');">
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
