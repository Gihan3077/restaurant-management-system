<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add New Food</title>
    <style>
        body { font-family: Arial, sans-serif;
               background-color: #f4f4f4;
               background-image: url('AddFoodbg.png');
               background-size: cover;
               background-repeat: no-repeat;
               background-position: center;
               min-height: 100vh;
        }
        .form-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type="text"], textarea { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; width: 100%; }
        input[type="submit"]:hover { background-color: #45a049; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Food</h2>
        <form action="FoodServlet" method="post">
            <input type="hidden" name="action" value="add">
            
            <label for="title">Food Title:</label>
            <input type="text" id="title" name="title" required>
            
            <label for="ingredients">Ingredients:</label>
            <textarea id="ingredients" name="ingredients" rows="4" required></textarea>
            
            <input type="submit" value="Add Food">
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
            
            <a href="dashboard.jsp">back to the dashboard</a>
        </form>
    </div>
</body>
</html>