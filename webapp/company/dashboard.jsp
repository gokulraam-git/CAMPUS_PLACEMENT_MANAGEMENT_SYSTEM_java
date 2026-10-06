<%@ page import="model.Company" %>
<%@ page import="model.Job" %>
<%@ page import="model.Application" %>
<%@ page import="service.JobService" %>
<%@ page import="service.ApplicationService" %>
<%@ page import="java.util.List" %>

<%
    // =========================================================
    // COMPANY SESSION CHECK
    // =========================================================

    Company company =
            (Company) session.getAttribute("company");

    if (company == null) {

        response.sendRedirect(
                request.getContextPath()
                        + "/company/login.jsp"
        );

        return;
    }


    // =========================================================
    // LOAD COMPANY DATA
    // =========================================================

    JobService jobService =
            new JobService();

    ApplicationService applicationService =
            new ApplicationService();

    List<Job> jobs =
            jobService.getJobsByCompany(
                    company.getCompanyId()
            );

    List<Application> applicants =
            applicationService.getApplicantsByCompany(
                    company.getCompanyId()
            );

    int totalJobs = jobs.size();
    int totalApplicants = applicants.size();
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Company Dashboard | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 24px;
        }

        .welcome-section {
            background: linear-gradient(
                    135deg,
                    #0f172a,
                    #1e3a8a
            );

            color: white;
            border-radius: 20px;
            padding: 38px;
            margin-bottom: 30px;
        }

        .welcome-section h1 {
            margin: 0 0 10px;
            font-size: 32px;
        }

        .welcome-section p {
            margin: 0;
            opacity: 0.85;
            font-size: 16px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns:
                    repeat(2, 1fr);

            gap: 20px;
            margin-bottom: 35px;
        }

        .stat-card {
            background: white;
            border-radius: 16px;
            padding: 25px;

            box-shadow:
                    0 8px 25px
                    rgba(15, 23, 42, 0.08);

            border: 1px solid #e5e7eb;
        }

        .stat-icon {
            font-size: 30px;
            margin-bottom: 12px;
        }

        .stat-number {
            font-size: 32px;
            font-weight: 700;
            color: #0f172a;
        }

        .stat-label {
            color: #64748b;
            margin-top: 5px;
        }

        .section-title {
            font-size: 24px;
            color: #0f172a;
            margin-bottom: 20px;
        }

        .action-grid {
            display: grid;
            grid-template-columns:
                    repeat(4, 1fr);

            gap: 20px;
        }

        .action-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;

            padding: 25px;

            text-decoration: none;
            color: inherit;

            transition:
                    transform 0.2s ease,
                    box-shadow 0.2s ease;
        }

        .action-card:hover {
            transform: translateY(-4px);

            box-shadow:
                    0 12px 30px
                    rgba(15, 23, 42, 0.12);
        }

        .action-icon {
            font-size: 32px;
            margin-bottom: 15px;
        }

        .action-card h3 {
            margin: 0 0 8px;
            color: #0f172a;
        }

        .action-card p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
            line-height: 1.5;
        }

        @media (max-width: 900px) {

            .action-grid {
                grid-template-columns:
                        repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .action-grid {
                grid-template-columns: 1fr;
            }

            .welcome-section {
                padding: 28px;
            }

            .welcome-section h1 {
                font-size: 26px;
            }
        }

    </style>

</head>

<body>

<!-- =========================================================
     NAVBAR
========================================================= -->

<nav class="navbar">

    <div class="nav-container">

        <a href="${pageContext.request.contextPath}/index.jsp"
           class="logo">
            🎓 Campus Placement
        </a>

        <div class="nav-links">

            <a href="${pageContext.request.contextPath}/company/dashboard.jsp">
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/company/profile.jsp">
                Profile
            </a>

            <a href="${pageContext.request.contextPath}/company-logout">
                Logout
            </a>

        </div>

    </div>

</nav>


<!-- =========================================================
     DASHBOARD
========================================================= -->

<main class="dashboard-container">


    <!-- WELCOME -->

    <section class="welcome-section">

        <h1>
            Welcome, <%= company.getCompanyName() %>! 👋
        </h1>

        <p>
            Manage your company profile, job opportunities
            and student applications from one place.
        </p>

    </section>


    <!-- =====================================================
         STATISTICS
    ====================================================== -->

    <div class="stats-grid">

        <div class="stat-card">

            <div class="stat-icon">
                💼
            </div>

            <div class="stat-number">
                <%= totalJobs %>
            </div>

            <div class="stat-label">
                Jobs Posted
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                👥
            </div>

            <div class="stat-number">
                <%= totalApplicants %>
            </div>

            <div class="stat-label">
                Applications Received
            </div>

        </div>

    </div>


    <!-- =====================================================
         QUICK ACTIONS
    ====================================================== -->

    <h2 class="section-title">
        Company Management
    </h2>


    <div class="action-grid">


        <!-- PROFILE -->

        <a href="${pageContext.request.contextPath}/company/profile.jsp"
           class="action-card">

            <div class="action-icon">
                👤
            </div>

            <h3>
                My Profile
            </h3>

            <p>
                View your company information
                and profile details.
            </p>

        </a>


        <!-- POST JOB -->

        <a href="${pageContext.request.contextPath}/company/post-job.jsp"
           class="action-card">

            <div class="action-icon">
                ➕
            </div>

            <h3>
                Post New Job
            </h3>

            <p>
                Create and publish a new
                placement opportunity.
            </p>

        </a>


        <!-- MY JOBS -->

        <a href="${pageContext.request.contextPath}/company/jobs.jsp"
           class="action-card">

            <div class="action-icon">
                💼
            </div>

            <h3>
                My Jobs
            </h3>

            <p>
                View all job opportunities
                posted by your company.
            </p>

        </a>


        <!-- APPLICANTS -->

        <a href="${pageContext.request.contextPath}/company/applicants.jsp"
           class="action-card">

            <div class="action-icon">
                📋
            </div>

            <h3>
                View Applicants
            </h3>

            <p>
                Review students who have
                applied for your jobs.
            </p>

        </a>

    </div>

</main>


<!-- =========================================================
     FOOTER
========================================================= -->

<footer class="footer">

    <p>
        © 2026 Campus Placement Management System.
        All rights reserved.
    </p>

</footer>

</body>

</html>