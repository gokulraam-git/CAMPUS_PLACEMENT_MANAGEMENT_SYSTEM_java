package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Admin;
import service.AdminService;

import java.io.IOException;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

    private final AdminService adminService =
            new AdminService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        Admin admin =
                adminService.login(
                        username,
                        password
                );

        if (admin != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "admin",
                    admin
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/admin/dashboard.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Invalid username or password."
            );

            request.getRequestDispatcher(
                    "/admin/login.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}