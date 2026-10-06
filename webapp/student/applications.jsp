<%@ page import="model.Student" %>
<%@ page import="model.Application" %>
<%@ page import="service.ApplicationService" %>
<%@ page import="java.util.List" %>

<%
    Student student = (Student) session.getAttribute("student");

    if (student == null) {
        response.sendRedirect(
                request.getContextPath() + "/student/login.jsp"
        );
        return;
    }

    ApplicationService applicationService =
            new ApplicationService();

    List<Application> applications =
            applicationService.getMyApplications(
                    student.getStudentId()
            );
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Applications | Campus Placement</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #172033;
        }

        /* NAVBAR */

        .navbar {
            height: 70px;
            background: #0b1f3a;
            color: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;
        }

        .logo {
            font-size: 21px;
            font-weight: bold;
        }

        .nav-links {
            display: flex;
            gap: 25px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .nav-links a:hover {
            color: #60a5fa;
        }

        /* PAGE */

        .page {
            max-width: 1100px;
            margin: 45px auto;
            padding: 0 25px;
        }

        .page-header {
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-size: 32px;
            margin-bottom: 8px;
        }

        .page-header p {
            color: #64748b;
        }

        /* SUMMARY */

        .summary {
            display: flex;
            gap: 18px;
            margin-bottom: 25px;
        }

        .summary-card {
            background: white;
            padding: 18px 22px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            min-width: 180px;
        }

        .summary-label {
            font-size: 12px;
            color: #64748b;
            margin-bottom: 6px;
        }

        .summary-value {
            font-size: 25px;
            font-weight: 700;
            color: #0b1f3a;
        }

        /* APPLICATION LIST */

        .application-list {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .application-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 15px;
            padding: 24px;

            display: flex;
            justify-content: space-between;
            align-items: center;

            box-shadow:
                0 6px 22px rgba(15, 23, 42, 0.05);
        }

        .application-card:hover {
            box-shadow:
                0 10px 28px rgba(15, 23, 42, 0.08);
        }

        /* JOB INFORMATION */

        .job-info h2 {
            font-size: 20px;
            color: #0b1f3a;
            margin-bottom: 8px;
        }

        .job-id {
            color: #64748b;
            font-size: 13px;
            margin-bottom: 15px;
        }

        .application-details {
            display: flex;
            gap: 25px;
            flex-wrap: wrap;
        }

        .detail-item {
            font-size: 13px;
        }

        .detail-label {
            color: #64748b;
            margin-right: 5px;
        }

        .detail-value {
            font-weight: 600;
        }

        /* STATUS */

        .status-section {
            text-align: right;
            min-width: 130px;
        }

        .status-label {
            color: #64748b;
            font-size: 12px;
            margin-bottom: 8px;
        }

        .status {
            display: inline-block;

            padding: 8px 15px;

            border-radius: 20px;

            font-size: 13px;

            font-weight: 700;
        }

        .status-applied {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .status-selected {
            background: #dcfce7;
            color: #15803d;
        }

        .status-rejected {
            background: #fee2e2;
            color: #b91c1c;
        }

        .status-shortlisted {
            background: #fef3c7;
            color: #a16207;
        }

        .status-default {
            background: #e2e8f0;
            color: #475569;
        }

        /* EMPTY STATE */

        .empty-state {
            background: white;
            border-radius: 16px;
            padding: 65px 30px;
            text-align: center;
            border: 1px solid #e2e8f0;
        }

        .empty-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .empty-state h2 {
            margin-bottom: 8px;
        }

        .empty-state p {
            color: #64748b;
            margin-bottom: 22px;
        }

        .browse-btn {
            display: inline-block;
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 12px 20px;
            border-radius: 9px;
            font-size: 14px;
            font-weight: 600;
        }

        .browse-btn:hover {
            background: #1d4ed8;
        }

        /* FOOTER */

        footer {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            padding: 35px;
        }

        /* RESPONSIVE */

        @media (max-width: 700px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a:nth-child(3) {
                display: none;
            }

            .summary {
                flex-direction: column;
            }

            .summary-card {
                width: 100%;
            }

            .application-card {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }

            .status-section {
                text-align: left;
            }

        }

    </style>

</head>


<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">
        🎓 Campus Placement
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/student/dashboard.jsp">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/student/profile.jsp">
            Profile
        </a>

        <a href="${pageContext.request.contextPath}/student/jobs.jsp">
            Jobs
        </a>

    </div>

</nav>


<!-- PAGE -->

<div class="page">

    <div class="page-header">

        <h1>My Applications</h1>

        <p>
            Track the jobs you have applied for and their current status.
        </p>

    </div>


    <%
        int applicationCount =
                applications == null ? 0 : applications.size();
    %>


    <!-- SUMMARY -->

    <div class="summary">

        <div class="summary-card">

            <div class="summary-label">
                Total Applications
            </div>

            <div class="summary-value">
                <%= applicationCount %>
            </div>

        </div>

    </div>


    <%
        if (applications == null ||
                applications.isEmpty()) {
    %>

        <!-- EMPTY STATE -->

        <div class="empty-state">

            <div class="empty-icon">
                📋
            </div>

            <h2>
                No Applications Yet
            </h2>

            <p>
                You haven't applied for any jobs yet.
            </p>

            <a href="jobs.jsp"
               class="browse-btn">

                Browse Available Jobs →

            </a>

        </div>

    <%
        } else {
    %>

        <!-- APPLICATION LIST -->

        <div class="application-list">

           <%
               for (Application app : applications) {

                   String status =
                           app.getStatus();

                    String statusClass =
                            "status-default";

                    if (status != null) {

                        if (status.equalsIgnoreCase("Applied")) {

                            statusClass =
                                    "status-applied";

                        } else if (
                                status.equalsIgnoreCase("Selected")) {

                            statusClass =
                                    "status-selected";

                        } else if (
                                status.equalsIgnoreCase("Rejected")) {

                            statusClass =
                                    "status-rejected";

                        } else if (
                                status.equalsIgnoreCase("Shortlisted")) {

                            statusClass =
                                    "status-shortlisted";
                        }
                    }
            %>


                <div class="application-card">


                    <!-- JOB INFORMATION -->

                    <div class="job-info">

                        <h2>

                            <%
                                String jobRole =
                                        app.getJobRole();

                                if (jobRole != null &&
                                        !jobRole.trim().isEmpty()) {
                            %>

                                <%= jobRole %>

                            <%
                                } else {
                            %>

                                Job #<%= app.getJobId() %>

                            <%
                                }
                            %>

                        </h2>


                        <div class="job-id">

                            Application ID:
                            <%= app.getApplicationId() %>

                            &nbsp; | &nbsp;

                            Job ID:
                            <%= app.getJobId() %>

                        </div>


                        <div class="application-details">

                            <div class="detail-item">

                                <span class="detail-label">
                                    Applied Date:
                                </span>

                                <span class="detail-value">
                                    <%= app.getAppliedDate() %>
                                </span>

                            </div>


                            <div class="detail-item">

                                <span class="detail-label">
                                    Applicant:
                                </span>

                                <span class="detail-value">
                                    <%= student.getName() %>
                                </span>

                            </div>

                        </div>

                    </div>


                    <!-- STATUS -->

                    <div class="status-section">

                        <div class="status-label">
                            Application Status
                        </div>

                        <span class="status <%= statusClass %>">

                            <%= status != null
                                    ? status
                                    : "Unknown" %>

                        </span>

                    </div>


                </div>


            <%
                }
            %>

        </div>

    <%
        }
    %>

</div>


<footer>

    © 2026 Campus Placement Management System

</footer>


</body>

</html>