package com.restaurant.controller;

import com.restaurant.dao.UserDAO;
import com.restaurant.model.User;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserDAO userDao = new UserDAO();
        User user = userDao.getUser(email, password);
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            switch(user.getRole()) {
                case "admin":
                    response.sendRedirect("WEB-INF/views/admin/dashboard.jsp");
                    break;
                case "staff":
                    response.sendRedirect("WEB-INF/views/staff/dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}