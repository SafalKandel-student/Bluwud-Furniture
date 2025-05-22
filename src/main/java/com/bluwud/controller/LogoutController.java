package com.bluwud.controller;

import java.io.IOException;

import com.bluwud.util.CookiesUtil;
import com.bluwud.util.SessionUtil;
import com.bluwud.util.RedirectionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/logout" })
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Invalidate session and delete cookies
        CookiesUtil.deleteCookie(response, "role");
        SessionUtil.invalidateSession(request);
        
        request.getRequestDispatcher(RedirectionUtil.welUrl).forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // For POST requests, do the same as GET
        doGet(request, response);
    }
}