package service;

import model.Job;
import model.Student;

import java.util.ArrayList;
import java.util.List;

public class PlacementService {

    // =========================================================
    // CHECK STUDENT ELIGIBILITY
    // CGPA + SKILLS
    // =========================================================

    public boolean checkEligibility(
            Student student,
            Job job) {

        if (student == null) {

            System.out.println(
                    "Student information not available."
            );

            return false;
        }

        if (job == null) {

            System.out.println(
                    "Job information not available."
            );

            return false;
        }


        // =====================================================
        // 1. CGPA CHECK
        // =====================================================

        if (student.getCgpa() < job.getCgpaRequired()) {

            System.out.println();
            System.out.println(
                    "NOT ELIGIBLE"
            );

            System.out.println(
                    "Reason: Your CGPA is below the required CGPA."
            );

            System.out.println(
                    "Your CGPA     : "
                            + student.getCgpa()
            );

            System.out.println(
                    "Required CGPA : "
                            + job.getCgpaRequired()
            );

            return false;
        }


        // =====================================================
        // 2. SKILLS CHECK
        // =====================================================

        String requiredSkills =
                job.getRequiredSkills();

        // If company has not specified skills,
        // CGPA eligibility is enough.

        if (requiredSkills == null ||
                requiredSkills.trim().isEmpty()) {

            System.out.println();
            System.out.println(
                    "Eligible based on CGPA."
            );

            return true;
        }


        String studentSkills =
                student.getSkills();

        if (studentSkills == null ||
                studentSkills.trim().isEmpty()) {

            System.out.println();
            System.out.println(
                    "NOT ELIGIBLE"
            );

            System.out.println(
                    "You have not provided any skills."
            );

            System.out.println(
                    "Required Skills : "
                            + requiredSkills
            );

            return false;
        }


        // =====================================================
        // CONVERT SKILLS INTO LISTS
        // =====================================================

        List<String> studentSkillList =
                convertToSkillList(studentSkills);

        List<String> requiredSkillList =
                convertToSkillList(requiredSkills);


        // =====================================================
        // FIND MISSING SKILLS
        // =====================================================

        List<String> missingSkills =
                new ArrayList<>();

        for (String requiredSkill :
                requiredSkillList) {

            if (!studentSkillList.contains(
                    requiredSkill)) {

                missingSkills.add(requiredSkill);
            }
        }


        // =====================================================
        // RESULT
        // =====================================================

        if (!missingSkills.isEmpty()) {

            System.out.println();
            System.out.println(
                    "NOT ELIGIBLE"
            );

            System.out.println(
                    "CGPA Requirement : PASSED"
            );

            System.out.println(
                    "Required Skills  : "
                            + requiredSkills
            );

            System.out.println(
                    "Your Skills      : "
                            + studentSkills
            );

            System.out.println(
                    "Missing Skills   : "
                            + String.join(
                            ", ",
                            missingSkills
                    )
            );

            return false;
        }


        // =====================================================
        // ALL REQUIREMENTS PASSED
        // =====================================================

        System.out.println();
        System.out.println(
                "ELIGIBLE"
        );

        System.out.println(
                "CGPA Requirement : PASSED"
        );

        System.out.println(
                "Skills Requirement : PASSED"
        );

        System.out.println(
                "All required skills are available."
        );

        return true;
    }


    // =========================================================
    // CONVERT COMMA-SEPARATED SKILLS TO LIST
    // =========================================================

    private List<String> convertToSkillList(
            String skills) {

        List<String> skillList =
                new ArrayList<>();

        if (skills == null ||
                skills.trim().isEmpty()) {

            return skillList;
        }


        String[] skillArray =
                skills.split(",");


        for (String skill : skillArray) {

            String cleanedSkill =
                    skill.trim().toLowerCase();

            if (!cleanedSkill.isEmpty()) {

                skillList.add(cleanedSkill);
            }
        }

        return skillList;
    }
}