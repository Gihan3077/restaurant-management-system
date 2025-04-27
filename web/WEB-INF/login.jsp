<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .login-container { width: 300px; margin: 100px auto; padding: 20px; background: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        input[type="text"], input[type="password"] { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ddd; box-sizing: border-box; }
        button { background-color: #4CAF50; color: white; padding: 10px; border: none; width: 100%; cursor: pointer; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Restaurant Management System</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Login</button>
        </form>
        <div class="error">${errorMessage}</div>
    </div>
</body>
</html>