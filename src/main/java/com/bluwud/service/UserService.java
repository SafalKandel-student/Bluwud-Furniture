package com.bluwud.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.bluwud.model.UserModel;
import com.bluwud.config.DbConfig;

public class UserService {
	 private static final Logger logger = Logger.getLogger(UserService.class.getName());

    public List<UserModel> getAllUserInfo() {
        String query = "SELECT user_id, user_name, user_contact, user_address, user_email FROM users";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet result = stmt.executeQuery()) {

            List<UserModel> userList = new ArrayList<>();

            while (result.next()) {
                userList.add(new UserModel(
                        result.getInt("user_id"),
                        result.getString("user_name"),
                        result.getString("user_contact"),
                        result.getString("user_address"),
                        result.getString("user_email")
                ));
            }
            return userList;

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error fetching user list: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public boolean updateUser(UserModel user) {
        String updateQuery = "UPDATE users SET user_name = ?, user_contact = ?, user_address = ?, user_email = ? WHERE user_id = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(updateQuery)) {

            stmt.setString(1, user.getUser_name());
            stmt.setString(2, user.getUser_contact());
            stmt.setString(3, user.getUser_address());
            stmt.setString(4, user.getUser_email());
            stmt.setInt(5, user.getUser_id());

            return stmt.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error updating user: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int user_id) {
        String deleteBookingsSQL = "DELETE FROM cart WHERE user_ID = ?";
        String deleteContactSQL = "DELETE FROM contact_form WHERE user_ID = ?";
        String deleteUserSQL = "DELETE FROM user WHERE user_id = ?";

        try (Connection conn = DbConfig.getDbConnection()) {
            conn.setAutoCommit(false); // Start transaction

            try (
                PreparedStatement deleteBookingsStmt = conn.prepareStatement(deleteBookingsSQL);
                PreparedStatement deleteContactStmt = conn.prepareStatement(deleteContactSQL);
                PreparedStatement deleteUserStmt = conn.prepareStatement(deleteUserSQL)
            ) {
                // Delete bookings
                deleteBookingsStmt.setInt(1, user_id);
                deleteBookingsStmt.executeUpdate();

                deleteContactStmt.setInt(1, user_id);
                deleteContactStmt.executeUpdate();

                deleteUserStmt.setInt(1, user_id);
                boolean userDeleted = deleteUserStmt.executeUpdate() > 0;

                conn.commit(); 
                return userDeleted;

            } catch (SQLException e) {
                conn.rollback(); 
                logger.log(Level.SEVERE, "Transaction failed while deleting user with ID: " + user_id, e);
                return false;
            }

        } catch (SQLException | ClassNotFoundException e) {
            logger.log(Level.SEVERE, "Error connecting to the database while deleting user with ID: " + user_id, e);
            return false;
        }
    }

    public UserModel getSpecificUserInfo(int user_id) {
        String query = "SELECT user_id, user_name, user_contact, user_address, user_email FROM users WHERE user_id = ?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, user_id);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                return new UserModel(
                        result.getInt("user_id"),
                        result.getString("user_name"),
                        result.getString("user_contact"),
                        result.getString("user_address"),
                        result.getString("user_email")
                );
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error fetching specific user: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
