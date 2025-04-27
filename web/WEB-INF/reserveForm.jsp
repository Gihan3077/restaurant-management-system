<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User, model.Food, dao.FoodDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Reserve Food</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        .header { background-color: #333; color: white; padding: 10px 20px; display: flex; justify-content: space-between; }
        .content { padding: 20px; }
        form { max-width: 500px; margin: 20px auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input, select { width: 100%; padding: 8px; box-sizing: border-box; }
        button { background-color: #4CAF50; color: white; padding: 10px; border: none; cursor: pointer; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Reserve Food</h2>
        <div>
            <% 
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    out.print("Welcome, " + user.getUsername() + " (" + user.getRole() + ") | ");
                    out.print("<a href=\"LogoutServlet\" style=\"color: white;\">Logout</a>");
                }
            %>
        </div>
    </div>
    
    <div class="content">
        <div class="error">${error}</div>
        
        <form action="ReservationServlet" method="post">
            <%
                int foodId = Integer.parseInt(request.getParameter("foodId"));
                FoodDAO foodDao = new FoodDAO();
                Food food = foodDao.getAllFoods().stream()
                    .filter(f -> f.getId() == foodId)
                    .findFirst()
                    .orElse(null);
                
                if (food != null) {
            %>
            <div class="form-group">
                <label>Food:</label>
                <input type="text" value="<%= food.getTitle() %>" readonly>
                <input type="hidden" name="foodId" value="<%= food.getId() %>">
            </div>
            
            <div class="form-group">
                <label for="customerName">Your Name:</label>
                <input type="text" id="customerName" name="customerName" required>
            </div>
            
            <div class="form-group">
                <label for="customerPhone">Your Phone:</label>
                <input type="text" id="customerPhone" name="customerPhone" required>
            </div>
            
            <div class="form-group">
                <label for="customerEmail">Your Email:</label>
                <input type="email" id="customerEmail" name="customerEmail" required>
            </div>
            
            <button type="submit">Make Reservation</button>
            <% } else { %>
                <p>Food not found!</p>
            <% } %>
        </form>
    </div>
</body>
</html>