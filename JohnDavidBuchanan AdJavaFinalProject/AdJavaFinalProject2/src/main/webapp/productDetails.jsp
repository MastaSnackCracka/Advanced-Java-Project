<%@page import="java.lang.reflect.Method"%>
<%@ page import="com.adjavafinalproject2.connection.DbConnection"%>
<%@ page import="com.adjavafinalproject2.dao.ProductDao"%>
<%@ page import="com.adjavafinalproject2.model.*"%>
<%@ page import="java.util.*"%>

<%
String productIdString = request.getParameter("id");
int productId = Integer.parseInt(productIdString);
ProductDao pd = new ProductDao(DbConnection.getConnection());
Product product = pd.getProductDetails(productId);

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Product Details</title>
<%@ include file="includes/header.jsp"%>
</head>
<style>
#productCarousel img {
	display: block;
	margin: 0 auto;
	max-height: 300px;
}

body {
	background-color: #f4f4f4;
	color: #333;
}

.container {
	margin-top: 20px;
}

.carousel-item {
	text-align: center;
}

#productCarousel img {
	display: block;
	margin: 0 auto;
	max-height: 500px;
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

/* carousel control buttons */
.carousel-control-prev, .carousel-control-next {
	width: 25%;
	color: #fff;
	opacity: 1;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: #D1D1D0;
	border: 0px solid #007bff;
	border-radius: 5px; /* border-radius for rounded corners */
}

.carousel-control-prev:hover, .carousel-control-next:hover {
	color: #D1D1D0; /* color on hover */
	/*background-color: #D1D1D0; /* background color on hover */
}
</style>
<body>
	<div class="container">
		<%@ include file="includes/navbar.jsp"%>

		<div class="card w-80 mx-auto my-5">
			<h2><%=product.getName()%></h2>
			<!--  -->

			<div id="productCarousel" class="carousel" data-ride="carousel"
				data-interval="false">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<%
					for (int i = 0; i < 3; i++) {
					%>
					<li data-target="#productCarousel" data-slide-to="<%=i%>"
						<%=(i == 0) ? "class=\"active\"" : ""%>></li>
					<%
					}
					%>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<%
					for (int i = 0; i < 3; i++) {
						String imageGet = "getImage" + (i + 1);
						Method method;
						String imageUrl;
						try {
							method = Product.class.getMethod(imageGet);
							imageUrl = (String) method.invoke(product);
						} catch (Exception e) {
							imageUrl = "";
							e.printStackTrace();
						}
						if (imageUrl == null || imageUrl.trim().isEmpty()) {
							imageUrl = "noimage.jpg"; // Adjust this based on your image path
						}
					%>
					<div class="carousel-item<%=(i == 0) ? " active" : ""%>">
						<img src="images/<%=imageUrl%>" alt="<%=product.getName()%>"
							class="img-fluid">
					</div>
					<%
					}
					%>
				</div>
				<a class="carousel-control-prev" href="#productCarousel"
					role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#productCarousel"
					role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<div class="card-body">

				<h6 class="category">
					Type:
					<%=product.getCategory()%></h6>
				<h6 class="race">
					Species:
					<%=product.getChar_race()%></h6>
				<h6 class="class">
					Class:
					<%=product.getChar_class()%></h6>
				<h7><%=product.getDescription()%></h7>
				<h6 class="price">
					<br>
					Price: $<%=product.getPrice()%></h6>

				<div class="mt-3 d-flex justify-content-end">
					<a href="add-to-cart?id=<%=product.getId()%>"
						class="btn btn-success">Add to Cart</a>
				</div>

			</div>
		</div>

		<%@ include file="includes/footer.jsp"%>
	</div>
	<script>
		$(document).ready(function() {
			$('#productCarousel').carousel();
		});
	</script>
</body>
</html>
