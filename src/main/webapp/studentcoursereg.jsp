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
    <title>Student Course Registration</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #34495E;
            --secondary-color: #2C3E50;
            --accent-color: #1ABC9C;
            --accent-color-dark: #16a085;
            --text-light: #ECF0F1;
            --text-muted: #95A5A6;
            --transition: all 0.3s ease;
            --shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: var(--primary-color);
            margin: 0;
            line-height: 1.6;
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

        /* Form styling */
        .form-container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: var(--shadow);
            max-width: 800px;
            margin: 0 auto;
            margin-top: 20px;
        }

        .form-container h1 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 1.5rem;
            border-bottom: 2px solid var(--accent-color);
            padding-bottom: 10px;
            font-weight: 500;
        }

        /* Table Styling */
        .form-group table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .form-group table th {
            background-color: var(--primary-color);
            color: var(--text-light);
            padding: 12px;
            text-align: left;
            text-transform: uppercase;
            font-weight: 600;
        }

        .form-group table td {
            padding: 12px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            color: var(--secondary-color);
        }

        .form-group table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .form-group table tr:hover {
            background-color: rgba(26, 188, 156, 0.1);
            transition: var(--transition);
        }

        /* Form Controls */
        .form-control {
            border-radius: 4px;
            border: 1px solid #ddd;
            margin-bottom: 1rem;
        }

        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 8px rgba(26, 188, 156, 0.3);
        }

        /* Select Styling */
        select {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ddd;
            background-color: white;
            color: var(--secondary-color);
            transition: var(--transition);
        }

        select:focus {
            border-color: var(--accent-color);
            outline: none;
            box-shadow: 0 0 8px rgba(26, 188, 156, 0.3);
        }

        /* Button Styling */
        .btn-custom {
            display: inline-block;
            background-color: var(--accent-color);
            color: white;
            width: 100%;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 0 var(--accent-color-dark);
            position: relative;
            transition: all 0.1s ease;
            cursor: pointer;
        }

        .btn-custom:hover {
            background-color: var(--accent-color-dark);
            box-shadow: 0 2px 0 var(--accent-color-dark);
            top: 2px;
        }

        .btn-custom:active {
            box-shadow: none;
            top: 4px;
            background-color: var(--accent-color-dark);
        }

        /* Responsive Adjustments */
        @media screen and (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 1rem;
            }

            .form-container {
                width: 95%;
                padding: 1rem;
                margin-left: auto;
                margin-right: auto;
            }

            .form-group table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<%@ include file="studentnav.jsp" %> 

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
</body>
</html>