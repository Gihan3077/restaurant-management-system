<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="dao.StatsDAO" %>
<% 
    StatsDAO statsDao = new StatsDAO();
    int totalFoods = statsDao.getTotalFoods();
    int availableFoods = statsDao.getAvailableFoods();
    int totalReservations = statsDao.getTotalReservations();
    int todayReservations = statsDao.getTodayReservations();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        .header { background-color: #333; color: white; padding: 10px 20px; display: flex; justify-content: space-between; }
        .content { padding: 20px; }
        .menu { display: flex; gap: 20px; margin-bottom: 20px; }
        .menu a { text-decoration: none; color: #333; padding: 5px 10px; border: 1px solid #ddd; border-radius: 3px; }
        .menu a:hover { background-color: #f4f4f4; }
        .stats-container { display: flex; gap: 20px; margin: 20px 0; }
        .stat-card { flex: 1; padding: 20px; background: #f9f9f9; border-radius: 5px; box-shadow: 0 0 5px rgba(0,0,0,0.1); text-align: center; }
        .stat-card h3 { margin-top: 0; color: #333; }
        .stat-card p { font-size: 24px; font-weight: bold; color: #4CAF50; margin: 10px 0 0; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Admin Dashboard</h2>
        <div>
            Welcome, ${user.username} (Admin) | 
            <a href="LogoutServlet" style="color: white;">Logout</a>
        </div>
    </div>
    
    <div class="content">
        <div class="menu">
            <a href="addFood.jsp">Add Food</a>
            <a href="FoodServlet">View Foods</a>
            <a href="ReservationServlet">View Reservations</a>
        </div>
        
        <div class="stats-container">
            <div class="stat-card">
                <h3>Total Foods</h3>
                <p><%= totalFoods %></p>
            </div>
            <div class="stat-card">
                <h3>Available Foods</h3>
                <p><%= availableFoods %></p>
            </div>
            <div class="stat-card">
                <h3>Total Reservations</h3>
                <p><%= totalReservations %></p>
            </div>
            <div class="stat-card">
                <h3>Today's Reservations</h3>
                <p><%= todayReservations %></p>
            </div>
        </div>
        <h3>Welcome to the Admin Dashboard</h3>
        <p>You can manage foods and view reservations from here.</p>
    </div>
</body>
</html>