package model;

public class Job {

    private int jobId;
    private int companyId;

    private String role;
    private String jobType;

    private double packageLpa;
    private double cgpaRequired;

    private int vacancy;
    private String description;

    // New field for required skills
    private String requiredSkills;


    // =========================================================
    // DEFAULT CONSTRUCTOR
    // =========================================================

    public Job() {
    }


    // =========================================================
    // JOB ID
    // =========================================================

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }


    // =========================================================
    // COMPANY ID
    // =========================================================

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }


    // =========================================================
    // ROLE
    // =========================================================

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    // =========================================================
    // JOB TYPE
    // =========================================================

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }


    // =========================================================
    // PACKAGE
    // =========================================================

    public double getPackageLpa() {
        return packageLpa;
    }

    public void setPackageLpa(double packageLpa) {
        this.packageLpa = packageLpa;
    }


    // =========================================================
    // REQUIRED CGPA
    // =========================================================

    public double getCgpaRequired() {
        return cgpaRequired;
    }

    public void setCgpaRequired(double cgpaRequired) {
        this.cgpaRequired = cgpaRequired;
    }


    // =========================================================
    // VACANCY
    // =========================================================

    public int getVacancy() {
        return vacancy;
    }

    public void setVacancy(int vacancy) {
        this.vacancy = vacancy;
    }


    // =========================================================
    // DESCRIPTION
    // =========================================================

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    // =========================================================
    // REQUIRED SKILLS
    // =========================================================

    public String getRequiredSkills() {
        return requiredSkills;
    }

    public void setRequiredSkills(String requiredSkills) {
        this.requiredSkills = requiredSkills;
    }
}