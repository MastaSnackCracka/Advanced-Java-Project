<%@page import="com.adjavafinalproject2.connection.DbConnection"%>
<%@page import="com.adjavafinalproject2.dao.ProductDao"%>
<%@page import="com.adjavafinalproject2.model.*"%>
<%@page import="java.util.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth == null)
{
	// If no user is logged in, redirect to the login page
	response.sendRedirect("login.jsp");
	return; // Stop further execution of this JSP
}

// If the user is logged in, continue with the rest of the page
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null)
{
	request.setAttribute("cart_list", cart_list);
}
%>

<!doctype html>
<html lang="en">
<head>
<title>Logged In</title>
<%@ include file="includes/header.jsp"%>
<style>
body {
	background-color: #f4f4f4;
	color: #333;
}

.container {
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
</head>
<body>
	<div class="container">
		<%@ include file="includes/navbar.jsp"%>
		<div class="card w-50 mx-auto my-5">
			<h1>
				Welcome,
				<%=auth.getFirst_name()%>!
			</h1>
			<p>You are now logged in.</p>
			<p>
				<a href="products.jsp?category=All" class="btn btn-primary">Go
					to Products</a>
			</p>
			<p>
				<a href="logout-servlet" class="btn btn-secondary">Log Out</a>
			</p>
		</div>
		<%@ include file="includes/footer.jsp"%>
	</div>
</body>
</html>
