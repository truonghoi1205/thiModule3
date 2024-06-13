package com.example.thi_module3.repository;

import com.example.thi_module3.models.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepo {
    List<Product> selectAllProduct()throws SQLException;
    void insertProduct(Product product)throws SQLException;
    boolean deleteProduct(int id) throws SQLException;
    List<Product> searchProductByName(String keyword) throws SQLException;

}
