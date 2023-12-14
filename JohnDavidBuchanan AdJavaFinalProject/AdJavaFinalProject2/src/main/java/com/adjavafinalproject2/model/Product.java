package com.adjavafinalproject2.model;

public class Product
{
	private int id;
	private String name;
	private String category;
	private String description;
	private double price;
	private String image1;
	private String image2;
	private String image3;
	private String char_race;
	private String char_class;

	public Product()
	{

	}

	public Product(int id, String name, String category, String description, double price, String image1, String image2,
			String image3, String char_race, String char_class)
	{
		this.id = id;
		this.name = name;
		this.category = category;
		this.description = description;
		this.price = price;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.char_race = char_race;
		this.char_class = char_class;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getCategory()
	{
		return category;
	}

	public void setCategory(String category)
	{
		this.category = category;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public double getPrice()
	{
		return price;
	}

	public void setPrice(double price)
	{
		this.price = price;
	}

	public String getImage1()
	{
		return image1;
	}

	public void setImage1(String image1)
	{
		this.image1 = image1;
	}

	public String getImage2()
	{
		return image2;
	}

	public void setImage2(String image2)
	{
		this.image2 = image2;
	}

	public String getImage3()
	{
		return image3;
	}

	public void setImage3(String image3)
	{
		this.image3 = image3;
	}

	public String getChar_race()
	{
		return char_race;
	}

	public void setChar_race(String char_race)
	{
		this.char_race = char_race;
	}

	public String getChar_class()
	{
		return char_class;
	}

	public void setChar_class(String char_class)
	{
		this.char_class = char_class;
	}

}
