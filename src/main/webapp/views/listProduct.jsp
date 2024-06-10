<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/10/2024
  Time: 9:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <div class="card-header d-flex justify-content-between">
                <div>
                    <h1>User Management</h1>
                </div>
                <div>
                    <form action="products">
                        <input type="text" name="keyword" placeholder="search">
                        <input type="hidden" name="action" value="search">
                        <button type="submit" class="btn btn-primary" >tìm</button>
                    </form>
                </div>
                <div>
                    <h2>
                        <a href="/products/create">Thêm sản phẩm mới</a>
                    </h2>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div align="center container">
                <table class="table text-center">
                    <h2 class="text-center">Danh sách sản phẩm</h2>
                    <tr>
                        <th>STT</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Màu sắc</th>
                        <th>Danh mục</th>
                        <th>Hành động</th>
                    </tr>
                    <c:forEach var="product" items="${products}" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.quantity}</td>
                            <td>${product.color}</td>
                            <td></td>
                            <form action="/products/delete" method="post">
                                <td>
                                    <input type="hidden" name="id" value="${product.id}">
                                    <button type="submit" class="btn btn-danger">Xóa</button>
                                    <a href="/products/update" class="btn btn-primary">Sửa</a>
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
