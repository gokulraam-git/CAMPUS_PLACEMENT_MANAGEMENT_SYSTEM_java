<%@ page import="model.Company" %>

<%
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

    <title>Post Job | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .job-form-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 45px 24px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-header .icon {
            font-size: 42px;
            margin-bottom: 10px;
        }

        .page-header h1 {
            margin: 0 0 8px;
            color: #0f172a;
        }

        .page-header p {
            margin: 0;
            color: #64748b;
        }

        .form-card {
            background: white;
            border-radius: 20px;
            padding: 35px;

            border: 1px solid #e5e7eb;

            box-shadow:
                    0 10px 30px
                    rgba(15, 23, 42, 0.08);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 22px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            margin-bottom: 8px;

            font-size: 14px;
            font-weight: 600;

            color: #334155;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {

            width: 100%;
            box-sizing: border-box;

            padding: 12px 14px;

            border: 1px solid #cbd5e1;

            border-radius: 9px;

            font-size: 15px;

            outline: none;

            transition: 0.2s ease;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {

            border-color: #2563eb;

            box-shadow:
                    0 0 0 3px
                    rgba(37, 99, 235, 0.1);
        }

        .form-group textarea {
            min-height: 130px;
            resize: vertical;
        }

        .helper-text {
            margin-top: 6px;

            font-size: 12px;

            color: #64748b;
        }

        .form-actions {
            display: flex;

            justify-content: center;

            gap: 15px;

            margin-top: 30px;

            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;

            padding: 12px 24px;

            border-radius: 9px;

            text-decoration: none;

            border: none;

            cursor: pointer;

            font-size: 15px;

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

        .btn-secondary:hover {
            background: #cbd5e1;
        }

        .alert {
            max-width: 900px;

            margin: 0 auto 20px;

            padding: 14px 18px;

            border-radius: 10px;

            background: #fee2e2;

            color: #991b1b;

            border: 1px solid #fecaca;
        }

        @media (max-width: 650px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: auto;
            }

            .form-card {
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
     PAGE
========================================================= -->

<main class="job-form-container">


    <div class="page-header">

        <div class="icon">
            💼
        </div>

        <h1>
            Post a New Job
        </h1>

        <p>
            Create a placement opportunity for eligible students.
        </p>

    </div>


    <!-- ERROR MESSAGE -->

    <%
        String errorMessage =
                (String) request.getAttribute("errorMessage");

        if (errorMessage != null) {
    %>

        <div class="alert">
            <%= errorMessage %>
        </div>

    <%
        }
    %>


    <!-- FORM -->

    <div class="form-card">

        <form
                action="${pageContext.request.contextPath}/company-post-job"
                method="post">


            <div class="form-grid">


                <!-- ROLE -->

                <div class="form-group">

                    <label for="role">
                        Job Role
                    </label>

                    <input
                            type="text"
                            id="role"
                            name="role"
                            placeholder="e.g. Software Developer"
                            required>

                </div>


                <!-- JOB TYPE -->

                <div class="form-group">

                    <label for="jobType">
                        Job Type
                    </label>

                    <select
                            id="jobType"
                            name="jobType"
                            required>

                        <option value="">
                            Select Job Type
                        </option>

                        <option value="Full Time">
                            Full Time
                        </option>

                        <option value="Internship">
                            Internship
                        </option>

                        <option value="Part Time">
                            Part Time
                        </option>

                    </select>

                </div>


                <!-- PACKAGE -->

                <div class="form-group">

                    <label for="packageLpa">
                        Package (LPA)
                    </label>

                    <input
                            type="number"
                            id="packageLpa"
                            name="packageLpa"
                            step="0.01"
                            min="0.01"
                            placeholder="e.g. 8.5"
                            required>

                </div>


                <!-- REQUIRED CGPA -->

                <div class="form-group">

                    <label for="cgpaRequired">
                        Required CGPA
                    </label>

                    <input
                            type="number"
                            id="cgpaRequired"
                            name="cgpaRequired"
                            step="0.01"
                            min="0"
                            max="10"
                            placeholder="e.g. 7.5"
                            required>

                </div>


                <!-- VACANCY -->

                <div class="form-group">

                    <label for="vacancy">
                        Number of Vacancies
                    </label>

                    <input
                            type="number"
                            id="vacancy"
                            name="vacancy"
                            min="1"
                            placeholder="e.g. 10"
                            required>

                </div>


                <!-- REQUIRED SKILLS -->

                <div class="form-group">

                    <label for="requiredSkills">
                        Required Skills
                    </label>

                    <input
                            type="text"
                            id="requiredSkills"
                            name="requiredSkills"
                            placeholder="Java, SQL, Spring">

                    <span class="helper-text">
                        Separate multiple skills using commas.
                    </span>

                </div>


                <!-- DESCRIPTION -->

                <div class="form-group full-width">

                    <label for="description">
                        Job Description
                    </label>

                    <textarea
                            id="description"
                            name="description"
                            placeholder="Describe the role, responsibilities and requirements..."
                            required></textarea>

                </div>

            </div>


            <!-- ACTIONS -->

            <div class="form-actions">

                <a
                        href="${pageContext.request.contextPath}/company/dashboard.jsp"
                        class="btn btn-secondary">
                    Cancel
                </a>

                <button
                        type="submit"
                        class="btn btn-primary">
                    Post Job
                </button>

            </div>

        </form>

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