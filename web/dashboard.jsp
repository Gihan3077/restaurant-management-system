<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #ff4032;
            --secondary: #333;
            --light: #f8f9fa;
            --dark: #343a40;
            --success: #28a745;
            --info: #17a2b8;
            --warning: #ffc107;
            --danger: #dc3545;
        }
        
        body { 
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('DashboardCover.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            color: #333;
        }
        
        .header { 
            background-color: var(--secondary); 
            color: white; 
            padding: 15px; 
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .menu { 
            background-color: var(--primary); 
            display: flex;
            justify-content: space-between;
            padding: 0 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .menu a { 
            color: white; 
            text-align: center; 
            padding: 14px 16px; 
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .menu a:hover { 
            background-color: rgba(255,255,255,0.2); 
        }
        
        .menu a i {
            margin-right: 8px;
        }
        
        .dashboard-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            border-left: 4px solid var(--primary);
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
        }
        
        .stat-card i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 15px;
        }
        
        .stat-card h3 {
            margin: 0;
            font-size: 1rem;
            color: #666;
            font-weight: 500;
        }
        
        .stat-card .value {
            font-size: 2.2rem;
            font-weight: 600;
            margin: 10px 0;
            color: var(--secondary);
        }
        
        .content-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .content-card h2 {
            margin-top: 0;
            color: var(--secondary);
            border-bottom: 2px solid var(--primary);
            padding-bottom: 10px;
            display: inline-block;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            background-color: var(--light);
            font-weight: 600;
            color: var(--dark);
        }
        
/*        tr:hover {
            background-color: rgba(0,0,0,0.02);
        }*/
        
        .btn {
            padding: 8px 15px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        .btn-primary {
            background-color: var(--primary);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #e6392b;
        }
        
        @media (max-width: 768px) {
            .menu {
                flex-direction: column;
                padding: 0;
            }
            
            .stats-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1><i class="fas fa-utensils"></i> Admin Dashboard | by Cafe</h1>
    </div>
    
    <div class="menu">
        <div>
            <a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
            <a href="FoodServlet?fromMenu=true"><i class="fas fa-utensils"></i> Food Menu</a>
            <a href="ReservationServlet"><i class="fas fa-calendar-check"></i> Reservations</a>
            <a href="addFood.jsp"><i class="fas fa-plus-circle"></i> Add Food</a>
        </div>
        <div>
            <a class="logout" href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
    
    <div class="dashboard-container">
        <div class="stats-container">
            <div class="stat-card">
                <i class="fas fa-hamburger"></i>
                <h3>Total Menu Items</h3>
                <div class="value">${totalFoodItems}</div>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h3>Available Items</h3>
                <div class="value">${availableFoodItems}</div>
            </div>
            <div class="stat-card">
                <i class="fas fa-calendar-alt"></i>
                <h3>Today's Reservations</h3>
                <div class="value">${todaysReservations}</div>
            </div>
            <div class="stat-card">
                <i class="fas fa-users"></i>
                <h3>Total Customers</h3>
                <div class="value">${totalCustomers}</div>
            </div>
        </div>
        
        <div class="content-card">
            <h2><i class="fas fa-utensils"></i> Food Management</h2>
            <jsp:include page="foodList.jsp" />
        </div>
    </div>
</body>
</html>