<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/12/2024
  Time: 9:55 AM
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
<div class="container py-5">
    <div class="text-center mb-5">
        <h2>Thêm sản phẩm mới</h2>
    </div>
    <div class="row justify-content-center">
        <div class="col-6">
            <form action="/products/create?id=${product.id}" method="post">
                <div class="mb-3 form-floating">
                    <input type="text" class="form-control" id="name" placeholder="Tên sản phẩm" name="name"
                           value="${product.name}">
                    <label for="name" class="form-label">Tên sản phẩm</label>
                </div>
                <div class="mb-3 form-floating">
                    <input type="text" class="form-control" id="price" placeholder="Giá" name="price"
                           value="${product.price}">
                    <label for="price" class="form-label">Giá</label>
                </div>
                <div class="mb-3 form-floating">
                    <input type="number" class="form-control" id="quantity" placeholder="Số lượng" name="quantity"
                           value="${product.quantity}">
                    <label for="quantity" class="form-label">Số lượng</label>
                </div>
                <select name="color" class="form-select form-select-lg mb-3 fs-6">
                    <option value="Đỏ" ${product.color == 'Đỏ' ? 'selected' : ''}>Đỏ</option>
                    <option value="Xanh lá" ${product.color == 'Xanh lá' ? 'selected' : ''}>Xanh lá</option>
                    <option value="Xanh dương" ${product.color == 'Xanh dương' ? 'selected' : ''}>Xanh dương</option>
                    <option value="Vàng" ${product.color == 'Vàng' ? 'selected' : ''}>Vàng</option>
                    <option value="Đen" ${product.color == 'Đen' ? 'selected' : ''}>Đen</option>
                    <option value="Trắng" ${product.color == 'Trắng' ? 'selected' : ''}>Trắng</option>
                </select>
                <div class="mb-3 form-floating">
                    <input type="text" class="form-control" id="description" placeholder="Mô tả" name="description"
                           value="${product.description}">
                    <label for="description" class="form-label">Mô tả</label>
                </div>
                <select class="form-select form-select-lg mb-3 fs-6" name="categoryId">
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                    <div>sáda</div>
                </select>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">${errorMessage}</div>
                    </c:if>
                <div class="text-end d-flex justify-content-between">
                    <a href="/products/list" class="btn btn-primary">Quay lại</a>
                    <button type="submit" class="btn btn-primary ">Lưu</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
