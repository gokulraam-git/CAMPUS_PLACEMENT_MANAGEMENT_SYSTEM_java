package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Company;
import service.CompanyService;

import java.io.IOException;

@WebServlet("/company-register")
public class CompanyRegisterServlet extends HttpServlet {

    private final CompanyService companyService =
            new CompanyService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String companyName =
                request.getParameter("companyName");

        String email =
                request.getParameter("email");

        String phone =
                request.getParameter("phone");

        String location =
                request.getParameter("location");

        String website =
                request.getParameter("website");

        String password =
                request.getParameter("password");

        String confirmPassword =
                request.getParameter("confirmPassword");


        // Check password confirmation
        if (password == null ||
                !password.equals(confirmPassword)) {

            request.setAttribute(
                    "errorMessage",
                    "Passwords do not match."
            );

            request.getRequestDispatcher(
                    "/company/register.jsp"
            ).forward(request, response);

            return;
        }


        // Create Company object
        Company company =
                new Company();

        company.setCompanyName(companyName);
        company.setEmail(email);
        company.setPhone(phone);
        company.setLocation(location);
        company.setWebsite(website);
        company.setPassword(password);


        // Register company
        boolean success =
                companyService.register(company);


        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/company/login.jsp?registered=true"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Registration failed. Email may already be registered or the details are invalid."
            );

            request.getRequestDispatcher(
                    "/company/register.jsp"
            ).forward(request, response);
        }
    }
}