<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/10/2024
  Time: 9:30 AM
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
    <div class="row justify-content-center">
        <div class="col-12 col-lg-6">
            <div class="shadow-sm rounded p-3 bg-white">
                <h4 class="mb-3">Thêm sản phẩm mới</h4>
                <form method="post" action="/products/create" id="borrow-form">
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" id="name" placeholder="Tên sản phẩm" name="name" value="${product.name}">
                        <label for="name" class="form-label">Tên sản phẩm</label>
                    </div>
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" id="price" placeholder="Giá" name="price" value="${product.price}">
                        <label for="price" class="form-label">Giá</label>
                    </div>
                    <div class="mb-3 form-floating">
                        <input type="number" class="form-control" id="quantity" value="${product.quantity}" name="quantity" placeholder="số lượng">
                        <label for="quantity" class="form-label">Số lượng</label>
                    </div>
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" id="color" placeholder="màu sắc" value="${product.color}"
                               name="color">
                        <label for="color" class="form-label">Màu sắc</label>
                    </div>
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" id="description" placeholder="mô tả"  value="${product.description}"
                               name="description">
                        <label for="description" class="form-label">Mô tả</label>
                    </div>

                    <select class="form-select form-select-lg mb-3" name="">
                            <option value=""></option>
                    </select>

                    <div class="d-flex justify-content-between row">
                        <div class="d-grid gap-2 mt-5 col-4">
                            <button type="submit" class="btn btn-primary btn-sm">Thêm</button>
                        </div>
                        <div class="d-grid gap-2 mt-5 col-4">
                            <a href="/products/list" class="btn btn-danger btn-sm">Trở về</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>