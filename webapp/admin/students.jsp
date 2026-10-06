<%@ page import="model.Admin" %>
<%@ page import="model.Student" %>
<%@ page import="dao.StudentDAO" %>
<%@ page import="java.util.List" %>

<%
    // =========================================================
    // ADMIN SESSION CHECK
    // =========================================================

    Admin admin =
            (Admin) session.getAttribute("admin");

    if (admin == null) {

        response.sendRedirect(
                request.getContextPath()
                        + "/admin/login.jsp"
        );

        return;
    }


    // =========================================================
    // GET ALL STUDENTS
    // =========================================================

    StudentDAO studentDAO =
            new StudentDAO();

    List<Student> students =
            studentDAO.getAllStudents();

    int totalStudents = students.size();
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Students | Admin | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .students-container {
            max-width: 1200px;
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

        .student-count {
            background: #e0e7ff;
            color: #3730a3;
            padding: 10px 17px;
            border-radius: 20px;
            font-weight: 600;
        }

        .student-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .student-card {
            background: white;

            border: 1px solid #e5e7eb;

            border-radius: 18px;

            padding: 28px;

            box-shadow:
                    0 8px 25px
                    rgba(15, 23, 42, 0.07);
        }

        .student-header {
            display: flex;
            align-items: center;
            gap: 15px;

            margin-bottom: 22px;
        }

        .student-icon {
            width: 52px;
            height: 52px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #e0e7ff;

            font-size: 25px;
        }

        .student-header h2 {
            margin: 0 0 5px;

            color: #0f172a;

            font-size: 21px;
        }

        .student-id {
            color: #64748b;

            font-size: 13px;
        }

        .student-details {
            display: grid;

            grid-template-columns:
                    repeat(3, 1fr);

            gap: 15px;
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

        .skills-box {
            grid-column: 1 / -1;
        }

        .skills {
            display: flex;

            flex-wrap: wrap;

            gap: 8px;
        }

        .skill {
            background: #eef2ff;

            color: #3730a3;

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

        @media (max-width: 850px) {

            .student-details {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 600px) {

            .student-details {
                grid-template-columns: 1fr;
            }

            .skills-box {
                grid-column: auto;
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

            <a href="${pageContext.request.contextPath}/admin/dashboard.jsp">
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/admin/students.jsp">
                Students
            </a>

            <a href="${pageContext.request.contextPath}/admin/companies.jsp">
                Companies
            </a>

            <a href="${pageContext.request.contextPath}/admin-logout">
                Logout
            </a>

        </div>

    </div>

</nav>


<!-- =========================================================
     STUDENTS
========================================================= -->

<main class="students-container">


    <div class="page-header">

        <div>

            <h1>
                Student Profiles
            </h1>

            <p>
                View all students registered in the
                campus placement system.
            </p>

        </div>

        <div class="student-count">

            <%= totalStudents %>
            Student<%= totalStudents == 1 ? "" : "s" %>

        </div>

    </div>


    <%
        if (students.isEmpty()) {
    %>


        <!-- =================================================
             EMPTY STATE
        ================================================== -->

        <div class="empty-state">

            <div class="empty-icon">
                🎓
            </div>

            <h2>
                No Students Registered
            </h2>

            <p>
                Student profiles will appear here
                after registration.
            </p>

        </div>


    <%
        } else {
    %>


        <!-- =================================================
             STUDENT LIST
        ================================================== -->

        <div class="student-list">

            <%
                for (Student student : students) {
            %>

                <div class="student-card">


                    <!-- STUDENT HEADER -->

                    <div class="student-header">

                        <div class="student-icon">
                            🎓
                        </div>

                        <div>

                            <h2>
                                <%= student.getName() %>
                            </h2>

                            <div class="student-id">
                                Student ID:
                                #<%= student.getStudentId() %>
                            </div>

                        </div>

                    </div>


                    <!-- STUDENT DETAILS -->

                    <div class="student-details">


                        <!-- EMAIL -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Email
                            </span>

                            <span class="detail-value">
                                <%= student.getEmail() %>
                            </span>

                        </div>


                        <!-- PHONE -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Phone
                            </span>

                            <span class="detail-value">
                                <%= student.getPhone() %>
                            </span>

                        </div>


                        <!-- GENDER -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Gender
                            </span>

                            <span class="detail-value">
                                <%= student.getGender() %>
                            </span>

                        </div>


                        <!-- DEPARTMENT -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Department
                            </span>

                            <span class="detail-value">
                                <%= student.getDepartment() %>
                            </span>

                        </div>


                        <!-- YEAR -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Year of Study
                            </span>

                            <span class="detail-value">
                                Year <%= student.getYearOfStudy() %>
                            </span>

                        </div>


                        <!-- CGPA -->

                        <div class="detail-box">

                            <span class="detail-label">
                                CGPA
                            </span>

                            <span class="detail-value">
                                <%= student.getCgpa() %>
                            </span>

                        </div>


                        <!-- SKILLS -->

                        <div class="detail-box skills-box">

                            <span class="detail-label">
                                Skills
                            </span>

                            <div class="skills">

                                <%
                                    String skills =
                                            student.getSkills();

                                    if (skills != null &&
                                            !skills.trim().isEmpty()) {

                                        String[] skillList =
                                                skills.split(",");

                                        for (String skill :
                                                skillList) {
                                %>

                                            <span class="skill">
                                                <%= skill.trim() %>
                                            </span>

                                <%
                                        }

                                    } else {
                                %>

                                        <span class="skill">
                                            No skills provided
                                        </span>

                                <%
                                    }
                                %>

                            </div>

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

    <div class="back-action">

        <a
                href="${pageContext.request.contextPath}/admin/dashboard.jsp"
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