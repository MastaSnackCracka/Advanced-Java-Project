<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.adjavafinalproject2.connection.DbConnection"%>
<%@ page import="com.adjavafinalproject2.dao.ProductDao"%>
<%@ page import="com.adjavafinalproject2.model.*"%>
<%@ page import="com.adjavafinalproject2.model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DecimalFormat dcf = new DecimalFormat("#0.00");

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null)
{
	request.setAttribute("person", auth);
}
ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

double total = 0;
List<Cart> cartItems = new ArrayList<>();

if (cartList != null && !cartList.isEmpty())
{
	ProductDao prodDao = new ProductDao(DbConnection.getConnection());

	cartItems = prodDao.getCartProducts(cartList);
	total = prodDao.getTotalCartPrice(cartItems);
}

request.setAttribute("dcf", dcf);
request.setAttribute("total", total);
request.setAttribute("cartItems", cartItems);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Cart</title>
<%@ include file="includes/header.jsp"%>
</head>

<style>
body {
	background-color: #f4f4f4;
	color: #333;
}

.container {
	margin-top: 20px;
}

form {
	margin-top: 20px;
}

.card {
	width: 50%;
	margin: auto;
	margin-top: 5%;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.btn-primary {
	background-color: #007bff;
	color: #fff;
}

a {
	color: #007bff;
}
</style>

<body>

	<div class="container">
		<%@ include file="includes/navbar.jsp"%>
		<div class="container">
			<h2>Your Shopping Cart</h2>
			<table class="table mt-4">
				<thead>
					<tr>
						<th>Name</th>
						<th></th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Cart cartItem : cartItems)
					{
						ProductDao prDao = new ProductDao(DbConnection.getConnection());
						Product prod = prDao.getSingleProduct(cartItem.getId());
					%>
					<tr>
						<td><%=cartItem.getName()%></td>
						<td>
							<%
							String imageSrc = "images/" + prod.getImage1();
							if (prod.getImage1() == null || prod.getImage1().trim().isEmpty()
									|| !new java.io.File(application.getRealPath("/") + imageSrc).exists())
							{
								imageSrc = "images/noimage.jpg";
							}
							%>
							<img src="<%=imageSrc%>" class="card-img-top"
								alt="<%=prod.getName()%>" style="width: 60px; height: 60px;">
						</td>
						<td>
							$<%=dcf.format(cartItem.getOriginalPrice())%></td>
						<td class="quantity-cell">
							<div class="input-group">
								<span class="input-group-prepend">
									<a class="btn btn-sm btn-decre btn-primary"
										href="quantity-inc-dec?action=dec&id=<%=cartItem.getId()%>">
										<i class="fa fa-minus fa-2xs"></i>
									</a>
								</span>


								<input type="text" name="quantity" style="max-width: 70px;"
									value="<%=cartItem.getQuantity()%>" readonly>
								<span class="input-group-append">
									<a class="btn btn-sm btn-incre btn-success"
										href="quantity-inc-dec?action=inc&id=<%=cartItem.getId()%>">
										<i class="fa fa-plus fa-2xs"></i>
									</a>
								</span>


							</div>
						</td>
						<td>
							<a href="remove-from-cart?id=<%=cartItem.getId()%>"
								class="btn btn-danger btn-sm">Remove</a>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<div class="text-right" style="margin-top: 50px;">
				<p class="font-weight-bold">
					Subtotal: $<%=(total > 0) ? dcf.format(total) : 0%></p>
				<a href="checkout.jsp" class="mx-3 btn btn-primary">Proceed to
					Checkout</a>
			</div>
			<%
			if (cartList == null || cartList.isEmpty())
			{
			%>
			<p class="mt-3">Your cart is empty.</p>
			<%
			}
			%>
		</div>
	</div>

	<%@ include file="includes/footer.jsp"%>
</body>

</html>
