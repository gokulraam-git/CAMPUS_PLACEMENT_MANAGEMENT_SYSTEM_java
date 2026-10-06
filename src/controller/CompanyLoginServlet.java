package controller;

import auth.SessionManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Company;
import service.CompanyService;

import java.io.IOException;

@WebServlet("/company-login")
public class CompanyLoginServlet extends HttpServlet {

    private final CompanyService companyService =
            new CompanyService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");


        // Authenticate company
        Company company =
                companyService.login(
                        email,
                        password
                );


        if (company != null) {

            // Application-level session
            SessionManager.login(
                    company,
                    "COMPANY"
            );


            // Web session
            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "company",
                    company
            );


            // Redirect to company dashboard
            response.sendRedirect(
                    request.getContextPath()
                            + "/company/dashboard.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Invalid email or password."
            );

            request.getRequestDispatcher(
                    "/company/login.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}