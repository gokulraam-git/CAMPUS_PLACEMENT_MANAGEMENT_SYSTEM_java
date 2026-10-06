<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f4f7fb;
            color: #1e293b;
        }

        /* ---------- NAVBAR ---------- */

        .navbar {
            height: 72px;
            background: #0f2747;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            color: white;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-icon {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
        }

        .brand-text h2 {
            font-size: 19px;
            letter-spacing: 0.3px;
        }

        .brand-text span {
            font-size: 11px;
            color: #cbd5e1;
        }

        .nav-link {
            color: white;
            text-decoration: none;
            font-size: 14px;
            padding: 10px 18px;
            border-radius: 7px;
            transition: 0.2s;
        }

        .nav-link:hover {
            background: #1e3a5f;
        }

        /* ---------- HERO ---------- */

        .hero {
            min-height: 430px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 60px;
            padding: 65px 9%;
            background: linear-gradient(135deg, #eef5ff, #ffffff);
        }

        .hero-content {
            max-width: 650px;
        }

        .badge {
            display: inline-block;
            background: #dbeafe;
            color: #1d4ed8;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .hero h1 {
            font-size: 46px;
            line-height: 1.15;
            color: #0f2747;
            margin-bottom: 20px;
        }

        .hero h1 span {
            color: #2563eb;
        }

        .hero p {
            font-size: 17px;
            line-height: 1.7;
            color: #64748b;
            margin-bottom: 30px;
        }

        .hero-buttons {
            display: flex;
            gap: 14px;
        }

        .primary-btn,
        .secondary-btn {
            text-decoration: none;
            padding: 13px 24px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            transition: 0.2s;
        }

        .primary-btn {
            background: #2563eb;
            color: white;
        }

        .primary-btn:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        .secondary-btn {
            border: 1px solid #cbd5e1;
            color: #334155;
            background: white;
        }

        .secondary-btn:hover {
            background: #f8fafc;
        }

        /* ---------- HERO CARD ---------- */

        .hero-card {
            width: 310px;
            background: white;
            padding: 28px;
            border-radius: 18px;
            box-shadow: 0 15px 40px rgba(15, 39, 71, 0.12);
            border: 1px solid #e2e8f0;
        }

        .hero-card-icon {
            width: 55px;
            height: 55px;
            border-radius: 14px;
            background: #dbeafe;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            margin-bottom: 18px;
        }

        .hero-card h3 {
            color: #0f2747;
            margin-bottom: 10px;
        }

        .hero-card p {
            font-size: 14px;
            line-height: 1.6;
            color: #64748b;
        }

        /* ---------- USER TYPES ---------- */

        .section {
            padding: 55px 8%;
            text-align: center;
        }

        .section-title {
            color: #0f2747;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .section-subtitle {
            color: #64748b;
            margin-bottom: 35px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
            max-width: 1050px;
            margin: auto;
        }

        .card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 15px;
            padding: 30px 25px;
            text-align: left;
            transition: 0.25s;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 15px 35px rgba(15, 39, 71, 0.10);
        }

        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background: #eff6ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 18px;
        }

        .card h3 {
            color: #0f2747;
            margin-bottom: 10px;
        }

        .card p {
            color: #64748b;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .card a {
            text-decoration: none;
            color: #2563eb;
            font-size: 14px;
            font-weight: 600;
        }

        .card a:hover {
            text-decoration: underline;
        }

        /* ---------- FOOTER ---------- */

        footer {
            background: #0f2747;
            color: #cbd5e1;
            text-align: center;
            padding: 22px;
            font-size: 13px;
        }

        /* ---------- RESPONSIVE ---------- */

        @media (max-width: 850px) {

            .hero {
                flex-direction: column;
                text-align: center;
            }

            .hero-buttons {
                justify-content: center;
            }

            .cards {
                grid-template-columns: 1fr;
                max-width: 500px;
            }

            .hero-card {
                width: 100%;
                max-width: 350px;
            }
        }
    </style>
</head>

<body>

<!-- ================= NAVBAR ================= -->

<header class="navbar">

    <div class="brand">
        <div class="brand-icon">🎓</div>

        <div class="brand-text">
            <h2>Campus Placement</h2>
            <span>Career Management System</span>
        </div>
    </div>

    <a href="#portals" class="nav-link">Login</a>

</header>


<!-- ================= HERO ================= -->

<section class="hero">

    <div class="hero-content">

        <span class="badge">🎯 Smart Campus Recruitment</span>

        <h1>
            Connect Talent with
            <span>Career Opportunities</span>
        </h1>

        <p>
            A centralized campus placement platform that connects
            students, companies and administrators through a simple
            and efficient recruitment process.
        </p>

        <div class="hero-buttons">

            <a href="#portals" class="primary-btn">
                Explore Portals →
            </a>

            <a href="#about" class="secondary-btn">
                Learn More
            </a>

        </div>

    </div>


    <div class="hero-card">

        <div class="hero-card-icon">💼</div>

        <h3>One Platform. Multiple Opportunities.</h3>

        <p>
            Discover suitable jobs, manage applications,
            post career opportunities and streamline the
            campus recruitment process.
        </p>

    </div>

</section>


<!-- ================= PORTALS ================= -->

<section class="section" id="portals">

    <h2 class="section-title">Choose Your Portal</h2>

    <p class="section-subtitle">
        Select the portal that matches your role
    </p>


    <div class="cards">

        <!-- STUDENT -->

        <div class="card">

            <div class="card-icon">🎓</div>

            <h3>Student Portal</h3>

            <p>
                Create your profile, explore available jobs,
                check eligibility and track your applications.
            </p>

            <a href="student/login.jsp">
                Student Login →
            </a>

        </div>


        <!-- COMPANY -->

        <div class="card">

            <div class="card-icon">🏢</div>

            <h3>Company Portal</h3>

            <p>
                Register your company, post job opportunities,
                view eligible applicants and manage applications.
            </p>

            <a href="company/login.jsp">
                Company Login →
            </a>

        </div>


        <!-- ADMIN -->

        <div class="card">

            <div class="card-icon">⚙️</div>

            <h3>Admin Portal</h3>

            <p>
                Manage student and company information and
                oversee the campus placement system.
            </p>

            <a href="admin/login.jsp">
                Admin Login →
            </a>

        </div>

    </div>

</section>


<!-- ================= ABOUT ================= -->

<section class="section" id="about">

    <h2 class="section-title">Why Campus Placement System?</h2>

    <p class="section-subtitle">
        Designed to simplify the complete placement workflow
    </p>

    <div class="cards">

        <div class="card">
            <div class="card-icon">🔍</div>
            <h3>Find Opportunities</h3>
            <p>
                Students can explore job openings based on
                eligibility and required skills.
            </p>
        </div>

        <div class="card">
            <div class="card-icon">📋</div>
            <h3>Manage Applications</h3>
            <p>
                Apply for jobs and keep track of application
                status from one place.
            </p>
        </div>

        <div class="card">
            <div class="card-icon">🚀</div>
            <h3>Streamlined Recruitment</h3>
            <p>
                Companies can efficiently post jobs and manage
                student applications.
            </p>
        </div>

    </div>

</section>


<!-- ================= FOOTER ================= -->

<footer>

    © 2026 Campus Placement Management System
    <br>
    Java • JSP • Servlets • MySQL

</footer>

</body>
</html>