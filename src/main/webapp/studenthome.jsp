<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

    <style>
        .content {
            margin-left: 280px;
            margin-top: 70px;
            padding: 2rem;
            transition: var(--transition);
        }

        .content-expanded {
            margin-left: 0;
        }

        .dashboard-card {
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
        }

        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .quick-stats {
            margin-bottom: 2rem;
        }

        .academic-overview {
            background: #fff;
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .activity-item {
            padding: 0.75rem 0;
            border-bottom: 1px solid #eee;
        }

        .stat-label {
            font-size: 0.9rem;
            color: #6c757d;
        }

        .stat-value {
            font-size: 1.8rem;
            font-weight: 600;
            color: #2c3e50;
        }

        .progress-bar-custom {
            border-radius: 10px;
            height: 15px;
        }
    </style>
</head>
<body>

<%@ include file="studentnav.jsp" %>

<!-- Main Content -->
<div id="mainContent" class="content">
    <div class="dashboard-welcome mb-4">
        <h1 class="mb-3">Welcome, <%= s.getName() %></h1>
        <p class="text-muted">Track your academic progress and stay updated with your educational journey.</p>
    </div>

    <!-- Quick Academic Stats Section -->
    <div class="quick-stats">
        <div class="row">
            <!-- Current GPA Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dashboard-card card border-left-primary h-100 py-2">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fas fa-graduation-cap card-icon text-primary"></i>
                            <div class="stat-label">Current GPA</div>
                            <div class="stat-value">
                               <c:out value="${gpa}"></c:out>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Total Credits Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dashboard-card card border-left-success h-100 py-2">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fas fa-book card-icon text-success"></i>
                            <div class="stat-label">Total Credits</div>
                            <div class="stat-value">
                                 <c:out value="${sum}"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Current Semester Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dashboard-card card border-left-info h-100 py-2">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fas fa-calendar-alt card-icon text-info"></i>
                            <div class="stat-label">Current Semester</div>
                            <div class="stat-value">
                                <c:out value="Even Semester"></c:out>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Degree Progress Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dashboard-card card border-left-warning h-100 py-2">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fas fa-file-alt card-icon text-warning"></i>
                            
                            <div class="stat-label">Total Courses Registered</div>
                            <div class="stat-value">
                                 <c:out value="${coursecount}"></c:out>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


        <!-- Quick Actions -->
        <div class="col-xl-4 col-lg-5">
            <div class="academic-overview">
                <h4 class="mb-4">Quick Actions</h4>
                <div class="list-group">
                    <a href="coursereg" class="list-group-item list-group-item-action">
                        <i class="fas fa-book-medical mr-2"></i>Register Courses
                    </a>
                </div>
            </div>
        </div>
    </div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>