<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/12/2024
  Time: 9:26 AM
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
    <div class="d-flex justify-content-between">
        <h2>Danh sách sản phẩm</h2>
        <form action="/products/search" class="d-flex">
            <input class="form-control form-control-sm" type="text" name="keyword" placeholder="Tìm kiếm theo tên sản phẩm"
                   aria-label=".form-control-sm example">
            <button class="btn btn-primary btn-sm">Tìm</button>
        </form>

        <a href="/products/create" class="btn btn-primary">Thêm sản phẩm mới</a>
    </div>
    <div>
        <table class="table">
            <tr>
                <th>STT</th>
                <th>tên sản phẩm</th>
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
                    <td>${product.category.name}</td>
                    <td class="d-flex">
                        <div  class="me-3">
                            <form  action="/products/delete?id=${product.id}" method="post">
                                <button class="btn btn-danger">Xóa</button>
                            </form>
                        </div>
                        <div>
                            <form action="/products/update?id=${product.id}">
                                <button class="btn btn-primary">Sửa</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
