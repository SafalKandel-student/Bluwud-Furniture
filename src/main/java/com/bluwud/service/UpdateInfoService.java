package com.bluwud.service;

import java.sql.*;

import com.bluwud.config.DbConfig;
import com.bluwud.model.UserModel;

public class UpdateInfoService {
	public UserModel getUser(String user_name) {
		String query = "SELECT user_id, user_name, user_contact, user_address, user_email, user_password FROM users WHERE user_name = ?";
		try (Connection conn = DbConfig.getDbConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, user_name);
			ResultSet result = stmt.executeQuery();

			if (result.next()) {
				return new UserModel(
						result.getInt("user_id"), 
						result.getString("user_name"),
						result.getString("user_contact"),
						result.getString("user_address"),
						result.getString("user_email"),
						result.getString("user_password")
						);
			}

		} catch (SQLException | ClassNotFoundException e) {
			System.err.println("Error fetching user by username: " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	public boolean updateUser(UserModel user) {
		String updateQuery = "UPDATE users SET user_name = ?,  user_contact = ?, user_address=?, user_email = ?, user_password = ? WHERE user_id = ?";
		try (Connection conn = DbConfig.getDbConnection();
				PreparedStatement stmt = conn.prepareStatement(updateQuery)) {

			stmt.setString(1, user.getUser_name());
			stmt.setString(2, user.getUser_contact());
			stmt.setString(3, user.getUser_address());
			stmt.setString(4, user.getUser_email());
			stmt.setString(5, user.getUser_password());

			stmt.setInt(6, user.getUser_id());

			int rowsAffected = stmt.executeUpdate();
			System.out.println("User update executed. Rows affected: " + rowsAffected);
			return rowsAffected > 0;

		} catch (SQLException | ClassNotFoundException e) {
			System.err.println("Error updating user: " + e.getMessage());
			e.printStackTrace(); // Optional: for detailed error trace
			return false;
		}
	}

}