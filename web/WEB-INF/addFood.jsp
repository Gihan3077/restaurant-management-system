<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Food</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        .header { background-color: #333; color: white; padding: 10px 20px; display: flex; justify-content: space-between; }
        .content { padding: 20px; }
        form { max-width: 500px; margin: 20px auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input, textarea, select { width: 100%; padding: 8px; box-sizing: border-box; }
        button { background-color: #4CAF50; color: white; padding: 10px; border: none; cursor: pointer; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Add New Food</h2>
        <div>
            <% 
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    out.print("Welcome, " + user.getUsername() + " (" + user.getRole() + ") | ");
                    out.print("<a href=\"LogoutServlet\" style=\"color: white;\">Logout</a>");
                    out.print(" | <a href=\"dashboard.jsp\" style=\"color: white;\">Dashboard</a>");
                }
            %>
        </div>
    </div>
 
    <div class="content">
        <div class="error">${error}</div>
        
        <form action="FoodServlet" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="form-group">
                <label for="title">Food Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            
            <div class="form-group">
                <label for="ingredients">Ingredients:</label>
                <textarea id="ingredients" name="ingredients" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status" required>
                    <option value="Available">Available</option>
                    <option value="Out of Stock">Out of Stock</option>
                </select>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <select id="category" name="category" required>
                    <% 
                        List<String> categories = foodDao.getAllCategories();
                        for (String category : categories) {
                    %>
                    <option value="<%= category %>"><%= category %></option>
                    <% } %>
                </select>
            </div>
            
            <button type="submit">Add Food</button>
        </form>
    </div>
</body>
</html>