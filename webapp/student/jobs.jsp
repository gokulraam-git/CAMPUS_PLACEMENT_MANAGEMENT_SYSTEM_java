<%@ page import="model.Student" %>
<%@ page import="model.Job" %>
<%@ page import="service.JobService" %>
<%@ page import="java.util.List" %>

<%
    Student student = (Student) session.getAttribute("student");

    if (student == null) {
        response.sendRedirect(
                request.getContextPath() + "/student/login.jsp"
        );
        return;
    }

    JobService jobService = new JobService();
    List<Job> jobs = jobService.getAllJobs();
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Available Jobs | Campus Placement</title>

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
            max-width: 1150px;
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

        /* JOB GRID */

        .job-grid {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(320px, 1fr));

            gap: 25px;
        }

        /* JOB CARD */

        .job-card {
            background: white;
            border-radius: 16px;

            padding: 25px;

            border: 1px solid #e2e8f0;

            box-shadow:
                0 8px 25px rgba(15, 23, 42, 0.06);

            transition: 0.2s;
        }

        .job-card:hover {
            transform: translateY(-4px);

            box-shadow:
                0 12px 30px rgba(15, 23, 42, 0.10);
        }

        /* JOB HEADER */

        .job-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;

            margin-bottom: 18px;
        }

        .job-title {
            font-size: 20px;
            font-weight: 700;
            color: #0b1f3a;
        }

        .job-id {
            font-size: 12px;
            color: #64748b;
        }

        /* BADGE */

        .badge {
            display: inline-block;

            background: #dbeafe;
            color: #1d4ed8;

            padding: 6px 10px;

            border-radius: 20px;

            font-size: 12px;
            font-weight: 600;

            margin-bottom: 15px;
        }

        /* DESCRIPTION */

        .description {
            color: #64748b;
            font-size: 14px;
            line-height: 1.6;

            margin-bottom: 20px;

            min-height: 45px;
        }

        /* DETAILS */

        .details {
            display: grid;
            grid-template-columns: 1fr 1fr;

            gap: 12px;

            margin-bottom: 20px;
        }

        .detail {
            background: #f8fafc;

            border-radius: 9px;

            padding: 12px;
        }

        .detail-label {
            display: block;

            color: #64748b;

            font-size: 11px;

            text-transform: uppercase;

            margin-bottom: 5px;
        }

        .detail-value {
            font-weight: 600;

            font-size: 14px;

            color: #172033;
        }

        /* SKILLS */

        .skills-section {
            margin-bottom: 20px;
        }

        .skills-label {
            font-size: 12px;

            color: #64748b;

            margin-bottom: 8px;

            font-weight: 600;
        }

        .skills {
            color: #334155;

            font-size: 13px;

            background: #f8fafc;

            padding: 10px;

            border-radius: 8px;
        }

        /* BUTTON */

        .apply-btn {
            display: block;

            width: 100%;

            text-align: center;

            text-decoration: none;

            background: #2563eb;

            color: white;

            padding: 12px;

            border-radius: 9px;

            font-size: 14px;

            font-weight: 600;

            transition: 0.2s;
        }

        .apply-btn:hover {
            background: #1d4ed8;
        }

        /* EMPTY STATE */

        .empty-state {
            background: white;

            border-radius: 16px;

            padding: 60px 30px;

            text-align: center;

            border: 1px solid #e2e8f0;
        }

        .empty-icon {
            font-size: 45px;

            margin-bottom: 15px;
        }

        .empty-state h2 {
            margin-bottom: 8px;
        }

        .empty-state p {
            color: #64748b;
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

            .job-grid {
                grid-template-columns: 1fr;
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

        <a href="${pageContext.request.contextPath}/student/applications.jsp">
            Applications
        </a>

    </div>

</nav>


<!-- PAGE -->

<div class="page">

    <div class="page-header">

        <h1>Available Jobs</h1>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");

            if (errorMessage != null) {
        %>

            <div class="alert error">
                <%= errorMessage %>
            </div>

        <%
            }
        %>

        <p>
            Explore placement opportunities posted by companies.
        </p>

    </div>


    <%
        if (jobs == null || jobs.isEmpty()) {
    %>

        <!-- EMPTY STATE -->

        <div class="empty-state">

            <div class="empty-icon">
                💼
            </div>

            <h2>
                No Jobs Available
            </h2>

            <p>
                There are currently no job openings.
                Please check again later.
            </p>

        </div>

    <%
        } else {
    %>

        <!-- JOB GRID -->

        <div class="job-grid">

            <%
                for (Job job : jobs) {
            %>

                <div class="job-card">

                    <div class="job-header">

                        <div>

                            <div class="job-title">
                                <%= job.getRole() %>
                            </div>

                            <div class="job-id">
                                Job ID: <%= job.getJobId() %>
                            </div>

                        </div>

                    </div>


                    <span class="badge">
                        <%= job.getJobType() %>
                    </span>


                    <div class="description">

                        <%
                            String description = job.getDescription();

                            if (description != null &&
                                    !description.trim().isEmpty()) {
                        %>

                            <%= description %>

                        <%
                            } else {
                        %>

                            No job description provided.

                        <%
                            }
                        %>

                    </div>


                    <!-- JOB DETAILS -->

                    <div class="details">

                        <div class="detail">

                            <span class="detail-label">
                                Package
                            </span>

                            <span class="detail-value">
                                ₹<%= job.getPackageLpa() %> LPA
                            </span>

                        </div>


                        <div class="detail">

                            <span class="detail-label">
                                Required CGPA
                            </span>

                            <span class="detail-value">
                                <%= job.getCgpaRequired() %>
                            </span>

                        </div>


                        <div class="detail">

                            <span class="detail-label">
                                Vacancies
                            </span>

                            <span class="detail-value">
                                <%= job.getVacancy() %>
                            </span>

                        </div>


                        <div class="detail">

                            <span class="detail-label">
                                Company ID
                            </span>

                            <span class="detail-value">
                                <%= job.getCompanyId() %>
                            </span>

                        </div>

                    </div>


                    <!-- REQUIRED SKILLS -->

                    <div class="skills-section">

                        <div class="skills-label">
                            Required Skills
                        </div>

                        <div class="skills">

                            <%
                                String requiredSkills =
                                        job.getRequiredSkills();

                                if (requiredSkills != null &&
                                        !requiredSkills.trim().isEmpty()) {
                            %>

                                <%= requiredSkills %>

                            <%
                                } else {
                            %>

                                No specific skills required

                            <%
                                }
                            %>

                        </div>

                    </div>


                    <!-- APPLY -->

                    <a href="<%= request.getContextPath() %>/apply-job?jobId=<%= job.getJobId() %>"
                       class="apply-btn">

                        Apply for this Job →

                    </a>

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