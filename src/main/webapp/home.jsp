<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduVerse - Educational Management Platform</title>
    <link rel="icon" href="images/homelogo1.jpg">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #34495E;
            --secondary-color: #1ABC9C;
            --text-color: #2C3E50;
            --background-light: #ECF0F1;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            background-color: var(--background-light);
        }

        .hero-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 8rem 0;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(52,73,94,0.8), rgba(26,188,156,0.8));
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            text-align: center;
        }

        .feature-section {
            padding: 6rem 0;
            background-color: white;
        }

        .feature-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            margin-bottom: 30px;
        }

        .feature-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }

        .feature-card .card-body {
            padding: 2.5rem 1.5rem;
            text-align: center;
        }

        .feature-card i {
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            font-size: 3.5rem;
        }

        .testimonial-section {
            background-color: var(--background-light);
            padding: 6rem 0;
        }

        .testimonial-card {
            background-color: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .about-section, .contact-section {
            background-color: white;
            padding: 6rem 0;
        }

        .social-icons a {
            color: var(--text-color);
            margin: 0 15px;
            font-size: 2rem;
            transition: color 0.3s ease;
        }

        .social-icons a:hover {
            color: var(--secondary-color);
        }

        .cta-section {
            background: var(--primary-color);
            color: white;
            padding: 6rem 0;
            text-align: center;
        }

        .partners-section {
            background-color: white;
            padding: 5rem 0;
        }

        .partner-logo {
            max-height: 100px;
            filter: grayscale(0);
            opacity: 1;
        }

        .partner-logo:hover {
            filter: grayscale(100%);
            opacity: 0.6;
            transition: all 0.3s;
        }

        .btn-primary-custom {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transition: all 0.3s ease;
        }

        .btn-primary-custom:hover {
            background-color: #16A085;
            border-color: #16A085;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <!-- Navigation (you would include your existing navbar here) -->

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container hero-content">
            <h1 class="display-3 mb-4 text-white">Transform Educational Management</h1>
            <p class="lead mb-5 text-white">Empowering Institutions with Intelligent Technology</p>
            <a href="/login" class="btn btn-primary-custom btn-lg px-5">Get Started</a>
        </div>
    </div>

    <!-- Features Section -->
    <div class="feature-section">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <i class="fas fa-graduation-cap"></i>
                            <h4 class="card-title mb-3">Student Management</h4>
                            <p class="card-text">Comprehensive tracking of student records, performance, and academic progress.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <i class="fas fa-chalkboard-teacher"></i>
                            <h4 class="card-title mb-3">Faculty Portal</h4>
                            <p class="card-text">Streamline teaching workflows, performance tracking, and schedule management.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <i class="fas fa-chart-line"></i>
                            <h4 class="card-title mb-3">Administrative Insights</h4>
                            <p class="card-text">Advanced analytics and reporting for strategic institutional decision-making.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="testimonial-section">
        <div class="container">
            <h2 class="text-center mb-5">What Our Clients Say</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="testimonial-card">
                        <p class="mb-4">"EduVerse has completely transformed our educational management approach, making complex processes seamless and intuitive."</p>
                        <div class="d-flex align-items-center">
                            <div>
                                <h5 class="mb-1">Dr. Sarah Johnson</h5>
                                <p class="text-muted mb-0">University Dean</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="testimonial-card">
                        <p class="mb-4">"The platform's comprehensive features have dramatically reduced our administrative workload and improved overall efficiency."</p>
                        <div class="d-flex align-items-center">
                            <div>
                                <h5 class="mb-1">Mark Williams</h5>
                                <p class="text-muted mb-0">School Administrator</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="testimonial-card">
                        <p class="mb-4">"An innovative solution that provides real-time insights and supports data-driven educational strategies praneeth praneeth praneeth praneeth."</p>
                        <div class="d-flex align-items-center">
                            <div>
                                <h5 class="mb-1">Emily Rodriguez</h5>
                                <p class="text-muted mb-0">IT Director</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Partners Section -->
    <div class="partners-section text-center">
        <div class="container">
            <h2 class="mb-5">Trusted By Leading Institutions</h2>
            <div class="row align-items-center justify-content-center">
                <div class="col-md-2 col-4"><img src="/images/homelogo1.jpg" alt="Partner Logo" class="partner-logo img-fluid"></div>
                <div class="col-md-2 col-4"><img src="/images/homelogo2.png" alt="Partner Logo" class="partner-logo img-fluid"></div>
                <div class="col-md-2 col-4"><img src="/images/homelogo3.jpg" alt="Partner Logo" class="partner-logo img-fluid"></div>
                <div class="col-md-2 col-4"><img src="/images/homelogo4.jpg" alt="Partner Logo" class="partner-logo img-fluid"></div>
            </div>
        </div>
    </div>

    <!-- About Us Section -->
    <div class="about-section">
        <div class="container">
            <h2 class="text-center mb-5">About EduVerse</h2>
            <div class="row">
                <div class="col-md-12 text-center">
                    <p class="lead">EduVerse is an innovative educational management platform designed to transform how institutions manage, track, and optimize their educational processes. We leverage cutting-edge technology to provide comprehensive solutions that empower educators, administrators, and students.</p>
                    <p>Our mission is to simplify complex administrative tasks, provide actionable insights, and create more efficient and effective learning environments.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Us Section -->
    <div class="contact-section text-center">
        <div class="container">
            <h2 class="mb-5">Contact Us</h2>
            <div class="row">
                <div class="col-md-12">
                    <p class="lead mb-4">Get in touch with us for any inquiries or support</p>
                    <p>Email: support@eduverse.com</p>
                    <p>Phone: +91 8555968162</p>
                    <div class="social-icons mt-4">
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="cta-section">
        <div class="container">
            <h2 class="display-4 mb-4">Ready to Elevate Your Institution?</h2>
            <p class="lead mb-5">Discover the power of intelligent educational management.</p>
            <a href="#" class="btn btn-light btn-lg px-5">Schedule a Demo</a>
        </div>
    </div>
</body>
</html>