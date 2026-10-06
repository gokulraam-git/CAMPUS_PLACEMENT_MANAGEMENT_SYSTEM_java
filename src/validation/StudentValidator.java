package validation;

import model.Student;

public class StudentValidator {

    public boolean validate(Student student) {

        if (InputValidator.isEmpty(student.getName())) {
            System.out.println("Name cannot be empty.");
            return false;
        }

        if (!InputValidator.isValidEmail(student.getEmail())) {
            System.out.println("Invalid email.");
            return false;
        }

        if (!InputValidator.isValidPhone(student.getPhone())) {
            System.out.println("Phone number must contain 10 digits.");
            return false;
        }

        if (student.getYearOfStudy() < 1 ||
                student.getYearOfStudy() > 4) {

            System.out.println("Year must be between 1 and 4.");
            return false;
        }

        if (student.getCgpa() < 0 ||
                student.getCgpa() > 10) {

            System.out.println("CGPA must be between 0 and 10.");
            return false;
        }

        if (InputValidator.isEmpty(student.getPassword())) {
            System.out.println("Password cannot be empty.");
            return false;
        }

        return true;
    }
}