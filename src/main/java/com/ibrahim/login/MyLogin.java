package com.ibrahim.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.ibrahim.connection.MyConnectionClass;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/executeAgain")
public class MyLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        // Get user input from login form
        String currName = req.getParameter("username");
        String currPassword = req.getParameter("userpassword");

        try (Connection connection = MyConnectionClass.GetConnection()) {
            // Query to check if the username exists
            String query = "SELECT UserPassword FROM userdata WHERE UserName = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, currName);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Username exists, validate password
                String dbPassword = resultSet.getString("UserPassword");
                if (currPassword.equals(dbPassword)) {
                    // Username and password match, forward to success page
                    RequestDispatcher loginSuccessDispatcher = req.getRequestDispatcher("success.jsp");
                    loginSuccessDispatcher.forward(req, resp);
                } else {
                    // Password does not match
                    String errorMessage = "Incorrect password. Please try again.";
                    req.setAttribute("errorMessage", errorMessage);
                    RequestDispatcher errorDispatcher = req.getRequestDispatcher("login.jsp");
                    errorDispatcher.forward(req, resp);
                }
            } else {
                // Username does not exist
                String errorMessage = "User doesn't exist in the database! Please sign up first.";
                req.setAttribute("errorMessage", errorMessage);
                RequestDispatcher errorDispatcher = req.getRequestDispatcher("login.jsp");
                errorDispatcher.forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            String errorMessage = "An error occurred during login. Please try again later.";
            req.setAttribute("errorMessage", errorMessage);
            RequestDispatcher exceptionRequestDispatcher = req.getRequestDispatcher("login.jsp");
            exceptionRequestDispatcher.forward(req, resp);
        }
    }
}
