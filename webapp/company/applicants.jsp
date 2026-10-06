<%@ page import="model.Company" %>
<%@ page import="model.Application" %>
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
    // GET APPLICANTS
    // =========================================================

    ApplicationService applicationService =
            new ApplicationService();

    List<Application> applicants =
            applicationService.getApplicantsByCompany(
                    company.getCompanyId()
            );

    int totalApplicants = applicants.size();
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Applicants | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .applicants-container {
            max-width: 1150px;
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

        .applicant-count {
            background: #e0e7ff;
            color: #3730a3;
            padding: 10px 17px;
            border-radius: 20px;
            font-weight: 600;
        }

        .applicant-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .applicant-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 28px;

            box-shadow:
                    0 8px 25px
                    rgba(15, 23, 42, 0.07);
        }

        .applicant-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 22px;
        }

        .student-name {
            margin: 0 0 6px;
            color: #0f172a;
            font-size: 22px;
        }

        .job-role {
            color: #2563eb;
            font-weight: 600;
            margin: 0;
        }

        .application-id {
            color: #64748b;
            font-size: 13px;
            margin-top: 5px;
        }

        .status {
            display: inline-block;
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
        }

        .status-applied {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .status-shortlisted {
            background: #fef3c7;
            color: #92400e;
        }

        .status-selected {
            background: #dcfce7;
            color: #166534;
        }

        .status-rejected {
            background: #fee2e2;
            color: #991b1b;
        }

        .student-details {
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
            font-weight: 500;
            word-break: break-word;
        }

        .application-actions {
            border-top: 1px solid #e5e7eb;
            padding-top: 20px;

            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .application-actions label {
            font-size: 14px;
            font-weight: 600;
            color: #334155;
        }

        .status-form {
            display: flex;
            gap: 10px;
            align-items: center;
            flex-wrap: wrap;
        }

        .status-form select {
            padding: 10px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            background: white;
            font-size: 14px;
        }

        .update-btn {
            border: none;
            padding: 10px 17px;
            border-radius: 8px;
            background: #2563eb;
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        .update-btn:hover {
            background: #1d4ed8;
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
            margin-bottom: 0;
        }

        .back-action {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: 600;
        }

        .btn-secondary {
            background: #e2e8f0;
            color: #0f172a;
        }

        @media (max-width: 800px) {

            .student-details {
                grid-template-columns: 1fr;
            }

            .applicant-header {
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
     APPLICANTS
========================================================= -->

<main class="applicants-container">


    <div class="page-header">

        <div>

            <h1>
                Applicants
            </h1>

            <p>
                Review students who have applied for your jobs.
            </p>

        </div>

        <div class="applicant-count">

            <%= totalApplicants %>
            Applicant<%= totalApplicants == 1 ? "" : "s" %>

        </div>

    </div>


    <%
        if (applicants.isEmpty()) {
    %>


        <!-- =================================================
             EMPTY STATE
        ================================================== -->

        <div class="empty-state">

            <div class="empty-icon">
                📋
            </div>

            <h2>
                No Applicants Yet
            </h2>

            <p>
                Students who apply for your job openings
                will appear here.
            </p>

        </div>


    <%
        } else {
    %>


        <!-- =================================================
             APPLICANT LIST
        ================================================== -->

        <div class="applicant-list">

            <%
                for (Application app : applicants) {

                    String status =
                            app.getStatus();

                    String statusClass =
                            "status-applied";

                    if ("Selected".equalsIgnoreCase(status)) {

                        statusClass =
                                "status-selected";

                    } else if ("Rejected".equalsIgnoreCase(status)) {

                        statusClass =
                                "status-rejected";

                    } else if ("Shortlisted".equalsIgnoreCase(status)) {

                        statusClass =
                                "status-shortlisted";
                    }
            %>

                <div class="applicant-card">


                    <!-- APPLICANT HEADER -->

                    <div class="applicant-header">

                        <div>

                            <h2 class="student-name">
                                <%= app.getStudentName() %>
                            </h2>

                            <p class="job-role">
                                Applied for:
                                <%= app.getJobRole() %>
                            </p>

                            <div class="application-id">
                                Application ID:
                                #<%= app.getApplicationId() %>
                            </div>

                        </div>


                        <span class="status <%= statusClass %>">

                            <%= status %>

                        </span>

                    </div>


                    <!-- STUDENT DETAILS -->

                    <div class="student-details">


                        <div class="detail-box">

                            <span class="detail-label">
                                Email
                            </span>

                            <span class="detail-value">
                                <%= app.getStudentEmail() %>
                            </span>

                        </div>


                        <div class="detail-box">

                            <span class="detail-label">
                                Phone
                            </span>

                            <span class="detail-value">
                                <%= app.getStudentPhone() %>
                            </span>

                        </div>


                        <div class="detail-box">

                            <span class="detail-label">
                                Department
                            </span>

                            <span class="detail-value">
                                <%= app.getStudentDepartment() %>
                            </span>

                        </div>


                        <div class="detail-box">

                            <span class="detail-label">
                                CGPA
                            </span>

                            <span class="detail-value">
                                <%= app.getStudentCgpa() %>
                            </span>

                        </div>


                        <div class="detail-box">

                            <span class="detail-label">
                                Applied Date
                            </span>

                            <span class="detail-value">
                                <%= app.getAppliedDate() %>
                            </span>

                        </div>

                    </div>


                    <!-- STATUS UPDATE -->

                    <div class="application-actions">

                        <label>
                            Update Status:
                        </label>

                        <form
                                class="status-form"
                                action="${pageContext.request.contextPath}/update-application-status"
                                method="post">

                            <input
                                    type="hidden"
                                    name="applicationId"
                                    value="<%= app.getApplicationId() %>">

                            <select name="status" required>

                                <option value="Applied"
                                    <%= "Applied".equalsIgnoreCase(status)
                                            ? "selected" : "" %>>
                                    Applied
                                </option>

                                <option value="Shortlisted"
                                    <%= "Shortlisted".equalsIgnoreCase(status)
                                            ? "selected" : "" %>>
                                    Shortlisted
                                </option>

                                <option value="Selected"
                                    <%= "Selected".equalsIgnoreCase(status)
                                            ? "selected" : "" %>>
                                    Selected
                                </option>

                                <option value="Rejected"
                                    <%= "Rejected".equalsIgnoreCase(status)
                                            ? "selected" : "" %>>
                                    Rejected
                                </option>

                            </select>

                            <button
                                    type="submit"
                                    class="update-btn">
                                Update
                            </button>

                        </form>

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

    <div class="back-action">

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