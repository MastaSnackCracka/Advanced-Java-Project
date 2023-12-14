<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>

<title>Dead End</title>
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
		<h3>OOOOPS!</h3>

		<div class="container">
			<p>This dead end is still under construction.</p>
			<div class="container">
				<img src="images/guess500.png">
			</div>

			<p>Guess I'll go back</p>
		</div>
		<%@ include file="includes/footer.jsp"%>

	</div>
</body>
</html>