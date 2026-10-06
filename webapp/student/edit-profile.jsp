<%@ page import="model.Student" %>

<%
    Student student =
            (Student) session.getAttribute("student");

    if (student == null) {
        response.sendRedirect(
                request.getContextPath()
                        + "/student/login.jsp"
        );
        return;
    }

    String errorMessage =
            (String) request.getAttribute("errorMessage");

    Student formStudent =
            (Student) request.getAttribute("student");

    if (formStudent != null) {
        student = formStudent;
    }
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Edit Profile | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #172033;
        }

        /* NAVBAR */

        .navbar {
            background: #0b1f3a;
            color: white;
            padding: 18px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
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
            color: #93c5fd;
        }

        /* PAGE */

        .container {
            width: 90%;
            max-width: 950px;
            margin: 45px auto;
        }

        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            font-size: 30px;
            color: #0b1f3a;
            margin-bottom: 8px;
        }

        .page-header p {
            color: #64748b;
        }

        /* CARD */

        .form-card {
            background: white;
            border-radius: 16px;
            padding: 35px;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
        }

        /* ERROR */

        .alert {
            padding: 13px 16px;
            border-radius: 10px;
            margin-bottom: 22px;
            font-size: 14px;
        }

        .alert.error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }

        /* FORM */

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full {
            grid-column: 1 / -1;
        }

        label {
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #334155;
        }

        input,
        select,
        textarea {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 9px;
            font-size: 14px;
            outline: none;
            background: white;
        }

        input:focus,
        select:focus,
        textarea:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        textarea {
            min-height: 100px;
            resize: vertical;
        }

        .readonly {
            background: #f1f5f9;
            color: #64748b;
            cursor: not-allowed;
        }

        .hint {
            margin-top: 6px;
            font-size: 12px;
            color: #64748b;
        }

        /* BUTTONS */

        .actions {
            margin-top: 30px;
            display: flex;
            gap: 12px;
        }

        .btn {
            padding: 12px 22px;
            border-radius: 9px;
            border: none;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
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
            padding: 30px;
            color: #64748b;
            font-size: 13px;
        }

        /* RESPONSIVE */

        @media (max-width: 700px) {

            .navbar {
                padding: 16px 5%;
            }

            .nav-links {
                gap: 12px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full {
                grid-column: auto;
            }

            .form-card {
                padding: 24px;
            }

            .actions {
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

    <div class="brand">
        🎓 Campus Placement System
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/student/dashboard.jsp">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/student/profile.jsp">
            Profile
        </a>

        <a href="${pageContext.request.contextPath}/student-logout">
            Logout
        </a>

    </div>

</nav>


<!-- PAGE -->

<div class="container">

    <div class="page-header">

        <h1>Edit Profile</h1>

        <p>
            Update your personal and academic information.
        </p>

    </div>


    <div class="form-card">

        <%
            if (errorMessage != null) {
        %>

            <div class="alert error">
                <%= errorMessage %>
            </div>

        <%
            }
        %>


        <form
                action="${pageContext.request.contextPath}/student-update-profile"
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
                            value="<%= student.getName() %>"
                            required>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label for="email">
                        Email
                    </label>

                    <input
                            type="email"
                            id="email"
                            value="<%= student.getEmail() %>"
                            class="readonly"
                            readonly>

                    <span class="hint">
                        Email cannot be changed.
                    </span>

                </div>


                <!-- PHONE -->

                <div class="form-group">

                    <label for="phone">
                        Phone
                    </label>

                    <input
                            type="text"
                            id="phone"
                            name="phone"
                            value="<%= student.getPhone() %>"
                            required>

                </div>


                <!-- GENDER -->

                <div class="form-group">

                    <label for="gender">
                        Gender
                    </label>

                    <select
                            id="gender"
                            name="gender"
                            required>

                        <option value="Male"
                            <%= "Male".equals(student.getGender()) ? "selected" : "" %>>
                            Male
                        </option>

                        <option value="Female"
                            <%= "Female".equals(student.getGender()) ? "selected" : "" %>>
                            Female
                        </option>

                        <option value="Other"
                            <%= "Other".equals(student.getGender()) ? "selected" : "" %>>
                            Other
                        </option>

                    </select>

                </div>


                <!-- DEPARTMENT -->

                <div class="form-group">

                    <label for="department">
                        Department
                    </label>

                    <input
                            type="text"
                            id="department"
                            name="department"
                            value="<%= student.getDepartment() %>"
                            required>

                </div>


                <!-- YEAR -->

                <div class="form-group">

                    <label for="yearOfStudy">
                        Year of Study
                    </label>

                    <select
                            id="yearOfStudy"
                            name="yearOfStudy"
                            required>

                        <option value="1"
                            <%= student.getYearOfStudy() == 1 ? "selected" : "" %>>
                            1st Year
                        </option>

                        <option value="2"
                            <%= student.getYearOfStudy() == 2 ? "selected" : "" %>>
                            2nd Year
                        </option>

                        <option value="3"
                            <%= student.getYearOfStudy() == 3 ? "selected" : "" %>>
                            3rd Year
                        </option>

                        <option value="4"
                            <%= student.getYearOfStudy() == 4 ? "selected" : "" %>>
                            4th Year
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
                            value="<%= student.getCgpa() %>"
                            min="0"
                            max="10"
                            step="0.01"
                            required>

                </div>


                <!-- SKILLS -->

                <div class="form-group full">

                    <label for="skills">
                        Skills
                    </label>

                    <textarea
                            id="skills"
                            name="skills"
                            placeholder="Example: Java, SQL, HTML, CSS, Python"><%= student.getSkills() != null ? student.getSkills() : "" %></textarea>

                    <span class="hint">
                        Separate multiple skills using commas.
                    </span>

                </div>


            </div>


            <!-- ACTIONS -->

            <div class="actions">

                <button
                        type="submit"
                        class="btn btn-primary">
                    Save Changes
                </button>

                <a
                        href="${pageContext.request.contextPath}/student/profile.jsp"
                        class="btn btn-secondary">
                    Cancel
                </a>

            </div>

        </form>

    </div>

</div>


<footer>
    © 2026 Campus Placement System
</footer>

</body>

</html>