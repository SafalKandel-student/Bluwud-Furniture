package com.bluwud.controller;

import com.bluwud.model.CartModel;
import com.bluwud.model.ProductModel;
import com.bluwud.model.UserModel;
import com.bluwud.service.CartService;
import com.bluwud.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = {"/cart"})
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        UserModel customer = (UserModel) SessionUtil.getAttribute(req, "customer");

        if (customer == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<CartModel> cartItems = cartService.getCartItemsByUserId(customer.getUser_id());
        req.setAttribute("cartItems", cartItems);
        req.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        UserModel customer = (UserModel) SessionUtil.getAttribute(req, "customer");

        if (customer == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            if ("add".equalsIgnoreCase(action)) {
                int productId = Integer.parseInt(req.getParameter("product_id"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));

                CartModel cart = new CartModel();
                ProductModel product = new ProductModel();
                product.setProduct_id(productId);

                cart.setUser_id(customer);
                cart.setProduct_id(product);
                cart.setCart_quantity(quantity);

                cartService.addToCart(cart);
                resp.sendRedirect(req.getContextPath() + "/cart");

            } else if ("delete".equalsIgnoreCase(action)) {
                int cartId = Integer.parseInt(req.getParameter("cart_id"));
                cartService.removeFromCart(cartId);
                resp.sendRedirect(req.getContextPath() + "/cart");

            } else if ("update".equalsIgnoreCase(action)) {
                int cartId = Integer.parseInt(req.getParameter("cart_id"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));
                cartService.updateCartQuantity(cartId, quantity);
                resp.sendRedirect(req.getContextPath() + "/cart");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Error processing your request: " + e.getMessage());
            
            if ("add".equalsIgnoreCase(action)) {
                int productId = Integer.parseInt(req.getParameter("product_id"));
                ProductModel product = new ProductModel();
                product.setProduct_id(productId);
                req.setAttribute("product", product);
                req.getRequestDispatcher("/WEB-INF/pages/product-detail.jsp").forward(req, resp);
            } else {
                List<CartModel> cartItems = cartService.getCartItemsByUserId(customer.getUser_id());
                req.setAttribute("cartItems", cartItems);
                req.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(req, resp);
            }
        }
    }
}