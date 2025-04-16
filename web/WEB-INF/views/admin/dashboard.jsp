<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <%@ include file="../shared/header.jsp" %>
    
    <div class="dashboard-container">
        <div class="sidebar">
            <ul>
                <li><a href="dashboard.jsp" class="active">Dashboard</a></li>
                <li><a href="menu.jsp">Menu Management</a></li>
                <li><a href="tables.jsp">Table Management</a></li>
                <li><a href="reports.jsp">Reports</a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <h1>Admin Dashboard</h1>
            <div class="stats-container">
                <div class="stat-card">
                    <h3>Today's Orders</h3>
                    <p>${todayOrders}</p>
                </div>
                <div class="stat-card">
                    <h3>Active Reservations</h3>
                    <p>${activeReservations}</p>
                </div>
                <div class="stat-card">
                    <h3>Low Stock Items</h3>
                    <p>${lowStockItems}</p>
                </div>
                <div class="stat-card">
                    <h3>Occupied Tables</h3>
                    <p>${occupiedTables}</p>
                </div>
            </div>
            
            <div class="recent-orders">
                <h2>Recent Orders</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Table</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${recentOrders}">
                            <tr>
                                <td>${order.orderId}</td>
                                <td>${order.tableId}</td>
                                <td>${order.orderTime}</td>
                                <td>${order.status}</td>
                                <td>$${order.totalAmount}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <%@ include file="../shared/footer.jsp" %>
</body>
</html>