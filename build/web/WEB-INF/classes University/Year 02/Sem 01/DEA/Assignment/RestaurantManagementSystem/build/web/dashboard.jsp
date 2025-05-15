<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif;
               margin: 0;
               padding: 0;
/*               background-color: #f4f4f4;*/
                background-image: url('DashboardCover.png');
                background-size: cover;
                background-repeat: no-repeat;
               background-position: center;
               min-height: 100vh;
        }
        .header { background-color: #333; color: white; padding: 15px; text-align: center; }
        .menu { background-color: #ff4032; overflow: hidden; }
        .menu a { float: left; display: block; color: white; text-align: center; padding: 14px 16px; text-decoration: none; }
        .menu a:hover { background-color: #fff; color: black; }
        .content-m {
                    display: flex-item;
                   padding: 40px;
                   background-color: rgba(255, 255, 255, 0.9); 
                   margin: 40px auto;                         
                   padding: 30px;
                   width: 90%;
                   max-width: 1000px;
                   border-radius: 10px;
                   box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        .logout { float: right; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #ddd; }
        th, td { padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Admin Dashboard | by cafe</h1>
    </div>
    
    <div class="menu">
        <a href="dashboard.jsp">Home</a>
        <a href="FoodServlet">Manage Foods</a>
        <a href="ReservationServlet">View Reservations</a>
        <a href="addFood.jsp">Add New Food</a>
        <a class="logout" href="LogoutServlet">Logout</a>
    </div>
    
    <div class="content-m">
        <h2>Food Management</h2>
        <jsp:include page="foodList.jsp" />
    </div>
</body>
</html>