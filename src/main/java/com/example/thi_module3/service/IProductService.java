package com.example.thi_module3.service;

import com.example.thi_module3.models.Product;

import java.util.List;

public interface IProductService {
    List<Product> selectAllProduct();
    void insertProduct(Product product);
    boolean deleteProduct(int id);
    List<Product> searchProductByName(String keyword);
    void updateProduct(Product product);
}
