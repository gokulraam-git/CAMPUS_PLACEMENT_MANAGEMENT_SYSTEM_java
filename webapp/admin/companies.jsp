<%@ page import="model.Admin" %>
<%@ page import="model.Company" %>
<%@ page import="dao.CompanyDAO" %>
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
    // GET ALL COMPANIES
    // =========================================================

    CompanyDAO companyDAO =
            new CompanyDAO();

    List<Company> companies =
            companyDAO.getAllCompanies();

    int totalCompanies = companies.size();
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Companies | Admin | Campus Placement System</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .companies-container {
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

        .company-count {
            background: #e0e7ff;
            color: #3730a3;
            padding: 10px 17px;
            border-radius: 20px;
            font-weight: 600;
        }

        .company-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .company-card {
            background: white;

            border: 1px solid #e5e7eb;

            border-radius: 18px;

            padding: 28px;

            box-shadow:
                    0 8px 25px
                    rgba(15, 23, 42, 0.07);
        }

        .company-header {
            display: flex;
            align-items: center;
            gap: 15px;

            margin-bottom: 22px;
        }

        .company-icon {
            width: 52px;
            height: 52px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #e0e7ff;

            font-size: 25px;
        }

        .company-header h2 {
            margin: 0 0 5px;

            color: #0f172a;

            font-size: 21px;
        }

        .company-id {
            color: #64748b;

            font-size: 13px;
        }

        .company-details {
            display: grid;

            grid-template-columns:
                    repeat(2, 1fr);

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

        .detail-value a {
            color: #2563eb;

            text-decoration: none;
        }

        .detail-value a:hover {
            text-decoration: underline;
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

        @media (max-width: 650px) {

            .company-details {
                grid-template-columns: 1fr;
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
     COMPANIES
========================================================= -->

<main class="companies-container">


    <div class="page-header">

        <div>

            <h1>
                Company Profiles
            </h1>

            <p>
                View all companies registered in the
                campus placement system.
            </p>

        </div>

        <div class="company-count">

            <%= totalCompanies %>
            Company<%= totalCompanies == 1 ? "" : "ies" %>

        </div>

    </div>


    <%
        if (companies.isEmpty()) {
    %>


        <!-- =================================================
             EMPTY STATE
        ================================================== -->

        <div class="empty-state">

            <div class="empty-icon">
                🏢
            </div>

            <h2>
                No Companies Registered
            </h2>

            <p>
                Company profiles will appear here
                after registration.
            </p>

        </div>


    <%
        } else {
    %>


        <!-- =================================================
             COMPANY LIST
        ================================================== -->

        <div class="company-list">

            <%
                for (Company company : companies) {
            %>

                <div class="company-card">


                    <!-- COMPANY HEADER -->

                    <div class="company-header">

                        <div class="company-icon">
                            🏢
                        </div>

                        <div>

                            <h2>
                                <%= company.getCompanyName() %>
                            </h2>

                            <div class="company-id">
                                Company ID:
                                #<%= company.getCompanyId() %>
                            </div>

                        </div>

                    </div>


                    <!-- COMPANY DETAILS -->

                    <div class="company-details">


                        <!-- EMAIL -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Email
                            </span>

                            <span class="detail-value">
                                <%= company.getEmail() %>
                            </span>

                        </div>


                        <!-- PHONE -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Phone
                            </span>

                            <span class="detail-value">
                                <%= company.getPhone() %>
                            </span>

                        </div>


                        <!-- LOCATION -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Location
                            </span>

                            <span class="detail-value">

                                <%
                                    String location =
                                            company.getLocation();

                                    if (location == null ||
                                            location.trim().isEmpty()) {
                                %>

                                    Not provided

                                <%
                                    } else {
                                %>

                                    <%= location %>

                                <%
                                    }
                                %>

                            </span>

                        </div>


                        <!-- WEBSITE -->

                        <div class="detail-box">

                            <span class="detail-label">
                                Website
                            </span>

                            <span class="detail-value">

                                <%
                                    String website =
                                            company.getWebsite();

                                    if (website == null ||
                                            website.trim().isEmpty()) {
                                %>

                                    Not provided

                                <%
                                    } else {
                                %>

                                    <a href="<%= website %>"
                                       target="_blank"
                                       rel="noopener noreferrer">
                                        <%= website %>
                                    </a>

                                <%
                                    }
                                %>

                            </span>

                        </div>

                                      </div>

                                      <!-- DELETE COMPANY -->

                                      <div style="margin-top: 20px; text-align: right;">

                                          <a
                                              href="<%= request.getContextPath() %>/delete-company?companyId=<%= company.getCompanyId() %>"
                                              class="btn btn-danger"
                                              onclick="return confirm('Are you sure you want to delete this company?');">
                                              🗑️ Delete Company
                                          </a>

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