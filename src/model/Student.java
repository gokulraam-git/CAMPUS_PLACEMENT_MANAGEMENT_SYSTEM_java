package model;

public class Student {

    private int studentId;
    private String name;
    private String email;
    private String phone;
    private String gender;
    private String department;
    private int yearOfStudy;
    private double cgpa;
    private String skills;
    private String password;


    // =========================================================
    // DEFAULT CONSTRUCTOR
    // =========================================================

    public Student() {
    }


    // =========================================================
    // CONSTRUCTOR
    // =========================================================

    public Student(String name, String email,
                   String phone, String gender,
                   String department, int yearOfStudy,
                   double cgpa, String skills,
                   String password) {

        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.department = department;
        this.yearOfStudy = yearOfStudy;
        this.cgpa = cgpa;
        this.skills = skills;
        this.password = password;
    }


    // =========================================================
    // STUDENT ID
    // =========================================================

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }


    // =========================================================
    // NAME
    // =========================================================

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    // =========================================================
    // EMAIL
    // =========================================================

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    // =========================================================
    // PHONE
    // =========================================================

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    // =========================================================
    // GENDER
    // =========================================================

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    // =========================================================
    // DEPARTMENT
    // =========================================================

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }


    // =========================================================
    // YEAR OF STUDY
    // =========================================================

    public int getYearOfStudy() {
        return yearOfStudy;
    }

    public void setYearOfStudy(int yearOfStudy) {
        this.yearOfStudy = yearOfStudy;
    }


    // =========================================================
    // CGPA
    // =========================================================

    public double getCgpa() {
        return cgpa;
    }

    public void setCgpa(double cgpa) {
        this.cgpa = cgpa;
    }


    // =========================================================
    // SKILLS
    // =========================================================

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }


    // =========================================================
    // PASSWORD
    // =========================================================

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}