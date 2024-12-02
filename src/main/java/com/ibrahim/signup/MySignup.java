package com.ibrahim.signup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.ibrahim.connection.MyConnectionClass;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/executesignup")
public class MySignup extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

		try {
			resp.setContentType("text/html");
			String UserName = req.getParameter("name");
			String UserEmail = req.getParameter("email");
			String UserPassword = req.getParameter("password");
			String UserPhone = req.getParameter("phone");

			Connection executeConnection = MyConnectionClass.GetConnection();
			String query = "insert into userdata(UserName,UserEmail,UserPassword,UserPhone) values(?,?,?,?)";
			PreparedStatement statement = executeConnection.prepareStatement(query);
			statement.setString(1, UserName);
			statement.setString(2, UserEmail);
			statement.setString(3, UserPassword);
			statement.setString(4, UserPhone);

			int executeUpdate = statement.executeUpdate();
			
			//Using Session object to save DB password.
			/*
			 * HttpSession session = req.getSession(); session.setAttribute("pswd",
			 * UserPassword);
			 */
	
			if (executeUpdate > 0) {
				RequestDispatcher successRequestDispatcher = req.getRequestDispatcher("login.jsp");
				successRequestDispatcher.forward(req, resp);
			} else {
				RequestDispatcher failedRequestDispatcher = req.getRequestDispatcher("signup.jsp");
				failedRequestDispatcher.forward(req, resp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
