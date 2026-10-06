package menu;

import auth.SessionManager;
import model.Application;
import model.Job;
import model.Student;
import service.ApplicationService;
import service.JobService;
import service.PlacementService;
import service.StudentService;

import java.util.List;
import java.util.Scanner;

public class StudentMenu {

    private final Scanner sc;
    private final StudentService studentService;
    private final JobService jobService;
    private final ApplicationService applicationService;
    private final PlacementService placementService;


    // =========================================================
    // CONSTRUCTOR
    // =========================================================

    public StudentMenu(Scanner sc) {

        this.sc = sc;
        this.studentService = new StudentService();
        this.jobService = new JobService();
        this.applicationService = new ApplicationService();
        this.placementService = new PlacementService();
    }


    // =========================================================
    // STUDENT MENU
    // =========================================================

    public void show() {

        while (true) {

            System.out.println();
            System.out.println("==========================================");
            System.out.println("              STUDENT MENU");
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
                    System.out.println(
                            "Invalid Choice!"
                    );
            }
        }
    }


    // =========================================================
    // STUDENT REGISTRATION
    // =========================================================

    private void register() {

        System.out.println();
        System.out.println("===== STUDENT REGISTRATION =====");

        Student student = new Student();

        System.out.print("Name : ");
        student.setName(sc.nextLine());

        System.out.print("Email : ");
        student.setEmail(sc.nextLine());

        System.out.print("Phone : ");
        student.setPhone(sc.nextLine());

        System.out.print("Gender : ");
        student.setGender(sc.nextLine());

        System.out.print("Department : ");
        student.setDepartment(sc.nextLine());


        // Year of Study
        try {

            System.out.print("Year of Study (1-4) : ");

            int year =
                    Integer.parseInt(
                            sc.nextLine()
                    );

            if (year < 1 || year > 4) {

                System.out.println(
                        "Year of Study must be between 1 and 4."
                );

                return;
            }

            student.setYearOfStudy(year);

        } catch (NumberFormatException e) {

            System.out.println(
                    "Year of Study must be a number."
            );

            return;
        }


        // CGPA
        try {

            System.out.print("CGPA : ");

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

            student.setCgpa(cgpa);

        } catch (NumberFormatException e) {

            System.out.println(
                    "CGPA must be a number."
            );

            return;
        }


        // Student Skills
        System.out.print(
                "Skills (comma separated) : "
        );

        student.setSkills(
                sc.nextLine()
        );


        // Password
        System.out.print("Password : ");
        student.setPassword(sc.nextLine());


        boolean success =
                studentService.register(student);


        if (success) {

            System.out.println();
            System.out.println(
                    "Student registered successfully."
            );

        } else {

            System.out.println();
            System.out.println(
                    "Registration failed."
            );
        }
    }


    // =========================================================
    // STUDENT LOGIN
    // =========================================================

    private void login() {

        System.out.println();
        System.out.println("===== STUDENT LOGIN =====");

        System.out.print("Email : ");
        String email = sc.nextLine();

        System.out.print("Password : ");
        String password = sc.nextLine();


        Student student =
                studentService.login(
                        email,
                        password
                );


        if (student == null) {

            System.out.println();
            System.out.println(
                    "Invalid email or password."
            );

            return;
        }


        SessionManager.login(
                student,
                "STUDENT"
        );


        System.out.println();
        System.out.println(
                "Login successful. Welcome "
                        + student.getName()
        );


        studentDashboard(student);
    }


    // =========================================================
    // STUDENT DASHBOARD
    // =========================================================

    private void studentDashboard(
            Student student) {

        while (true) {

            System.out.println();
            System.out.println("==========================================");
            System.out.println("             STUDENT DASHBOARD");
            System.out.println("==========================================");
            System.out.println("1. View Profile");
            System.out.println("2. Update Profile");
            System.out.println("3. View Available Jobs");
            System.out.println("4. Apply for Job");
            System.out.println("5. View My Applications");
            System.out.println("6. Logout");

            System.out.print("Enter Choice : ");

            String choice = sc.nextLine();


            switch (choice) {

                case "1":

                    viewProfile(student);
                    break;


                case "2":

                    updateProfile(student);
                    break;


                case "3":

                    viewAvailableJobs();
                    break;


                case "4":

                    applyForJob(student);
                    break;


                case "5":

                    viewMyApplications(student);
                    break;


                case "6":

                    SessionManager.logout();

                    System.out.println();
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
    // VIEW STUDENT PROFILE
    // =========================================================

    private void viewProfile(Student student) {

        System.out.println();
        System.out.println("===== STUDENT PROFILE =====");

        System.out.println(
                "Student ID : "
                        + student.getStudentId()
        );

        System.out.println(
                "Name       : "
                        + student.getName()
        );

        System.out.println(
                "Email      : "
                        + student.getEmail()
        );

        System.out.println(
                "Phone      : "
                        + student.getPhone()
        );

        System.out.println(
                "Gender     : "
                        + student.getGender()
        );

        System.out.println(
                "Department : "
                        + student.getDepartment()
        );

        System.out.println(
                "Year       : "
                        + student.getYearOfStudy()
        );

        System.out.println(
                "CGPA       : "
                        + student.getCgpa()
        );

        System.out.println(
                "Skills     : "
                        + student.getSkills()
        );
    }


    // =========================================================
    // UPDATE STUDENT PROFILE
    // =========================================================

    private void updateProfile(
            Student student) {

        System.out.println();
        System.out.println("===== UPDATE PROFILE =====");

        System.out.print(
                "Name [" + student.getName() + "] : "
        );

        String name = sc.nextLine();

        if (!name.trim().isEmpty()) {
            student.setName(name);
        }


        System.out.print(
                "Phone [" + student.getPhone() + "] : "
        );

        String phone = sc.nextLine();

        if (!phone.trim().isEmpty()) {
            student.setPhone(phone);
        }


        System.out.print(
                "Gender [" + student.getGender() + "] : "
        );

        String gender = sc.nextLine();

        if (!gender.trim().isEmpty()) {
            student.setGender(gender);
        }


        System.out.print(
                "Department [" + student.getDepartment() + "] : "
        );

        String department = sc.nextLine();

        if (!department.trim().isEmpty()) {
            student.setDepartment(department);
        }


        // Year
        System.out.print(
                "Year of Study [" +
                        student.getYearOfStudy() +
                        "] : "
        );

        String yearInput = sc.nextLine();

        if (!yearInput.trim().isEmpty()) {

            try {

                int year =
                        Integer.parseInt(yearInput);

                if (year < 1 || year > 4) {

                    System.out.println(
                            "Year must be between 1 and 4."
                    );

                    return;
                }

                student.setYearOfStudy(year);

            } catch (NumberFormatException e) {

                System.out.println(
                        "Invalid year."
                );

                return;
            }
        }


        // CGPA
        System.out.print(
                "CGPA [" +
                        student.getCgpa() +
                        "] : "
        );

        String cgpaInput = sc.nextLine();

        if (!cgpaInput.trim().isEmpty()) {

            try {

                double cgpa =
                        Double.parseDouble(
                                cgpaInput
                        );

                if (cgpa < 0 || cgpa > 10) {

                    System.out.println(
                            "CGPA must be between 0 and 10."
                    );

                    return;
                }

                student.setCgpa(cgpa);

            } catch (NumberFormatException e) {

                System.out.println(
                        "Invalid CGPA."
                );

                return;
            }
        }


        // Skills
        System.out.print(
                "Skills [" +
                        student.getSkills() +
                        "] : "
        );

        String skills = sc.nextLine();

        if (!skills.trim().isEmpty()) {
            student.setSkills(skills);
        }


        boolean success =
                studentService.updateProfile(
                        student
                );


        if (success) {

            System.out.println();
            System.out.println(
                    "Profile updated successfully."
            );

        } else {

            System.out.println();
            System.out.println(
                    "Profile update failed."
            );
        }
    }


    // =========================================================
    // VIEW AVAILABLE JOBS
    // =========================================================

    private void viewAvailableJobs() {

        List<Job> jobs =
                jobService.getAllJobs();


        System.out.println();
        System.out.println("===== AVAILABLE JOBS =====");


        if (jobs.isEmpty()) {

            System.out.println(
                    "No jobs are currently available."
            );

            return;
        }


        for (Job job : jobs) {

            printJob(job);
        }
    }


    // =========================================================
    // APPLY FOR JOB
    // =========================================================

    private void applyForJob(
            Student student) {

        List<Job> jobs =
                jobService.getAllJobs();


        if (jobs.isEmpty()) {

            System.out.println();
            System.out.println(
                    "No jobs are currently available."
            );

            return;
        }


        System.out.println();
        System.out.println("===== AVAILABLE JOBS =====");


        for (Job job : jobs) {

            printJob(job);
        }


        System.out.print(
                "\nEnter Job ID to Apply : "
        );


        int jobId;

        try {

            jobId =
                    Integer.parseInt(
                            sc.nextLine()
                    );

        } catch (NumberFormatException e) {

            System.out.println(
                    "Invalid Job ID."
            );

            return;
        }


        // Find selected job

        Job selectedJob = null;

        for (Job job : jobs) {

            if (job.getJobId() == jobId) {

                selectedJob = job;
                break;
            }
        }


        if (selectedJob == null) {

            System.out.println(
                    "Job not found."
            );

            return;
        }


        // Vacancy check

        if (selectedJob.getVacancy() <= 0) {

            System.out.println(
                    "This job currently has no vacancies."
            );

            return;
        }


        // CGPA + Skills eligibility check

        if (!placementService.checkEligibility(
                student,
                selectedJob)) {

            return;
        }


        // Submit application

        boolean success =
                applicationService.applyForJob(
                        student.getStudentId(),
                        selectedJob.getJobId()
                );


        if (success) {

            System.out.println();
            System.out.println(
                    "Application submitted successfully!"
            );

        } else {

            System.out.println();
            System.out.println(
                    "Application failed."
            );
        }
    }


    // =========================================================
    // PRINT JOB DETAILS
    // =========================================================

    private void printJob(Job job) {

        System.out.println();
        System.out.println("------------------------------------------");

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

        System.out.println("------------------------------------------");
    }


    // =========================================================
    // VIEW MY APPLICATIONS
    // =========================================================

    private void viewMyApplications(
            Student student) {

        List<Application> applications =
                applicationService.getMyApplications(
                        student.getStudentId()
                );


        System.out.println();
        System.out.println("===== MY APPLICATIONS =====");


        if (applications.isEmpty()) {

            System.out.println(
                    "You have not applied for any jobs yet."
            );

            return;
        }


        for (Application application :
                applications) {

            System.out.println();
            System.out.println("------------------------------------------");

            System.out.println(
                    "Application ID : "
                            + application.getApplicationId()
            );

            System.out.println(
                    "Job ID         : "
                            + application.getJobId()
            );

            System.out.println(
                    "Applied Date   : "
                            + application.getAppliedDate()
            );

            System.out.println(
                    "Status         : "
                            + application.getStatus()
            );

            System.out.println("------------------------------------------");
        }
    }
}