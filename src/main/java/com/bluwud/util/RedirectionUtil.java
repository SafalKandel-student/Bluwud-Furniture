package com.bluwud.util;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RedirectionUtil {

	private static final String baseUrl = "/WEB-INF/pages/";
	public static final String registerUrl = baseUrl + "register.jsp";
	public static final String loginUrl = baseUrl + "login.jsp";
	public static final String homeUrl = baseUrl + "home.jsp";
	public static final String welcomeUrl = baseUrl + "welcome.jsp";
	public static final String productUrl = baseUrl + "home.jsp";
	public static final String welUrl = baseUrl + "welcome.jsp";
	public static final String aboutUrl = baseUrl + "AboutUs.jsp";
	public static final String contactUrl = baseUrl + "ContactUs.jsp";
	public static final String DashUrl = baseUrl + "Dashboard.jsp";
	public static final String logoutUrl = baseUrl + "welcome.jsp";
	public static final String userUrl = baseUrl + "AdminManagement.jsp";
	public static final String updateUrl = baseUrl + "adminupdate.jsp";
	public static final String infoUrl = baseUrl + "updateinfo.jsp";
	public static final String allcontactUrl = baseUrl + "allcontact.jsp";
	
	
	
	public void setMsgAttribute(HttpServletRequest req, String msgType, String msg) {
		req.setAttribute(msgType, msg);
	}

	public void redirectToPage(HttpServletRequest req, HttpServletResponse resp, String page)
			throws ServletException, IOException {
		req.getRequestDispatcher(page).forward(req, resp);
	}

	public void setMsgAndRedirect(HttpServletRequest req, HttpServletResponse resp, String msgType, String msg,
			String page) throws ServletException, IOException {
		setMsgAttribute(req, msgType, msg);
		redirectToPage(req, resp, page);
	}

	
}