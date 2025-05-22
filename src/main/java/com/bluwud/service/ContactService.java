package com.bluwud.service;

import com.bluwud.config.DbConfig;
import com.bluwud.model.ContactModel;
import com.bluwud.model.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactService {
    private Connection dbConn;

    public ContactService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Insert a contact form entry
    public void insertContact(ContactModel contact) throws SQLException {
        String query = "INSERT INTO contact_form (full_name, email, message, user_id) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, contact.getFull_name());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getMessage());
            stmt.setInt(4, contact.getUser_id().getUser_id());
            stmt.executeUpdate();
        }
    }

    // Get contact form entries by user ID
    public List<ContactModel> getContacts() {
        List<ContactModel> contacts = new ArrayList<>();
        String query = "SELECT * FROM contact_form";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ContactModel contact = new ContactModel();
                UserModel user = new UserModel();
                
                contact.setContact_form_id(rs.getInt("contact_form_id"));
                contact.setFull_name(rs.getString("full_name"));
                contact.setEmail(rs.getString("email"));
                contact.setMessage(rs.getString("message"));
                
                user.setUser_id(rs.getInt("user_id"));
                contact.setUser_id(user);

                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contacts;
    }

    // Delete a contact form entry by ID
    public void deleteContactById(int contactId) throws SQLException {
        String query = "DELETE FROM contact_form WHERE contact_form_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, contactId);
            stmt.executeUpdate();
        }
    }
}