package com.example.thi_module3.service;

import com.example.thi_module3.models.Product;
import com.example.thi_module3.repository.product.IProductRepo;
import com.example.thi_module3.repository.product.ProductRepo;

import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService{
    IProductRepo productRepo = new ProductRepo();

    @Override
    public List<Product> selectAllProduct() {
        try {
            return  productRepo.selectAllProduct();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertProduct(Product product) {
        try {
            productRepo.insertProduct(product);
        } catch (SQLException e) {

        }
    }

    @Override
    public void delete(int id) {
        try {
            productRepo.delete(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Product product) {
        try {
            productRepo.update(product);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product selectProduct(int id) {
        try {
            return productRepo.selectProduct(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
