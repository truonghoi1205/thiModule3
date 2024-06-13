package com.example.thi_module3.service;

import com.example.thi_module3.models.Category;
import com.example.thi_module3.repository.CategoryRepo;
import com.example.thi_module3.repository.ICategoryRepo;

import java.sql.SQLException;
import java.util.List;

public class CategoryService implements ICategoryService{
    ICategoryRepo categoryRepo = new CategoryRepo();
    @Override
    public List<Category> selectAllCategory() {
        try {
            return categoryRepo.selectAllCategory();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
