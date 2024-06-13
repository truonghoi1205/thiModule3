package com.example.thi_module3.repository;

import com.example.thi_module3.models.Category;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryRepo {
    List<Category> selectAllCategory() throws SQLException;
}
