package com.example.thi_module3.service;

import com.example.thi_module3.models.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    List<Product> selectAllProduct();
    void insertProduct(Product product);
    void delete(int id);
    void update(Product product) ;
    Product selectProduct(int id);
}
