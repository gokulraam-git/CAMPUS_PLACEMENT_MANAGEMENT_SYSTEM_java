package service;

import dao.CompanyDAO;
import model.Company;
import util.PasswordUtil;
import validation.CompanyValidator;

public class CompanyService {

    private final CompanyDAO companyDAO = new CompanyDAO();
    private final CompanyValidator validator = new CompanyValidator();

    public boolean register(Company company) {

        if (!validator.validate(company)) {
            return false;
        }

        if (companyDAO.findByEmail(company.getEmail()) != null) {
            System.out.println("Email already registered.");
            return false;
        }

        company.setPassword(
                PasswordUtil.hashPassword(company.getPassword())
        );

        return companyDAO.save(company);
    }

    public Company login(String email, String password) {

        Company company = companyDAO.findByEmail(email);

        if (company == null) {
            return null;
        }

        String hashedPassword =
                PasswordUtil.hashPassword(password);

        if (company.getPassword().equals(hashedPassword)) {
            return company;
        }

        return null;
    }

    // Admin deletes a company
    public boolean deleteCompany(int companyId) {

        if (companyId <= 0) {
            return false;
        }

        return companyDAO.deleteCompany(companyId);
    }
}