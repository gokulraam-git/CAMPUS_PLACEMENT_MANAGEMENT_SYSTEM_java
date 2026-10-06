<%@ page import="model.Company" %>

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
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Company Profile | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .profile-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 45px 24px;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header .icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 18px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #e0e7ff;

            font-size: 38px;
        }

        .profile-header h1 {
            margin: 0 0 8px;
            color: #0f172a;
        }

        .profile-header p {
            margin: 0;
            color: #64748b;
        }

        .profile-card {
            background: white;

            border-radius: 20px;

            padding: 35px;

            box-shadow:
                    0 10px 30px
                    rgba(15, 23, 42, 0.08);

            border: 1px solid #e5e7eb;
        }

        .profile-grid {
            display: grid;

            grid-template-columns:
                    repeat(2, 1fr);

            gap: 22px;
        }

        .profile-item {
            padding: 18px;

            background: #f8fafc;

            border-radius: 12px;

            border: 1px solid #e2e8f0;
        }

        .profile-item.full-width {
            grid-column: 1 / -1;
        }

        .profile-label {
            display: block;

            font-size: 13px;

            color: #64748b;

            margin-bottom: 7px;

            font-weight: 600;

            text-transform: uppercase;

            letter-spacing: 0.5px;
        }

        .profile-value {
            color: #0f172a;

            font-size: 16px;

            font-weight: 500;

            word-break: break-word;
        }

        .profile-actions {
            display: flex;

            justify-content: center;

            gap: 15px;

            margin-top: 30px;

            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;

            padding: 12px 22px;

            border-radius: 9px;

            text-decoration: none;

            font-weight: 600;

            transition: 0.2s ease;
        }

        .btn-primary {
            background: #2563eb;
            color: white;
        }

        .btn-primary:hover {
            background: #1d4ed8;
        }

        .btn-secondary {
            background: #e2e8f0;
            color: #0f172a;
        }

        .btn-secondary:hover {
            background: #cbd5e1;
        }

        @media (max-width: 650px) {

            .profile-grid {
                grid-template-columns: 1fr;
            }

            .profile-item.full-width {
                grid-column: auto;
            }

            .profile-card {
                padding: 22px;
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
     PROFILE
========================================================= -->

<main class="profile-container">


    <div class="profile-header">

        <div class="icon">
            🏢
        </div>

        <h1>
            Company Profile
        </h1>

        <p>
            View your registered company information
        </p>

    </div>


    <div class="profile-card">

        <div class="profile-grid">


            <!-- COMPANY NAME -->

            <div class="profile-item full-width">

                <span class="profile-label">
                    Company Name
                </span>

                <div class="profile-value">
                    <%= company.getCompanyName() %>
                </div>

            </div>


            <!-- EMAIL -->

            <div class="profile-item">

                <span class="profile-label">
                    Email
                </span>

                <div class="profile-value">
                    <%= company.getEmail() %>
                </div>

            </div>


            <!-- PHONE -->

            <div class="profile-item">

                <span class="profile-label">
                    Phone
                </span>

                <div class="profile-value">
                    <%= company.getPhone() %>
                </div>

            </div>


            <!-- LOCATION -->

            <div class="profile-item">

                <span class="profile-label">
                    Location
                </span>

                <div class="profile-value">

                    <%
                        String location =
                                company.getLocation();

                        if (location == null ||
                                location.trim().isEmpty()) {
                    %>

                        Not provided

                    <%
                        } else {
                    %>

                        <%= location %>

                    <%
                        }
                    %>

                </div>

            </div>


            <!-- WEBSITE -->

            <div class="profile-item">

                <span class="profile-label">
                    Website
                </span>

                <div class="profile-value">

                    <%
                        String website =
                                company.getWebsite();

                        if (website == null ||
                                website.trim().isEmpty()) {
                    %>

                        Not provided

                    <%
                        } else {
                    %>

                        <a href="<%= website %>"
                           target="_blank"
                           rel="noopener noreferrer">
                            <%= website %>
                        </a>

                    <%
                        }
                    %>

                </div>

            </div>


            <!-- COMPANY ID -->

            <div class="profile-item full-width">

                <span class="profile-label">
                    Company ID
                </span>

                <div class="profile-value">
                    #<%= company.getCompanyId() %>
                </div>

            </div>

        </div>


        <!-- ACTIONS -->

        <div class="profile-actions">

            <a href="${pageContext.request.contextPath}/company/dashboard.jsp"
               class="btn btn-secondary">
                ← Back to Dashboard
            </a>

        </div>

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