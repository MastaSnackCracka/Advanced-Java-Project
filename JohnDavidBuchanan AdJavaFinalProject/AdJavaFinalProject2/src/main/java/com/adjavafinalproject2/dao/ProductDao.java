package com.adjavafinalproject2.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.adjavafinalproject2.model.Cart;
import com.adjavafinalproject2.model.Product;

public class ProductDao
{
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet res;

	public ProductDao(Connection con)
	{
		super();
		this.con = con;
	}

	// show list of products on the product list in index
	public List<Product> getAllProducts()
	{
		List<Product> products = new ArrayList<Product>();
		try
		{
			query = "Select * FROM products";
			pst = this.con.prepareStatement(query);
			res = pst.executeQuery();

			while (res.next())
			{
				Product row = new Product();
				row.setId(res.getInt("id"));
				row.setName(res.getString("name"));
				row.setCategory(res.getString("category"));
				row.setPrice(res.getDouble("price"));
				row.setImage1(res.getString("image1"));
				row.setImage2(res.getString("image2"));
				row.setImage3(res.getString("image3"));

				products.add(row);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return products;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList)
	{
		List<Cart> products = new ArrayList<Cart>();

		try
		{
			if (cartList.size() > 0)
			{
				for (Cart item : cartList)
				{
					query = "SELECT * FROM products WHERE id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					res = pst.executeQuery();
					while (res.next())
					{
						Cart row = new Cart();
						row.setId(res.getInt("id"));
						row.setName(res.getString("name"));
						row.setCategory(res.getString("category"));
						row.setPrice(res.getDouble("price"));
						row.setQuantity(item.getQuantity());
						row.setOriginalPrice(res.getDouble("price")); // Set the originalPrice to the actual product
																		// price
						products.add(row);
					}
				}
			}
		} catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return products;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList)
	{
		double sum = 0;

		try
		{
			if (cartList.size() > 0)
			{
				for (Cart item : cartList)
				{
					query = "select price from products WHERE id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					res = pst.executeQuery();
					while (res.next())
					{
						sum += res.getDouble("price") * item.getQuantity();
					}

				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return sum;
	}

	public Product getSingleProduct(int id)
	{
		Product row = null;
		try
		{
			query = "SELECT * FROM products WHERE id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			res = pst.executeQuery();
			while (res.next())
			{
				row = new Product();
				row.setId(res.getInt("id"));
				row.setName(res.getString("name"));
				row.setCategory(res.getString("category"));
				row.setPrice(res.getDouble("price"));
				row.setImage1(res.getString("image1"));
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return row;
	}

	public List<Product> getCategoryProducts(String category)
	{
		List<Product> products = new ArrayList<>();

		try
		{
			if ("All".equalsIgnoreCase(category))
			{
				// Fetch all products if "All" is selected
				query = "SELECT * FROM products";
				pst = this.con.prepareStatement(query);
			} else
			{
				query = "SELECT * FROM products WHERE category=?";
				pst = this.con.prepareStatement(query);
				pst.setString(1, category);
			}
			res = pst.executeQuery();

			while (res.next())
			{
				Product product = new Product();
				product.setId(res.getInt("id"));
				product.setName(res.getString("name"));
				product.setCategory(res.getString("category"));
				product.setChar_race(res.getString("char_race"));
				product.setChar_class(res.getString("char_class"));
				product.setDescription(res.getString("description"));
				product.setPrice(res.getDouble("price"));
				product.setImage1(res.getString("image1"));
				product.setImage2(res.getString("image2"));
				product.setImage3(res.getString("image3"));

				products.add(product);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return products;
	}

	public double getTotalCartPrice(List<Cart> cartItems)
	{
		double total = 0;

		try
		{
			if (cartItems != null && !cartItems.isEmpty())
			{
				for (Cart item : cartItems)
				{
					total += item.getOriginalPrice() * item.getQuantity();
				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return total;
	}

	public Product getProductDetails(int productId)
	{
		Product product = null;
		try
		{
			query = "SELECT * FROM products WHERE id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, productId);
			res = pst.executeQuery();

			while (res.next())
			{
				product = new Product();
				product.setId(res.getInt("id"));
				product.setName(res.getString("name"));
				product.setCategory(res.getString("category"));
				product.setChar_race(res.getString("char_race"));
				product.setChar_class(res.getString("char_class"));
				product.setDescription(res.getString("description"));
				product.setPrice(res.getDouble("price"));
				product.setImage1(res.getString("image1"));
				product.setImage2(res.getString("image2"));
				product.setImage3(res.getString("image3"));
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return product;
	}
}
