package model;

public class Application {

    // ================= APPLICATION DETAILS =================

    private int applicationId;
    private int studentId;
    private int jobId;
    private String appliedDate;
    private String status;


    // ================= STUDENT DETAILS =================

    /*
     * These fields are used when the company
     * views applicants.
     */
    private String studentName;
    private String studentEmail;
    private String studentPhone;
    private String studentDepartment;
    private double studentCgpa;


    // ================= JOB DETAILS =================

    /*
     * Used to display the job role
     * along with applicant information.
     */
    private String jobRole;


    // ================= CONSTRUCTOR =================

    public Application() {
    }


    // ================= APPLICATION ID =================

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }


    // ================= STUDENT ID =================

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }


    // ================= JOB ID =================

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }


    // ================= APPLIED DATE =================

    public String getAppliedDate() {
        return appliedDate;
    }

    public void setAppliedDate(String appliedDate) {
        this.appliedDate = appliedDate;
    }


    // ================= STATUS =================

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    // ================= STUDENT NAME =================

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }


    // ================= STUDENT EMAIL =================

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }


    // ================= STUDENT PHONE =================

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }


    // ================= STUDENT DEPARTMENT =================

    public String getStudentDepartment() {
        return studentDepartment;
    }

    public void setStudentDepartment(String studentDepartment) {
        this.studentDepartment = studentDepartment;
    }


    // ================= STUDENT CGPA =================

    public double getStudentCgpa() {
        return studentCgpa;
    }

    public void setStudentCgpa(double studentCgpa) {
        this.studentCgpa = studentCgpa;
    }


    // ================= JOB ROLE =================

    public String getJobRole() {
        return jobRole;
    }

    public void setJobRole(String jobRole) {
        this.jobRole = jobRole;
    }
}