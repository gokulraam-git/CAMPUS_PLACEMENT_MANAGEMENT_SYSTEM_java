package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Student;
import service.StudentService;

import java.io.IOException;

@WebServlet("/student-register")
public class StudentRegisterServlet extends HttpServlet {

    private final StudentService studentService = new StudentService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String department = request.getParameter("department");
        String yearOfStudyStr = request.getParameter("yearOfStudy");
        String cgpaStr = request.getParameter("cgpa");
        String skills = request.getParameter("skills");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Password confirmation
        if (!password.equals(confirmPassword)) {

            request.setAttribute(
                    "errorMessage",
                    "Passwords do not match."
            );

            request.getRequestDispatcher(
                    "/student/register.jsp"
            ).forward(request, response);

            return;
        }

        int yearOfStudy;
        double cgpa;

        try {

            yearOfStudy = Integer.parseInt(yearOfStudyStr);
            cgpa = Double.parseDouble(cgpaStr);

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "errorMessage",
                    "Year of study and CGPA must be valid numbers."
            );

            request.getRequestDispatcher(
                    "/student/register.jsp"
            ).forward(request, response);

            return;
        }

        Student student = new Student();

        student.setName(name);
        student.setEmail(email);
        student.setPhone(phone);
        student.setGender(gender);
        student.setDepartment(department);
        student.setYearOfStudy(yearOfStudy);
        student.setCgpa(cgpa);
        student.setSkills(skills);
        student.setPassword(password);

        boolean success = studentService.register(student);

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/student/login.jsp?registered=true"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Registration failed. Email may already be registered."
            );

            request.getRequestDispatcher(
                    "/student/register.jsp"
            ).forward(request, response);
        }
    }
}