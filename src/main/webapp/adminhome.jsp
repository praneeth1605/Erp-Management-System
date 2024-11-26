<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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

        .recent-activity {
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
    </style>
</head>
<body>

<%@ include file="adminnav.jsp" %>

<!-- Main Content -->
<div id="mainContent" class="content">
    <div class="dashboard-welcome mb-4">
        <h1 class="mb-3">Welcome to Admin Dashboard</h1>
        <p class="text-muted">Manage your educational institution efficiently with our comprehensive admin tools.</p>
    </div>

    <!-- Quick Stats Section -->
    <div class="quick-stats">
        <div class="row">
            <!-- Total Students Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dashboard-card card border-left-primary h-100 py-2">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fas fa-user-graduate card-icon text-primary"></i>
                            <div class="stat-label">Total Students</div>
                            <div class="stat-value">
                                <%= request.getAttribute("totalStudents") != null ? request.getAttribute("totalStudents") : "1,250" %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Total Faculty Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dashboard-card card border-left-success h-100 py-2">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fas fa-chalkboard-teacher card-icon text-success"></i>
                            <div class="stat-label">Total Faculty</div>
                            <div class="stat-value">
                                <%= request.getAttribute("totalFaculty") != null ? request.getAttribute("totalFaculty") : "75" %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Total Courses Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dashboard-card card border-left-info h-100 py-2">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fas fa-book-open card-icon text-info"></i>
                            <div class="stat-label">Total Courses</div>
                            <div class="stat-value">
                                <%= request.getAttribute("totalCourses") != null ? request.getAttribute("totalCourses") : "32" %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Total Departments Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="dashboard-card card border-left-warning h-100 py-2">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fas fa-building card-icon text-warning"></i>
                            <div class="stat-label">Departments</div>
                            <div class="stat-value">
                                <%= request.getAttribute("totalDepartments") != null ? request.getAttribute("totalDepartments") : "8" %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity Section -->
    <div class="row">
        <div class="col-xl-8 col-lg-7">
            <div class="recent-activity">
                <h4 class="mb-4">Recent Activity</h4>
                <div class="activity-item">
                    <i class="fas fa-user-plus text-success mr-2"></i>
                    New student registration completed
                    <small class="text-muted float-right">2 minutes ago</small>
                </div>
                <div class="activity-item">
                    <i class="fas fa-book text-primary mr-2"></i>
                    New course "Advanced Mathematics" added
                    <small class="text-muted float-right">1 hour ago</small>
                </div>
                <div class="activity-item">
                    <i class="fas fa-user-tie text-info mr-2"></i>
                    Faculty meeting scheduled
                    <small class="text-muted float-right">3 hours ago</small>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="col-xl-4 col-lg-5">
            <div class="recent-activity">
                <h4 class="mb-4">Quick Actions</h4>
                <div class="list-group">
                    <a href="studentreg" class="list-group-item list-group-item-action">
                        <i class="fas fa-user-plus mr-2"></i>Add New Student
                    </a>
                    <a href="facultyreg" class="list-group-item list-group-item-action">
                        <i class="fas fa-chalkboard-teacher mr-2"></i>Add New Faculty
                    </a>
                    <a href="coursereg" class="list-group-item list-group-item-action">
                        <i class="fas fa-book-medical mr-2"></i>Create New Course
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>