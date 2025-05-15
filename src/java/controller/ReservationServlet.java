package controller;

import dao.ReservationDAO;
import dao.FoodDAO;
import model.Reservation;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReservationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ReservationDAO reservationDao = new ReservationDAO();
        List<Reservation> reservations = reservationDao.getAllReservations();
        
        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("viewReservations.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        int foodId = Integer.parseInt(request.getParameter("foodId"));
        
        Reservation reservation = new Reservation();
        reservation.setCustomerName(customerName);
        reservation.setCustomerPhone(customerPhone);
        reservation.setFoodId(foodId);
        
        ReservationDAO reservationDao = new ReservationDAO();
        FoodDAO foodDao = new FoodDAO();
        
        try {
            // Start transaction
            // Update food status first
            if (foodDao.updateFoodStatus(foodId, "Reserved")) {
                // Then create reservation
                if (reservationDao.addReservation(reservation)) {
                    response.sendRedirect("searchFood.jsp?success=true");
                } else {
                    // Rollback food status if reservation fails
                    foodDao.updateFoodStatus(foodId, "Available");
                    request.setAttribute("errorMessage", "Failed to make reservation");
                    request.getRequestDispatcher("reserveForm.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Food is not available for reservation");
                request.getRequestDispatcher("reserveForm.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "System error during reservation");
            request.getRequestDispatcher("reserveForm.jsp").forward(request, response);
        }
    }
}