<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String msg=request.getParameter("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Registration</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
<style>
.content {
            margin-left: 200px;
            margin-top: 60px; 
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

/* Form Container Enhancements */
.form-container {
    background-color: #ffffff;
    padding: 2.5rem;
    border-radius: 12px;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 2rem auto;
    transition: transform 0.3s ease;
}

.form-container:hover {
    transform: translateY(-5px);
}

.form-container h1 {
    color: #34495E;
    text-align: center;
    margin-bottom: 2rem;
    font-size: 2rem;
    font-weight: 600;
    position: relative;
    padding-bottom: 10px;
}

.form-container h1:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 3px;
    background: #1ABC9C;
    border-radius: 2px;
}

/* Form Elements Styling */
.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    color: #34495E;
    font-weight: 600;
    margin-bottom: 0.5rem;
    font-size: 1rem;
    display: block;
}

.form-control {
    border-radius: 6px;
    border: 2px solid #e9ecef;
    padding: 0.75rem;
    font-size: 1rem;
    background-color: #ffffff;
    transition: all 0.3s ease;
    color: #2c3e50;
}

 /* Select Styling */
select.form-control {
    appearance: none;
    padding-right: 2.5rem;
    padding-top: 1rem;
    padding-bottom: 1rem;
    height: 3.5rem;  /* Increased height */
    background: #ffffff url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e")
        no-repeat;
    background-position: right 1rem center;
    background-size: 1em;
    cursor: pointer;
}

select.form-control option {
    color: #2c3e50;
    padding: 1rem;
    height: 3rem;  /* Added height for options */
}

select.form-control option:hover,
select.form-control option:focus,
select.form-control option:active {
    background-color: #1ABC9C;
    color: #ffffff;
}

/* Placeholder Styling */
select.form-control option[disabled] {
    color: #95a5a6;
}

.form-control:focus {
    border-color: #1ABC9C;
    box-shadow: 0 0 0 0.2rem rgba(26, 188, 156, 0.25);
    outline: none;
    background-color: #ffffff;
}

/* Button Styling */
.btn-custom {
    background-color: #1ABC9C;
    color: #ffffff;
    width: 100%;
    padding: 12px;
    border-radius: 6px;
    font-size: 1.1rem;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-custom:hover {
    background-color: #16A085;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(26, 188, 156, 0.3);
}

.btn-custom:active {
    transform: translateY(0);
}
</style>

</head>
<body>

<%@ include file="adminnav.jsp" %>

<div class="content">
    <div class="form-container">
        <h1>Map Faculty to Course</h1>
        <form action="map" method="POST">
        <%if(msg!=null){%>
        <h4><%=msg%></h4>
        <%} %>
            <div class="form-group">
                <label for="faculty">Select Faculty</label>
                <select class="form-control" id="faculty" name="fid" required>
                    <option value="" disabled selected>Select Faculty</option>
                    <c:forEach var="faculty" items="${faculties}">
                        <option value="${faculty.id}">${faculty.id} - ${faculty.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="course">Select Course</label>
                <select class="form-control" id="course" name="cid" required>
                    <option value="" disabled selected>Select Course</option>
                    <c:forEach var="course" items="${courses}">
                        <option value="${course.id}">${course.code} - ${course.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
            <label>Give Section</label>
            <input class="form-control" type="number" name="section" min="1" max="40" required>
            </div>

            <button type="submit" class="btn btn-custom">Map Faculty</button>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>