package com.bluwud.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.bluwud.config.DbConfig;
import com.bluwud.model.CategoryModel;
import com.bluwud.model.ProductModel;
import com.bluwud.model.SupplierModel;

public class ProductService {
    public List<ProductModel> getAllProducts() {
        List<ProductModel> products = new ArrayList<>();
        String query = "SELECT p.*, c.category_type, s.supplier_name FROM product p " +
                       "LEFT JOIN category c ON p.category_id = c.category_id " +
                       "LEFT JOIN supplier s ON p.supplier_id = s.supplier_id";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                CategoryModel category = new CategoryModel();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_type(rs.getString("category_type"));

                SupplierModel supplier = new SupplierModel();
                supplier.setSupplier_id(rs.getInt("supplier_id"));
                supplier.setSupplier_name(rs.getString("supplier_name"));

                ProductModel product = new ProductModel(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_description"),
                        rs.getFloat("product_unitprice"),
                        rs.getString("image_path"),
                        category,
                        supplier
                );
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public ProductModel getProductById(int id) {
        String query = "SELECT p.*, c.category_type, s.supplier_name FROM product p " +
                       "LEFT JOIN category c ON p.category_id = c.category_id " +
                       "LEFT JOIN supplier s ON p.supplier_id = s.supplier_id " +
                       "WHERE p.product_id=?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                CategoryModel category = new CategoryModel();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_type(rs.getString("category_type"));

                SupplierModel supplier = new SupplierModel();
                supplier.setSupplier_id(rs.getInt("supplier_id"));
                supplier.setSupplier_name(rs.getString("supplier_name"));

                return new ProductModel(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_description"),
                        rs.getFloat("product_unitprice"),
                        rs.getString("image_path"),
                        category,
                        supplier
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean addProduct(ProductModel product) {
        String query = "INSERT INTO product (product_name, product_description, product_unitprice, image_path, category_id, supplier_id) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, product.getProduct_name());
            stmt.setString(2, product.getProduct_description());
            stmt.setFloat(3, product.getProduct_unitprice());
            stmt.setString(4, product.getImage_path());
            stmt.setInt(5, product.getCategory_id().getCategory_id());
            stmt.setInt(6, product.getSupplier_id().getSupplier_id());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean updateProduct(ProductModel product) {
        String query = "UPDATE product SET product_name=?, product_description=?, product_unitprice=?, category_id=?, supplier_id=?, image_path = ? WHERE product_id=?";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, product.getProduct_name());
            stmt.setString(2, product.getProduct_description());
            stmt.setFloat(3, product.getProduct_unitprice());
            stmt.setInt(4, product.getCategory_id().getCategory_id());
            stmt.setInt(5, product.getSupplier_id().getSupplier_id());
            stmt.setString(6, product.getImage_path());
            stmt.setInt(7, product.getProduct_id());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteProduct(int id) {
        String deleteCartQuery = "DELETE FROM cart WHERE product_id = ?";
        String deleteProductQuery = "DELETE FROM product WHERE product_id = ?";
        
        try (Connection conn = DbConfig.getDbConnection()) {
            conn.setAutoCommit(false); // Begin transaction

            try (PreparedStatement deleteCartStmt = conn.prepareStatement(deleteCartQuery);
                 PreparedStatement deleteProductStmt = conn.prepareStatement(deleteProductQuery)) {

                deleteCartStmt.setInt(1, id);
                deleteCartStmt.executeUpdate();

                deleteProductStmt.setInt(1, id);
                int rowsAffected = deleteProductStmt.executeUpdate();

                conn.commit(); 
                return rowsAffected > 0;

            } catch (Exception e) {
                conn.rollback(); 
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    public List<CategoryModel> getAllCategories() {
        List<CategoryModel> categories = new ArrayList<>();
        String query = "SELECT * FROM category";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                CategoryModel c = new CategoryModel();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCategory_type(rs.getString("category_type"));
                categories.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<SupplierModel> getAllSuppliers() {
        List<SupplierModel> suppliers = new ArrayList<>();
        String query = "SELECT * FROM supplier";
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                SupplierModel s = new SupplierModel();
                s.setSupplier_id(rs.getInt("supplier_id"));
                s.setSupplier_name(rs.getString("supplier_name"));
                suppliers.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return suppliers;
    }
    public List<ProductModel> getProductsByCategoryId(int categoryId) {
        List<ProductModel> products = new ArrayList<>();
        String query = "SELECT p.*, c.category_type, s.supplier_name FROM product p " +
                       "LEFT JOIN category c ON p.category_id = c.category_id " +
                       "LEFT JOIN supplier s ON p.supplier_id = s.supplier_id " +
                       "WHERE p.category_id = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CategoryModel category = new CategoryModel();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_type(rs.getString("category_type"));

                SupplierModel supplier = new SupplierModel();
                supplier.setSupplier_id(rs.getInt("supplier_id"));
                supplier.setSupplier_name(rs.getString("supplier_name"));

                ProductModel product = new ProductModel(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_description"),
                        rs.getFloat("product_unitprice"),
                        rs.getString("image_path"),
                        category,
                        supplier
                );
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    public List<ProductModel> searchProducts(String keyword) {
        List<ProductModel> products = new ArrayList<>();
        String query = "SELECT p.*, c.category_type, s.supplier_name FROM product p " +
                       "LEFT JOIN category c ON p.category_id = c.category_id " +
                       "LEFT JOIN supplier s ON p.supplier_id = s.supplier_id " +
                       "WHERE p.product_name LIKE ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CategoryModel category = new CategoryModel();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_type(rs.getString("category_type"));

                SupplierModel supplier = new SupplierModel();
                supplier.setSupplier_id(rs.getInt("supplier_id"));
                supplier.setSupplier_name(rs.getString("supplier_name"));

                ProductModel product = new ProductModel(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_description"),
                        rs.getFloat("product_unitprice"),
                        rs.getString("image_path"),
                        category,
                        supplier
                );
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }


}