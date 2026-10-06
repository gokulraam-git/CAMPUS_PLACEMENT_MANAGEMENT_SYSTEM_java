package auth;

import model.Admin;
import model.Company;
import model.Student;
import service.AdminService;
import service.CompanyService;
import service.StudentService;

public class AuthService {

    private final StudentService studentService = new StudentService();
    private final CompanyService companyService = new CompanyService();
    private final AdminService adminService = new AdminService();

    public boolean loginStudent(String email, String password) {

        Student student = studentService.login(email, password);

        if (student != null) {
            SessionManager.login(student, "STUDENT");
            return true;
        }

        return false;
    }

    public boolean loginCompany(String email, String password) {

        Company company = companyService.login(email, password);

        if (company != null) {
            SessionManager.login(company, "COMPANY");
            return true;
        }

        return false;
    }

    public boolean loginAdmin(String username, String password) {

        Admin admin = adminService.login(username, password);

        if (admin != null) {
            SessionManager.login(admin, "ADMIN");
            return true;
        }

        return false;
    }

    public void logout() {
        SessionManager.logout();
    }

    public boolean isLoggedIn() {
        return SessionManager.isLoggedIn();
    }

    public boolean hasRole(String role) {

        if (!SessionManager.isLoggedIn()) {
            return false;
        }

        return role.equalsIgnoreCase(
                SessionManager.getCurrentRole()
        );
    }
}