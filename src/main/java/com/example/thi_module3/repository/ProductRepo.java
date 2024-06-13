package com.example.thi_module3.repository;

import com.example.thi_module3.ConnectDB.ConnectDB;
import com.example.thi_module3.models.Category;
import com.example.thi_module3.models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo {

    @Override
    public List<Product> selectAllProduct() throws SQLException {
        List<Product> products = new ArrayList<>();
        Connection connection = new ConnectDB().getConnection();
        String sql = "select p.*, c.name as categoryName from product p join category c on p.categoryId = c.id;";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            product.setQuantity(rs.getInt("quantity"));
            product.setDescription(rs.getString("description"));
            product.setColor(rs.getString("color"));
            Category category = new Category();
            category.setName(rs.getString("categoryName"));
            product.setCategory(category);
            products.add(product);
        }
        return products;
    }

    @Override
    public void insertProduct(Product product) throws SQLException {
        Connection connection = new ConnectDB().getConnection();
        String sql = "insert into product(name, price, quantity, color, description, categoryId) value(?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, product.getName());
        ps.setDouble(2, product.getPrice());
        ps.setInt(3, product.getQuantity());
        ps.setString(4, product.getColor());
        ps.setString(5, product.getDescription());
        ps.setInt(6, product.getCategoryId());
        ps.executeUpdate();
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        Connection connection = new ConnectDB().getConnection();
        String sql = "delete from product where id = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        boolean rowDeleted = ps.executeUpdate() > 0;
        return rowDeleted;
    }

    @Override
    public List<Product> searchProductByName(String keyword) throws SQLException {
       List<Product> products = new ArrayList<>();
        Connection connection = new ConnectDB().getConnection();
        String sql = "select * from product where name like ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            product.setQuantity(rs.getInt("quantity"));
            product.setColor(rs.getString("color"));
            product.setDescription(rs.getString("description"));
            Category category = new Category();
            category.setName(rs.getString("name"));
            product.setCategory(category);
            products.add(product);
        }
        return products;
    }
}
