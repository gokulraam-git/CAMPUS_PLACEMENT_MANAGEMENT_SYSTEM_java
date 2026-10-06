<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Registration | Campus Placement System</title>

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
            background: linear-gradient(135deg, #eef5ff, #f8fafc);
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

        .home-link {
            color: white;
            text-decoration: none;

            font-size: 13px;

            padding: 9px 16px;

            border-radius: 7px;

            transition: 0.2s;
        }

        .home-link:hover {
            background: #1e3a5f;
        }

        /* ================= MAIN ================= */

        .main-container {
            max-width: 1050px;
            margin: auto;

            padding: 45px 25px 60px;
        }

        /* ================= HEADER ================= */

        .page-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .page-icon {
            width: 58px;
            height: 58px;

            margin: 0 auto 15px;

            border-radius: 15px;

            background: #dbeafe;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 27px;
        }

        .page-header h1 {
            color: #0f2747;
            font-size: 30px;
            margin-bottom: 8px;
        }

        .page-header p {
            color: #64748b;
            font-size: 14px;
        }

        /* ================= FORM CARD ================= */

        .form-card {
            background: white;

            border: 1px solid #e2e8f0;

            border-radius: 18px;

            padding: 35px;

            box-shadow: 0 12px 35px rgba(15, 39, 71, 0.08);
        }

        .form-section-title {
            color: #0f2747;
            font-size: 18px;

            margin-bottom: 5px;
        }

        .form-section-description {
            color: #64748b;
            font-size: 13px;

            margin-bottom: 25px;
        }

        /* ================= FORM GRID ================= */

        .form-grid {
            display: grid;

            grid-template-columns: repeat(2, 1fr);

            gap: 20px 24px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            color: #334155;

            font-size: 13px;

            font-weight: 600;

            margin-bottom: 8px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {

            width: 100%;

            padding: 12px 14px;

            border: 1px solid #cbd5e1;

            border-radius: 8px;

            outline: none;

            font-family: inherit;

            font-size: 14px;

            color: #1e293b;

            background: white;

            transition: 0.2s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {

            border-color: #2563eb;

            box-shadow:
                0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        .form-group textarea {
            min-height: 90px;
            resize: vertical;
        }

        .hint {
            color: #94a3b8;

            font-size: 11px;

            margin-top: 6px;
        }

        /* ================= DIVIDER ================= */

        .divider {
            height: 1px;

            background: #e2e8f0;

            margin: 30px 0;
        }

        /* ================= BUTTONS ================= */

        .form-actions {
            display: flex;

            justify-content: flex-end;

            align-items: center;

            gap: 12px;
        }

        .cancel-btn,
        .register-btn {

            text-decoration: none;

            border-radius: 8px;

            padding: 12px 22px;

            font-size: 14px;

            font-weight: 600;

            cursor: pointer;

            transition: 0.2s;
        }

        .cancel-btn {

            color: #475569;

            background: #f1f5f9;

            border: 1px solid #e2e8f0;
        }

        .cancel-btn:hover {
            background: #e2e8f0;
        }

        .register-btn {

            border: none;

            background: #2563eb;

            color: white;
        }

        .register-btn:hover {

            background: #1d4ed8;

            transform: translateY(-1px);
        }

        /* ================= LOGIN LINK ================= */

        .login-link {

            text-align: center;

            margin-top: 25px;

            color: #64748b;

            font-size: 13px;
        }

        .login-link a {

            color: #2563eb;

            text-decoration: none;

            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* ================= FOOTER ================= */

        footer {

            background: #0f2747;

            color: #cbd5e1;

            text-align: center;

            padding: 20px;

            font-size: 12px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 700px) {

            .navbar {
                padding: 0 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .form-card {
                padding: 25px;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .cancel-btn,
            .register-btn {
                width: 100%;
                text-align: center;
            }
        }
        .alert {
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .alert.error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
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


    <a class="home-link"
       href="${pageContext.request.contextPath}/index.jsp">

        ← Home

    </a>

</header>



<!-- ================= MAIN ================= -->

<main class="main-container">


    <!-- PAGE HEADER -->

    <section class="page-header">

        <div class="page-icon">
            📝
        </div>

        <h1>Create Student Account</h1>

        <p>
            Register your profile to explore campus placement opportunities.
        </p>

    </section>



    <!-- FORM -->

    <section class="form-card">

        <h2 class="form-section-title">
            Student Information
        </h2>

        <p class="form-section-description">
            Enter your details accurately. They will be used to determine
            your eligibility for available job opportunities.
        </p>

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
        <form action="${pageContext.request.contextPath}/student-register"
              method="post">


            <div class="form-grid">


                <!-- NAME -->

                <div class="form-group">

                    <label for="name">
                        Full Name
                    </label>

                    <input
                            type="text"
                            id="name"
                            name="name"
                            placeholder="Enter your full name"
                            required>

                </div>



                <!-- EMAIL -->

                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="example@email.com"
                            required>

                </div>



                <!-- PHONE -->

                <div class="form-group">

                    <label for="phone">
                        Phone Number
                    </label>

                    <input
                            type="tel"
                            id="phone"
                            name="phone"
                            placeholder="Enter your phone number"
                            required>

                </div>



                <!-- GENDER -->

                <div class="form-group">

                    <label for="gender">
                        Gender
                    </label>

                    <select id="gender" name="gender" required>

                        <option value="">
                            Select gender
                        </option>

                        <option value="Male">
                            Male
                        </option>

                        <option value="Female">
                            Female
                        </option>

                        <option value="Other">
                            Other
                        </option>

                    </select>

                </div>



                <!-- DEPARTMENT -->

                <div class="form-group">

                    <label for="department">
                        Department
                    </label>

                    <select id="department"
                            name="department"
                            required>

                        <option value="">
                            Select department
                        </option>

                        <option value="CSE">
                            Computer Science and Engineering
                        </option>

                        <option value="IT">
                            Information Technology
                        </option>

                        <option value="ECE">
                            Electronics and Communication Engineering
                        </option>

                        <option value="EEE">
                            Electrical and Electronics Engineering
                        </option>

                        <option value="MECH">
                            Mechanical Engineering
                        </option>

                        <option value="CIVIL">
                            Civil Engineering
                        </option>

                    </select>

                </div>



                <!-- YEAR -->

                <div class="form-group">

                    <label for="yearOfStudy">
                        Year of Study
                    </label>

                    <select id="yearOfStudy"
                            name="yearOfStudy"
                            required>

                        <option value="">
                            Select year
                        </option>

                        <option value="1">
                            First Year
                        </option>

                        <option value="2">
                            Second Year
                        </option>

                        <option value="3">
                            Third Year
                        </option>

                        <option value="4">
                            Final Year
                        </option>

                    </select>

                </div>



                <!-- CGPA -->

                <div class="form-group">

                    <label for="cgpa">
                        CGPA
                    </label>

                    <input
                            type="number"
                            id="cgpa"
                            name="cgpa"
                            min="0"
                            max="10"
                            step="0.01"
                            placeholder="Example: 8.25"
                            required>

                    <span class="hint">
                        Enter your current CGPA out of 10.
                    </span>

                </div>



                <!-- SKILLS -->

                <div class="form-group">

                    <label for="skills">
                        Technical Skills
                    </label>

                    <input
                            type="text"
                            id="skills"
                            name="skills"
                            placeholder="Java, SQL, HTML, CSS">

                    <span class="hint">
                        Separate multiple skills using commas.
                    </span>

                </div>



                <!-- PASSWORD -->

                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Create a secure password"
                            required>

                </div>



                <!-- CONFIRM PASSWORD -->

                <div class="form-group">

                    <label for="confirmPassword">
                        Confirm Password
                    </label>

                    <input
                            type="password"
                            id="confirmPassword"
                            name="confirmPassword"
                            placeholder="Re-enter your password"
                            required>

                </div>

            </div>


            <div class="divider"></div>


            <!-- ACTIONS -->

            <div class="form-actions">

                <a
                        href="${pageContext.request.contextPath}/student/login.jsp"
                        class="cancel-btn">

                    Cancel

                </a>


                <button
                        type="submit"
                        class="register-btn">

                    Create Account →

                </button>

            </div>

        </form>


        <p class="login-link">

            Already have an account?

            <a href="${pageContext.request.contextPath}/student/login.jsp">
                Login here
            </a>

        </p>

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