<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%--validate--%>
<%--    <script>--%>
<%--        function validateForm() {--%>
<%--            let name = document.forms["productForm"]["name"].value;--%>
<%--            let price = document.forms["productForm"]["price"].value;--%>
<%--            let quantity = document.forms["productForm"]["quantity"].value;--%>
<%--            let color = document.forms["productForm"]["color"].value;--%>
<%--            let category = document.forms["productForm"]["category"].value;--%>
<%--            let errorMessage = "";--%>

<%--            if (name == null || name == "") {--%>
<%--                errorMessage += "Băt buộc.\n";--%>
<%--            }--%>
<%--            if (price == null || price == "" || isNaN(price) || parseFloat(price) <= 10000000) {--%>
<%--                errorMessage += "Giá không được thấp hơn 10,000,000 VND.\n";--%>
<%--            }--%>
<%--            if (quantity == null || quantity == "" || isNaN(quantity) || parseInt(quantity) <= 0) {--%>
<%--                errorMessage += "Số lượng phải là số nguyên dương.\n";--%>
<%--            }--%>
<%--            if (color == null || color == "") {--%>
<%--                errorMessage += "Bắt buộc.\n";--%>
<%--            }--%>
<%--            if (category == null || category == "") {--%>
<%--                errorMessage += "Bắt buộc.\n";--%>
<%--            }--%>

<%--            if (errorMessage != "") {--%>
<%--                alert(errorMessage);--%>
<%--                return false;--%>
<%--            }--%>
<%--            return true;--%>
<%--        }--%>
<%--    </script>--%>
</head>
<body>
<div class="container py-5">
    <div>
        <h2>Thêm sản phẩm mới</h2>
    </div>
    <div class="col-12 col-lg-6">
        <form action="/products/create?id=${product.id}" method="post" >
            <div class="mb-3 form-floating">
                <input type="text" class="form-control" id="name" placeholder="Tên sản phẩm" name="name">
                <label for="name" class="form-label">Tên sản phẩm</label>
            </div>
            <div class="mb-3 form-floating">
                <input type="text" class="form-control" id="price" placeholder="Giá" name="price">
                <label for="price" class="form-label">Giá</label>
            </div>
            <div class="mb-3 form-floating">
                <input type="number" class="form-control" id="quantity" placeholder="Số lượng" name="quantity">
                <label for="quantity" class="form-label">Số lượng</label>
            </div>
            <select name="color" class="form-select form-select-lg mb-3 fs-6">
                <option value="">Màu</option>
                <option value="Red" ${product.color == 'Đỏ' ? 'selected' : ''}>Red</option>
                <option value="Green" ${product.color == 'Xanh lá' ? 'selected' : ''}>Green</option>
                <option value="Blue" ${product.color == 'Xanh dương' ? 'selected' : ''}>Blue</option>
                <option value="Yellow" ${product.color == 'Vàng' ? 'selected' : ''}>Yellow</option>
                <option value="Black" ${product.color == 'Đen' ? 'selected' : ''}>Black</option>
                <option value="White" ${product.color == 'Trắng' ? 'selected' : ''}>White</option>
            </select>
            <div class="mb-3 form-floating">
                <input type="text" class="form-control" id="description" placeholder="Mô tả" name="description">
                <label for="description" class="form-label">Mô tả</label>
            </div>
            <select class="form-select form-select-lg mb-3 fs-6" name="categoryId">
                <option value="">Danh mục</option>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
            <div class=" justify-content-between">
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>
                <button type="submit" class="btn btn-primary ">Lưu</button>
                <a href="/products/list" class="btn btn-primary">Quay lại</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
