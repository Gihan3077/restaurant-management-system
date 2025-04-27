<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User, model.Food, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Food List</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        .header { background-color: #333; color: white; padding: 10px 20px; display: flex; justify-content: space-between; }
        .content { padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f4f4f4; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .action-btns { display: flex; gap: 5px; }
        .btn { padding: 5px 10px; text-decoration: none; border-radius: 3px; }
        .btn-reserve { background-color: #4CAF50; color: white; }
        .btn-delete { background-color: #f44336; color: white; }
        .error { color: red; }
        
        .pagination { margin-top: 20px; display: flex; justify-content: center; }
        .pagination a { color: black; padding: 8px 16px; text-decoration: none; border: 1px solid #ddd; }
        .pagination a.active { background-color: #4CAF50; color: white; border: 1px solid #4CAF50; }
        .pagination a:hover:not(.active) { background-color: #ddd; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Food Menu</h2>
        <div>
            <% 
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    out.print("Welcome, " + user.getUsername() + " (" + user.getRole() + ") | ");
                    out.print("<a href=\"LogoutServlet\" style=\"color: white;\">Logout</a>");
                    if (user.getRole().equals("Admin")) {
                        out.print(" | <a href=\"dashboard.jsp\" style=\"color: white;\">Dashboard</a>");
                    }
                }
            %>
        </div>
    </div>
    
    <div class="content">
        <div class="error">${error}</div>
        
    <div class="filter-section">
        <form action="FoodServlet" method="get">
            <label for="category">Filter by Category:</label>
            <select id="category" name="category" onchange="this.form.submit()">
                <option value="">All Categories</option>
                <% 
                    List<String> categories = (List<String>) request.getAttribute("categories");
                    if (categories != null) {
                        for (String category : categories) {
                            String selected = request.getParameter("category") != null && 
                                            request.getParameter("category").equals(category) ? "selected" : "";
                %>
                <option value="<%= category %>" <%= selected %>><%= category %></option>
                <%      }
                    }
                %>
            </select>
        </form>
    </div>
 
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Ingredients</th>
                <th>Status</th>
                <th>Action</th>
                <th>Category</th>

            </tr>
            <%
                List<Food> foods = (List<Food>) request.getAttribute("foods");
                if (foods != null) {
                    for (Food food : foods) {
            %>
            <tr>
                <td><%= food.getId() %></td>
                <td><%= food.getTitle() %></td>
                <td><%= food.getIngredients() %></td>
                <td><%= food.getStatus() %></td>
                <td><%= food.getCategory() %></td>
                <td class="action-btns">
                    <% if (user != null && user.getRole().equals("Customer")) { %>
                        <a href="reserveForm.jsp?foodId=<%= food.getId() %>" class="btn btn-reserve">Reserve</a>
                    <% } else if (user != null && user.getRole().equals("Admin")) { %>
                        <form action="FoodServlet" method="post" style="display: inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= food.getId() %>">
                            <input type="submit" value="Delete" class="btn btn-delete">
                        </form>
                    <% } %>
                </td>
            </tr>
            <%      }
                }
            %>
        </table>
    </div>
        
    <div class="pagination">
        <% 
            int currentPage = (Integer) request.getAttribute("currentPage");
            int noOfPages = (Integer) request.getAttribute("noOfPages");
            String categoryParam = request.getParameter("category") != null ? 
                                 "&category=" + request.getParameter("category") : "";
        %>

        <% if (currentPage > 1) { %>
            <a href="FoodServlet?page=<%= currentPage-1 %><%= categoryParam %>">&laquo; Previous</a>
        <% } %>

        <% for (int i = 1; i <= noOfPages; i++) { %>
            <a href="FoodServlet?page=<%= i %><%= categoryParam %>" 
               class="<%= currentPage == i ? "active" : "" %>"><%= i %></a>
        <% } %>

        <% if (currentPage < noOfPages) { %>
            <a href="FoodServlet?page=<%= currentPage+1 %><%= categoryParam %>">Next &raquo;</a>
        <% } %>
    </div>
</body>
</html>