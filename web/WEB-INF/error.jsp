<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        .error-container { max-width: 600px; margin: 0 auto; }
        h1 { color: #d9534f; }
        a { color: #337ab7; text-decoration: none; }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Error Occurred</h1>
        <p>${errorMessage}</p>
        <p><a href="login.jsp">Return to Login Page</a></p>
    </div>
</body>
</html>