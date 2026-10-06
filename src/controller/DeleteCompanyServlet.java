package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Company;
import service.CompanyService;

import java.io.IOException;

@WebServlet("/delete-company")
public class DeleteCompanyServlet extends HttpServlet {

    private final CompanyService companyService =
            new CompanyService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether admin is logged in
        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("admin") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/admin/login.jsp"
            );

            return;
        }

        // Get company ID from URL
        String companyIdParam =
                request.getParameter("companyId");

        if (companyIdParam == null ||
                companyIdParam.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/admin/companies.jsp"
            );

            return;
        }

        int companyId;

        try {
            companyId = Integer.parseInt(companyIdParam);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/admin/companies.jsp?error=invalid"
            );

            return;
        }

        // Delete company
        boolean deleted =
                companyService.deleteCompany(companyId);

        if (deleted) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/admin/companies.jsp?deleted=true"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                            + "/admin/companies.jsp?error=delete"
            );
        }
    }
}