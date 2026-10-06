<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Login | Campus Placement System</title>

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
            min-height: 100vh;
            background: linear-gradient(135deg, #eef5ff, #f8fafc);
            color: #1e293b;
        }

        /* ---------- NAVBAR ---------- */

        .navbar {
            height: 72px;
            background: #0f2747;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            color: white;
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
            font-size: 19px;
            margin-bottom: 2px;
        }

        .brand span {
            font-size: 11px;
            color: #cbd5e1;
        }

        .home-link {
            color: white;
            text-decoration: none;
            font-size: 14px;
            padding: 9px 16px;
            border-radius: 7px;
            transition: 0.2s;
        }

        .home-link:hover {
            background: #1e3a5f;
        }

        /* ---------- MAIN ---------- */

        .main-container {
            min-height: calc(100vh - 72px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px 20px;
        }

        .login-wrapper {
            width: 900px;
            max-width: 100%;
            display: grid;
            grid-template-columns: 1fr 1fr;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(15, 39, 71, 0.12);
            border: 1px solid #e2e8f0;
        }

        /* ---------- LEFT PANEL ---------- */

        .welcome-panel {
            background: linear-gradient(145deg, #0f2747, #1d4e89);
            color: white;
            padding: 55px 45px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .welcome-icon {
            width: 65px;
            height: 65px;
            border-radius: 16px;
            background: rgba(255, 255, 255, 0.13);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 31px;
            margin-bottom: 25px;
        }

        .welcome-panel h1 {
            font-size: 32px;
            line-height: 1.2;
            margin-bottom: 17px;
        }

        .welcome-panel p {
            color: #dbeafe;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 28px;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 12px 0;
            color: #e0f2fe;
            font-size: 13px;
        }

        .check {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.15);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* ---------- LOGIN PANEL ---------- */

        .login-panel {
            padding: 50px 45px;
        }

        .login-panel h2 {
            color: #0f2747;
            font-size: 28px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 32px;
        }

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

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 16px;
        }

        .input-wrapper input {
            width: 100%;
            padding: 13px 14px 13px 42px;
            border: 1px solid #cbd5e1;
            border-radius: 9px;
            outline: none;
            font-size: 14px;
            color: #1e293b;
            transition: 0.2s;
        }

        .input-wrapper input:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        .login-btn {
            width: 100%;
            border: none;
            padding: 14px;
            margin-top: 8px;
            border-radius: 9px;
            background: #2563eb;
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .login-btn:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }

        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 25px 0;
            color: #94a3b8;
            font-size: 12px;
        }

        .divider::before,
        .divider::after {
            content: "";
            height: 1px;
            background: #e2e8f0;
            flex: 1;
        }

        .register-text {
            text-align: center;
            color: #64748b;
            font-size: 13px;
        }

        .register-text a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
        }

        .register-text a:hover {
            text-decoration: underline;
        }

        .back-home {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #64748b;
            text-decoration: none;
            font-size: 13px;
        }

        .back-home:hover {
            color: #2563eb;
        }

        /* ---------- RESPONSIVE ---------- */

        @media (max-width: 750px) {

            .login-wrapper {
                grid-template-columns: 1fr;
            }

            .welcome-panel {
                padding: 35px;
            }

            .login-panel {
                padding: 35px;
            }
        }

        @media (max-width: 450px) {

            .navbar {
                padding: 0 20px;
            }

            .brand h2 {
                font-size: 16px;
            }

            .welcome-panel h1 {
                font-size: 26px;
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


<!-- ================= MAIN CONTENT ================= -->

<main class="main-container">

    <div class="login-wrapper">

        <!-- LEFT SIDE -->

        <section class="welcome-panel">

            <div class="welcome-icon">
                🎓
            </div>

            <h1>
                Welcome Back,<br>
                Student!
            </h1>

            <p>
                Login to your campus placement account and
                explore career opportunities that match your
                skills and eligibility.
            </p>

            <div class="feature">
                <span class="check">✓</span>
                Explore available job opportunities
            </div>

            <div class="feature">
                <span class="check">✓</span>
                Check your eligibility
            </div>

            <div class="feature">
                <span class="check">✓</span>
                Track your applications
            </div>

        </section>


        <!-- RIGHT SIDE -->

        <section class="login-panel">

            <h2>Student Login</h2>

            <p class="subtitle">
                Enter your credentials to access your account.
            </p>


            <!-- LOGIN FORM -->

            <form action="${pageContext.request.contextPath}/student-login"
                  method="post">

                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <div class="input-wrapper">

                        <span class="input-icon">📧</span>

                        <input
                                type="email"
                                id="email"
                                name="email"
                                placeholder="Enter your email address"
                                required>

                    </div>

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <div class="input-wrapper">

                        <span class="input-icon">🔒</span>

                        <input
                                type="password"
                                id="password"
                                name="password"
                                placeholder="Enter your password"
                                required>

                    </div>

                </div>


                <button type="submit" class="login-btn">
                    Login to Account →
                </button>

            </form>


            <div class="divider">
                OR
            </div>


            <p class="register-text">

                New to Campus Placement?

                <a href="register.jsp">
                    Create an account
                </a>

            </p>


            <a class="back-home"
               href="${pageContext.request.contextPath}/index.jsp">

                ← Back to Home

            </a>

        </section>

    </div>

</main>

</body>
</html>