<%@page import="com.klef.jfsd.model.Faculty"%>
<%Faculty faculty = (Faculty) session.getAttribute("faculty");
char ch = faculty.getName().charAt(0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Profile - EduVerse</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: var(--primary-color);
            line-height: 1.6;
        }

        .profile-container {
            max-width: 800px;
            margin: 100px auto 50px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .profile-header {
            background: var(--primary-color);
            color: var(--text-light);
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            color: white;
            margin: -60px auto 20px;
            border: 5px solid white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .profile-details {
            padding: 20px;
            text-align: center;
        }

        .profile-details h2 {
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .profile-details p {
            color: var(--text-muted);
            margin-bottom: 20px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-top: 20px;
        }

        .info-card {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            text-align: left;
            transition: var(--transition);
        }

        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .info-card i {
            color: var(--accent-color);
            margin-right: 10px;
            font-size: 1.2rem;
        }

        .info-card .label {
            color: var(--text-muted);
            font-size: 0.8rem;
            display: block;
            margin-top: 5px;
        }

        .change-password-btn {
            display: inline-block;
            background: var(--accent-color);
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 8px;
            margin-top: 20px;
            transition: var(--transition);
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .change-password-btn:hover {
            background: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 600px) {
            .info-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <div class="profile-container">
        <div class="profile-header">
            <h1>Faculty Profile</h1>
            <i class="fas fa-chalkboard-teacher" style="font-size: 2rem;"></i>
        </div>
        
        <div class="profile-avatar">
            <%=ch%>
        </div>

        <div class="profile-details">
            <h2><%=faculty.getName() %></h2>
            <p><%=faculty.getDepartment() %> Department</p>

            <div class="info-grid">
                <div class="info-card">
                    <i class="fas fa-envelope"></i>
                    <%=faculty.getEmail()%>
                    <span class="label">Email Address</span>
                </div>
                <div class="info-card">
                    <i class="fas fa-id-card"></i>
                    <%=faculty.getId()%>
                    <span class="label">Faculty ID</span>
                </div>
                
                <div class="info-card">
                    <i class="fas fa-briefcase"></i>
                    <%=faculty.getDesignation()%>
                    <span class="label">Designation</span>
                </div>
                
                <div class="info-card">
                    <i class="fas fa-phone"></i>
                    <%=faculty.getContact()%>
                    <span class="label">Contact Number</span>
                </div>
            </div>

            <a href="changepwd" class="change-password-btn">
                <i class="fas fa-lock"></i> Change Password
            </a>
        </div>
    </div>
</body>
</html>