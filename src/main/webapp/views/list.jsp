<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between">
        <a href="/products/list" class="">Danh sách sản phẩm</a>
        <form action="/products/search" class="d-flex">
            <input class="form-control form-control-sm" type="text" name="keyword"
                   placeholder="Tìm kiếm theo tên sản phẩm"
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
                        <%--hiển thị số theo format--%>
                    <td><fmt:formatNumber value="${product.price}" type="number"/></td>
                    <td>${product.quantity}</td>
                    <td>${product.color}</td>
                    <td>${product.category.name}</td>
                    <td class="d-flex">
                        <div class="me-3">
                            <a class="btn btn-danger" data-bs-toggle="modal"
                                   data-bs-target="#product-${product.id}">Xóa</a>
                            <div class="modal" tabindex="-1" id="product-${product.id}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body p-4">
                                            <h2 class="mb-3 text-center">Bạn có muốn xóa sản phẩm này không?</h2>
                                            <div class="text-center mt-5">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Hủy
                                                </button>
                                                <a href="/products/delete?id=${product.id}"
                                                   class="btn btn-danger">Xóa</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <a href="/products/update?id=${product.id}" class="btn btn-primary">Sửa</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
