package menu;

import auth.SessionManager;
import model.Application;
import model.Company;
import model.Job;
import service.ApplicationService;
import service.CompanyService;
import service.JobService;

import java.util.List;
import java.util.Scanner;

public class CompanyMenu {

    private final Scanner sc;
    private final CompanyService companyService;
    private final JobService jobService;
    private final ApplicationService applicationService;

    public CompanyMenu(Scanner sc) {

        this.sc = sc;
        this.companyService = new CompanyService();
        this.jobService = new JobService();
        this.applicationService = new ApplicationService();
    }


    // =========================================================
    // MAIN COMPANY MENU
    // =========================================================

    public void show() {

        while (true) {

            System.out.println();
            System.out.println("==========================================");
            System.out.println("              COMPANY MENU");
            System.out.println("==========================================");
            System.out.println("1. Register");
            System.out.println("2. Login");
            System.out.println("3. Back");

            System.out.print("Enter Choice : ");

            String choice = sc.nextLine();

            switch (choice) {

                case "1":
                    register();
                    break;

                case "2":
                    login();
                    break;

                case "3":
                    return;

                default:
                    System.out.println("Invalid Choice!");
            }
        }
    }


    // =========================================================
    // COMPANY REGISTRATION
    // =========================================================

    private void register() {

        System.out.println();
        System.out.println("===== COMPANY REGISTRATION =====");

        Company company = new Company();

        System.out.print("Company Name : ");
        company.setCompanyName(sc.nextLine());

        System.out.print("Email : ");
        company.setEmail(sc.nextLine());

        System.out.print("Phone : ");
        company.setPhone(sc.nextLine());

        System.out.print("Location : ");
        company.setLocation(sc.nextLine());

        System.out.print("Website : ");
        company.setWebsite(sc.nextLine());

        System.out.print("Password : ");
        company.setPassword(sc.nextLine());

        boolean success =
                companyService.register(company);

        if (success) {

            System.out.println();
            System.out.println(
                    "Company registered successfully."
            );

        } else {

            System.out.println();
            System.out.println(
                    "Company registration failed."
            );
        }
    }


    // =========================================================
    // COMPANY LOGIN
    // =========================================================

    private void login() {

        System.out.println();
        System.out.println("===== COMPANY LOGIN =====");

        System.out.print("Email : ");
        String email = sc.nextLine();

        System.out.print("Password : ");
        String password = sc.nextLine();

        Company company =
                companyService.login(
                        email,
                        password
                );

        if (company == null) {

            System.out.println(
                    "Invalid email or password."
            );

            return;
        }

        SessionManager.login(
                company,
                "COMPANY"
        );

        System.out.println();
        System.out.println(
                "Login successful. Welcome "
                        + company.getCompanyName()
        );

        companyDashboard(company);
    }


    // =========================================================
    // COMPANY DASHBOARD
    // =========================================================

    private void companyDashboard(
            Company company) {

        while (true) {

            System.out.println();
            System.out.println("==========================================");
            System.out.println("           COMPANY DASHBOARD");
            System.out.println("==========================================");
            System.out.println("1. View Profile");
            System.out.println("2. Update Profile");
            System.out.println("3. Post Job");
            System.out.println("4. View My Jobs");
            System.out.println("5. View Applicants");
            System.out.println("6. Update Application Status");
            System.out.println("7. Logout");

            System.out.print("Enter Choice : ");

            String choice = sc.nextLine();

            switch (choice) {

                case "1":
                    viewProfile(company);
                    break;

                case "2":
                    System.out.println();
                    System.out.println(
                            "Update Profile will be implemented next."
                    );
                    break;

                case "3":
                    postJob(company);
                    break;

                case "4":
                    viewMyJobs(company);
                    break;

                case "5":
                    viewApplicants(company);
                    break;

                case "6":
                    updateApplicationStatus(company);
                    break;

                case "7":

                    SessionManager.logout();

                    System.out.println(
                            "Logged out successfully."
                    );

                    return;

                default:
                    System.out.println(
                            "Invalid Choice!"
                    );
            }
        }
    }


    // =========================================================
    // VIEW COMPANY PROFILE
    // =========================================================

    private void viewProfile(
            Company company) {

        System.out.println();
        System.out.println("===== COMPANY PROFILE =====");

        System.out.println(
                "Company ID   : "
                        + company.getCompanyId()
        );

        System.out.println(
                "Company Name : "
                        + company.getCompanyName()
        );

        System.out.println(
                "Email        : "
                        + company.getEmail()
        );

        System.out.println(
                "Phone        : "
                        + company.getPhone()
        );

        System.out.println(
                "Location     : "
                        + company.getLocation()
        );

        System.out.println(
                "Website      : "
                        + company.getWebsite()
        );
    }


    // =========================================================
    // POST JOB
    // =========================================================

    private void postJob(
            Company company) {

        System.out.println();
        System.out.println("===== POST NEW JOB =====");

        Job job = new Job();

        // Automatically attach logged-in company
        job.setCompanyId(
                company.getCompanyId()
        );


        // -----------------------------------------------------
        // JOB ROLE
        // -----------------------------------------------------

        System.out.print("Job Role : ");

        String role = sc.nextLine();

        if (role.trim().isEmpty()) {

            System.out.println(
                    "Job role cannot be empty."
            );

            return;
        }

        job.setRole(role);


        // -----------------------------------------------------
        // JOB TYPE
        // -----------------------------------------------------

        System.out.print("Job Type : ");

        String jobType = sc.nextLine();

        if (jobType.trim().isEmpty()) {

            System.out.println(
                    "Job type cannot be empty."
            );

            return;
        }

        job.setJobType(jobType);


        // -----------------------------------------------------
        // PACKAGE
        // -----------------------------------------------------

        try {

            System.out.print(
                    "Package (LPA) : "
            );

            double packageLpa =
                    Double.parseDouble(
                            sc.nextLine()
                    );

            if (packageLpa <= 0) {

                System.out.println(
                        "Package must be greater than 0."
                );

                return;
            }

            job.setPackageLpa(packageLpa);

        } catch (NumberFormatException e) {

            System.out.println(
                    "Invalid package. Enter a number."
            );

            return;
        }


        // -----------------------------------------------------
        // REQUIRED CGPA
        // -----------------------------------------------------

        try {

            System.out.print(
                    "Required CGPA : "
            );

            double cgpa =
                    Double.parseDouble(
                            sc.nextLine()
                    );

            if (cgpa < 0 || cgpa > 10) {

                System.out.println(
                        "CGPA must be between 0 and 10."
                );

                return;
            }

            job.setCgpaRequired(cgpa);

        } catch (NumberFormatException e) {

            System.out.println(
                    "Invalid CGPA. Enter a number."
            );

            return;
        }


        // -----------------------------------------------------
        // REQUIRED SKILLS
        // -----------------------------------------------------

        System.out.print(
                "Required Skills (comma separated) : "
        );

        String requiredSkills =
                sc.nextLine();

        if (requiredSkills.trim().isEmpty()) {

            System.out.println(
                    "Required skills cannot be empty."
            );

            return;
        }

        job.setRequiredSkills(
                requiredSkills
        );


        // -----------------------------------------------------
        // VACANCY
        // -----------------------------------------------------

        try {

            System.out.print(
                    "Vacancy : "
            );

            int vacancy =
                    Integer.parseInt(
                            sc.nextLine()
                    );

            if (vacancy <= 0) {

                System.out.println(
                        "Vacancy must be greater than 0."
                );

                return;
            }

            job.setVacancy(vacancy);

        } catch (NumberFormatException e) {

            System.out.println(
                    "Invalid vacancy. Enter a whole number."
            );

            return;
        }


        // -----------------------------------------------------
        // DESCRIPTION
        // -----------------------------------------------------

        System.out.print(
                "Job Description : "
        );

        String description =
                sc.nextLine();

        job.setDescription(description);


        // -----------------------------------------------------
        // SAVE JOB
        // -----------------------------------------------------

        boolean success =
                jobService.postJob(job);

        if (success) {

            System.out.println();
            System.out.println(
                    "Job Posted Successfully!"
            );

        } else {

            System.out.println();
            System.out.println(
                    "Failed to Post Job."
            );
        }
    }


    // =========================================================
    // VIEW MY JOBS
    // =========================================================

    private void viewMyJobs(
            Company company) {

        List<Job> jobs =
                jobService.getJobsByCompany(
                        company.getCompanyId()
                );

        System.out.println();
        System.out.println(
                "===== MY POSTED JOBS ====="
        );

        if (jobs.isEmpty()) {

            System.out.println(
                    "You have not posted any jobs yet."
            );

            return;
        }

        for (Job job : jobs) {

            printJob(job);
        }
    }


    // =========================================================
    // VIEW APPLICANTS
    // =========================================================

    private void viewApplicants(
            Company company) {

        List<Application> applications =
                applicationService.getApplicantsByCompany(
                        company.getCompanyId()
                );

        System.out.println();
        System.out.println("===== APPLICANTS =====");

        if (applications.isEmpty()) {

            System.out.println(
                    "No students have applied for your jobs yet."
            );

            return;
        }

        for (Application application :
                applications) {

            System.out.println();
            System.out.println(
                    "------------------------------------------"
            );

            System.out.println(
                    "Application ID : "
                            + application.getApplicationId()
            );

            System.out.println(
                    "Job Role       : "
                            + application.getJobRole()
            );

            System.out.println(
                    "Student ID     : "
                            + application.getStudentId()
            );

            System.out.println(
                    "Student Name   : "
                            + application.getStudentName()
            );

            System.out.println(
                    "Email          : "
                            + application.getStudentEmail()
            );

            System.out.println(
                    "Phone          : "
                            + application.getStudentPhone()
            );

            System.out.println(
                    "Department     : "
                            + application.getStudentDepartment()
            );

            System.out.println(
                    "CGPA           : "
                            + application.getStudentCgpa()
            );

            System.out.println(
                    "Applied Date   : "
                            + application.getAppliedDate()
            );

            System.out.println(
                    "Status         : "
                            + application.getStatus()
            );

            System.out.println(
                    "------------------------------------------"
            );
        }
    }


    // =========================================================
    // UPDATE APPLICATION STATUS
    // =========================================================

    private void updateApplicationStatus(
            Company company) {

        System.out.println();
        System.out.println(
                "===== UPDATE APPLICATION STATUS ====="
        );

        System.out.print(
                "Enter Application ID : "
        );

        int applicationId;

        try {

            applicationId =
                    Integer.parseInt(
                            sc.nextLine()
                    );

        } catch (NumberFormatException e) {

            System.out.println(
                    "Invalid Application ID."
            );

            return;
        }

        System.out.println();
        System.out.println("1. Shortlist");
        System.out.println("2. Reject");
        System.out.println("3. Select");

        System.out.print(
                "Enter Choice : "
        );

        String choice = sc.nextLine();

        String status;

        switch (choice) {

            case "1":
                status = "Shortlisted";
                break;

            case "2":
                status = "Rejected";
                break;

            case "3":
                status = "Selected";
                break;

            default:

                System.out.println(
                        "Invalid choice."
                );

                return;
        }

        boolean success =
                applicationService.updateStatus(
                        applicationId,
                        status,
                        company.getCompanyId()
                );

        if (success) {

            System.out.println();
            System.out.println(
                    "Application status updated to "
                            + status
            );

        } else {

            System.out.println();
            System.out.println(
                    "Unable to update application status."
            );

            System.out.println(
                    "Check the Application ID or ensure "
                            + "the application belongs to your company."
            );
        }
    }


    // =========================================================
    // PRINT JOB DETAILS
    // =========================================================

    private void printJob(Job job) {

        System.out.println();
        System.out.println(
                "------------------------------------------"
        );

        System.out.println(
                "Job ID          : "
                        + job.getJobId()
        );

        System.out.println(
                "Role            : "
                        + job.getRole()
        );

        System.out.println(
                "Job Type        : "
                        + job.getJobType()
        );

        System.out.println(
                "Package         : "
                        + job.getPackageLpa()
                        + " LPA"
        );

        System.out.println(
                "Required CGPA   : "
                        + job.getCgpaRequired()
        );

        System.out.println(
                "Required Skills : "
                        + job.getRequiredSkills()
        );

        System.out.println(
                "Vacancy         : "
                        + job.getVacancy()
        );

        System.out.println(
                "Description     : "
                        + job.getDescription()
        );

        System.out.println(
                "------------------------------------------"
        );
    }
}