<%@page import="model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    System.out.println("User role in JSP: " + user.getRole());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <c:choose>
        <c:when test="${not empty foods}">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Ingredients</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="food" items="${foods}">
                    <tr>
                        <td>${food.id}</td>
                        <td>${food.title}</td>
                        <td>${food.ingredients}</td>
                        <td>${food.status}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.role == 'Admin'}">
                                    <form action="FoodServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${food.id}">
                                        <input type="submit" value="Delete" style="background-image: linear-gradient(to right,#ede174, #ff707c)">
                                    </form>
                                </c:when>
                                <c:when test="${food.status == 'Available'}">
                                    <a href="reserveForm.jsp?foodId=${food.id}">Reserve</a>
                                </c:when>
                                <c:otherwise>
                                    Reserved
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <p>No foods available at the moment.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>