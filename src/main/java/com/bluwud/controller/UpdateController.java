package com.bluwud.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.bluwud.model.UserModel;
import com.bluwud.service.UserService;
import com.bluwud.util.RedirectionUtil;
import com.bluwud.util.ValidationUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/Update" })
public class UpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private final UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int user_id;
        try {
            user_id = Integer.parseInt(request.getParameter("user_id"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID.");
            return;
        }

        UserModel user = userService.getSpecificUserInfo(user_id);
        if (user == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
            return;
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher(RedirectionUtil.updateUrl).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int user_id;
        try {
            user_id = Integer.parseInt(request.getParameter("user_id"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID.");
            return;
        }

        switch (action) {
            case "updateForm":
                handleUpdateForm(request, response, user_id);
                break;
            case "update":
                handleUpdate(request, response, user_id);
                break;
            case "delete":
                handleDelete(request, response, user_id);
                break;
            default:
                request.setAttribute("error", "Unsupported action: " + action);
                request.getRequestDispatcher(RedirectionUtil.updateUrl).forward(request, response);
        }
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response, int user_id)
            throws ServletException, IOException {
        String validationMessage = validateUpdateForm(request);
        if (validationMessage != null) {
            request.setAttribute("error", validationMessage);
            doGet(request, response); // reload form with error
            return;
        }

        String user_name = request.getParameter("user_name");
        String user_contact = request.getParameter("user_contact");
        String user_address = request.getParameter("user_address");
        String user_email = request.getParameter("user_email");

        UserModel user = new UserModel(user_id, user_name,  user_contact,  user_address,  user_email);
        boolean success = userService.updateUser(user);

        if (success) {
            request.setAttribute("success", "User information updated successfully.");
        } else {
            request.setAttribute("error", "Failed to update user information.");
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher(RedirectionUtil.updateUrl).forward(request, response);
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response, int user_ID)
            throws ServletException, IOException {
        boolean success = userService.deleteUser(user_ID);
        if (success) {
            System.out.println("Deletion successful");
        } else {
            System.out.println("Deletion failed");
        }
        response.sendRedirect(request.getContextPath() + "/CustomerController");
    }

    private void handleUpdateForm(HttpServletRequest request, HttpServletResponse response, int user_id)
            throws IOException {
        UserModel user = userService.getSpecificUserInfo(user_id);
        if (user != null) {
            response.sendRedirect(request.getContextPath() + "/Update?user_id=" + user_id);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found with ID: " + user_id);
        }
    }

    private String validateUpdateForm(HttpServletRequest request) {
    	 String user_name = request.getParameter("user_name");
         String user_contact = request.getParameter("user_contact");
         String user_address = request.getParameter("user_address");
         String user_email = request.getParameter("user_email");

        if (ValidationUtil.isNulOrEmpty(user_name))
            return "User name is required.";
        if (ValidationUtil.isNulOrEmpty(user_email))
            return "Email is required.";
        if (ValidationUtil.isNulOrEmpty(user_contact))
            return "Contact number is required.";
        if (ValidationUtil.isNulOrEmpty(user_address))
            return "Address not valid.";

        if (!ValidationUtil.isAlphanuericStartingWithLetter(user_name))
            return "Name must start with a letter and contain only letters and numbers.";
        if (!ValidationUtil.isValiEmail(user_email))
            return "Invalid email format.";
        if (!ValidationUtil.isValiPhoneNumber(user_contact))
            return "Phone number must be 10 digits and start with 98.";

        return null;
    }
}
