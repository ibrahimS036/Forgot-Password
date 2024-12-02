package com.ibrahim.changepassword;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.ibrahim.connection.MyConnectionClass;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updatePassword")
public class UpdatePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/html");
			String userName = req.getParameter("UserName");
			String confirmPasssword = req.getParameter("confirmPassword");

			Connection connection = MyConnectionClass.GetConnection();
			String query = "update userdata set UserPassword=? where UserName=? ";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, confirmPasssword);
			statement.setString(2, userName);

			int rowEffected = statement.executeUpdate();
			if (rowEffected > 0) {
				String successMessage = "Password changed successfully.";
				req.setAttribute("successMessage", successMessage);
				RequestDispatcher successRequestDispatcher = req.getRequestDispatcher("changePassword.jsp");
				successRequestDispatcher.forward(req, resp);
			} else {
				String errorMessage = "Updation failed...try again!";
				req.setAttribute("errorMessage", errorMessage);
				RequestDispatcher errorRequestDispatcher = req.getRequestDispatcher("changePassword.jsp");
				errorRequestDispatcher.forward(req, resp);

			}

		} catch (Exception e) {
			// In case of error, set a general error message
			String errorMessage = "An error occurred while updating password.";
			req.setAttribute("errorMessage", errorMessage);
			RequestDispatcher errorRequestDispatcher = req.getRequestDispatcher("changePassword.jsp");
			errorRequestDispatcher.forward(req, resp);
		}
	}

}
