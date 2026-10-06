package service;

import dao.ApplicationDAO;
import model.Application;

import java.time.LocalDate;
import java.util.List;

public class ApplicationService {

    private final ApplicationDAO applicationDAO;

    public ApplicationService() {
        this.applicationDAO = new ApplicationDAO();
    }

    // =========================================================
    // STUDENT - APPLY FOR JOB
    // =========================================================

    public boolean applyForJob(
            int studentId,
            int jobId) {

        // Check duplicate application

        if (applicationDAO.alreadyApplied(
                studentId,
                jobId)) {

            System.out.println(
                    "You have already applied for this job."
            );

            return false;
        }

        Application application =
                new Application();

        application.setStudentId(studentId);
        application.setJobId(jobId);

        application.setAppliedDate(
                LocalDate.now().toString()
        );

        application.setStatus("Applied");

        return applicationDAO.save(application);
    }


    // =========================================================
    // STUDENT - VIEW MY APPLICATIONS
    // =========================================================

    public List<Application> getMyApplications(
            int studentId) {

        return applicationDAO
                .getApplicationsByStudent(studentId);
    }


    // =========================================================
    // COMPANY - VIEW APPLICANTS
    // =========================================================

    public List<Application> getApplicantsByCompany(
            int companyId) {

        return applicationDAO
                .getApplicantsByCompany(companyId);
    }


    // =========================================================
    // COMPANY - UPDATE APPLICATION STATUS
    // =========================================================

    public boolean updateStatus(
            int applicationId,
            String status,
            int companyId) {

        return applicationDAO.updateStatus(
                applicationId,
                status,
                companyId
        );
    }
}
