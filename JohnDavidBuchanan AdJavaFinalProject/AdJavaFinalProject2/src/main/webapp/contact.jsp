<%@page import="com.adjavafinalproject2.connection.DbConnection"%>
<%@page import="com.adjavafinalproject2.dao.ProductDao"%>
<%@page import="com.adjavafinalproject2.model.*"%>
<%@page import="java.util.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth == null)
{
	// User is not logged in, redirect them to the login page
	response.sendRedirect("login.jsp");
	return; // Stop further execution to prevent loading the rest of the page
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null)
{
	request.setAttribute("cart_list", cart_list);
}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Contact</title>
<%@ include file="includes/header.jsp"%>

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
</head>

<body>
	<div class="container">
		<%@ include file="includes/navbar.jsp"%>
		<div class="card">

			<h2>Contact Us</h2>

			<form method="post"
				action="https://webdevbasics.net/scripts/demo.php">
				<div class="form-group">
					<label for="myName">Name:</label>
					<input type="text" class="form-control" name="myName" id="myName"
						required>
				</div>

				<div class="form-group">
					<label for="myEmail">Email:</label>
					<input type="email" class="form-control" name="myEmail"
						id="myEmail" required>
				</div>

				<div class="form-group">
					<label for="myComments">Comments:</label>
					<textarea class="form-control" name="myComments" id="myComments"
						rows="6" cols="40" required></textarea>
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-secondary">Reset</button>
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
