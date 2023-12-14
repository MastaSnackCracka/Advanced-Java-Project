package com.adjavafinalproject2.model;

public class User
{
	private int id;
	private String first_name;
	private String second_name;
	private String username;
	private String email;
	private String password;
	private boolean is_staff;
	private boolean is_active;

	public User()
	{

	}

	public User(int id, String first_name, String second_name, String username, String email, String password,
			boolean is_staff, boolean is_active)
	{
		this.id = id;
		this.first_name = first_name;
		this.second_name = second_name;
		this.username = username;
		this.email = email;
		this.password = password;
		this.is_staff = is_staff;
		this.is_active = is_active;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getFirst_name()
	{
		return first_name;
	}

	public void setFirst_name(String first_name)
	{
		this.first_name = first_name;
	}

	public String getSecond_name()
	{
		return second_name;
	}

	public void setSecond_name(String second_name)
	{
		this.second_name = second_name;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public boolean getIs_staff()
	{
		return is_staff;
	}

	public void setIs_staff(boolean is_staff)
	{
		this.is_staff = is_staff;
	}

	public boolean getIs_active()
	{
		return is_active;
	}

	public void setIs_active(boolean is_active)
	{
		this.is_active = is_active;
	}
}
