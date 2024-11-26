<%@page import="com.klef.jfsd.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Home</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        
        

        /* Main Content */
        .content {
            margin-left: 200px;
            margin-top: 70px; /* Offset for fixed navbar */
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        .content-expanded {
            margin-left: 0;
        }

    </style>
</head>
<body>

<%@ include file="studentnav.jsp" %>

<!-- Sidebar Toggle Button -->
<button id="toggle-btn" class="toggle-btn"><i class="fas fa-chevron-left"></i></button>

<!-- Main Content -->
<div id="mainContent" class="content">
    <h1>Welcome <%= s.getName() %></h1>
    <p style="margin-bottom: 410px">This is the student dashboard where you can manage students, faculty, and courses.</p>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

</script>
</body>
</html>
