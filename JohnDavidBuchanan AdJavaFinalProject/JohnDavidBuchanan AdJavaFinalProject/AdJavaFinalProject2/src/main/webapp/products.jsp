<%@page import="com.adjavafinalproject2.connection.DbConnection"%>
<%@page import="com.adjavafinalproject2.dao.ProductDao"%>
<%@page import="com.adjavafinalproject2.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String selectedCategory = request.getParameter("category");
ProductDao pd = new ProductDao(DbConnection.getConnection());
List<Product> products = pd.getCategoryProducts(selectedCategory);

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null)
{
	request.setAttribute("cart_list", cart_list);
}
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Products</title>
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
</style>

<body>

	<div class="container">
		<%@include file="includes/navbar.jsp"%>
		<div class="container">
			<div class="card-header my-3">
				<H2>Products</H2>
			</div>

			<div class="row">

				<%
				if (!products.isEmpty())
				{
					for (Product p : products)
					{
				%>

				<div class="col-md-4 my-3">
					<div class="thumbnail">
						<div class="card" style="width: 18rem;">
							<a href="productDetails.jsp?id=<%=p.getId()%>">
								<%
								String imageSrc = "images/" + p.getImage1();
								if (p.getImage1() == null || p.getImage1().trim().isEmpty()
										|| !new java.io.File(application.getRealPath("/") + imageSrc).exists())
								{
									imageSrc = "images/noimage.jpg";
								}
								%>

								<img src="<%=imageSrc%>" class="card-img-top"
									alt="<%=p.getName()%>">



							</a>
							<div class="card-body">
								<h5 class="card-title"><%=p.getName()%></h5>
								<h6 class="price">
									Price: $<%=p.getPrice()%></h6>
								<h6 class="category">
									Type:
									<%=p.getCategory()%></h6>
								<div class="mt-3 d-flex justify-content-end">
									<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-success">Add
										to Cart</a>
									<!--  			<a href="order-now?id=< %=p.getId()%>&quantity=0"
										class="btn btn-primary">Buy Now</a>-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				} else
				{
				%>
				<p>No products found for the selected category.</p>
				<%
				}
				%>
			</div>

			<%@ include file="includes/footer.jsp"%>
		</div>
	</div>
</body>
</html>

