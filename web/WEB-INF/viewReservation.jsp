<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Reservations</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }
        .content { padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid #ddd; }
        th, td { padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        
        .cancelled { background-color: #ffdddd; }
        .action-btn { 
            padding: 5px 10px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .action-btn:hover { background-color: #d32f2f; }
    </style>
</head>

<body>
    <jsp:include page="dashboard.jsp" />
    
    <div class="content">
        <h2>All Reservations</h2>
        
        <%-- Success message --%>
        <c:if test="${not empty param.success}">
            <p style="color: green;">${param.success}</p>
        </c:if>
        
        <table>
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Phone</th>
                <th>Food ID</th>
                <th>Status</th>
                <th>Reservation Date/Time</th>
                <th>Action</th>
            </tr>
            <c:forEach var="reservation" items="${reservations}">
                <tr class="${reservation.status == 'Cancelled' ? 'cancelled' : ''}">
                    <td>${reservation.id}</td>
                    <td>${reservation.customerName}</td>
                    <td>${reservation.customerPhone}</td>
                    <td>${reservation.foodId}</td>
                    <td>${reservation.status}</td>
                    <td>${reservation.reservationDate}</td>
                    <td>
                        <c:if test="${reservation.status != 'Cancelled'}">
                            <form action="CancelReservationServlet" method="post" style="display: inline;">
                                <input type="hidden" name="reservationId" value="${reservation.id}">
                                <input type="hidden" name="foodId" value="${reservation.foodId}">
                                <button type="submit" class="action-btn">Cancel</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>