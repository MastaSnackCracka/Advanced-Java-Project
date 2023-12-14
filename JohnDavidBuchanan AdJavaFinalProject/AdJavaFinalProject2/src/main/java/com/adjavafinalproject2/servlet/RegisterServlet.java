package com.adjavafinalproject2.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.adjavafinalproject2.dao.UserDao;
import com.adjavafinalproject2.connection.DbConnection;
import com.adjavafinalproject2.model.User;

@WebServlet("/register-servlet")
public class RegisterServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("second_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try
		{
			UserDao userDao = new UserDao(DbConnection.getConnection());
			User newUser = new User();
			newUser.setFirst_name(firstName);
			newUser.setSecond_name(lastName);
			newUser.setEmail(email);
			newUser.setPassword(password); 

			boolean isRegistered = userDao.registerUser(newUser);

			if (isRegistered)
			{
				// Registration successful
				response.sendRedirect("registration-success.jsp");
			} else
			{
				// Registration failed
				response.sendRedirect("register.jsp?error=true");
			}
		} catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace(); // Log the exception
			response.sendRedirect("register.jsp?error=database");
		}
	}
}
