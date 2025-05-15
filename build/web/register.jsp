<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            background-image: url('Registrationbg.png');
                background-size: cover;
                background-repeat: no-repeat;
               background-position: center;
        }
        .register-container {
            opacity: 0.9;
            width: 350px;
            margin: 100px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
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
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="register-container">
        <h2 style="text-align: center">Sign Up or Log In</h2>
        <form action="RegisterServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" required>

            <label for="password">Password:</label>
            <input type="password" name="password" required>

            <label for="role">Role:</label>
            <input type="text" name="role" placeholder="e.g., Customer or Admin" required>

            <input type="submit" value="Register">

            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
        </form>

        <p style="text-align:center; margin-top:10px;">
            Already registered? <a href="login.jsp">Login here</a>
        </p>
    </div>
</body>
</html>