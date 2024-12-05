<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
       
:root {
    --primary-color: #34495E;
    --secondary-color: #2C3E50;
    --accent-color: #1ABC9C;
    --text-light: #ECF0F1;
    --text-muted: #95A5A6;
    --transition: all 0.3s ease;
    --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f9fa;
    color: var(--primary-color);
    margin: 0;
    line-height: 1.6;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.main-content {
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: var(--shadow);
    padding: 30px;
    margin-top: 100px;
    margin-left: 90px;
}

.content-wrapper h2 {
    color: var(--primary-color);
    border-bottom: 2px solid var(--accent-color);
    padding-bottom: 10px;
    margin-bottom: 20px;
    font-weight: 500;
}

.button-container {
    margin-bottom: 20px;
    text-align: right;
}

.button-container a {
    display: inline-block;
    background-color: var(--accent-color);
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    transition: transform 0.2s ease, background-color 0.2s ease, box-shadow 0.2s ease;
    font-weight: 500;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.button-container a:hover {
    background-color: var(--primary-color);
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}

.button-container a:active {
    transform: translateY(2px);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    background-color: var(--primary-color-dark); /* Slightly darker color for clicked effect */
}


.table-container {
    width: 100%;
    overflow-x: auto;
    display: flex;
    justify-content: center; /* Center the table horizontally */
}

table {
    width: 100%;
    max-width: 900px; /* Optional: limit table width */
    border-collapse: collapse;
    margin-top: 20px;
}

table th {
    background-color: var(--primary-color);
    color: var(--text-light);
    padding: 12px;
    text-align: left;
    text-transform: uppercase;
    font-weight: 600;
}

table td {
    padding: 12px;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    color: var(--secondary-color);
}

table tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tr:hover {
    background-color: rgba(26, 188, 156, 0.1);
    transition: var(--transition);
}

@media screen and (max-width: 768px) {
    .container {
        width: 95%;
        padding: 10px;
    }

    .main-content {
        padding: 15px;
    }

    table {
        font-size: 14px;
    }
}

/* Responsive Typography */
@media screen and (max-width: 480px) {
    h2 {
        font-size: 1.4rem;
    }

    .button-container a {
        padding: 8px 15px;
        font-size: 0.9rem;
    }
}

/* Subtle Animations */
.button-container a,
table tr {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

th:nth-child(2) {
            min-width: 150px; /* Increases column width for these columns */
        }
    </style>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <%@include file="studentnav.jsp" %>
    
    <div class="container">
    
        <div class="main-content">
            <div class="content-wrapper">
                <h2>My CGPA</h2>
                <h3>CGPA: <c:out value="${cgpa}"></c:out> </h3>
                <div class="table-container">
                    <table>
                        <tr>
                           
                            <th>Course Code</th>
                            <th>Course Title</th>
                            <th>Grade</th>
                            <th>Grade Points</th>
                            <th>Credits</th>
                            <th>Academic Year</th>
                            <th>Semester</th>
                        </tr>

                        <c:forEach items="${mycourselist}" var="scm">
                            <tr>
                                
                                <td><c:out value="${scm.course.code}" /></td>
                                <td><c:out value="${scm.course.name}" /></td>
                                <td><c:out value="${scm.result}" /></td>
                                <td><c:out value="${scm.grade}" /></td>
                                <td><c:out value="${scm.course.credits}" /></td>
                                <td><c:out value="${scm.course.academicYear}" /></td>
                                <td><c:out value="${scm.course.semester}" /></td>
                                
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>