<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Post Attendance</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #34495E;  /* Deep blue-gray */
            --secondary-color: #2C3E50;
            --accent-color: #1ABC9C;   /* Teal accent */
            --text-light: #ECF0F1;
            --text-muted: #95A5A6;
            --background-color: #f8f9fa;
            --transition: all 0.3s ease;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--primary-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1100px;  /* Increased container width */
            margin: 90px auto 30px;
            background: white;
            padding: 40px;  /* Increased padding */
            border-radius: 12px;  /* Slightly larger border radius */
            box-shadow: var(--shadow);
        }

        .course-info {
            background-color: var(--secondary-color);
            color: var(--text-light);
            padding: 20px;  /* Increased padding */
            border-radius: 8px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .course-info b {
            color: var(--text-light);
            font-weight: 500;
            font-size: 1.1rem;  /* Slightly larger font */
        }

      

        .table-attendance {
            width: 100%;
            margin-top: 20px;
            border-collapse: separate;
            border-spacing: 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .table-attendance thead {
            background-color: var(--primary-color);
            color: var(--text-light);
        }

        .table-attendance th, .table-attendance td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        .table-attendance thead th {
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .table-attendance tbody tr:hover {
            background-color: rgba(26, 188, 156, 0.05);
        }

        .table-attendance tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn-submit {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 15px 25px;
            font-weight: 600;
            border-radius: 8px;
            transition: var(--transition);
            width: 100%;
            margin-top: 20px;
            font-size: 1.1rem;
        }

        .btn-submit:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            cursor: pointer;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .container {
                margin: 70px 15px 30px;
                padding: 20px;
            }

            .course-info {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }

            
        }
        .table-attendance input[type="text"] {
    width: 150px;
    padding: 10px;
    border: 2px solid var(--text-muted);
    border-radius: 6px;
    font-family: 'Roboto', sans-serif;
    font-size: 1rem;
    color: var(--primary-color);
    transition: var(--transition);
    text-align: center;
}

.table-attendance input[type="text"]:focus {
    outline: none;
    border-color: var(--accent-color);
    box-shadow: 0 0 0 3px rgba(26, 188, 156, 0.2);
}

.table-attendance input[type="text"]:hover {
    border-color: var(--accent-color);
}
    </style>
</head>
<body>

    <div class="container">
        <h1 class="text-center mb-4" style="color: var(--primary-color);">Post Externals</h1>

        <div class="course-info">
            <b>Course Name: ${course.name}</b>
            <b>Course Code: ${course.code}</b>
            <b>Section: ${sec}</b>
        </div>

        <form action="/admin/externalspost" method="post">
            <input type="hidden" name="section" value="${sec}">
            <input type="hidden" name="cid" value="${course.id}">

            <div class="table-responsive">
                <table class="table-attendance">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th class="text-center">Enter Marks(Out of 40)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="details" items="${slist}" varStatus="status">
                            <tr>
                                <td>${details.student.id}</td>
                                <td>${details.student.name}</td>
                                <td class="text-center">
                                    <input type="text" name="${status.index}">
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <button type="submit" class="btn-submit">
                Post Internals
            </button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>