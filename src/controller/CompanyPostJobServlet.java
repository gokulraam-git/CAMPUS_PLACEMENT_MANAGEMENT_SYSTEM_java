package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Company;
import model.Job;
import service.JobService;

import java.io.IOException;

@WebServlet("/company-post-job")
public class CompanyPostJobServlet extends HttpServlet {

    private final JobService jobService =
            new JobService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // =====================================================
        // CHECK COMPANY LOGIN
        // =====================================================

        HttpSession session =
                request.getSession(false);

        if (session == null ||
                session.getAttribute("company") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/company/login.jsp"
            );

            return;
        }

        Company company =
                (Company) session.getAttribute("company");


        // =====================================================
        // GET FORM DATA
        // =====================================================

        String role =
                request.getParameter("role");

        String jobType =
                request.getParameter("jobType");

        String packageLpaStr =
                request.getParameter("packageLpa");

        String cgpaRequiredStr =
                request.getParameter("cgpaRequired");

        String vacancyStr =
                request.getParameter("vacancy");

        String description =
                request.getParameter("description");

        String requiredSkills =
                request.getParameter("requiredSkills");


        // =====================================================
        // CONVERT NUMERIC VALUES
        // =====================================================

        double packageLpa;
        double cgpaRequired;
        int vacancy;

        try {

            packageLpa =
                    Double.parseDouble(packageLpaStr);

            cgpaRequired =
                    Double.parseDouble(cgpaRequiredStr);

            vacancy =
                    Integer.parseInt(vacancyStr);

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "errorMessage",
                    "Package, CGPA and vacancy must contain valid numbers."
            );

            request.getRequestDispatcher(
                    "/company/post-job.jsp"
            ).forward(request, response);

            return;
        }


        // =====================================================
        // CREATE JOB OBJECT
        // =====================================================

        Job job =
                new Job();

        job.setCompanyId(
                company.getCompanyId()
        );

        job.setRole(role);

        job.setJobType(jobType);

        job.setPackageLpa(
                packageLpa
        );

        job.setCgpaRequired(
                cgpaRequired
        );

        job.setVacancy(
                vacancy
        );

        job.setDescription(
                description
        );

        job.setRequiredSkills(
                requiredSkills
        );


        // =====================================================
        // SAVE JOB
        // =====================================================

        boolean success =
                jobService.postJob(job);


        // =====================================================
        // RESULT
        // =====================================================

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/company/jobs.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Unable to post the job. Please check the details and try again."
            );

            request.getRequestDispatcher(
                    "/company/post-job.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}