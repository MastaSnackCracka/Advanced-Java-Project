package com.adjavafinalproject2.servlet;

import java.util.ArrayList;

import com.adjavafinalproject2.connection.DbConnection;
import com.adjavafinalproject2.dao.ProductDao;
import com.adjavafinalproject2.model.Cart;
import com.adjavafinalproject2.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF=8");
		try (PrintWriter out = response.getWriter())
		{

			ArrayList<Cart> cartList = new ArrayList<>();

			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);

			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

			if (cart_list == null)
			{
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);

				response.sendRedirect("cart.jsp");

			} else
			{
				// out.print("cart list exist");
				cartList = cart_list;

				boolean exist = false;

				// cartList.contains(cm);this for each loop is c: for our session id
				for (Cart c : cart_list)
				{
					if (c.getId() == id)
					{
						exist = true;
						out.println(
								"<h3 style='color:crimson, text-align:center'> Item already exist on the Cart.<a href='cart.jsp'> Go to Cart Page</a></h3>");

					}
				}
				if (!exist)
				{
					// Fetch the product details to get the correct price
					ProductDao prodDao = new ProductDao(DbConnection.getConnection());
					Product product = prodDao.getProductDetails(id);

					cm.setOriginalPrice(product.getPrice());
					cartList.add(cm);
					response.sendRedirect("cart.jsp");

				}
			}

			// for(Cart c:cart_list) {
			// out.println(c.getId());
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
