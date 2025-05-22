package com.bluwud.service;

import com.bluwud.config.DbConfig;
import com.bluwud.model.CartModel;
import com.bluwud.model.ProductModel;
import com.bluwud.model.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartService {
    private Connection dbConn;

    public CartService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addToCart(CartModel cart) throws SQLException {
       
        String checkQuery = "SELECT cart_id, cart_quantity FROM cart WHERE user_id = ? AND product_id = ?";
        try (PreparedStatement checkStmt = dbConn.prepareStatement(checkQuery)) {
            checkStmt.setInt(1, cart.getUser_id().getUser_id());
            checkStmt.setInt(2, cart.getProduct_id().getProduct_id());
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                
                int newQuantity = rs.getInt("cart_quantity") + cart.getCart_quantity();
                String updateQuery = "UPDATE cart SET cart_quantity = ? WHERE cart_id = ?";
                try (PreparedStatement updateStmt = dbConn.prepareStatement(updateQuery)) {
                    updateStmt.setInt(1, newQuantity);
                    updateStmt.setInt(2, rs.getInt("cart_id"));
                    updateStmt.executeUpdate();
                }
            } else {
                // Add new cart item
                String insertQuery = "INSERT INTO cart (user_id, product_id, cart_quantity) VALUES (?, ?, ?)";
                try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
                    insertStmt.setInt(1, cart.getUser_id().getUser_id());
                    insertStmt.setInt(2, cart.getProduct_id().getProduct_id());
                    insertStmt.setInt(3, cart.getCart_quantity());
                    insertStmt.executeUpdate();
                }
            }
        }
    }

    public List<CartModel> getCartItemsByUserId(int userId) {
        List<CartModel> cartItems = new ArrayList<>();
        String query = "SELECT c.*, p.product_name, p.product_unitprice, p.product_description " +
                       "FROM cart c JOIN product p ON c.product_id = p.product_id " +
                       "WHERE c.user_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CartModel cart = new CartModel();
                ProductModel product = new ProductModel();
                UserModel user = new UserModel();

                cart.setCart_id(rs.getInt("cart_id"));
                user.setUser_id(rs.getInt("user_id"));
                product.setProduct_id(rs.getInt("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_unitprice(rs.getFloat("product_unitprice"));
                product.setProduct_description(rs.getString("product_description"));

                cart.setUser_id(user);
                cart.setProduct_id(product);
                cart.setCart_quantity(rs.getInt("cart_quantity"));

                cartItems.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public void removeFromCart(int cartId) throws SQLException {
        String query = "DELETE FROM cart WHERE cart_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, cartId);
            stmt.executeUpdate();
        }
    }

    public void updateCartQuantity(int cartId, int quantity) throws SQLException {
        String query = "UPDATE cart SET cart_quantity = ? WHERE cart_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, quantity);
            stmt.setInt(2, cartId);
            stmt.executeUpdate();
        }
    }
    
    public List<CartModel> getAllCartItemsForAdmin() {
        List<CartModel> cartItems = new ArrayList<>();
        String query = "SELECT c.*, u.user_id, u.user_name, p.product_id, p.product_name, p.product_unitprice, p.product_description " +
                       "FROM cart c " +
                       "JOIN users u ON c.user_id = u.user_id " +
                       "JOIN product p ON c.product_id = p.product_id";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CartModel cart = new CartModel();
                UserModel user = new UserModel();
                ProductModel product = new ProductModel();

                cart.setCart_id(rs.getInt("cart_id"));
                cart.setCart_quantity(rs.getInt("cart_quantity"));

                user.setUser_id(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name")); // Ensure this field exists in your UserModel
                cart.setUser_id(user);

                product.setProduct_id(rs.getInt("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_unitprice(rs.getFloat("product_unitprice"));
                product.setProduct_description(rs.getString("product_description"));
                cart.setProduct_id(product);

                cartItems.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartItems;
    }

}