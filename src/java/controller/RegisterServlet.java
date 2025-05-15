package controller;

import model.User;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/librarydbnew", "root", ""); 

            // Check if username already exists
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("errorMessage", "Username already taken.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Insert new user
            PreparedStatement insertStmt = conn.prepareStatement(
                "INSERT INTO users (username, password, role) VALUES (?, ?, ?)");
            insertStmt.setString(1, username);
            insertStmt.setString(2, password);
            insertStmt.setString(3, role);

            int rowsInserted = insertStmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Internal error occurred.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}