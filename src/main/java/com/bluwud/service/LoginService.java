package com.bluwud.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bluwud.config.DbConfig;
import com.bluwud.model.UserModel;
import com.bluwud.util.PasswordUtil;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns user information.
 */
public class LoginService {

    private Connection dbConn;
    private boolean isConnectionError = false;

    public LoginService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    
    public UserModel loginUser(UserModel userModel) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return null;
        }

        // Include user_ID, user_name, user_password, and user_role
        String query = "SELECT user_id, user_name, user_password, user_role FROM users WHERE user_name = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, userModel.getUser_name());
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                if (validatePassword(result, userModel)) {
                    // ✅ Set all necessary fields
                    UserModel authenticatedUser = new UserModel();
                    authenticatedUser.setUser_id(result.getInt("user_id"));
                    authenticatedUser.setUser_name(result.getString("user_name"));
                    authenticatedUser.setUser_role(result.getString("user_role"));
                    return authenticatedUser;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return null;
    }

    private boolean validatePassword(ResultSet result, UserModel userModel) throws SQLException {
        String dbUsername = result.getString("user_name");
        String dbPassword = result.getString("user_password");

        if (dbPassword == null || dbUsername == null || userModel.getUser_password() == null) {
            return false;
        }

        String decryptedPassword = PasswordUtil.decrypt(dbPassword, dbUsername);
        return decryptedPassword != null && decryptedPassword.equals(userModel.getUser_password());
    }
}
