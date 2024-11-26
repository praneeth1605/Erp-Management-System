<%@page import="com.klef.jfsd.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% Faculty f = (Faculty)session.getAttribute("faculty"); 
   if(f==null)
   {
	  response.sendRedirect("SessionExpired");
	  return;
   }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Faculty Home</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            background-color: #FFFFFF;
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
            padding-top: 70px; /* Adjust for navbar height */
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
            margin-top: 70px; /* Offset for fixed navbar */
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
    </style>
</head>
<body>

<%@ include file="facultynav.jsp" %> <!-- Include top navbar -->

<%@ include file="facultysidenav.jsp" %>

<!-- Sidebar Toggle Button -->
<button id="toggle-btn" class="toggle-btn"><i class="fas fa-chevron-left"></i></button>

<!-- Main Content -->
<div id="mainContent" class="content">
    <h1>Welcome <%=f.getName()%></h1>
    <p style="margin-bottom: 410px">This is the admin dashboard where you can manage students, faculty, and courses.</p>
</div>

<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
document.getElementById('toggle-btn').addEventListener('click', function () {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('mainContent');
    const toggleBtnIcon = this.querySelector('i');

    sidebar.classList.toggle('sidebar-hidden');
    mainContent.classList.toggle('content-expanded');
    this.classList.toggle('btn-moved');

    toggleBtnIcon.classList.toggle('fa-chevron-right');
    toggleBtnIcon.classList.toggle('fa-chevron-left');
});
</script>
</body>
</html>
