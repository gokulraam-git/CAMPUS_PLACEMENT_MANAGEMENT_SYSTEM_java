<%@ page import="model.Company" %>
<%@ page import="model.Job" %>
<%@ page import="service.JobService" %>
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
    // GET COMPANY JOBS
    // =========================================================

    JobService jobService =
            new JobService();

    List<Job> jobs =
            jobService.getJobsByCompany(
                    company.getCompanyId()
            );

    int totalJobs = jobs.size();
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Jobs | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .jobs-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 45px 24px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .page-header h1 {
            margin: 0 0 6px;
            color: #0f172a;
        }

        .page-header p {
            margin: 0;
            color: #64748b;
        }

        .job-count {
            background: #e0e7ff;
            color: #3730a3;
            padding: 10px 16px;
            border-radius: 20px;
            font-weight: 600;
        }

        .job-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .job-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 28px;

            box-shadow:
                    0 8px 25px
                    rgba(15, 23, 42, 0.07);
        }

        .job-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 20px;
        }

        .job-title {
            margin: 0 0 8px;
            color: #0f172a;
            font-size: 23px;
        }

        .job-id {
            color: #64748b;
            font-size: 13px;
        }

        .job-type {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 20px;
            background: #dbeafe;
            color: #1d4ed8;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
        }

        .job-details {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-bottom: 22px;
        }

        .detail-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 14px;
        }

        .detail-label {
            display: block;
            color: #64748b;
            font-size: 12px;
            margin-bottom: 5px;
            text-transform: uppercase;
            font-weight: 600;
        }

        .detail-value {
            color: #0f172a;
            font-weight: 600;
        }

        .job-section {
            margin-top: 18px;
        }

        .job-section h3 {
            margin: 0 0 8px;
            color: #334155;
            font-size: 15px;
        }

        .job-section p {
            margin: 0;
            color: #64748b;
            line-height: 1.6;
        }

        .skills {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .skill {
            background: #f1f5f9;
            color: #334155;
            border-radius: 20px;
            padding: 7px 12px;
            font-size: 13px;
        }

        .empty-state {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 60px 30px;
            text-align: center;

            box-shadow:
                    0 8px 25px
                    rgba(15, 23, 42, 0.06);
        }

        .empty-icon {
            font-size: 50px;
            margin-bottom: 15px;
        }

        .empty-state h2 {
            color: #0f172a;
            margin-bottom: 8px;
        }

        .empty-state p {
            color: #64748b;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: 600;
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

        .actions {
            margin-top: 30px;
            text-align: center;
        }

        @media (max-width: 750px) {

            .job-details {
                grid-template-columns: 1fr;
            }

            .job-top {
                flex-direction: column;
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
     JOBS
========================================================= -->

<main class="jobs-container">


    <div class="page-header">

        <div>

            <h1>
                My Jobs
            </h1>

            <p>
                View all placement opportunities posted by your company.
            </p>

        </div>

        <div class="job-count">

            <%= totalJobs %> Job<%= totalJobs == 1 ? "" : "s" %>

        </div>

    </div>


    <%
        if (jobs.isEmpty()) {
    %>


        <!-- =================================================
             EMPTY STATE
        ================================================== -->

        <div class="empty-state">

            <div class="empty-icon">
                💼
            </div>

            <h2>
                No Jobs Posted Yet
            </h2>

            <p>
                You haven't posted any placement opportunities.
                Create your first job opening to get started.
            </p>

            <a
                    href="${pageContext.request.contextPath}/company/post-job.jsp"
                    class="btn btn-primary">
                + Post New Job
            </a>

        </div>


    <%
        } else {
    %>


        <!-- =================================================
             JOB LIST
        ================================================== -->

        <div class="job-list">

            <%
                for (Job job : jobs) {
            %>

                <div class="job-card">


                    <!-- JOB HEADER -->

                    <div class="job-top">

                        <div>

                            <h2 class="job-title">
                                <%= job.getRole() %>
                            </h2>

                            <span class="job-id">
                                Job ID: #<%= job.getJobId() %>
                            </span>

                        </div>

                        <span class="job-type">
                            <%= job.getJobType() %>
                        </span>

                    </div>


                    <!-- JOB DETAILS -->

                    <div class="job-details">


                        <div class="detail-box">

                            <span class="detail-label">
                                Package
                            </span>

                            <span class="detail-value">
                                ₹<%= job.getPackageLpa() %> LPA
                            </span>

                        </div>


                        <div class="detail-box">

                            <span class="detail-label">
                                Required CGPA
                            </span>

                            <span class="detail-value">
                                <%= job.getCgpaRequired() %>
                            </span>

                        </div>


                        <div class="detail-box">

                            <span class="detail-label">
                                Vacancies
                            </span>

                            <span class="detail-value">
                                <%= job.getVacancy() %>
                            </span>

                        </div>

                    </div>


                    <!-- DESCRIPTION -->

                    <div class="job-section">

                        <h3>
                            Job Description
                        </h3>

                        <p>
                            <%= job.getDescription() %>
                        </p>

                    </div>


                    <!-- REQUIRED SKILLS -->

                    <div class="job-section">

                        <h3>
                            Required Skills
                        </h3>

                        <div class="skills">

                            <%
                                String requiredSkills =
                                        job.getRequiredSkills();

                                if (requiredSkills != null &&
                                        !requiredSkills.trim().isEmpty()) {

                                    String[] skills =
                                            requiredSkills.split(",");

                                    for (String skill : skills) {
                            %>

                                        <span class="skill">
                                            <%= skill.trim() %>
                                        </span>

                            <%
                                    }

                                } else {
                            %>

                                    <span class="skill">
                                        No specific skills mentioned
                                    </span>

                            <%
                                }
                            %>

                        </div>

                    </div>

                </div>

            <%
                }
            %>

        </div>

    <%
        }
    %>


    <!-- BACK TO DASHBOARD -->

    <div class="actions">

        <a
                href="${pageContext.request.contextPath}/company/dashboard.jsp"
                class="btn btn-secondary">
            ← Back to Dashboard
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