<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    System.out.println("User role: " + user.getRole());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Food</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }
        .header { background-color: #333; color: white; padding: 15px; text-align: center; }
        .menu { background-color: #ffdc00; overflow: hidden; }
        .menu a { float: left; display: block; color: #112203; text-align: center; padding: 14px 16px; text-decoration: none; }
        .menu a:hover { background-color: #ddd; color: black; }
        .content { padding: 20px; }
        .logout { float: right; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #ddd; }
        th, td { padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .success { color: green; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Customer Dashboard</h1>
    </div>
    
    <div class="menu">
        <a href="FoodServlet">Search Food</a> <!-- Changed to link directly to FoodServlet -->
        <a class="logout" href="LogoutServlet">Logout</a>
    </div>
    
    <div class="content">
        <h2>Available Foods</h2>
        
        <% if ("true".equals(request.getParameter("success"))) { %>
            <p class="success">Reservation made successfully!</p>
        <% } %>
        
        <jsp:include page="foodList.jsp" />
    </div>
</body>
</html>