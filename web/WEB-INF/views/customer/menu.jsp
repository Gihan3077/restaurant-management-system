<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Menu</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <%@ include file="../shared/header.jsp" %>
    
    <div class="menu-container">
        <h1>Our Menu</h1>
        
        <div class="menu-categories">
            <button class="category-btn active" onclick="filterMenu('all')">All Items</button>
            <button class="category-btn" onclick="filterMenu('Starter')">Starters</button>
            <button class="category-btn" onclick="filterMenu('Main')">Main Courses</button>
            <button class="category-btn" onclick="filterMenu('Dessert')">Desserts</button>
            <button class="category-btn" onclick="filterMenu('Drink')">Drinks</button>
        </div>
        
        <div class="menu-items">
            <c:forEach var="item" items="${menuItems}">
                <div class="menu-item" data-category="${item.category}">
                    <div class="item-image">
                        <img src="../images/menu/${item.imagePath}" alt="${item.name}">
                    </div>
                    <div class="item-details">
                        <h3>${item.name}</h3>
                        <p class="item-description">${item.description}</p>
                        <p class="item-price">$${item.price}</p>
                        <button onclick="addToOrder(${item.itemId})">Add to Order</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <div class="order-summary">
        <h2>Your Order</h2>
        <div id="orderItems">
            <!-- Order items will be added here dynamically -->
        </div>
        <div class="order-total">
            <p>Total: $<span id="orderTotal">0.00</span></p>
        </div>
        <button onclick="submitOrder()" class="submit-order-btn">Place Order</button>
    </div>
    
    <%@ include file="../shared/footer.jsp" %>
    <script src="../script.js"></script>
</body>
</html>