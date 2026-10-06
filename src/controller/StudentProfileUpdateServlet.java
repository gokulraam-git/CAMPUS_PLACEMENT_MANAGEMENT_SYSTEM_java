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

@WebServlet("/student-update-profile")
public class StudentProfileUpdateServlet extends HttpServlet {

    private final StudentService studentService =
            new StudentService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check student login
        if (session == null ||
                session.getAttribute("student") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/student/login.jsp"
            );
            return;
        }

        // Get logged-in student
        Student currentStudent =
                (Student) session.getAttribute("student");

        // Get form values
        String name =
                request.getParameter("name");

        String phone =
                request.getParameter("phone");

        String gender =
                request.getParameter("gender");

        String department =
                request.getParameter("department");

        String yearOfStudyStr =
                request.getParameter("yearOfStudy");

        String cgpaStr =
                request.getParameter("cgpa");

        String skills =
                request.getParameter("skills");

        int yearOfStudy;
        double cgpa;

        // Convert numeric values
        try {

            yearOfStudy =
                    Integer.parseInt(yearOfStudyStr);

            cgpa =
                    Double.parseDouble(cgpaStr);

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "errorMessage",
                    "Year of study and CGPA must be valid numbers."
            );

            request.getRequestDispatcher(
                    "/student/edit-profile.jsp"
            ).forward(request, response);

            return;
        }

        // Create updated Student object
        Student updatedStudent =
                new Student();

        // Keep the existing student ID
        updatedStudent.setStudentId(
                currentStudent.getStudentId()
        );

        updatedStudent.setName(name);
        updatedStudent.setEmail(
                currentStudent.getEmail()
        );
        updatedStudent.setPhone(phone);
        updatedStudent.setGender(gender);
        updatedStudent.setDepartment(department);
        updatedStudent.setYearOfStudy(yearOfStudy);
        updatedStudent.setCgpa(cgpa);
        updatedStudent.setSkills(skills);

        // Update database
        boolean success =
                studentService.updateProfile(
                        updatedStudent
                );

        if (success) {

            // Update session with new student details
            session.setAttribute(
                    "student",
                    updatedStudent
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/student/profile.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Unable to update profile. Please check your details."
            );

            request.setAttribute(
                    "student",
                    updatedStudent
            );

            request.getRequestDispatcher(
                    "/student/edit-profile.jsp"
            ).forward(request, response);
        }
    }
}