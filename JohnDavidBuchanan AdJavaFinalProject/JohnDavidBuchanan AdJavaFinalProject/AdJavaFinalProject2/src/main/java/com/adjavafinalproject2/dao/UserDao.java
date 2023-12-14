package com.adjavafinalproject2.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.adjavafinalproject2.model.User;

public class UserDao
{
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet res;

	public UserDao(Connection con)
	{
		this.con = con;
	}

	public User userLogin(String email, String password)
	{
		User user = null;
		try
		{
			query = "SELECT * FROM users where email=? AND password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			res = pst.executeQuery();

			if (res.next())
			{
				user = new User();
				user.setId(res.getInt("id"));
				user.setFirst_name(res.getString("first_name"));
				user.setSecond_name(res.getString("second_name"));
				user.setEmail(res.getString("email"));
			}

		} catch (Exception e)
		{
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;

	}

	public boolean registerUser(User user)
	{
		boolean result = false;
		try
		{
			query = "INSERT INTO users (first_name, second_name, email, password) VALUES (?, ?, ?, ?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, user.getFirst_name());
			pst.setString(2, user.getSecond_name());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPassword());

			int rowsAffected = pst.executeUpdate();
			if (rowsAffected > 0)
			{
				result = true;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
			System.out.print(e.getMessage());
		} finally
		{
			try
			{
				if (pst != null)
					pst.close();
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		return result;
	}
}
