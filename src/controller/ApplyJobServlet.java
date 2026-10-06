package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Job;
import model.Student;
import service.ApplicationService;
import service.JobService;
import service.PlacementService;

import java.io.IOException;
import java.util.List;

@WebServlet("/apply-job")
public class ApplyJobServlet extends HttpServlet {

    private final ApplicationService applicationService =
            new ApplicationService();

    private final JobService jobService =
            new JobService();

    private final PlacementService placementService =
            new PlacementService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check student login
        if (session == null ||
                session.getAttribute("student") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/student/login.jsp"
            );

            return;
        }

        Student student =
                (Student) session.getAttribute("student");

        // Get Job ID
        String jobIdParam =
                request.getParameter("jobId");

        if (jobIdParam == null ||
                jobIdParam.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/student/jobs.jsp"
            );

            return;
        }

        int jobId;

        try {

            jobId = Integer.parseInt(jobIdParam);

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "errorMessage",
                    "Invalid job ID."
            );

            request.getRequestDispatcher(
                    "/student/jobs.jsp"
            ).forward(request, response);

            return;
        }

        // Get all available jobs
        List<Job> jobs = jobService.getAllJobs();

        Job selectedJob = null;

        // Find selected job
        for (Job job : jobs) {

            if (job.getJobId() == jobId) {

                selectedJob = job;
                break;
            }
        }

        // Job not found
        if (selectedJob == null) {

            request.setAttribute(
                    "errorMessage",
                    "Job not found."
            );

            request.getRequestDispatcher(
                    "/student/jobs.jsp"
            ).forward(request, response);

            return;
        }

        // Check vacancy
        if (selectedJob.getVacancy() <= 0) {

            request.setAttribute(
                    "errorMessage",
                    "This job currently has no vacancies."
            );

            request.getRequestDispatcher(
                    "/student/jobs.jsp"
            ).forward(request, response);

            return;
        }

        // Check eligibility using CGPA + Skills
        if (!placementService.checkEligibility(
                student,
                selectedJob)) {

            request.setAttribute(
                    "errorMessage",
                    "You are not eligible for this job based on the required CGPA or skills."
            );

            request.getRequestDispatcher(
                    "/student/jobs.jsp"
            ).forward(request, response);

            return;
        }

        // Apply for job
        boolean success =
                applicationService.applyForJob(
                        student.getStudentId(),
                        selectedJob.getJobId()
                );

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/student/applications.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Unable to apply. You may have already applied for this job."
            );

            request.getRequestDispatcher(
                    "/student/jobs.jsp"
            ).forward(request, response);
        }
    }
}