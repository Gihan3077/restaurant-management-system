<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .register-container { width: 300px; margin: 100px auto; padding: 20px; background: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        input[type="text"], input[type="password"] { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ddd; box-sizing: border-box; }
        button { background-color: #4CAF50; color: white; padding: 10px; border: none; width: 100%; cursor: pointer; }
        .error { color: red; }
        .success { color: green; }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Register</button>
        </form>
        <div class="error">${errorMessage}</div>
        <% if ("success".equals(request.getParameter("registration"))) { %>
            <div class="success">Registration successful! Please login.</div>
        <% } %>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>