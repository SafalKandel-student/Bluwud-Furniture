package com.bluwud.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.bluwud.service.UserService;
import com.bluwud.util.RedirectionUtil;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/CustomerController" })
public class CustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        var userList = userService.getAllUserInfo();
        if (userList.isEmpty()) {
            request.setAttribute("error", "No users found.");
        } else {
            request.setAttribute("userList", userList);
        }
        request.getRequestDispatcher(RedirectionUtil.userUrl).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST not supported.");
    }
}
