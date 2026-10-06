package dao;

import model.Job;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JobDAO {

    // =========================================================
    // SAVE JOB
    // =========================================================

    public boolean save(Job job) {

        String sql =
                "INSERT INTO job " +
                        "(company_id, role, job_type, package_lpa, " +
                        "cgpa_required, vacancy, description, required_skills) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst =
                     con.prepareStatement(sql)) {

            pst.setInt(1, job.getCompanyId());
            pst.setString(2, job.getRole());
            pst.setString(3, job.getJobType());
            pst.setDouble(4, job.getPackageLpa());
            pst.setDouble(5, job.getCgpaRequired());
            pst.setInt(6, job.getVacancy());
            pst.setString(7, job.getDescription());
            pst.setString(8, job.getRequiredSkills());

            return pst.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Unable to save job: "
                            + e.getMessage()
            );

            return false;
        }
    }


    // =========================================================
    // GET ALL JOBS
    // =========================================================

    public List<Job> getAllJobs() {

        List<Job> jobs = new ArrayList<>();

        String sql =
                "SELECT job_id, company_id, role, job_type, " +
                        "package_lpa, cgpa_required, vacancy, " +
                        "description, required_skills " +
                        "FROM job " +
                        "ORDER BY job_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst =
                     con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {

                Job job =
                        createJobFromResultSet(rs);

                jobs.add(job);
            }

        } catch (Exception e) {

            System.out.println(
                    "Unable to get jobs: "
                            + e.getMessage()
            );
        }

        return jobs;
    }


    // =========================================================
    // GET JOBS BY COMPANY
    // =========================================================

    public List<Job> getJobsByCompany(
            int companyId) {

        List<Job> jobs = new ArrayList<>();

        String sql =
                "SELECT job_id, company_id, role, job_type, " +
                        "package_lpa, cgpa_required, vacancy, " +
                        "description, required_skills " +
                        "FROM job " +
                        "WHERE company_id = ? " +
                        "ORDER BY job_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst =
                     con.prepareStatement(sql)) {

            pst.setInt(1, companyId);

            try (ResultSet rs = pst.executeQuery()) {

                while (rs.next()) {

                    Job job =
                            createJobFromResultSet(rs);

                    jobs.add(job);
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Unable to get company jobs: "
                            + e.getMessage()
            );
        }

        return jobs;
    }


    // =========================================================
    // CREATE JOB OBJECT FROM RESULT SET
    // =========================================================

    private Job createJobFromResultSet(
            ResultSet rs) throws Exception {

        Job job = new Job();

        job.setJobId(
                rs.getInt("job_id")
        );

        job.setCompanyId(
                rs.getInt("company_id")
        );

        job.setRole(
                rs.getString("role")
        );

        job.setJobType(
                rs.getString("job_type")
        );

        job.setPackageLpa(
                rs.getDouble("package_lpa")
        );

        job.setCgpaRequired(
                rs.getDouble("cgpa_required")
        );

        job.setVacancy(
                rs.getInt("vacancy")
        );

        job.setDescription(
                rs.getString("description")
        );

        job.setRequiredSkills(
                rs.getString("required_skills")
        );

        return job;
    }
}