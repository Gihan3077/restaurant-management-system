<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Reserve Food</title>
    <style>
        body { font-family: Arial, sans-serif;
               background-color: #f4f4f4;
               background-image: url('Welcome.png');
               background-size: cover;
               background-repeat: no-repeat;
               background-position: center;
               min-height: 100vh;
        }
        .form-container { width: 400px;
                         margin: 50px auto;
                         padding: 20px;
                         background: #fff;
                         border-radius: 5px;
                         box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover { background-color: #45a049; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>make it OWN</h2>
        <form action="ReservationServlet" method="post">
            <input type="hidden" name="foodId" value="<%= request.getParameter("foodId") %>">
            
            <label for="customerName">Your Name:</label>
            <input type="text" id="customerName" name="customerName" required>
            
            <label for="customerPhone">Phone Number:</label>
            <input type="tel" id="customerPhone" name="customerPhone" required>
            
            <input type="submit" value="Reserve">
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
        </form>
    </div>
</body>
</html>