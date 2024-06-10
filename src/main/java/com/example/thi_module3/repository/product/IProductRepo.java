package com.example.thi_module3.repository.product;

import com.example.thi_module3.models.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepo {
    List<Product> selectAllProduct() throws SQLException;

    void insertProduct(Product product) throws SQLException;

    void delete(int id) throws SQLException;

    void update(Product product) throws SQLException;
    Product selectProduct(int id) throws SQLException;
}
