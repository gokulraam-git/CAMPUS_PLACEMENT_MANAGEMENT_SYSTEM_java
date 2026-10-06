<%@ page import="model.Student" %>

<%
    Student student = (Student) session.getAttribute("student");

    if (student == null) {
        response.sendRedirect(request.getContextPath() + "/student/login.jsp");
        return;
    }
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Dashboard | Campus Placement System</title>

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

        /* ================= NAVBAR ================= */

        .navbar {
            height: 72px;
            background: #0f2747;
            color: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;
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

        .brand h2 {
            font-size: 18px;
            margin-bottom: 2px;
        }

        .brand span {
            font-size: 11px;
            color: #cbd5e1;
        }

        .logout-btn {
            text-decoration: none;
            color: white;

            border: 1px solid rgba(255,255,255,0.25);
            padding: 9px 17px;
            border-radius: 7px;

            font-size: 13px;

            transition: 0.2s;
        }

        .logout-btn:hover {
            background: #1e3a5f;
        }

        /* ================= MAIN ================= */

        .main-container {
            max-width: 1150px;
            margin: auto;
            padding: 45px 25px 60px;
        }

        /* ================= WELCOME ================= */

        .welcome-section {
            background: linear-gradient(135deg, #0f2747, #1d4e89);

            color: white;

            border-radius: 18px;

            padding: 35px 40px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 35px;

            box-shadow: 0 12px 30px rgba(15, 39, 71, 0.12);
        }

        .welcome-text h1 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .welcome-text h1 span {
            color: #93c5fd;
        }

        .welcome-text p {
            color: #dbeafe;
            font-size: 14px;
        }

        .student-icon {
            width: 75px;
            height: 75px;

            border-radius: 20px;

            background: rgba(255,255,255,0.12);

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 35px;
        }

        /* ================= SECTION TITLE ================= */

        .section-header {
            margin-bottom: 22px;
        }

        .section-header h2 {
            color: #0f2747;
            font-size: 24px;
            margin-bottom: 6px;
        }

        .section-header p {
            color: #64748b;
            font-size: 14px;
        }

        /* ================= DASHBOARD CARDS ================= */

        .dashboard-grid {
            display: grid;

            grid-template-columns: repeat(3, 1fr);

            gap: 22px;
        }

        .dashboard-card {
            background: white;

            border: 1px solid #e2e8f0;

            border-radius: 15px;

            padding: 27px;

            min-height: 210px;

            display: flex;
            flex-direction: column;

            transition: 0.25s;

            box-shadow: 0 5px 18px rgba(15,39,71,0.04);
        }

        .dashboard-card:hover {
            transform: translateY(-5px);

            box-shadow: 0 15px 35px rgba(15,39,71,0.10);

            border-color: #bfdbfe;
        }

        .card-icon {
            width: 52px;
            height: 52px;

            border-radius: 13px;

            background: #eff6ff;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 24px;

            margin-bottom: 18px;
        }

        .dashboard-card h3 {
            color: #0f2747;
            font-size: 18px;
            margin-bottom: 9px;
        }

        .dashboard-card p {
            color: #64748b;

            font-size: 13px;

            line-height: 1.6;

            flex-grow: 1;
        }

        .card-link {
            margin-top: 20px;

            color: #2563eb;

            text-decoration: none;

            font-size: 13px;

            font-weight: 600;
        }

        .card-link:hover {
            text-decoration: underline;
        }

        /* ================= QUICK INFO ================= */

        .info-section {
            margin-top: 35px;

            background: white;

            border: 1px solid #e2e8f0;

            border-radius: 15px;

            padding: 25px 28px;
        }

        .info-section h3 {
            color: #0f2747;
            margin-bottom: 17px;
            font-size: 18px;
        }

        .info-items {
            display: flex;
            gap: 45px;
            flex-wrap: wrap;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 10px;

            color: #64748b;

            font-size: 13px;
        }

        .info-item strong {
            color: #334155;
        }

        /* ================= FOOTER ================= */

        footer {
            text-align: center;

            background: #0f2747;

            color: #cbd5e1;

            padding: 20px;

            font-size: 12px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 850px) {

            .dashboard-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .welcome-section {
                padding: 30px;
            }
        }

        @media (max-width: 600px) {

            .navbar {
                padding: 0 20px;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }

            .welcome-section {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }

            .student-icon {
                width: 60px;
                height: 60px;
            }

            .welcome-text h1 {
                font-size: 25px;
            }
        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<header class="navbar">

    <div class="brand">

        <div class="brand-icon">
            🎓
        </div>

        <div>

            <h2>Campus Placement</h2>

            <span>Career Management System</span>

        </div>

    </div>


    <a href="${pageContext.request.contextPath}/student-logout" class="logout">
        Logout
    </a>

</header>



<!-- ================= MAIN ================= -->

<main class="main-container">


    <!-- WELCOME BANNER -->

    <section class="welcome-section">

        <div class="welcome-text">

            <h1>
                Welcome back,
                <span><%= student.getName() %></span>!
            </h1>

            <p>
                Manage your profile, explore opportunities and
                track your placement applications.
            </p>

        </div>


        <div class="student-icon">
            🎓
        </div>

    </section>



    <!-- DASHBOARD OPTIONS -->

    <div class="section-header">

        <h2>Student Dashboard</h2>

        <p>
            Choose an option to continue
        </p>

    </div>



    <section class="dashboard-grid">


        <!-- PROFILE -->

        <div class="dashboard-card">

            <div class="card-icon">
                👤
            </div>

            <h3>My Profile</h3>

            <p>
                View and manage your personal information,
                academic details and skills.
            </p>

            <a href="profile.jsp" class="card-link">
                View Profile →
            </a>

        </div>



        <!-- JOBS -->

        <div class="dashboard-card">

            <div class="card-icon">
                💼
            </div>

            <h3>Available Jobs</h3>

            <p>
                Explore available placement opportunities
                and check your eligibility for each job.
            </p>

            <a href="jobs.jsp" class="card-link">
                Explore Jobs →
            </a>

        </div>



        <!-- APPLICATIONS -->

        <div class="dashboard-card">

            <div class="card-icon">
                📋
            </div>

            <h3>My Applications</h3>

            <p>
                Track the jobs you have applied for and
                monitor your application status.
            </p>

            <a href="applications.jsp" class="card-link">
                View Applications →
            </a>

        </div>

    </section>



    <!-- QUICK INFO -->

    <section class="info-section">

        <h3>Placement Journey</h3>

        <div class="info-items">

            <div class="info-item">
                <span>👤</span>
                <span><strong>Step 1:</strong> Complete your profile</span>
            </div>

            <div class="info-item">
                <span>🔎</span>
                <span><strong>Step 2:</strong> Find suitable jobs</span>
            </div>

            <div class="info-item">
                <span>📨</span>
                <span><strong>Step 3:</strong> Apply for opportunities</span>
            </div>

            <div class="info-item">
                <span>🚀</span>
                <span><strong>Step 4:</strong> Track your progress</span>
            </div>

        </div>

    </section>


</main>



<!-- ================= FOOTER ================= -->

<footer>

    © 2026 Campus Placement Management System
    <br>
    Java • JSP • Servlets • MySQL

</footer>


</body>

</html>