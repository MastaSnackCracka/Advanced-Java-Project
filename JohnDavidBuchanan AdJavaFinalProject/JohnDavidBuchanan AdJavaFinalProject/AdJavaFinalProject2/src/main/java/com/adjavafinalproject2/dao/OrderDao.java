package com.adjavafinalproject2.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.adjavafinalproject2.model.Order;
import com.adjavafinalproject2.model.Product;

public class OrderDao
{
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet res;

	public OrderDao(Connection con)
	{
		this.con = con;
	}

	public boolean insertOrder(Order oModel)
	{
		boolean result = false;

		try
		{
			query = "INSERT INTO orders(id, user_id, quantity, date) VALUES(?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, oModel.getId());
			pst.setInt(2, oModel.getUser_id());
			pst.setInt(3, oModel.getProduct_id());
			pst.setInt(3, oModel.getQuantity());
			pst.setString(4, oModel.getDate());
			pst.executeUpdate();
			result = true;

		} catch (Exception e)
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return result;
	}

	public List<Order> userOrder(int id)
	{
		List<Order> list = new ArrayList<>();

		try
		{
			query = "SELECT * FROM orders WHERE u_id = ? ORDER BY orders.o_id DESC";

			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			res = pst.executeQuery();

			while (res.next())
			{
				Order order = new Order();
				ProductDao pDao = new ProductDao(this.con);
				int pId = res.getInt("p_id");

				Product product = pDao.getSingleProduct(pId);
				order.setId(res.getInt("id"));
				order.setId(pId);
				order.setProduct_id(product.getId());
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setPrice(product.getPrice());
				order.setQuantity(res.getInt("quantity"));
				order.setDate(res.getString("date"));
				list.add(order);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return list;
	}

	public void cancelOrder(int id)
	{
		try
		{
			query = "DELETE FROM orders WHERE o_id = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
