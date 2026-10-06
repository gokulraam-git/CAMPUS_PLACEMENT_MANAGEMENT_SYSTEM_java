package dao;

import model.Application;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    // =========================================================
    // SAVE APPLICATION
    // =========================================================

    public boolean save(Application application) {

        String sql =
                "INSERT INTO application " +
                        "(student_id, job_id, applied_date, status) " +
                        "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, application.getStudentId());
            pst.setInt(2, application.getJobId());
            pst.setString(3, application.getAppliedDate());
            pst.setString(4, application.getStatus());

            return pst.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Unable to save application: "
                            + e.getMessage()
            );

            return false;
        }
    }


    // =========================================================
    // CHECK DUPLICATE APPLICATION
    // =========================================================

    public boolean alreadyApplied(
            int studentId,
            int jobId) {

        String sql =
                "SELECT application_id " +
                        "FROM application " +
                        "WHERE student_id = ? " +
                        "AND job_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, studentId);
            pst.setInt(2, jobId);

            try (ResultSet rs = pst.executeQuery()) {

                return rs.next();
            }

        } catch (Exception e) {

            System.out.println(
                    "Unable to check application: "
                            + e.getMessage()
            );

            return false;
        }
    }


    // =========================================================
    // GET APPLICATIONS OF A STUDENT
    // =========================================================

    public List<Application> getApplicationsByStudent(
            int studentId) {

        List<Application> applications =
                new ArrayList<>();

        String sql =
                "SELECT application_id, student_id, job_id, " +
                        "applied_date, status " +
                        "FROM application " +
                        "WHERE student_id = ? " +
                        "ORDER BY application_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, studentId);

            try (ResultSet rs = pst.executeQuery()) {

                while (rs.next()) {

                    Application application =
                            new Application();

                    application.setApplicationId(
                            rs.getInt("application_id")
                    );

                    application.setStudentId(
                            rs.getInt("student_id")
                    );

                    application.setJobId(
                            rs.getInt("job_id")
                    );

                    application.setAppliedDate(
                            rs.getString("applied_date")
                    );

                    application.setStatus(
                            rs.getString("status")
                    );

                    applications.add(application);
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Unable to get applications: "
                            + e.getMessage()
            );
        }

        return applications;
    }


    // =========================================================
    // GET ALL APPLICANTS FOR A COMPANY
    // =========================================================

    public List<Application> getApplicantsByCompany(
            int companyId) {

        List<Application> applications =
                new ArrayList<>();

        String sql =
                "SELECT " +
                        "a.application_id, " +
                        "a.student_id, " +
                        "a.job_id, " +
                        "a.applied_date, " +
                        "a.status, " +
                        "s.name, " +
                        "s.email, " +
                        "s.phone, " +
                        "s.department, " +
                        "s.cgpa, " +
                        "j.role " +

                        "FROM application a " +

                        "INNER JOIN student s " +
                        "ON a.student_id = s.student_id " +

                        "INNER JOIN job j " +
                        "ON a.job_id = j.job_id " +

                        "WHERE j.company_id = ? " +

                        "ORDER BY a.application_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, companyId);

            try (ResultSet rs = pst.executeQuery()) {

                while (rs.next()) {

                    Application application =
                            new Application();

                    // Application information

                    application.setApplicationId(
                            rs.getInt("application_id")
                    );

                    application.setStudentId(
                            rs.getInt("student_id")
                    );

                    application.setJobId(
                            rs.getInt("job_id")
                    );

                    application.setAppliedDate(
                            rs.getString("applied_date")
                    );

                    application.setStatus(
                            rs.getString("status")
                    );


                    // Student information

                    application.setStudentName(
                            rs.getString("name")
                    );

                    application.setStudentEmail(
                            rs.getString("email")
                    );

                    application.setStudentPhone(
                            rs.getString("phone")
                    );

                    application.setStudentDepartment(
                            rs.getString("department")
                    );

                    application.setStudentCgpa(
                            rs.getDouble("cgpa")
                    );


                    // Job information

                    application.setJobRole(
                            rs.getString("role")
                    );

                    applications.add(application);
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Unable to get applicants: "
                            + e.getMessage()
            );
        }

        return applications;
    }


    // =========================================================
    // UPDATE APPLICATION STATUS
    // =========================================================

    public boolean updateStatus(
            int applicationId,
            String status,
            int companyId) {

        // Only allow valid application statuses

        if (!status.equals("Shortlisted")
                && !status.equals("Rejected")
                && !status.equals("Selected")) {

            System.out.println(
                    "Invalid application status."
            );

            return false;
        }

        String sql =
                "UPDATE application a " +
                        "INNER JOIN job j " +
                        "ON a.job_id = j.job_id " +
                        "SET a.status = ? " +
                        "WHERE a.application_id = ? " +
                        "AND j.company_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, status);
            pst.setInt(2, applicationId);
            pst.setInt(3, companyId);

            return pst.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Unable to update application status: "
                            + e.getMessage()
            );

            return false;
        }
    }
}