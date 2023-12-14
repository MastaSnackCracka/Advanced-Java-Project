package com.adjavafinalproject2.model;

import java.util.List;

public class Cart extends Product
{
	private List<Cart> items;

	private int quantity;

	private double originalPrice;

	public int getQuantity()
	{
		return quantity;
	}

	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}

	public int getTotalQuantity()
	{
		int totalQuantity = 0;
		for (Cart item : items)
		{
			totalQuantity += item.getQuantity();
		}
		return totalQuantity;
	}

	public double getOriginalPrice()
	{
		return originalPrice;
	}

	public void setOriginalPrice(double originalPrice)
	{
		this.originalPrice = originalPrice;
	}

}
