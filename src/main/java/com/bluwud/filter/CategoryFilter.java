package com.bluwud.filter;

import java.io.IOException;
import java.util.List;

import com.bluwud.model.CategoryModel;
import com.bluwud.service.ProductService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/*") // Intercepts all requests
public class CategoryFilter implements Filter {

    private ProductService productService;

    @Override
    public void init(FilterConfig filterConfig) {
        productService = new ProductService();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        List<CategoryModel> categories = productService.getAllCategories();
        request.setAttribute("categories", categories);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
