<%@ page import="java.util.List"%>
<%@ page import="com.adjavafinalproject2.model.Product"%>
<%@ page import="com.adjavafinalproject2.dao.ProductDao"%>
<%@ page import="com.adjavafinalproject2.connection.DbConnection"%>
<%@ page import="com.adjavafinalproject2.model.Cart"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home</title>
<%@include file="includes/header.jsp"%>

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

#homeSlides {
	margin-bottom: -200px;
}

<!--
.card-row {
	position: relative;
	z-index: 10;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
}
</style>

<body>

	<div class="container">
		<%@include file="includes/navbar.jsp"%>
		<div class="container">
			<div id="homeSlides"
				class="carousel slide carousel-fade d-none d-md-block"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-interval="3000">
						<img src="images/warrioranddragon.png" class="d-block w-100"
							alt="a man in a Scottish kilt engaging in battle with a dragon">
					</div>
					<div class="carousel-item" data-interval="3000">
						<img src="images/gnomeandogre.png" class="d-block w-100"
							alt="a gnomish wizard casting a spell at an ogre in a mystical forest">
					</div>
					<div class="carousel-item" data-interval="3000">
						<img src="images/clericandbeholder.png" class="d-block w-100"
							alt="beholder engaged in battle with a female cleric in an underground cavern">
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row card-row">
					<div class="col-sm">
						<div class="card" style="width: 18rem;">
							<img src="images/toy_store_shelves_dark_indoors (1).jpeg"
								class="card-img-top"
								alt="Adventures browse through shelves of wondrous objects">
							<div class="card-body">
								<h5 class="card-title">Store</h5>
								<p class="card-text">Have a look through our catalog of hand
									painted minis. If you want to narrow it down a bit, feel free
									to use the "Products" dropdown above.</p>
								<div class="mt-3 d-flex justify-content-end">
									<a href="products.jsp?category=All" class="btn btn-primary">Shop</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card" style="width: 18rem;">
							<img src="images/a_tiny_warrior_statue_on_a_sta (4).jpeg"
								class="card-img-top"
								alt="A small statue on a pedestal, bathed in spotlight">
							<div class="card-body">
								<h5 class="card-title">Featured Product</h5>
								<p class="card-text">Every week, we showcase a different
									miniature. Everyone likes to get a little spotlight every now
									and then, right?</p>
								<div class="mt-3 d-flex justify-content-end">
									<a href="deadend.jsp" class="btn btn-primary">Spotlight</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card" style="width: 18rem;">
							<img src="images/old_smiling_gnome_tinkerer_wit (6).jpeg"
								class="card-img-top"
								alt="a gnomish tinkerer working on miniature toys">
							<div class="card-body">
								<h5 class="card-title">Coming Soon</h5>
								<p class="card-text">Our Mini Artists are always working on
									something new. Have a sneak peak at some of the projects we
									have coming.</p>
								<div class="mt-3 d-flex justify-content-end">
									<a href="deadend.jsp" class="btn btn-primary">Sneak a Peak</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="includes/footer.jsp"%>
		</div>
</body>
</html>