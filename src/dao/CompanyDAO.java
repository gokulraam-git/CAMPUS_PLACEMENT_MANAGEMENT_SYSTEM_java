package dao;

import model.Company;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CompanyDAO {

    public boolean save(Company company) {

        String sql = "INSERT INTO company " +
                "(company_name, email, phone, location, website, password) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, company.getCompanyName());
            pst.setString(2, company.getEmail());
            pst.setString(3, company.getPhone());
            pst.setString(4, company.getLocation());
            pst.setString(5, company.getWebsite());
            pst.setString(6, company.getPassword());

            return pst.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Unable to save company: " + e.getMessage());
            return false;
        }
    }

    public Company findByEmail(String email) {

        String sql = "SELECT * FROM company WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, email);

            try (ResultSet rs = pst.executeQuery()) {

                if (rs.next()) {

                    Company company = new Company();

                    company.setCompanyId(rs.getInt("company_id"));
                    company.setCompanyName(rs.getString("company_name"));
                    company.setEmail(rs.getString("email"));
                    company.setPhone(rs.getString("phone"));
                    company.setLocation(rs.getString("location"));
                    company.setWebsite(rs.getString("website"));
                    company.setPassword(rs.getString("password"));

                    return company;
                }
            }

        } catch (Exception e) {
            System.out.println("Unable to find company: " + e.getMessage());
        }

        return null;
    }

    public List<Company> getAllCompanies() {

        List<Company> companies = new ArrayList<>();

        String sql = "SELECT * FROM company";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {

                Company company = new Company();

                company.setCompanyId(rs.getInt("company_id"));
                company.setCompanyName(rs.getString("company_name"));
                company.setEmail(rs.getString("email"));
                company.setPhone(rs.getString("phone"));
                company.setLocation(rs.getString("location"));
                company.setWebsite(rs.getString("website"));

                companies.add(company);
            }

        } catch (Exception e) {
            System.out.println("Unable to get companies: " + e.getMessage());
        }

        return companies;
    }
    public boolean deleteCompany(int companyId) {

        String sql = "DELETE FROM company WHERE company_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, companyId);

            return pst.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println(
                    "Unable to delete company: " + e.getMessage()
            );
            return false;
        }
    }
}