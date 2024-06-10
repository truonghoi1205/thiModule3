package com.example.thi_module3.controller;

import com.example.thi_module3.models.Product;
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = req.getPathInfo();
        switch (url) {
            case "/list":
                listProduct(req, resp);
                break;
            case "/create":
                showFormCreateProduct(req, resp);
                break;
            case "/update":
                showFormUpdateProduct(req,resp);
                break;
        }
    }

    private void showFormUpdateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product products = productService.selectProduct(id);
        req.setAttribute("products", products);
        req.getRequestDispatcher("/views/updateProduct.jsp").forward(req, resp);
    }

    private void showFormCreateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/createProduct.jsp").forward(req, resp);
    }

    private void listProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.selectAllProduct();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/views/listProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = req.getPathInfo();
        switch (url) {
            case "/create":
                insertProduct(req, resp);
                break;
            case "/delete":
                deleteProduct(req,resp);
                break;
            case "/update":
                updateProduct(req,resp);
                break;
        }
    }



    private void insertProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String color = req.getParameter("color");
        String description = req.getParameter("description");
        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setColor(color);
        product.setDescription(description);
        productService.insertProduct(product);
        resp.sendRedirect("/products/list");
    }
    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.delete(id);
        List<Product> products = productService.selectAllProduct();
        req.setAttribute("products",products);
        resp.sendRedirect("/products/list");
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String color = req.getParameter("color");
        String description = req.getParameter("description");
        Product product = new Product();
        product.setId(id);
        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setColor(color);
        product.setDescription(description);
        productService.update(product);
        resp.sendRedirect("/products/list");
    }


}
