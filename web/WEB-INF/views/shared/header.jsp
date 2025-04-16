<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>Restaurant Management System</h1>
        </div>
        <nav>
            <ul>
                <c:choose>
                    <c:when test="${user.role == 'ADMIN'}">
                        <li><a href="admin/dashboard.jsp">Dashboard</a></li>
                    </c:when>
                    <c:when test="${user.role == 'STAFF'}">
                        <li><a href="staff/orders.jsp">Orders</a></li>
                        <li><a href="staff/kitchen.jsp">Kitchen</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="customer/menu.jsp">Menu</a></li>
                        <li><a href="customer/reservation.jsp">Reservation</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
        <div class="user-info">
            <c:if test="${not empty user}">
                <span>Welcome, ${user.name}</span>
                <a href="../LoginServlet?action=logout">Logout</a>
            </c:if>
            <c:if test="${empty user}">
                <a href="login.jsp">Login</a>
            </c:if>
        </div>
    </header>