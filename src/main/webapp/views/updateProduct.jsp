<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/10/2024
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/products/update?id=${product.id}" method="post">

    <input name="name" value="${product.name}" placeholder="Enter name" >
    <input name="price" value="${product.price}" placeholder="price" >
    <input name="quantity" value="${product.quantity}" placeholder="Enter quantity">
    <input name="color" value="${product.color}" placeholder="Enter color">
    <input name="description" value="${product.description}" placeholder="Enter description">
    <select name="category" id="category">
        <option value="${product.category.id}">${product.category.name}</option>
    </select>
    <div>
        <input type="submit" name="submit" value="cập nhật">
    </div>

</form>
</body>
</html>
