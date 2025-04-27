package controller;

import model.User;
import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "Customer"; // Default role for new users
        
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);
        
        UserDAO userDao = new UserDAO();
        if (userDao.registerUser(user)) {
            response.sendRedirect("login.jsp?registration=success");
        } else {
            request.setAttribute("errorMessage", "Registration failed. Username may already exist.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}