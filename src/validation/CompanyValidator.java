package validation;

import model.Company;

public class CompanyValidator {

    public boolean validate(Company company) {

        if (InputValidator.isEmpty(
                company.getCompanyName())) {

            System.out.println(
                    "Company name cannot be empty."
            );

            return false;
        }

        if (!InputValidator.isValidEmail(
                company.getEmail())) {

            System.out.println("Invalid email.");
            return false;
        }

        if (!InputValidator.isValidPhone(
                company.getPhone())) {

            System.out.println(
                    "Phone number must contain 10 digits."
            );

            return false;
        }

        if (InputValidator.isEmpty(
                company.getPassword())) {

            System.out.println(
                    "Password cannot be empty."
            );

            return false;
        }

        return true;
    }
}