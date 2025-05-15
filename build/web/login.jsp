<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <style>
        body { font-family: Arial, sans-serif;
               background-color: #f4f4f4;
               
               background-image: url('Welcome.png');
                background-size: cover;
                background-repeat: no-repeat;
               background-position: center;
        }
        .login-container {
            opacity: 0.9;
            width: 350px;
            margin: 100px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="password"] { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        input[type="submit"] { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; width: 100%; }
        input[type="submit"]:hover { background-color: #45a049; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 style="text-align: center">Sign Up or Log In</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Login">
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
            
            <!-- Register Link -->
        <a class="register-link" href="register.jsp">Don't have an account? Register here</a>
        </form>
    </div>
</body>
</html>