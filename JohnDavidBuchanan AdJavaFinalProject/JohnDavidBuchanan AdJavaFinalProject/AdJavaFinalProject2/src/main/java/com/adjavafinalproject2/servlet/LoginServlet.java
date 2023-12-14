package com.adjavafinalproject2.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.adjavafinalproject2.model.User;
import com.adjavafinalproject2.dao.UserDao;
import com.adjavafinalproject2.connection.DbConnection;

@WebServlet("/login-servlet")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try
		{
			UserDao userDao = new UserDao(DbConnection.getConnection());
			User user = userDao.userLogin(email, password);

			if (user != null)
			{
				// User is authenticated
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("loggedIn.jsp");
			} else
			{
				// Authentication failed
				response.sendRedirect("login.jsp?error=true");
			}
		} catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace(); // Log the exception
			// Handle the error appropriately
			response.sendRedirect("login.jsp?error=database");
		}
	}
}
