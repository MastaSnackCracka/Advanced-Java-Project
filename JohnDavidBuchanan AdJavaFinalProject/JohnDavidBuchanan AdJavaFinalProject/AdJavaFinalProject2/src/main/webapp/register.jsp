<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.adjavafinalproject2.dao.UserDao"%>
<%@page import="com.adjavafinalproject2.connection.DbConnection"%>
<%@page import="java.util.ArrayList"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Register</title>
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
			<h1>Register</h1>
			<form action="register-servlet" method="post">
				<div class="mb-3">
					<label for="first_name" class="form-label">First Name</label>
					<input type="text" class="form-control" id="first_name"
						name="first_name" required>
				</div>
				<div class="mb-3">
					<label for="second_name" class="form-label">Last Name</label>
					<input type="text" class="form-control" id="second_name"
						name="second_name" required>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email address</label>
					<input type="email" class="form-control" id="email" name="email"
						required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label>
					<input type="password" class="form-control" id="password"
						name="password" required>
				</div>
				<button type="submit" class="btn btn-primary">Register</button>
			</form>

			<!-- Link to go back to login -->
			<div class="mt-3">
				<p>
					Already have an account?
					<a href="login.jsp">Log in here</a>
				</p>
			</div>
		</div>



		<%@ include file="includes/footer.jsp"%>
	</div>
</body>
</html>