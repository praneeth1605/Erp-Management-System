<%@page import="com.klef.jfsd.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% Faculty faculty = (Faculty) session.getAttribute("faculty");
char ch = faculty.getName().charAt(0);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduVerse Faculty Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* All previous CSS remains the same, with minor modifications */
        :root {
            --primary-color: #34495E;  /* Deep blue-gray for faculty */
            --secondary-color: #2C3E50;
            --accent-color: #1ABC9C;   /* Teal accent */
            --text-light: #ECF0F1;
            --transition: all 0.3s ease;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* [Rest of the previous CSS remains unchanged] */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: var(--primary-color);
            margin: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Navbar Styling */
        .navbar {
            background-color: var(--primary-color);
            padding: 1rem 2rem;
            box-shadow: var(--shadow);
        }

        .top-navbar {
            padding: 0.8rem 1.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-light) !important;
        }

        .navbar-brand i {
            font-size: 1.8rem;
            color: var(--accent-color);
        }

        /* New styles for right-aligned elements */
        .navbar-right {
            display: flex;
            align-items: center;
            margin-left: auto;
            gap: 1.5rem;
        }

        .notification-badge {
            position: relative;
            color: var(--text-light);
            padding: 0.5rem;
            cursor: pointer;
        }

        .notification-badge::after {
            content: '3';
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--accent-color);
            color: white;
            border-radius: 50%;
            padding: 0.2rem 0.5rem;
            font-size: 0.7rem;
            font-weight: 600;
        }

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            padding: 0.5rem;
            border-radius: 5px;
            transition: var(--transition);
        }

        .admin-profile:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .admin-avatar {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background: var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 500;
        }

        .admin-info {
            display: flex;
            flex-direction: column;
            line-height: 1.2;
        }

        .admin-name {
            font-weight: 500;
            color: var(--text-light);
        }

        .admin-role {
            font-size: 0.8rem;
            color: rgba(255, 255, 255, 0.8);
        }

        /* Dropdown styles */
        .dropdown-menu {
            position: absolute;
            background: var(--primary-color);
            border: none;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.2);
            margin-top: 0.5rem;
            border-radius: 8px;
            min-width: 200px;
        }

        .dropdown-item {
            color: var(--text-light);
            padding: 0.7rem 1.2rem;
            transition: var(--transition);
        }

        .dropdown-item:hover {
            background: rgba(255, 255, 255, 0.1);
            color: var(--accent-color);
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .admin-info {
                display: none;
            }

            .navbar-right {
                gap: 1rem;
            }
        }
        /* Main Variables */
:root {
    --primary-color: #34495E;
    --secondary-color: #2C3E50;
    --accent-color: #1ABC9C;
    --text-light: #ECF0F1;
    --text-muted: #95A5A6;
    --transition: all 0.3s ease;
    --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Sidebar Base */
.sidebar {
    background: var(--primary-color);
    color: var(--text-light);
    height: 100vh;
    position: fixed;
    width: 280px;
    padding-top: 90px; /* Increased from 70px to 90px */
    transition: var(--transition);
    box-shadow: var(--shadow);
    z-index: 999;
    overflow-y: auto;
}

/* Sidebar Header */
.sidebar-header {
    padding: 20px;
    
    margin-bottom: 10px;
    margin-top: 15px; /* Added margin-top */
}

.sidebar-header h5 {
    color: var(--text-light);
    font-size: 1.2rem;
    font-weight: 500;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 10px;
}

/* Navigation Items */
.sidebar .nav-item {
    margin: 5px 15px;
}

.sidebar .nav-link {
    color: var(--text-light) !important;
    padding: 12px 20px;
    border-radius: 8px;
    transition: var(--transition);
    font-weight: 400;
    font-size: 0.95rem;
    display: flex;
    align-items: center;
    gap: 12px;
    position: relative;
}

.sidebar .nav-link i {
    font-size: 1.1rem;
    width: 20px;
    text-align: center;
}

.sidebar .nav-link:hover {
    background: rgba(255, 255, 255, 0.1);
    color: var(--accent-color) !important;
    transform: translateX(5px);
}

/* Submenu Styling */
.sidebar .collapse {
    background: var(--secondary-color);
    margin: 5px 0;
    border-radius: 8px;
}

.sidebar .collapse .nav-link {
    padding: 10px 20px 10px 52px;
    font-size: 0.9rem;
    border-radius: 5px;
    margin: 2px 8px;
}

/* Dropdown Indicators */
.sidebar .nav-link[data-toggle="collapse"] {
    justify-content: space-between;
}

.sidebar .nav-link[data-toggle="collapse"] .ms-auto {
    margin-left: auto;
    transition: var(--transition);
}

.sidebar .nav-link[aria-expanded="true"] .ms-auto {
    transform: rotate(180deg);
}

/* Active State */
.sidebar .nav-link.active {
    background: var(--accent-color);
    color: white !important;
}

.sidebar .nav-link.active:hover {
    background: var(--accent-color);
    transform: translateX(5px);
}

/* Sidebar Toggle State */
.sidebar-hidden {
    transform: translateX(-280px);
}
    
        .top-navbar {
            padding: 0.8rem 1.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .navbar-brand i {
            font-size: 1.8rem;
            color: var(--accent-color);
        }

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .admin-avatar {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background: var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 500;
        }

        .admin-info {
            display: flex;
            flex-direction: column;
            line-height: 1.2;
        }

        .admin-name {
            font-weight: 500;
            color: var(--text-light);
        }

        .admin-role {
            font-size: 0.8rem;
            color: rgba(255, 255, 255, 0.8);
        }

        .navbar-nav .nav-item {
            display: flex;
            align-items: center;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
            border-radius: 5px;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .nav-link i {
            font-size: 1.1rem;
        }

        .notification-badge {
            position: relative;
        }
        
          .notification-badge:hover {
          color: var(--accent-color);
        }

        .notification-badge::after {
            content: '3';  /* Change this number dynamically if needed */
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--accent-color);
            color: white;
            border-radius: 50%;
            padding: 0.2rem 0.5rem;
            font-size: 0.7rem;
            font-weight: 600;
            
        }

        .dropdown-menu {
            background: var(--primary-color);
            border: none;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.2);
            margin-top: 0.5rem;
            border-radius: 8px;
        }

        .dropdown-item {
            color: var(--text-light);
            padding: 0.7rem 1.2rem;
            transition: all 0.3s ease;
        }

        .dropdown-item:hover {
            background: rgba(255, 255, 255, 0.1);
            color: var(--accent-color);
        }

        .dropdown-item i {
            margin-right: 8px;
            width: 20px;
            text-align: center;
        }

        .dropdown-divider {
            border-color: rgba(255, 255, 255, 0.1);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .admin-info {
                display: none;
            }

            .navbar-brand {
                font-size: 1.2rem;
            }
        }
        
        /* Scrollbar */
.sidebar::-webkit-scrollbar {
    width: 6px;
}

.sidebar::-webkit-scrollbar-track {
    background: var(--secondary-color);
}

.sidebar::-webkit-scrollbar-thumb {
    background: var(--accent-color);
    border-radius: 3px;
}

/* Responsive */
@media (max-width: 768px) {
    .sidebar {
        width: 250px;
    }
    
    .content {
        margin-left: 0;
    }
    
    .menu-toggle {
        display: flex;
    }

    .sidebar .nav-link {
        font-size: 0.9rem;
    }
}

/* Menu Toggle Button */
.menu-toggle {
    position: fixed;
    top: 85px; /* Aligned with the top of the sidebar */
    left: 290px; /* Default position when sidebar is visible */
    z-index: 1050; /* Ensure it stays above other elements */
    background: var(--primary-color);
    color: var(--text-light);
    border: none;
    padding: 12px;
    border-radius: 50%;
    width: 45px;
    height: 45px;
    cursor: pointer;
    transition: var(--transition);
    box-shadow: var(--shadow);
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Hover Effect */
.menu-toggle:hover {
    background: var(--accent-color);
    transform: scale(1.1);
}

/* Adjust position when sidebar is hidden */
.sidebar-hidden + .menu-toggle {
    left: 20px; /* Move to the left corner when sidebar is hidden */
    top: 85px; /* Ensure consistent vertical alignment */
}

/* Adjustments for small screens */
@media (max-width: 768px) {
    .menu-toggle {
        left: 260px; /* Adjust for smaller sidebar width */
    }
    .sidebar-hidden + .menu-toggle {
        left: 10px; /* Adjust for smaller screen sizes */
    }
}

/* Add these styles to your existing CSS */

/* Dropdown Animation Styles */
.collapse {
    overflow: hidden;
    transition: all 0.35s ease;
    max-height: 0;
    opacity: 0;
    transform: translateY(-10px);
}

.collapse.show {
    max-height: 500px; /* Adjust based on your content */
    opacity: 1;
    transform: translateY(0);
}

/* Submenu Item Animation */
.collapse .nav-link {
    transform: translateX(-10px);
    opacity: 0;
    transition: all 0.3s ease;
    transition-delay: 0.1s;
}

.collapse.show .nav-link {
    transform: translateX(0);
    opacity: 1;
}

/* Chevron Animation */
.nav-link[data-toggle="collapse"] .fa-chevron-down {
    transition: transform 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.nav-link[aria-expanded="true"] .fa-chevron-down {
    transform: rotate(180deg);
}

/* Hover Effect Enhancement */
.sidebar .nav-link {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
}

.sidebar .nav-link::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 0;
    background: rgba(255, 255, 255, 0.1);
    transition: width 0.3s ease;
    z-index: -1;
}

.sidebar .nav-link:hover::before {
    width: 100%;
}

/* Active Link Animation */
.sidebar .nav-link.active {
    position: relative;
    overflow: hidden;
}

.sidebar .nav-link.active::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    height: 2px;
    width: 100%;
    background: var(--accent-color);
    animation: slideIn 0.3s ease-out;
}

@keyframes slideIn {
    from {
        transform: translateX(-100%);
    }
    to {
        transform: translateX(0);
    }
}

/* Ripple Effect on Click */
.sidebar .nav-link {
    position: relative;
}

.ripple {
    position: absolute;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: scale(0);
    animation: ripple 0.6s linear;
    pointer-events: none;
}

@keyframes ripple {
    to {
        transform: scale(4);
        opacity: 0;
    }
}
    </style>
</head>
<body>
    <!-- Menu Toggle Button -->
    <button id="menuToggle" class="menu-toggle">
        <i class="fas fa-bars"></i>
    </button>

    <nav class="navbar navbar-expand-lg navbar-dark top-navbar fixed-top">
        <div class="container-fluid">
            <!-- Brand -->
            <a class="navbar-brand" href="facultyhome">
                <i class="fas fa-chalkboard-teacher"></i>
                EduVerse
            </a>

            <!-- Right-aligned elements -->
            <div class="navbar-right">
                <!-- Faculty Profile -->
                <div class="dropdown">
                    <div class="admin-profile" data-toggle="dropdown">
                        <div class="admin-avatar">
                            <%=ch%>
                        </div>
                        <div class="admin-info">
                            <span class="admin-name"><%=faculty.getName()%></span>
                            <span class="admin-role">Faculty</span>
                        </div>
                    </div>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item" href="facultyprofile">
                            <i class="fas fa-user-tie"></i>
                            My Profile
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout">
                            <i class="fas fa-sign-out-alt"></i>
                            Logout
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div id="sidebar" class="sidebar">
        <div class="sidebar-header">
            
        </div>
        
        <div class="sidebar-menu">
            <ul class="nav flex-column">
                <!-- Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="facultyhome">
                        <i class="fas fa-home"></i>
                        Dashboard
                    </a>
                </li>
                
                <!-- Courses -->
                <li class="nav-item">
                    <a class="nav-link" href="mycourses">
                        <i class="fas fa-book-open"></i>
                        My Courses
                    </a>
                </li>

                <!-- Student Attendance -->
                <li class="nav-item">
                    <a class="nav-link" href="attendance">
                        <i class="fas fa-calendar-check"></i>
                        Attendance
                    </a>
                </li>

                <!-- Grade Management -->
                <li class="nav-item">
                    <a class="nav-link" href="internals">
                        <i class="fas fa-chart-bar"></i>
                        Grades
                    </a>
                </li>
            </ul>
        </div>

        <!-- Sidebar Footer -->
        <div class="sidebar-footer">
            <div class="nav flex-column">
                <div class="nav-item">
                    <a class="nav-link" href="logout">
                        <i class="fas fa-sign-out-alt"></i>
                        Logout
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script>
        // All previous JavaScript remains the same as in the student navbar
        // No changes needed in the script section
        // [Previous JavaScript remains unchanged]
        document.addEventListener('DOMContentLoaded', function() {
        // Handle sidebar submenu toggles
        const submenuToggles = document.querySelectorAll('.nav-link[data-toggle="collapse"]');

        // Add ripple effect function
        function createRipple(event) {
            const button = event.currentTarget;
            const ripple = document.createElement('span');
            const diameter = Math.max(button.clientWidth, button.clientHeight);
            const radius = diameter / 2;

            ripple.style.width = ripple.style.height = `${diameter}px`;
            ripple.style.left = `${event.clientX - button.offsetLeft - radius}px`;
            ripple.style.top = `${event.clientY - button.offsetTop - radius}px`;
            ripple.classList.add('ripple');

            // Remove existing ripples
            const existingRipple = button.querySelector('.ripple');
            if (existingRipple) {
                existingRipple.remove();
            }

            button.appendChild(ripple);

            // Remove ripple after animation
            setTimeout(() => ripple.remove(), 600);
        }

        submenuToggles.forEach(toggle => {
            toggle.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();

                // Add ripple effect
                createRipple(e);

                const targetId = this.getAttribute('href');
                const targetSubmenu = document.querySelector(targetId);
                const chevron = this.querySelector('.fa-chevron-down');

                if (targetSubmenu) {
                    // Close other submenus with animation
                    submenuToggles.forEach(otherToggle => {
                        if (otherToggle !== this) {
                            const otherId = otherToggle.getAttribute('href');
                            const otherSubmenu = document.querySelector(otherId);
                            const otherChevron = otherToggle.querySelector('.fa-chevron-down');
                            
                            if (otherSubmenu && otherSubmenu.classList.contains('show')) {
                                otherSubmenu.style.maxHeight = '0';
                                setTimeout(() => {
                                    otherSubmenu.classList.remove('show');
                                }, 350);
                                otherToggle.setAttribute('aria-expanded', 'false');
                                if (otherChevron) {
                                    otherChevron.style.transform = 'rotate(0deg)';
                                }
                            }
                        }
                    });

                    // Toggle current submenu with animation
                    const isExpanded = targetSubmenu.classList.contains('show');
                    
                    if (!isExpanded) {
                        targetSubmenu.classList.add('show');
                        targetSubmenu.style.maxHeight = targetSubmenu.scrollHeight + 'px';
                    } else {
                        targetSubmenu.style.maxHeight = '0';
                        setTimeout(() => {
                            targetSubmenu.classList.remove('show');
                        }, 350);
                    }

                    this.setAttribute('aria-expanded', !isExpanded);

                    // Animate chevron
                    if (chevron) {
                        chevron.style.transform = isExpanded ? 'rotate(0deg)' : 'rotate(180deg)';
                    }
                }
            });

            // Add ripple effect to all nav links
            toggle.addEventListener('mousedown', createRipple);
        });

        // Close submenus when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.nav-link[data-toggle="collapse"]')) {
                submenuToggles.forEach(toggle => {
                    const targetId = toggle.getAttribute('href');
                    const targetSubmenu = document.querySelector(targetId);
                    const chevron = toggle.querySelector('.fa-chevron-down');
                    
                    if (targetSubmenu && targetSubmenu.classList.contains('show')) {
                        targetSubmenu.style.maxHeight = '0';
                        setTimeout(() => {
                            targetSubmenu.classList.remove('show');
                        }, 350);
                        toggle.setAttribute('aria-expanded', 'false');
                        if (chevron) {
                            chevron.style.transform = 'rotate(0deg)';
                        }
                    }
                });
            }
        });

        // Initialize active states
        const currentLocation = window.location.pathname.split('/').pop();
        const navLinks = document.querySelectorAll('.nav-link');

        navLinks.forEach(link => {
            if (link.getAttribute('href') === currentLocation) {
                link.classList.add('active');
                const parentCollapse = link.closest('.collapse');

                if (parentCollapse) {
                    parentCollapse.classList.add('show');
                    parentCollapse.style.maxHeight = parentCollapse.scrollHeight + 'px';
                    const parentToggle = document.querySelector(`[data-toggle="collapse"][href="#${parentCollapse.id}"]`);
                    if (parentToggle) {
                        parentToggle.setAttribute('aria-expanded', 'true');
                        const chevron = parentToggle.querySelector('.fa-chevron-down');
                        if (chevron) {
                            chevron.style.transform = 'rotate(180deg)';
                        }
                    }
                }
            }
        });
    });
    
        document.getElementById('menuToggle').addEventListener('click', function() {
            const sidebar = document.getElementById('sidebar');
            const menuToggle = document.getElementById('menuToggle');
            const sidebarHeader = document.querySelector('.sidebar-header');
            const mainContent = document.getElementById('mainContent');
            
            // Toggle the sidebar's visibility
            sidebar.classList.toggle('sidebar-hidden');
            mainContent.classList.toggle('content-expanded');
            
            // Adjust the toggle button's position relative to the sidebar header
            if (sidebar.classList.contains('sidebar-hidden')) {
                // When sidebar is hidden, position near the first nav item
                menuToggle.style.left = '20px';
                menuToggle.style.top = '85px';
            } else {
                // When sidebar is visible, position next to the sidebar header
                const headerRect = sidebarHeader.getBoundingClientRect();
                menuToggle.style.left = `${headerRect.width + 10}px`;
                menuToggle.style.top = '85px';
            }

            // Update the icon to reflect sidebar state
            const icon = menuToggle.querySelector('i');
            if (sidebar.classList.contains('sidebar-hidden')) {
                icon.classList.remove('fa-bars');
                icon.classList.add('fa-bars-staggered');
            } else {
                icon.classList.remove('fa-bars-staggered');
                icon.classList.add('fa-bars');
            }
        });

        // On page load, set initial toggle button position
        document.addEventListener('DOMContentLoaded', function() {
            const sidebar = document.getElementById('sidebar');
            const menuToggle = document.getElementById('menuToggle');
            const sidebarHeader = document.querySelector('.sidebar-header');
            
            // Initial positioning next to the sidebar header
            const headerRect = sidebarHeader.getBoundingClientRect();
            menuToggle.style.left = `${headerRect.width + 10}px`;
            menuToggle.style.top = '85px';
        });

    </script>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.dropdown-toggle').dropdown();
            
            $('.admin-profile').on('click', function(e) {
                e.stopPropagation();
                $(this).next('.dropdown-menu').toggle();
            });

            $(document).on('click', function(e) {
                if (!$(e.target).closest('.dropdown').length) {
                    $('.dropdown-menu').hide();
                }
            });
        });
    </script>
</body>
</html>