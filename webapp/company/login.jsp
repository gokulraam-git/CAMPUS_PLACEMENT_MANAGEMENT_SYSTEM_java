<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Company Login | Campus Placement System</title>

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
            min-height: 100vh;
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
            min-height: calc(100vh - 72px);
            display: flex;
            align-items: center;
            justify-content: center;

            padding: 50px 25px;
        }

        .login-wrapper {
            width: 100%;
            max-width: 950px;

            display: grid;
            grid-template-columns: 1fr 1fr;

            background: white;

            border-radius: 20px;

            overflow: hidden;

            box-shadow:
                0 15px 40px rgba(15, 39, 71, 0.12);
        }

        /* ================= LEFT PANEL ================= */

        .welcome-panel {
            background: linear-gradient(
                135deg,
                #0f2747,
                #174a7e
            );

            color: white;

            padding: 55px 45px;

            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .welcome-icon {
            width: 65px;
            height: 65px;

            background: rgba(255, 255, 255, 0.15);

            border-radius: 16px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 30px;

            margin-bottom: 25px;
        }

        .welcome-panel h1 {
            font-size: 32px;
            margin-bottom: 15px;
        }

        .welcome-panel p {
            color: #dbeafe;
            line-height: 1.7;
            font-size: 14px;
            margin-bottom: 28px;
        }

        .features {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 10px;

            font-size: 13px;
            color: #e0ecff;
        }

        .feature-icon {
            width: 25px;
            height: 25px;

            border-radius: 50%;

            background: rgba(255, 255, 255, 0.15);

            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* ================= LOGIN PANEL ================= */

        .login-panel {
            padding: 55px 45px;

            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-header {
            margin-bottom: 28px;
        }

        .login-header h2 {
            color: #0f2747;
            font-size: 27px;
            margin-bottom: 8px;
        }

        .login-header p {
            color: #64748b;
            font-size: 14px;
        }

        /* ================= ALERT ================= */

        .alert {
            padding: 12px 15px;
            border-radius: 9px;
            margin-bottom: 20px;
            font-size: 13px;
        }

        .alert.error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }

        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;

            color: #334155;

            font-size: 13px;
            font-weight: 600;

            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;

            padding: 13px 14px;

            border: 1px solid #cbd5e1;

            border-radius: 8px;

            outline: none;

            font-family: inherit;
            font-size: 14px;

            transition: 0.2s;
        }

        .form-group input:focus {
            border-color: #2563eb;

            box-shadow:
                0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        /* ================= BUTTON ================= */

        .login-btn {
            width: 100%;

            padding: 13px;

            border: none;

            border-radius: 8px;

            background: #2563eb;

            color: white;

            font-size: 14px;

            font-weight: 600;

            cursor: pointer;

            transition: 0.2s;
        }

        .login-btn:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }

        /* ================= REGISTER ================= */

        .register-link {
            text-align: center;

            margin-top: 25px;

            color: #64748b;

            font-size: 13px;
        }

        .register-link a {
            color: #2563eb;

            text-decoration: none;

            font-weight: 600;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .home-bottom {
            text-align: center;

            margin-top: 15px;
        }

        .home-bottom a {
            color: #64748b;

            text-decoration: none;

            font-size: 12px;
        }

        .home-bottom a:hover {
            color: #2563eb;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 750px) {

            .navbar {
                padding: 0 20px;
            }

            .login-wrapper {
                grid-template-columns: 1fr;
            }

            .welcome-panel {
                padding: 35px 30px;
            }

            .welcome-panel h1 {
                font-size: 26px;
            }

            .login-panel {
                padding: 40px 30px;
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


    <a class="home-link"
       href="${pageContext.request.contextPath}/index.jsp">

        ← Home

    </a>

</header>



<!-- ================= MAIN ================= -->

<main class="main-container">


    <div class="login-wrapper">


        <!-- ================= LEFT PANEL ================= -->

        <section class="welcome-panel">

            <div class="welcome-icon">
                🏢
            </div>

            <h1>Welcome, Recruiter!</h1>

            <p>
                Sign in to manage your company profile,
                post job opportunities and connect with
                talented students.
            </p>


            <div class="features">

                <div class="feature">

                    <div class="feature-icon">
                        ✓
                    </div>

                    Manage company profile

                </div>


                <div class="feature">

                    <div class="feature-icon">
                        ✓
                    </div>

                    Post placement opportunities

                </div>


                <div class="feature">

                    <div class="feature-icon">
                        ✓
                    </div>

                    Review student applications

                </div>

            </div>

        </section>



        <!-- ================= LOGIN PANEL ================= -->

        <section class="login-panel">


            <div class="login-header">

                <h2>Company Login</h2>

                <p>
                    Enter your credentials to access your account.
                </p>

            </div>


            <%
                String errorMessage =
                        (String) request.getAttribute("errorMessage");

                if (errorMessage != null) {
            %>

                <div class="alert error">
                    <%= errorMessage %>
                </div>

            <%
                }
            %>


            <form
                    action="${pageContext.request.contextPath}/company-login"
                    method="post">


                <!-- EMAIL -->

                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="company@example.com"
                            required>

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
                            placeholder="Enter your password"
                            required>

                </div>


                <!-- LOGIN -->

                <button
                        type="submit"
                        class="login-btn">

                    Login to Company Portal →

                </button>


            </form>


            <p class="register-link">

                Don't have a company account?

                <a href="${pageContext.request.contextPath}/company/register.jsp">
                    Register here
                </a>

            </p>


            <div class="home-bottom">

                <a href="${pageContext.request.contextPath}/index.jsp">
                    ← Back to Home
                </a>

            </div>


        </section>

    </div>

</main>


</body>

</html>