<%@ page import="model.Student" %>

<%
    Student student = (Student) session.getAttribute("student");

    if (student == null) {
        response.sendRedirect(
                request.getContextPath() + "/student/login.jsp"
        );
        return;
    }
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Profile | Campus Placement</title>

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
            align-items: center;
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
            max-width: 1000px;
            margin: 45px auto;
            padding: 0 25px;
        }

        .page-header {
            margin-bottom: 28px;
        }

        .page-header h1 {
            font-size: 32px;
            margin-bottom: 8px;
        }

        .page-header p {
            color: #64748b;
        }

        /* PROFILE CARD */

        .profile-card {
            background: white;
            border-radius: 18px;
            box-shadow: 0 8px 30px rgba(15, 23, 42, 0.08);
            overflow: hidden;
        }

        .profile-top {
            background: linear-gradient(
                135deg,
                #0b1f3a,
                #174a7e
            );

            color: white;
            padding: 30px;
            display: flex;
            align-items: center;
            gap: 22px;
        }

        .avatar {
            width: 75px;
            height: 75px;
            border-radius: 50%;
            background: #ffffff;
            color: #0b1f3a;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            font-weight: bold;
        }

        .profile-top h2 {
            margin-bottom: 6px;
        }

        .profile-top p {
            opacity: 0.85;
        }

        /* DETAILS */

        .details {
            padding: 35px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px;
        }

        .detail-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 18px;
        }

        .detail-label {
            font-size: 12px;
            color: #64748b;
            margin-bottom: 7px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .detail-value {
            font-size: 16px;
            font-weight: 600;
            color: #172033;
            word-break: break-word;
        }

        .skills {
            grid-column: 1 / -1;
        }

        /* BUTTONS */

        .actions {
            padding: 0 35px 35px;
            display: flex;
            gap: 12px;
        }

        .btn {
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 9px;
            font-size: 14px;
            font-weight: 600;
            display: inline-block;
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
            color: #334155;
        }

        .btn-secondary:hover {
            background: #cbd5e1;
        }

        /* FOOTER */

        footer {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            padding: 30px;
        }

        /* RESPONSIVE */

        @media (max-width: 700px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a:nth-child(2) {
                display: none;
            }

            .details {
                grid-template-columns: 1fr;
                padding: 22px;
            }

            .skills {
                grid-column: auto;
            }

            .actions {
                padding: 0 22px 25px;
                flex-direction: column;
            }

            .btn {
                text-align: center;
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

        <a href="${pageContext.request.contextPath}/student/jobs.jsp">
            Jobs
        </a>

        <a href="${pageContext.request.contextPath}/student/applications.jsp">
            Applications
        </a>

    </div>

</nav>


<!-- PAGE -->

<div class="page">

    <div class="page-header">

        <h1>My Profile</h1>

        <p>
            View your personal and academic information.
        </p>

    </div>


    <div class="profile-card">

        <!-- PROFILE HEADER -->

        <div class="profile-top">

            <div class="avatar">
                <%= student.getName().substring(0, 1).toUpperCase() %>
            </div>

            <div>

                <h2>
                    <%= student.getName() %>
                </h2>

                <p>
                    Student Profile
                </p>

            </div>

        </div>


        <!-- DETAILS -->

        <div class="details">

            <div class="detail-box">

                <div class="detail-label">
                    Full Name
                </div>

                <div class="detail-value">
                    <%= student.getName() %>
                </div>

            </div>


            <div class="detail-box">

                <div class="detail-label">
                    Email
                </div>

                <div class="detail-value">
                    <%= student.getEmail() %>
                </div>

            </div>


            <div class="detail-box">

                <div class="detail-label">
                    Phone
                </div>

                <div class="detail-value">
                    <%= student.getPhone() %>
                </div>

            </div>


            <div class="detail-box">

                <div class="detail-label">
                    Gender
                </div>

                <div class="detail-value">
                    <%= student.getGender() %>
                </div>

            </div>


            <div class="detail-box">

                <div class="detail-label">
                    Department
                </div>

                <div class="detail-value">
                    <%= student.getDepartment() %>
                </div>

            </div>


            <div class="detail-box">

                <div class="detail-label">
                    Year of Study
                </div>

                <div class="detail-value">
                    Year <%= student.getYearOfStudy() %>
                </div>

            </div>


            <div class="detail-box">

                <div class="detail-label">
                    CGPA
                </div>

                <div class="detail-value">
                    <%= student.getCgpa() %>
                </div>

            </div>


            <div class="detail-box skills">

                <div class="detail-label">
                    Technical Skills
                </div>

                <div class="detail-value">

                    <%
                        String skills = student.getSkills();

                        if (skills != null && !skills.trim().isEmpty()) {
                    %>

                        <%= skills %>

                    <%
                        } else {
                    %>

                        No skills added yet.

                    <%
                        }
                    %>

                </div>

            </div>

        </div>


        <!-- ACTIONS -->

        <div class="actions">

            <a href="dashboard.jsp"
               class="btn btn-secondary">
                ← Back to Dashboard
            </a>

           <a href="${pageContext.request.contextPath}/student/edit-profile.jsp"
              class="btn btn-primary">
               ✏️ Edit Profile
           </a>

        </div>

    </div>

</div>


<footer>
    © 2026 Campus Placement Management System
</footer>

</body>

</html>