<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Management</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <%@ include file="../shared/header.jsp" %>
    
    <div class="staff-container">
        <h1>Order Management</h1>
        
        <div class="order-tabs">
            <button class="tab-btn active" onclick="openTab('pending')">Pending</button>
            <button class="tab-btn" onclick="openTab('cooking')">Cooking</button>
            <button class="tab-btn" onclick="openTab('ready')">Ready</button>
            <button class="tab-btn" onclick="openTab('served')">Served</button>
        </div>
        
        <div id="pending" class="tab-content" style="display:block;">
            <h2>Pending Orders</h2>
            <c:forEach var="order" items="${pendingOrders}">
                <div class="order-card">
                    <div class="order-header">
                        <span>Order #${order.orderId} | Table ${order.tableId}</span>
                        <span>${order.orderTime}</span>
                    </div>
                    <div class="order-items">
                        <c:forEach var="item" items="${order.items}">
                            <div class="order-item">
                                <p>${item.quantity}x ${item.name}</p>
                                <c:if test="${not empty item.specialRequest}">
                                    <p class="special-request">Note: ${item.specialRequest}</p>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="order-footer">
                        <p>Total: $${order.totalAmount}</p>
                        <button onclick="updateOrderStatus(${order.orderId}, 'Cooking')">Start Cooking</button>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div id="cooking" class="tab-content">
            <h2>Cooking Orders</h2>
            <!-- Similar structure as pending orders -->
        </div>
        
        <div id="ready" class="tab-content">
            <h2>Ready Orders</h2>
            <!-- Similar structure as pending orders -->
        </div>
        
        <div id="served" class="tab-content">
            <h2>Served Orders</h2>
            <!-- Similar structure as pending orders -->
        </div>
    </div>
    
    <%@ include file="../shared/footer.jsp" %>
    <script src="../script.js"></script>
</body>
</html>