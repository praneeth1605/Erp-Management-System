<%@page import="com.klef.jfsd.model.FacultyCourseMapping"%>
<%@page import="java.util.List"%>
<%@page import="com.klef.jfsd.model.Course"%>
<%@page import="com.klef.jfsd.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%!int i=1; %>
<%
 Student student = (Student)session.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
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

<%@ include file="studentnav.jsp" %> <!-- Include top navbar -->
<%@ include file="studentsidenav.jsp" %>

<!-- Sidebar Toggle Button -->
<button id="toggle-btn" class="toggle-btn"><i class="fas fa-chevron-left"></i></button>

<!-- Main Content -->
<div class="content">
    <div class="form-container">
    
        <h1>Register for a Course</h1>
        <form action="courseregister" method="POST">
            
            <div class="form-group">
                <table>
    <tr> 
    <th>SNO</th>
      <th>COURSE CODE</th>
      <th>COURSE TITLE</th>
      <th>SECTION</th>
    </tr> 

    <c:forEach items="${course}" var="c">
    <c:set var="currentc" value="${c}" scope="request" />
    <tr>
      <td><%=++i %></td>
        <td><c:out value="${c.code}" /></td>
        <td><c:out value="${c.name}" /></td>
        <td>
            <select name="<%=i%>">
                <option value="">--Select--</option>
                <%
                    Course courseobject = (Course) request.getAttribute("currentc");

                    if (courseobject != null) {
                        String sectionsAttr = "sections" + courseobject.getId();

                        List<FacultyCourseMapping> sectionsList = (List<FacultyCourseMapping>) request.getAttribute(sectionsAttr);

                        if (sectionsList != null) {
                            for (FacultyCourseMapping section : sectionsList) {
                %>
                                <option value="<%=courseobject.getId()+"/"+section.getSection()+"/"+section.getInstructor().getId() %>">
                                    <%= section.getSection() %>
                                </option>
                <%
                            }
                        }
                    }
                %>
            </select>
        </td>
    </tr>
</c:forEach>

  </table>
            </div>
            <input type="hidden" value="<%=i%>" name="index">
            
            <button type="submit" class="btn btn-custom">Register</button>
            
        </form>
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
