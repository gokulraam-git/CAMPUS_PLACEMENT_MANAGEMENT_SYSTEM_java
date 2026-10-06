package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Company;
import service.ApplicationService;

import java.io.IOException;

@WebServlet("/update-application-status")
public class UpdateApplicationStatusServlet extends HttpServlet {

    private final ApplicationService applicationService =
            new ApplicationService();

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

        String applicationIdStr =
                request.getParameter("applicationId");

        String status =
                request.getParameter("status");


        // =====================================================
        // VALIDATE INPUT
        // =====================================================

        int applicationId;

        try {

            applicationId =
                    Integer.parseInt(applicationIdStr);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/company/applicants.jsp"
            );

            return;
        }


        if (status == null ||
                status.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/company/applicants.jsp"
            );

            return;
        }


        // =====================================================
        // UPDATE STATUS
        // =====================================================

        boolean success =
                applicationService.updateStatus(
                        applicationId,
                        status,
                        company.getCompanyId()
                );


        // =====================================================
        // RESULT
        // =====================================================

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/company/applicants.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Unable to update application status."
            );

            request.getRequestDispatcher(
                    "/company/applicants.jsp"
            ).forward(
                    request,
                    response
            );
        }
    }
}