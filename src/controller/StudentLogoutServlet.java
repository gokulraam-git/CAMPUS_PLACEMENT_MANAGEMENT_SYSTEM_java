package controller;

import auth.SessionManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/student-logout")
public class StudentLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Logout from the existing application session manager
        SessionManager.logout();

        // Logout from the web session
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        // Redirect to student login page
        response.sendRedirect(
                request.getContextPath()
                        + "/student/login.jsp"
        );
    }
}