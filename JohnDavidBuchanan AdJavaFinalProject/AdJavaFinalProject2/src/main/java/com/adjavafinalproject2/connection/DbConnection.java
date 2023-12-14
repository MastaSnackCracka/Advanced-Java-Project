package com.adjavafinalproject2.connection;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection
{
	private static Connection connection = null;

	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if (connection == null)
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/adjava_final_project", "root",
					"n1nj@z112");
			System.out.print("connected");
		}
		return connection;
	}

}
