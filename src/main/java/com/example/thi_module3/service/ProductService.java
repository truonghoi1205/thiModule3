package com.example.thi_module3.service;

import com.example.thi_module3.models.Product;
import com.example.thi_module3.repository.IProductRepo;
import com.example.thi_module3.repository.ProductRepo;

import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {
    IProductRepo productRepo = new ProductRepo();

    @Override
    public List<Product> selectAllProduct() {
        try {
            return productRepo.selectAllProduct();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertProduct(Product product) {
        try {
            productRepo.insertProduct(product);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteProduct(int id) {
        try {
         return productRepo.deleteProduct(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Product> searchProductByName(String keyword) {
        try {
            return productRepo.searchProductByName(keyword);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateProduct(Product product) {
        try {
            productRepo.updateProduct(product);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
