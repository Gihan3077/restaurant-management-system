<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User, model.Reservation, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Reservations</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        .header { background-color: #333; color: white; padding: 10px 20px; display: flex; justify-content: space-between; }
        .content { padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f4f4f4; }
        tr:nth-child(even) { background-color: #f9f9f9; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Reservations</h2>
        <div>
            <% 
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    out.print("Welcome, " + user.getUsername() + " (" + user.getRole() + ") | ");
                    out.print("<a href=\"LogoutServlet\" style=\"color: white;\">Logout</a>");
                    out.print(" | <a href=\"dashboard.jsp\" style=\"color: white;\">Dashboard</a>");
                }
            %>
        </div>
    </div>
    
    <div class="content">
        <table>
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Customer Phone</th>
                <th>Food</th>
                <th>Reservation Date</th>
            </tr>
            <%
                List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                if (reservations != null) {
                    for (Reservation reservation : reservations) {
            %>
            <tr>
                <td><%= reservation.getId() %></td>
                <td><%= reservation.getCustomerName() %></td>
                <td><%= reservation.getCustomerPhone() %></td>
                <td><%= reservation.getFoodId() %></td>
                <td><%= reservation.getReservationDate() %></td>
            </tr>
            <%      }
                }
            %>
        </table>
    </div>
</body>
</html>