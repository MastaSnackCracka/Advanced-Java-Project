<%@page import="com.adjavafinalproject2.connection.DbConnection"%>

<%@page import="com.adjavafinalproject2.dao.ProductDao"%>
<%@page import="com.adjavafinalproject2.model.*"%>
<%@page import="java.util.*"%>


<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null)
{
	response.sendRedirect("loggedIn.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null)
{
	request.setAttribute("cart_list", cart_list);
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<title>Login</title>
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
		<div class="card w-50 mx-auto my-5">
			<h1>Log In</h1>
			<form action="login-servlet" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label">Email
						address</label>
					<input type="email" class="form-control" name="email"
						aria-describedby="emailHelp">
					<div id="emailHelp" class="form-text">We'll never share your
						email with anyone else.</div>
				</div>
				<div class="form-group">
					<label for="password" class="form-label">Password</label>
					<input type="password" class="form-control" name="password">
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>

			<div class="mt-3">
				<p>
					Don't have an account?
					<a href="register.jsp">Register here</a>
				</p>
			</div>
		</div>

		<%@ include file="includes/footer.jsp"%>
	</div>
</body>
</html>