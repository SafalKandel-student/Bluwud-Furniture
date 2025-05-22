package com.bluwud.controller;

import com.bluwud.model.CartModel;
import com.bluwud.service.CartService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/cart"})
public class AdminCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Optional: Add admin session check here
        List<CartModel> allCartItems = cartService.getAllCartItemsForAdmin();
        req.setAttribute("allCartItems", allCartItems);
        req.getRequestDispatcher("/WEB-INF/pages/orders.jsp").forward(req, resp);
    }
}
