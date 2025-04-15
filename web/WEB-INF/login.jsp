<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Library Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
    <header class="header">
        <div class="container header-content">
            <div class="logo">Library System</div>
        </div>
    </header>

    <main class="container">
        <div class="form-container">
            <h1 class="text-center">ForestRock Login</h1>
            
            <c:if test="${not empty param.registered}">
                <div class="alert alert-success">
                    Registration successful! Please login.
                </div>
            </c:if>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>
            
            <form action="auth" method="post">
                <input type="hidden" name="action" value="login">
                
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <br>
                <button type="submit" class="btn btn-block">Login</button>
            </form>
            
            <div class="text-center mt-3"><br>
                <p>New User? <a href="register.jsp">Register Here</a></p>
            </div>
        </div>
    </main>
</body>
</html>