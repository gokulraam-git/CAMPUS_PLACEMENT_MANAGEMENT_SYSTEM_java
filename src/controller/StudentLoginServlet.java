package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Student;
import service.StudentService;

import java.io.IOException;

@WebServlet("/student-login")
public class StudentLoginServlet extends HttpServlet {

    private final StudentService studentService = new StudentService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Student student = studentService.login(email, password);

        if (student != null) {

            HttpSession session = request.getSession();
            session.setAttribute("student", student);

            response.sendRedirect(
                    request.getContextPath() + "/student/dashboard.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Invalid email or password"
            );

            request.getRequestDispatcher(
                    "/student/login.jsp"
            ).forward(request, response);
        }
    }
}