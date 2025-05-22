package com.bluwud.controller;

import java.io.IOException;

import com.bluwud.model.UserModel;
import com.bluwud.service.LoginService;
import com.bluwud.util.CookiesUtil;
import com.bluwud.util.SessionUtil;
import com.bluwud.util.RedirectionUtil;
import com.bluwud.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ValidationUtil validationUtil;
	private RedirectionUtil redirectionUtil;
	private LoginService loginService;

	@Override
	public void init() throws ServletException {
		this.validationUtil = new ValidationUtil();
		this.redirectionUtil = new RedirectionUtil();
		this.loginService = new LoginService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher(RedirectionUtil.loginUrl).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_name = req.getParameter("user_name");
		String user_password = req.getParameter("user_password");

		if (!validationUtil.isNullOrEmpty(user_name) && !validationUtil.isNullOrEmpty(user_password)) {
			UserModel userModel = new UserModel(user_name, user_password);
			UserModel loggedInUser = loginService.loginUser(userModel);

			if (loggedInUser != null) {
				String role = loggedInUser.getUser_role();
				SessionUtil.setAttribute(req, "user_name", user_name);
				SessionUtil.setAttribute(req, "customer", loggedInUser);
				SessionUtil.setAttribute(req, "isAdmin", "admin".equalsIgnoreCase(role));
				
				

				CookiesUtil.addCookie(resp, "role", role, 5 * 60);

				if ("admin".equalsIgnoreCase(role)) {
					resp.sendRedirect(req.getContextPath() + "/Dashboard");
				} else {
					resp.sendRedirect(req.getContextPath() + "/home");

				}
			} else {
				handleLoginFailure(req, resp, loggedInUser != null);
			}
		} else {
			redirectionUtil.setMsgAndRedirect(req, resp, "error", "Please fill all the fields!",
					RedirectionUtil.loginUrl);
		}
	}

	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "User credential mismatch. Please try again!";
		}
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher(RedirectionUtil.loginUrl).forward(req, resp);
	}
}