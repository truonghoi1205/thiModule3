package com.example.thi_module3.controller;

import com.example.thi_module3.models.Category;
import com.example.thi_module3.models.Product;

import com.example.thi_module3.service.CategoryService;
import com.example.thi_module3.service.ICategoryService;
import com.example.thi_module3.service.IProductService;
import com.example.thi_module3.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products/*")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();
    ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = req.getPathInfo();
        switch (url) {
            case "/list":
                showList(req, resp);
                break;
            case "/create":
                showFromCreateProduct(req, resp);
                break;
            case "/search":
                searchProduct(req, resp);
                break;
            case "/update":
                showFormUpdateProduct(req, resp);
                break;
            case "/delete":
                deleteProduct(req, resp);
                break;
        }
    }

    private void showFormUpdateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int id = Integer.parseInt(req.getParameter("id"));
//        Product products = productService.selectProduct(id);
//        req.setAttribute("products", products);
//        CategoryService categoryService = new CategoryService();
//        List<Category> categories = categoryService.selectAll();
//        req.setAttribute("categories", categories);

        req.getRequestDispatcher("/views/update.jsp").forward(req, resp);
    }

    // tìm sản phẩm
    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyWord = req.getParameter("keyword");
        List<Product> products = productService.searchProductByName(keyWord);
        req.setAttribute("products", products);
        req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
    }

    //hiển thị form thêm
    private void showFromCreateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product new_pr = new Product();
        List<Category> categories = categoryService.selectAllCategory();
        req.setAttribute("categories", categories);
        req.setAttribute("product", new_pr);
        req.getRequestDispatcher("/views/create.jsp").forward(req, resp);
    }

    //hiển thị tất cả sp
    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.selectAllProduct();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = req.getPathInfo();
        switch (url) {
            case "/create":
                createProduct(req, resp);
                break;
            case "/update":
                updateProduct(req, resp);
                break;
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) {

    }

    //thêm
    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String name = req.getParameter("name");
        String priceStr = req.getParameter("price");
        String quantityStr = req.getParameter("quantity");
        String color = req.getParameter("color");
        String description = req.getParameter("description");
        String categoryIdStr = req.getParameter("categoryId");

        double price = Double.parseDouble(priceStr);
        int quantity = Integer.parseInt(quantityStr);
        int categoryId = Integer.parseInt(categoryIdStr);

        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setColor(color);
        product.setDescription(description);
        product.setCategoryId(categoryId);
        String errorMessage = validateProduct(name, priceStr, quantityStr, color, categoryIdStr);

        if (errorMessage != null) {
            List<Category> categories = categoryService.selectAllCategory();
            req.setAttribute("categories", categories);
            req.setAttribute("errorMessage", errorMessage);
            req.setAttribute("product", product);
            req.getRequestDispatcher("/views/create.jsp").forward(req, resp);
            return;
        }
        productService.insertProduct(product);
        resp.sendRedirect("/products/list");
    }

    //xóa
    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.deleteProduct(id);
        List<Product> products = productService.selectAllProduct();
        req.setAttribute("products", products);
        resp.sendRedirect("/products/list");
    }

    //validate
    private String validateProduct(String name, String priceStr, String quantityStr, String color, String category) {
        if (name == null || name.isEmpty()) {
            return "Vui lòng nhập tên sản phẩm.";
        }
        if (priceStr == null || priceStr.isEmpty()) {
            return "Vui lòng nhập giá.";
        }
        try {
            double price = Double.parseDouble(priceStr);
            if (price <= 10000000) {
                return "Giá không được thấp hơn 10,000,000 VND.";
            }
        } catch (NumberFormatException e) {
            return "Vui lòng nhập giá đúng.";
        }
        if (quantityStr == null || quantityStr.isEmpty()) {
            return "Vui lòng nhập số lượng.";
        }
        try {
            int quantity = Integer.parseInt(quantityStr);
            if (quantity <= 0) {
                return "Vui lòng nhập số lượng đúng.";
            }
        } catch (NumberFormatException e) {
            return "Vui lòng nhập số lượng đúng.";
        }
        if (color == null || color.isEmpty()) {
            return "Vui lòng chọn màu.";
        }
        if (category == null || category.isEmpty()) {
            return "Vui lòng chọn danh mục.";
        }
        return null;
    }

}
