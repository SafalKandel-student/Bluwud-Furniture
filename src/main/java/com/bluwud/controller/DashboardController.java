package com.bluwud.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bluwud.service.DashboardService;
import com.bluwud.util.RedirectionUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/Dashboard" })
public class DashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DashboardController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DashboardService dashboardService = new DashboardService();

        // Set real dashboard metrics
        request.setAttribute("customers", dashboardService.getTotalUsers());
        request.setAttribute("revenue", "$3,465 "); // You can implement real revenue logic later
        request.setAttribute("totalOrders", dashboardService.getTotalOrders());
        request.setAttribute("totalReturns", 1789); 
        request.setAttribute("categoryTypeMap", dashboardService.getCategoryType());// Example static data

        

        request.getRequestDispatcher(RedirectionUtil.DashUrl).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
