package controller;

import dao.FoodDAO;
import model.Food;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

public class FoodServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
        FoodDAO foodDao = new FoodDAO();
        
        List<Food> foods = foodDao.getAllFoods();
        request.setAttribute("foods", foods);

    HttpSession session = request.getSession(false);
    User user = (User) session.getAttribute("user");
    
    if (user != null && user.getRole().equals("Admin")) {
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    } else {
        request.getRequestDispatcher("searchFood.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        FoodDAO foodDao = new FoodDAO();
        
        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String ingredients = request.getParameter("ingredients");
            
            Food food = new Food();
            food.setTitle(title);
            food.setIngredients(ingredients);
            
            if (foodDao.addFood(food)) {
                response.sendRedirect("FoodServlet");
            } else {
                request.setAttribute("errorMessage", "Failed to add food");
                request.getRequestDispatcher("addFood.jsp").forward(request, response);
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (foodDao.deleteFood(id)) {
                response.sendRedirect("FoodServlet");
            } else {
                request.setAttribute("errorMessage", "Failed to delete food");
                request.getRequestDispatcher("foodList.jsp").forward(request, response);
            }
        }
    }
}
