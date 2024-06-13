package com.example.thi_module3.repository;

import com.example.thi_module3.ConnectDB.ConnectDB;
import com.example.thi_module3.models.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepo implements ICategoryRepo {

    @Override
    public List<Category> selectAllCategory() throws SQLException {
        List<Category> categories = new ArrayList<>();
        Connection connection = new ConnectDB().getConnection();
        String sql = "select * from category";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Category category = new Category();
            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));
            categories.add(category);
        }
        return categories;
    }
}
