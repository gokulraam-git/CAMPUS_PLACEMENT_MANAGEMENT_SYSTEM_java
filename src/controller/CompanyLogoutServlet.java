package controller;

import auth.SessionManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/company-logout")
public class CompanyLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Clear application-level session
        SessionManager.logout();

        // Clear HTTP session
        HttpSession session =
                request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        // Redirect to company login
        response.sendRedirect(
                request.getContextPath()
                        + "/company/login.jsp"
        );
    }
}