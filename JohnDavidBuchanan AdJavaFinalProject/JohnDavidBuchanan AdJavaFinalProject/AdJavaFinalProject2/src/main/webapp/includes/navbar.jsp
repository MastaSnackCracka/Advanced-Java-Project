<%@ page import="com.adjavafinalproject2.connection.DbConnection"%>
<%@ page import="com.adjavafinalproject2.dao.ProductDao"%>
<%@ page import="com.adjavafinalproject2.model.Cart"%>
<%@ page import="com.adjavafinalproject2.model.Product"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
try
{
	ProductDao pdNav = new ProductDao(DbConnection.getConnection());
	List<Cart> productsNav = pdNav.getCartProducts(new ArrayList<>());
} catch (Exception e)
{
	e.printStackTrace();
}
ArrayList<Cart> bar_cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Products</title>
</head>

<body>

	<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">The Minis Emporium</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-expanded="false">Products</a>
						<ul class="dropdown-menu">
							<!-- dropdown items -->
							<li>
								<a class="dropdown-item" href="products.jsp?category=All">All</a>
							</li>
							<li>
								<a class="dropdown-item" href="products.jsp?category=Hero">Heroes</a>
							</li>
							<li>
								<a class="dropdown-item" href="products.jsp?category=Villain">Villains</a>
							</li>
							<li>
								<a class="dropdown-item" href="products.jsp?category=Monster">Monsters</a>
							</li>
						</ul>
					</li>

					<!--  		<li class="nav-item">
						<a class="nav-link" href="order.jsp">Order</a>
					</li>-->
					<li class="nav-item">
						<a class="nav-link" href="about.jsp">About Us</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="contact.jsp">Contact</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="login.jsp">Login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="cart.jsp">
							<i class="fa fa-shopping-cart"
								style="color: white; z-index: 1001; position: relative;"></i>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="cart.jsp">
							<%
							if (bar_cart_list != null)
							{
							%>
							<span class="badge badge-danger px-1"><%=bar_cart_list.size()%></span>
							<%
							}
							%>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

</body>

</html>
