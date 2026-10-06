package menu;

import auth.SessionManager;
import model.Admin;
import service.AdminService;

import java.util.Scanner;
import dao.StudentDAO;
import dao.CompanyDAO;
import model.Student;
import model.Company;

import java.util.List;

public class AdminMenu {

    private final Scanner sc;
    private final AdminService adminService;

    public AdminMenu(Scanner sc) {

        this.sc = sc;
        this.adminService = new AdminService();
    }

    public void show() {

        System.out.println("\n===== ADMIN LOGIN =====");

        System.out.print("Username: ");
        String username = sc.nextLine();

        System.out.print("Password: ");
        String password = sc.nextLine();

        Admin admin =
                adminService.login(username, password);

        if (admin == null) {

            System.out.println(
                    "Invalid username or password."
            );

            return;
        }

        SessionManager.login(admin, "ADMIN");

        System.out.println(
                "Admin login successful."
        );

        adminDashboard(admin);
    }

    private void adminDashboard(Admin admin) {

        while (true) {

            System.out.println("\n========== ADMIN DASHBOARD ==========");
            System.out.println("1. View Student Profiles");
            System.out.println("2. View Company Profiles");
            System.out.println("3. Logout");

            System.out.print("Enter Choice : ");

            String choice = sc.nextLine();

            switch (choice) {

                case "1":
                    viewStudentProfiles();
                    break;

                case "2":
                    viewCompanyProfiles();
                    break;

                case "3":
                    SessionManager.logout();
                    System.out.println("Logged out Successfully!");
                    return;

                default:
                    System.out.println("Invalid Choice!");

            }

        }


        }
    private void viewStudentProfiles() {

        StudentDAO dao = new StudentDAO();

        List<Student> students = dao.getAllStudents();

        System.out.println("\n========== STUDENT PROFILES ==========");

        for (Student s : students) {

            System.out.println("-------------------------------------");
            System.out.println("Student ID : " + s.getStudentId());
            System.out.println("Name       : " + s.getName());
            System.out.println("Email      : " + s.getEmail());
            System.out.println("Phone      : " + s.getPhone());
            System.out.println("Gender     : " + s.getGender());
            System.out.println("Department : " + s.getDepartment());
            System.out.println("Year       : " + s.getYearOfStudy());
            System.out.println("CGPA       : " + s.getCgpa());

        }

    }
    private void viewCompanyProfiles() {

        CompanyDAO dao = new CompanyDAO();

        List<Company> companies = dao.getAllCompanies();

        System.out.println("\n========== COMPANY PROFILES ==========");

        for (Company c : companies) {

            System.out.println("-------------------------------------");
            System.out.println("Company ID   : " + c.getCompanyId());
            System.out.println("Company Name : " + c.getCompanyName());
            System.out.println("Email        : " + c.getEmail());
            System.out.println("Phone        : " + c.getPhone());
            System.out.println("Location     : " + c.getLocation());
            System.out.println("Website      : " + c.getWebsite());

        }

    }
    }
