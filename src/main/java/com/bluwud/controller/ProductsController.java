package com.bluwud.controller;

import java.io.IOException;
import java.util.List;

import com.bluwud.model.*;
import com.bluwud.service.ProductService;
import com.bluwud.util.ImageUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(asyncSupported = true, urlPatterns = { "/Products" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductsController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService productService;

	@Override
	public void init() {
		productService = new ProductService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String categoryIdParam = request.getParameter("categoryId");
		if (action == null)
			action = "list";

		boolean isAdmin = false;
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("isAdmin") != null) {
			Object adminAttr = session.getAttribute("isAdmin");
			if (adminAttr instanceof Boolean) {
				isAdmin = (Boolean) adminAttr;
			} else if (adminAttr instanceof String) {
				isAdmin = Boolean.parseBoolean((String) adminAttr);
			}
		}

		request.setAttribute("isAdmin", isAdmin);
		request.setAttribute("categories", productService.getAllCategories());

		try {
			switch (action) {
			case "list":
				handleList(request, response, categoryIdParam);
				break;
			case "add":
				handleAdd(request, response);
				break;
			case "edit":
				handleEdit(request, response);
				break;
			case "delete":
				handleDelete(request, response);
				break;
			case "category":
				handleCategory(request, response);
				break;
			case "details":
				handleDetails(request, response);
				break;
			default:
				request.setAttribute("error", "Unknown action: " + action);
				request.getRequestDispatcher("WEB-INF/pages/products.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Something went wrong: " + e.getMessage());
			request.getRequestDispatcher("WEB-INF/pages/products.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action == null) {
			request.setAttribute("error", "Missing action parameter in POST request.");
			request.getRequestDispatcher("WEB-INF/pages/products.jsp").forward(request, response);
			return;
		}

		try {
			switch (action) {
			case "delete":
				handleDelete(request, response);
				break;
			case "save":
				handleSave(request, response);
				break;
			default:
				request.setAttribute("error", "Unsupported POST action: " + action);
				request.getRequestDispatcher("WEB-INF/pages/products.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Something went wrong: " + e.getMessage());
			request.getRequestDispatcher("WEB-INF/pages/products.jsp").forward(request, response);
		}
	}

	private void handleList(HttpServletRequest request, HttpServletResponse response, String categoryIdParam)
			throws ServletException, IOException {
		List<ProductModel> products;
		String searchQuery = request.getParameter("search");

		if (searchQuery != null && !searchQuery.trim().isEmpty()) {
			products = productService.searchProducts(searchQuery.trim());
			request.setAttribute("searchQuery", searchQuery);
		} else if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
			try {
				int selectedCategoryId = Integer.parseInt(categoryIdParam);
				products = productService.getProductsByCategoryId(selectedCategoryId);
				request.setAttribute("selectedCategoryId", selectedCategoryId);
			} catch (NumberFormatException e) {
				products = productService.getAllProducts();
			}
		} else {
			products = productService.getAllProducts();
		}

		request.setAttribute("products", products);
		request.getRequestDispatcher("WEB-INF/pages/products.jsp").forward(request, response);
	}

	private void handleEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ProductModel product = productService.getProductById(id);
		List<CategoryModel> categories = productService.getAllCategories();
		List<SupplierModel> suppliers = productService.getAllSuppliers();

		request.setAttribute("product", product);
		request.setAttribute("categories", categories);
		request.setAttribute("suppliers", suppliers);
		request.getRequestDispatcher("WEB-INF/pages/product-form.jsp").forward(request, response);
	}

	private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		productService.deleteProduct(id);
		response.sendRedirect(request.getContextPath() + "/Products");
	}

	private void handleAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<CategoryModel> categories = productService.getAllCategories();
		List<SupplierModel> suppliers = productService.getAllSuppliers();

		request.setAttribute("categories", categories);
		request.setAttribute("suppliers", suppliers);
		request.setAttribute("product", null);
		request.getRequestDispatcher("WEB-INF/pages/product-form.jsp").forward(request, response);
	}

	private void handleSave(HttpServletRequest request, HttpServletResponse response) 
	        throws IOException, ServletException {
	    
	    int id = request.getParameter("product_id") != null && !request.getParameter("product_id").isEmpty()
	            ? Integer.parseInt(request.getParameter("product_id"))
	            : 0;

	    String name = request.getParameter("product_name");
	    String description = request.getParameter("product_description");
	    float price = Float.parseFloat(request.getParameter("product_unitprice"));
	    int categoryId = Integer.parseInt(request.getParameter("category_id"));
	    int supplierId = Integer.parseInt(request.getParameter("supplier_id"));

	    CategoryModel category = new CategoryModel();
	    category.setCategory_id(categoryId);

	    SupplierModel supplier = new SupplierModel();
	    supplier.setSupplier_id(supplierId);

	    // Handle image upload
	    String imagePath = null;
	    Part filePart = request.getPart("image_path");
	    
	    if (filePart != null && filePart.getSize() > 0) {
	        ImageUtil imageUtil = new ImageUtil();
	        String saveFolder = "products"; // or any subfolder you want
	        boolean uploadSuccess = imageUtil.uploadImage(filePart, saveFolder, request);
	        
	        if (uploadSuccess) {
	            String imageName = imageUtil.getImageNameFromPart(filePart);
	            imagePath = "resources/images/" + saveFolder + "/" + imageName;
	        }
	    }

	    ProductModel product = new ProductModel(id, name, description, price, imagePath, category, supplier);

	    if (id > 0) {
	        // For update, keep existing image if no new image was uploaded
	        if (imagePath == null) {
	            ProductModel existingProduct = productService.getProductById(id);
	            if (existingProduct != null) {
	                product.setImage_path(existingProduct.getImage_path());
	            }
	        }
	        productService.updateProduct(product);
	    } else {
	        // For new product, set default image if none was uploaded
	        if (imagePath == null) {
	            product.setImage_path("resources/images/default-product.png");
	        }
	        productService.addProduct(product);
	    }

	    response.sendRedirect(request.getContextPath() + "/Products");
	}

	private void handleCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		List<ProductModel> products = productService.getProductsByCategoryId(categoryId);
		request.setAttribute("products", products);
		request.getRequestDispatcher("WEB-INF/pages/products.jsp").forward(request, response);
	}

	private void handleDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("id"));
		ProductModel product = productService.getProductById(productId);

		if (product == null) {
			request.setAttribute("error", "Product not found.");
			request.getRequestDispatcher("WEB-INF/pages/products.jsp").forward(request, response);
			return;
		}

		request.setAttribute("product", product);

		// Preserve categoryId and search query
		String categoryId = request.getParameter("categoryId");
		String search = request.getParameter("search");
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("search", search);

		request.getRequestDispatcher("WEB-INF/pages/product-detail.jsp").forward(request, response);
	}

}
