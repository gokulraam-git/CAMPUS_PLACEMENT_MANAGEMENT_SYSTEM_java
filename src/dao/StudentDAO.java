package dao;

import model.Student;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    // =========================================================
    // SAVE STUDENT
    // =========================================================

    public boolean save(Student student) {

        String sql =
                "INSERT INTO student " +
                        "(name, email, phone, gender, department, " +
                        "year_of_study, cgpa, skills, password) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst =
                     con.prepareStatement(sql)) {

            pst.setString(1, student.getName());
            pst.setString(2, student.getEmail());
            pst.setString(3, student.getPhone());
            pst.setString(4, student.getGender());
            pst.setString(5, student.getDepartment());
            pst.setInt(6, student.getYearOfStudy());
            pst.setDouble(7, student.getCgpa());
            pst.setString(8, student.getSkills());
            pst.setString(9, student.getPassword());

            return pst.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Unable to save student: "
                            + e.getMessage()
            );

            return false;
        }
    }


    // =========================================================
    // FIND STUDENT BY EMAIL
    // =========================================================

    public Student findByEmail(String email) {

        String sql =
                "SELECT student_id, name, email, phone, gender, " +
                        "department, year_of_study, cgpa, skills, password " +
                        "FROM student " +
                        "WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst =
                     con.prepareStatement(sql)) {

            pst.setString(1, email);

            try (ResultSet rs = pst.executeQuery()) {

                if (rs.next()) {

                    return createStudentFromResultSet(rs);
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Unable to find student: "
                            + e.getMessage()
            );
        }

        return null;
    }


    // =========================================================
    // GET ALL STUDENTS
    // =========================================================

    public List<Student> getAllStudents() {

        List<Student> students =
                new ArrayList<>();

        String sql =
                "SELECT student_id, name, email, phone, gender, " +
                        "department, year_of_study, cgpa, skills " +
                        "FROM student " +
                        "ORDER BY student_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst =
                     con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {

                Student student =
                        new Student();

                student.setStudentId(
                        rs.getInt("student_id")
                );

                student.setName(
                        rs.getString("name")
                );

                student.setEmail(
                        rs.getString("email")
                );

                student.setPhone(
                        rs.getString("phone")
                );

                student.setGender(
                        rs.getString("gender")
                );

                student.setDepartment(
                        rs.getString("department")
                );

                student.setYearOfStudy(
                        rs.getInt("year_of_study")
                );

                student.setCgpa(
                        rs.getDouble("cgpa")
                );

                student.setSkills(
                        rs.getString("skills")
                );

                // Password intentionally not loaded.

                students.add(student);
            }

        } catch (Exception e) {

            System.out.println(
                    "Unable to get students: "
                            + e.getMessage()
            );
        }

        return students;
    }


    // =========================================================
    // UPDATE STUDENT PROFILE
    // =========================================================

    public boolean updateProfile(
            Student student) {

        String sql =
                "UPDATE student SET " +
                        "name = ?, " +
                        "phone = ?, " +
                        "gender = ?, " +
                        "department = ?, " +
                        "year_of_study = ?, " +
                        "cgpa = ?, " +
                        "skills = ? " +
                        "WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst =
                     con.prepareStatement(sql)) {

            pst.setString(1, student.getName());
            pst.setString(2, student.getPhone());
            pst.setString(3, student.getGender());
            pst.setString(4, student.getDepartment());
            pst.setInt(5, student.getYearOfStudy());
            pst.setDouble(6, student.getCgpa());
            pst.setString(7, student.getSkills());
            pst.setInt(8, student.getStudentId());

            return pst.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Unable to update student profile: "
                            + e.getMessage()
            );

            return false;
        }
    }


    // =========================================================
    // CREATE STUDENT OBJECT FROM RESULT SET
    // =========================================================

    private Student createStudentFromResultSet(
            ResultSet rs) throws Exception {

        Student student =
                new Student();

        student.setStudentId(
                rs.getInt("student_id")
        );

        student.setName(
                rs.getString("name")
        );

        student.setEmail(
                rs.getString("email")
        );

        student.setPhone(
                rs.getString("phone")
        );

        student.setGender(
                rs.getString("gender")
        );

        student.setDepartment(
                rs.getString("department")
        );

        student.setYearOfStudy(
                rs.getInt("year_of_study")
        );

        student.setCgpa(
                rs.getDouble("cgpa")
        );

        student.setSkills(
                rs.getString("skills")
        );

        student.setPassword(
                rs.getString("password")
        );

        return student;
    }
}