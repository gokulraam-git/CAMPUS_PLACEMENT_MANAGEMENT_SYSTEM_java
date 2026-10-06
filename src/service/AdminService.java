package service;

import dao.AdminDAO;
import model.Admin;
import util.PasswordUtil;

public class AdminService {

    private final AdminDAO adminDAO = new AdminDAO();

    public Admin login(String username, String password) {

        Admin admin = adminDAO.findByUsername(username);

        if (admin == null) {
            return null;
        }

        String hashedPassword =
                PasswordUtil.hashPassword(password);

        if (admin.getPassword().equals(hashedPassword)) {
            return admin;
        }

        return null;
    }
}