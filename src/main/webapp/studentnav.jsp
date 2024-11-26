<%@page import="com.klef.jfsd.model.Student"%>
<%
Student s = (Student) session.getAttribute("student");
if(s==null)
{
	response.sendRedirect("SessionExpired");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduVerse</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Ensure the body and html take full height */
        html, body {
            height: 100%;
            margin: 0;
        }

        body {
            background-color: #FFFFFF;
            color: #34495E;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .navbar {
            background-color: #34495E;
            border-bottom: 2px solid #1ABC9C;
        }

        .navbar-nav .nav-link {
            color: #FFFFFF !important;
        }

        .navbar-nav .nav-link:hover {
            color: #1ABC9C !important; 
        }

        .btn-custom {
            background-color: #1ABC9C; 
            color: #FFFFFF;
        }

        .btn-custom:hover {
            background-color: #16A085; 
            color: #FFFFFF;
        }

    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="/">EduVerse</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    
    <!-- Bootstrap JS & Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
