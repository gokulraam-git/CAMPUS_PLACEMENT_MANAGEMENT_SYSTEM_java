<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Login | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .login-container {
            min-height: calc(100vh - 80px);

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 40px 20px;
        }

        .login-card {
            width: 100%;
            max-width: 430px;

            background: white;

            border-radius: 20px;

            padding: 40px;

            border: 1px solid #e5e7eb;

            box-shadow:
                    0 15px 40px
                    rgba(15, 23, 42, 0.10);
        }

        .login-icon {
            width: 75px;
            height: 75px;

            margin: 0 auto 20px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #e0e7ff;

            font-size: 36px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            margin: 0 0 8px;
            color: #0f172a;
        }

        .login-header p {
            margin: 0;
            color: #64748b;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;

            margin-bottom: 8px;

            color: #334155;

            font-size: 14px;

            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            box-sizing: border-box;

            padding: 13px 14px;

            border: 1px solid #cbd5e1;

            border-radius: 9px;

            font-size: 15px;

            outline: none;
        }

        .form-group input:focus {
            border-color: #2563eb;

            box-shadow:
                    0 0 0 3px
                    rgba(37, 99, 235, 0.10);
        }

        .login-btn {
            width: 100%;

            padding: 13px;

            border: none;

            border-radius: 9px;

            background: #2563eb;

            color: white;

            font-size: 15px;

            font-weight: 600;

            cursor: pointer;
        }

        .login-btn:hover {
            background: #1d4ed8;
        }

        .back-link {
            display: block;

            text-align: center;

            margin-top: 22px;

            color: #64748b;

            text-decoration: none;

            font-size: 14px;
        }

        .back-link:hover {
            color: #2563eb;
        }

        .alert {
            margin-bottom: 20px;

            padding: 13px 15px;

            border-radius: 9px;

            background: #fee2e2;

            color: #991b1b;

            border: 1px solid #fecaca;

            font-size: 14px;
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

            <a href="${pageContext.request.contextPath}/index.jsp">
                Home
            </a>

        </div>

    </div>

</nav>


<!-- =========================================================
     LOGIN
========================================================= -->

<main class="login-container">

    <div class="login-card">


        <div class="login-icon">
            🛡️
        </div>


        <div class="login-header">

            <h1>
                Admin Login
            </h1>

            <p>
                Access the placement management portal
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


        <!-- LOGIN FORM -->

        <form
                action="${pageContext.request.contextPath}/admin-login"
                method="post">


            <div class="form-group">

                <label for="username">
                    Username
                </label>

                <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter admin username"
                        required>

            </div>


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


            <button
                    type="submit"
                    class="login-btn">
                Login as Admin
            </button>

        </form>


        <a
                href="${pageContext.request.contextPath}/index.jsp"
                class="back-link">
            ← Back to Home
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