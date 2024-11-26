<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        /* Base styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
            min-height: 100vh;
        }

        /* Layout structure */
        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Side navbar styling - adjust width as needed */
        .sidenav {
            width: 250px;
            background-color: #2c3e50;
            position: fixed;
            height: 100vh;
            left: 0;
            top: 0;
        }

        /* Main content area */
        .main-content {
            margin-left: 250px; /* Should match sidenav width */
            flex: 1;
            padding: 20px 40px;
        }

        .content-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 20px;
        }

        /* Page title styling */
        h2 {
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 24px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            text-align: center;
        }

        /* Register courses button container */
        .button-container {
            text-align: center;
            margin-bottom: 30px;
        }

        /* Register courses button */
        a[href="coursereg"] {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a[href="coursereg"]:hover {
            background-color: #2980b9;
        }

        /* Table styling */
        .table-container {
            overflow-x: auto;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #34495e;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        /* Responsive design */
        @media (max-width: 1024px) {
            .main-content {
                margin-left: 200px;
                padding: 20px;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 15px;
            }

            .sidenav {
                width: 200px;
                transform: translateX(-100%);
                transition: transform 0.3s ease-in-out;
            }

            .sidenav.active {
                transform: translateX(0);
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="studentnav.jsp" %> <!-- Include top navbar -->
    
    <div class="container">
        <div class="sidenav">
            <%@ include file="studentsidenav.jsp" %>
        </div>
        
        <div class="main-content">
            <div class="content-wrapper">
                <h2>My Courses</h2>
                <h2><c:out value="${msg}"></c:out></h2>
                
                <div class="button-container">
                    <a href="coursereg">Register Courses</a>
                </div>
                
                <div class="table-container">
                    <table>
                        <tr>
                            <th>COURSE CODE</th>
                            <th>COURSE TITLE</th>
                            <th>SECTION</th>
                            <th>Faculty Name</th>
                        </tr>

                        <c:forEach items="${clist}" var="scm">
                            <tr>
                                <td><c:out value="${scm.course.code}" /></td>
                                <td><c:out value="${scm.course.name}" /></td>
                                <td><c:out value="${scm.section}" /></td>
                                <td><c:out value="${scm.faculty.name}" /></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>