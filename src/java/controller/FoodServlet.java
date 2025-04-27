package controller;

import model.Food;
import dao.FoodDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    int page = 1;
    int recordsPerPage = 5;
    
    if (request.getParameter("page") != null) {
        page = Integer.parseInt(request.getParameter("page"));
    }
    
    String category = request.getParameter("category");
    
    FoodDAO foodDao = new FoodDAO();
    List<Food> foods = foodDao.getFoodsPaginated(page, recordsPerPage, category);
    int noOfRecords = foodDao.getFoodCount(category);
    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
    
    request.setAttribute("foods", foods);
    request.setAttribute("categories", foodDao.getAllCategories());
    request.setAttribute("noOfPages", noOfPages);
    request.setAttribute("currentPage", page);
    request.getRequestDispatcher("foodList.jsp").forward(request, response);
}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        FoodDAO foodDao = new FoodDAO();
        
        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String ingredients = request.getParameter("ingredients");
            String status = request.getParameter("status");
            
            Food food = new Food();
            food.setTitle(title);
            food.setIngredients(ingredients);
            food.setStatus(status);
            
            if (foodDao.addFood(food)) {
                response.sendRedirect("FoodServlet");
            } else {
                request.setAttribute("error", "Failed to add food");
                request.getRequestDispatcher("addFood.jsp").forward(request, response);
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (foodDao.deleteFood(id)) {
                response.sendRedirect("FoodServlet");
            } else {
                request.setAttribute("error", "Failed to delete food");
                request.getRequestDispatcher("foodList.jsp").forward(request, response);
            }
        }
    }
}