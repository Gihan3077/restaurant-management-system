<%@ page import="com.restaurant.model.Order" %>
<%@ page import="java.util.List" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<table>
    <tr>
        <th>Order ID</th>
        <th>Table</th>
        <th>Status</th>
    </tr>
    <% for (Order order : orders) { %>
    <tr>
        <td><%= order.getOrderId() %></td>
        <td><%= order.getTableId() %></td>
        <td><%= order.getStatus() %></td>
    </tr>
    <% } %>
</table>