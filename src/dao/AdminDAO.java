package dao;

import model.Admin;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    public Admin findByUsername(String username) {

        String sql = "SELECT * FROM admin WHERE username=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, username);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                Admin admin = new Admin();

                admin.setAdminId(rs.getInt("admin_id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));

                return admin;
            }

        } catch (Exception e) {
            System.out.println(
                    "Unable to find admin: " + e.getMessage()
            );
        }

        return null;
    }
}
