package controller;

import dao.FoodDAO;
import model.Reservation;
import dao.ReservationDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Food;
import util.EmailUtil;

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
    String customerEmail = request.getParameter("customerEmail"); // Add this field to reserveForm.jsp
    int foodId = Integer.parseInt(request.getParameter("foodId"));
    
    Reservation reservation = new Reservation();
    reservation.setCustomerName(customerName);
    reservation.setCustomerPhone(customerPhone);
    reservation.setFoodId(foodId);
    
    ReservationDAO reservationDao = new ReservationDAO();
    if (reservationDao.addReservation(reservation)) {
        // Send email notification
        FoodDAO foodDao = new FoodDAO();
        Food food = foodDao.getAllFoods().stream()
            .filter(f -> f.getId() == foodId)
            .findFirst()
            .orElse(null);
        
        if (food != null && customerEmail != null && !customerEmail.isEmpty()) {
            String subject = "Your Reservation Confirmation";
            String body = "Dear " + customerName + ",\n\n" +
                         "Thank you for your reservation!\n\n" +
                         "Food: " + food.getTitle() + "\n" +
                         "Ingredients: " + food.getIngredients() + "\n" +
                         "Reservation Date: " + new java.util.Date() + "\n\n" +
                         "We look forward to serving you!\n\n" +
                         "Best regards,\n" +
                         "Restaurant Management Team";
            
            EmailUtil.sendEmail(customerEmail, subject, body);
        }
        
        response.sendRedirect("FoodServlet");
    } else {
        request.setAttribute("error", "Failed to make reservation");
        request.getRequestDispatcher("reserveForm.jsp").forward(request, response);
    }
}
}