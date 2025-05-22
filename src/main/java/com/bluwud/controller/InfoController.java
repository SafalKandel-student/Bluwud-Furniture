package com.bluwud.controller;

import com.bluwud.model.UserModel;
import com.bluwud.service.UpdateInfoService;
import com.bluwud.util.PasswordUtil;
import com.bluwud.util.RedirectionUtil;
import com.bluwud.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/Info" })
public class InfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UpdateInfoService updateInfoService = new UpdateInfoService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = (String) SessionUtil.getAttribute(request, "user_name");

		if (username == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		UserModel user = updateInfoService.getUser(username);
		if (user != null) {
			String decryptedPassword = PasswordUtil.decrypt(user.getUser_password(), username);
			user.setUser_password(decryptedPassword);
			request.setAttribute("user", user);
		} else {
			request.setAttribute("error", "User not found.");
		}

		request.getRequestDispatcher(RedirectionUtil.infoUrl).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String username = (String) SessionUtil.getAttribute(request, "user_name");

	    if (username == null) {
	        response.sendRedirect(request.getContextPath() + "/login");
	        return;
	    }

	    UserModel User = updateInfoService.getUser(username);
	    if (User == null) {
	        request.setAttribute("error", "Unable to load user data.");
	        request.getRequestDispatcher(RedirectionUtil.infoUrl).forward(request, response);
	        return;
	    }

	    String name = request.getParameter("user_name");
	    String contact = request.getParameter("user_contact");
	    String address = request.getParameter("user_address");
	    String email = request.getParameter("user_email");
	    String password = request.getParameter("user_password");
	    String confirmPassword = request.getParameter("confirm_password");

	    if (!password.equals(confirmPassword)) {
	        request.setAttribute("error", "Passwords do not match.");
	        User.setUser_name(name);
	        User.setUser_contact(contact);
	        User.setUser_address(address);
	        User.setUser_email(email);
	        User.setUser_password(password);
	       

	        request.setAttribute("user", User);
	        request.getRequestDispatcher(RedirectionUtil.infoUrl).forward(request, response);
	        return;
	    }

	    try {
	        String encryptedPassword = PasswordUtil.encrypt(name, password);

	        User.setUser_name(name);
	        User.setUser_contact(contact);
	        User.setUser_address(address);
	        User.setUser_email(email);
	        User.setUser_password(encryptedPassword);

	        boolean updated = updateInfoService.updateUser(User);

	        if (updated) {
	            request.setAttribute("success", "Profile updated successfully!");
	        } else {
	            request.setAttribute("error", "Profile update failed.");
	        }

	        String decryptedPassword = PasswordUtil.decrypt(encryptedPassword, name);
	        User.setUser_password(decryptedPassword);

	    } catch (Exception e) {
	        request.setAttribute("error", "Encryption error: " + e.getMessage());

	        User.setUser_password(password);
	    }

	    request.setAttribute("user", User);
	    request.getRequestDispatcher(RedirectionUtil.infoUrl).forward(request, response);
	}

}
