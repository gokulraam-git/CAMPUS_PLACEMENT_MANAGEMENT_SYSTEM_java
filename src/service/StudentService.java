package service;

import dao.StudentDAO;
import model.Student;
import util.PasswordUtil;
import validation.StudentValidator;

public class StudentService {

    private final StudentDAO studentDAO;
    private final StudentValidator validator;

    public StudentService() {

        this.studentDAO = new StudentDAO();
        this.validator = new StudentValidator();
    }


    // =========================================================
    // STUDENT REGISTRATION
    // =========================================================

    public boolean register(Student student) {

        if (student == null) {

            System.out.println(
                    "Student details cannot be null."
            );

            return false;
        }

        // Validate student information
        if (!validator.validate(student)) {

            return false;
        }

        // Check duplicate email
        if (studentDAO.findByEmail(
                student.getEmail()) != null) {

            System.out.println(
                    "Email already registered."
            );

            return false;
        }

        // Hash password before storing
        student.setPassword(
                PasswordUtil.hashPassword(
                        student.getPassword()
                )
        );

        return studentDAO.save(student);
    }


    // =========================================================
    // STUDENT LOGIN
    // =========================================================

    public Student login(
            String email,
            String password) {

        if (email == null ||
                email.trim().isEmpty()) {

            return null;
        }

        if (password == null ||
                password.trim().isEmpty()) {

            return null;
        }

        Student student =
                studentDAO.findByEmail(email);

        if (student == null) {

            return null;
        }

        // Hash entered password
        String hashedPassword =
                PasswordUtil.hashPassword(password);

        // Compare hashed password
        if (student.getPassword() != null &&
                student.getPassword()
                        .equals(hashedPassword)) {

            return student;
        }

        return null;
    }


    // =========================================================
    // UPDATE STUDENT PROFILE
    // =========================================================

    public boolean updateProfile(Student student) {

        if (student == null) {

            System.out.println(
                    "Student details cannot be null."
            );

            return false;
        }

        // Basic validation
        if (student.getName() == null ||
                student.getName().trim().isEmpty()) {

            System.out.println(
                    "Name cannot be empty."
            );

            return false;
        }

        if (student.getPhone() == null ||
                student.getPhone().trim().isEmpty()) {

            System.out.println(
                    "Phone cannot be empty."
            );

            return false;
        }

        if (student.getGender() == null ||
                student.getGender().trim().isEmpty()) {

            System.out.println(
                    "Gender cannot be empty."
            );

            return false;
        }

        if (student.getDepartment() == null ||
                student.getDepartment().trim().isEmpty()) {

            System.out.println(
                    "Department cannot be empty."
            );

            return false;
        }

        if (student.getYearOfStudy() < 1 ||
                student.getYearOfStudy() > 4) {

            System.out.println(
                    "Year of Study must be between 1 and 4."
            );

            return false;
        }

        if (student.getCgpa() < 0 ||
                student.getCgpa() > 10) {

            System.out.println(
                    "CGPA must be between 0 and 10."
            );

            return false;
        }

        if (student.getStudentId() <= 0) {

            System.out.println(
                    "Invalid student ID."
            );

            return false;
        }

        return studentDAO.updateProfile(student);
    }
}