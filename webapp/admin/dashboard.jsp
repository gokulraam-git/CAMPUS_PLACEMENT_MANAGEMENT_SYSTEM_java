<%@ page import="model.Admin" %>
<%@ page import="dao.StudentDAO" %>
<%@ page import="dao.CompanyDAO" %>
<%@ page import="model.Student" %>
<%@ page import="model.Company" %>
<%@ page import="java.util.List" %>

<%
    // =========================================================
    // ADMIN SESSION CHECK
    // =========================================================

    Admin admin =
            (Admin) session.getAttribute("admin");

    if (admin == null) {

        response.sendRedirect(
                request.getContextPath()
                        + "/admin/login.jsp"
        );

        return;
    }


    // =========================================================
    // LOAD STUDENTS AND COMPANIES
    // =========================================================

    StudentDAO studentDAO =
            new StudentDAO();

    CompanyDAO companyDAO =
            new CompanyDAO();

    List<Student> students =
            studentDAO.getAllStudents();

    List<Company> companies =
            companyDAO.getAllCompanies();

    int totalStudents = students.size();
    int totalCompanies = companies.size();
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .dashboard-container {
            max-width: 1150px;
            margin: 0 auto;
            padding: 45px 24px;
        }

        .welcome-section {
            background: linear-gradient(
                    135deg,
                    #0f172a,
                    #312e81
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

            border: 1px solid #e5e7eb;

            box-shadow:
                    0 8px 25px
                    rgba(15, 23, 42, 0.08);
        }

        .stat-icon {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .stat-number {
            font-size: 32px;
            font-weight: 700;
            color: #0f172a;
        }

        .stat-label {
            margin-top: 5px;
            color: #64748b;
        }

        .section-title {
            margin-bottom: 20px;
            color: #0f172a;
            font-size: 24px;
        }

        .action-grid {
            display: grid;

            grid-template-columns:
                    repeat(2, 1fr);

            gap: 20px;
        }

        .action-card {
            background: white;

            border: 1px solid #e5e7eb;

            border-radius: 16px;

            padding: 28px;

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
            font-size: 35px;
            margin-bottom: 15px;
        }

        .action-card h3 {
            margin: 0 0 8px;
            color: #0f172a;
        }

        .action-card p {
            margin: 0;
            color: #64748b;
            line-height: 1.5;
        }

        @media (max-width: 650px) {

            .stats-grid,
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

            <a href="${pageContext.request.contextPath}/admin/dashboard.jsp">
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/admin/students.jsp">
                Students
            </a>

            <a href="${pageContext.request.contextPath}/admin/companies.jsp">
                Companies
            </a>

            <a href="${pageContext.request.contextPath}/admin-logout">
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
            Welcome, Admin! 👋
        </h1>

        <p>
            Manage students and companies
            participating in the campus placement process.
        </p>

    </section>


    <!-- =====================================================
         STATISTICS
    ====================================================== -->

    <div class="stats-grid">


        <div class="stat-card">

            <div class="stat-icon">
                🎓
            </div>

            <div class="stat-number">
                <%= totalStudents %>
            </div>

            <div class="stat-label">
                Registered Students
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                🏢
            </div>

            <div class="stat-number">
                <%= totalCompanies %>
            </div>

            <div class="stat-label">
                Registered Companies
            </div>

        </div>

    </div>


    <!-- =====================================================
         ADMIN ACTIONS
    ====================================================== -->

    <h2 class="section-title">
        Management
    </h2>


    <div class="action-grid">


        <!-- STUDENTS -->

        <a
                href="${pageContext.request.contextPath}/admin/students.jsp"
                class="action-card">

            <div class="action-icon">
                🎓
            </div>

            <h3>
                View Students
            </h3>

            <p>
                View registered student profiles,
                academic details and contact information.
            </p>

        </a>


        <!-- COMPANIES -->

        <a
                href="${pageContext.request.contextPath}/admin/companies.jsp"
                class="action-card">

            <div class="action-icon">
                🏢
            </div>

            <h3>
                View Companies
            </h3>

            <p>
                View companies registered in the
                campus placement system.
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