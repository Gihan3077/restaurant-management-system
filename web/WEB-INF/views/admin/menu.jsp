<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu Management</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <%@ include file="../shared/header.jsp" %>
    
    <div class="dashboard-container">
        <div class="sidebar">
            <ul>
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="menu.jsp" class="active">Menu Management</a></li>
                <li><a href="tables.jsp">Table Management</a></li>
                <li><a href="reports.jsp">Reports</a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <h1>Menu Management</h1>
            
            <div class="action-bar">
                <button onclick="showAddItemModal()">Add New Item</button>
                <select onchange="filterByCategory(this.value)">
                    <option value="all">All Categories</option>
                    <option value="Starter">Starters</option>
                    <option value="Main">Mains</option>
                    <option value="Dessert">Desserts</option>
                    <option value="Drink">Drinks</option>
                </select>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Availability</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${menuItems}">
                        <tr>
                            <td>${item.itemId}</td>
                            <td>${item.name}</td>
                            <td>${item.category}</td>
                            <td>$${item.price}</td>
                            <td>
                                <label class="switch">
                                    <input type="checkbox" ${item.available ? 'checked' : ''} 
                                           onchange="toggleAvailability(${item.itemId}, this.checked)">
                                    <span class="slider round"></span>
                                </label>
                            </td>
                            <td>
                                <button onclick="editItem(${item.itemId})">Edit</button>
                                <button onclick="deleteItem(${item.itemId})">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Add Item Modal -->
    <div id="addItemModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideAddItemModal()">&times;</span>
            <h2>Add New Menu Item</h2>
            <form id="addItemForm" action="../OrderServlet?action=addMenuItem" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="itemName">Name:</label>
                    <input type="text" id="itemName" name="itemName" required>
                </div>
                <div class="form-group">
                    <label for="itemDescription">Description:</label>
                    <textarea id="itemDescription" name="itemDescription"></textarea>
                </div>
                <div class="form-group">
                    <label for="itemCategory">Category:</label>
                    <select id="itemCategory" name="itemCategory" required>
                        <option value="Starter">Starter</option>
                        <option value="Main">Main</option>
                        <option value="Dessert">Dessert</option>
                        <option value="Drink">Drink</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="itemPrice">Price:</label>
                    <input type="number" id="itemPrice" name="itemPrice" step="0.01" min="0" required>
                </div>
                <div class="form-group">
                    <label for="itemImage">Image:</label>
                    <input type="file" id="itemImage" name="itemImage" accept="image/*">
                </div>
                <button type="submit">Add Item</button>
            </form>
        </div>
    </div>
    
    <%@ include file="../shared/footer.jsp" %>
    <script src="../script.js"></script>
</body>
</html>