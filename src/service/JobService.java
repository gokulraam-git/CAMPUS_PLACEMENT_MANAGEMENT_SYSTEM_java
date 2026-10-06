package service;

import dao.JobDAO;
import model.Job;

import java.util.List;

public class JobService {

    private final JobDAO jobDAO;

    public JobService() {
        this.jobDAO = new JobDAO();
    }

    // =========================================================
    // POST JOB
    // =========================================================

    public boolean postJob(Job job) {

        if (job == null) {

            System.out.println(
                    "Job details cannot be null."
            );

            return false;
        }

        // Role validation
        if (job.getRole() == null ||
                job.getRole().trim().isEmpty()) {

            System.out.println(
                    "Job role cannot be empty."
            );

            return false;
        }

        // Job type validation
        if (job.getJobType() == null ||
                job.getJobType().trim().isEmpty()) {

            System.out.println(
                    "Job type cannot be empty."
            );

            return false;
        }

        // Package validation
        if (job.getPackageLpa() <= 0) {

            System.out.println(
                    "Package must be greater than 0."
            );

            return false;
        }

        // CGPA validation
        if (job.getCgpaRequired() < 0 ||
                job.getCgpaRequired() > 10) {

            System.out.println(
                    "Required CGPA must be between 0 and 10."
            );

            return false;
        }

        // Vacancy validation
        if (job.getVacancy() <= 0) {

            System.out.println(
                    "Vacancy must be greater than 0."
            );

            return false;
        }

        // Company validation
        if (job.getCompanyId() <= 0) {

            System.out.println(
                    "Invalid company."
            );

            return false;
        }

        return jobDAO.save(job);
    }


    // =========================================================
    // GET ALL AVAILABLE JOBS
    // =========================================================

    public List<Job> getAllJobs() {

        return jobDAO.getAllJobs();
    }


    // =========================================================
    // GET JOBS POSTED BY A COMPANY
    // =========================================================

    public List<Job> getJobsByCompany(
            int companyId) {

        if (companyId <= 0) {

            System.out.println(
                    "Invalid company ID."
            );

            return List.of();
        }

        return jobDAO.getJobsByCompany(companyId);
    }
}