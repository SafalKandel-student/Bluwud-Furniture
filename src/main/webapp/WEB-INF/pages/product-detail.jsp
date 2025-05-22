<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.bluwud.model.ProductModel"%>
<%@ page import="com.bluwud.model.UserModel"%>
<%
Boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.product_name}</title>

<c:choose>
	<c:when test="${isAdmin}">
		<style>
html, body {
	height: 100%;
}

body {
	background-color: white;
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.container {
	max-width: 1000px;
	margin: 80px auto;
	display: flex;
	gap: 40px;
	padding: 40px 60px;
	background-color: #f9f9f9;
	border-radius: 12px;
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
}

.product-image {
	flex: 1;
}

.product-image img {
	width: 100%;
	max-width: 400px;
	height: 400px;
	object-fit: cover;
	border-radius: 10px;
}

.product-details {
	flex: 2;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

h1 {
	font-size: 32px;
	margin-bottom: 15px;
	color: #333;
}

.price {
	font-size: 24px;
	color: #3d827f;
	margin-bottom: 20px;
}

.description {
	font-size: 18px;
	color: #555;
	margin-bottom: 30px;
}

.cart-form {
	margin-bottom: 20px;
}

.cart-form label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.cart-form input[type="number"] {
	padding: 8px;
	width: 80px;
	margin-bottom: 15px;
}

.btn, .back {
	display: inline-block;
	padding: 12px 25px;
	background-color: #3d827f;
	color: white;
	text-decoration: none;
	font-size: 16px;
	border-radius: 8px;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-right: 10px;
}

.btn:hover, .back:hover {
	background-color: #275d5b;
}

.error {
	color: #e74c3c;
	font-weight: bold;
	margin-bottom: 15px;
}

@media screen and (max-width: 768px) {
	.container {
		flex-direction: column;
		align-items: center;
	}
	.product-image img {
		max-width: 100%;
		height: auto;
	}
	.product-details {
		text-align: center;
	}
	.btn, .back {
		width: 100%;
		margin: 10px 0;
	}
}

.sidebar {
	width: 250px;
	background-color: #3d827f;
	color: white;
	padding: 20px;
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
}

.sidebar h2 {
	text-align: center;
	margin-bottom: 30px;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	margin: 15px 0;
}

.sidebar ul li a, .sidebar ul li button {
	color: white;
	text-decoration: none;
	background: none;
	border: none;
	font-size: 16px;
	cursor: pointer;
}

.logout {
	margin-top: 30px;
}
</style>
	</c:when>
	<c:otherwise>
		<!-- Customer Style (Before Admin Feature Added) -->
		<style>
body {
	background-color: white;
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.container {
	max-width: 1000px;
	margin: 80px auto;
	display: flex;
	gap: 40px;
	padding: 40px 60px;
	background-color: #f9f9f9;
	border-radius: 12px;
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
}

.product-image {
	flex: 1;
}

.product-image img {
	width: 100%;
	max-width: 400px;
	height: 400px;
	object-fit: cover;
	border-radius: 10px;
}

.product-details {
	flex: 2;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

h1 {
	font-size: 32px;
	margin-bottom: 15px;
	color: #333;
}

.price {
	font-size: 24px;
	color: #3d827f;
	margin-bottom: 20px;
}

.description {
	font-size: 18px;
	color: #555;
	margin-bottom: 30px;
}

.cart-form {
	margin-bottom: 20px;
}

.cart-form label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.cart-form input[type="number"] {
	padding: 8px;
	width: 80px;
	margin-bottom: 15px;
}

.btn, .back {
	display: inline-block;
	padding: 12px 25px;
	background-color: #3d827f;
	color: white;
	text-decoration: none;
	font-size: 16px;
	border-radius: 8px;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-right: 10px;
}

.btn:hover, .back:hover {
	background-color: #275d5b;
}

.error {
	color: #e74c3c;
	font-weight: bold;
	margin-bottom: 15px;
}

@media screen and (max-width: 768px) {
	.container {
		flex-direction: column;
		align-items: center;
	}
	.product-image img {
		max-width: 100%;
		height: auto;
	}
	.product-details {
		text-align: center;
	}
	.btn, .back {
		width: 100%;
		margin: 10px 0;
	}
}
</style>

		<!-- Customer Header/Footer CSS -->
		<link rel="stylesheet" href="${contextPath}/css/header.css" />
		<link rel="stylesheet" href="${contextPath}/css/footer.css" />
	</c:otherwise>
</c:choose>
</head>
<body>

	<%
	if (isAdmin != null && isAdmin) {
	%>
	<!-- Admin Sidebar -->
	<div class="sidebar">
		<h2>Bluwud Furniture</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/Dashboard">Dashboard</a></li>
			<li><a href="${pageContext.request.contextPath}/Info">Admin
					Portal</a></li>
			<li><a
				href="${pageContext.request.contextPath}/CustomerController"> User List</a></li>
			<li><a href="${pageContext.request.contextPath}/Products">Products</a></li>
		</ul>
		<div class="logout">
			<ul>
				<li>
					<form action="${pageContext.request.contextPath}/logout"
						method="POST">
						<button type="submit">Logout</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
	<%
	} else {
	%>
	<jsp:include page="header.jsp" />
	<%
	}
	%>

	<c:choose>
		<c:when test="${not empty product}">
			<div class="container"
				style="<%if (isAdmin != null && isAdmin)
	out.print("margin-left:270px;");%>">
				<div class="product-image">
					<img src="${product.image_path}" alt="${product.product_name}" />
				</div>
				<div class="product-details">
					<h1>${product.product_name}</h1>
					<div class="price">Rs. ${product.product_unitprice}</div>
					<p class="description">${product.product_description}</p>

					<c:if test="${not empty errorMessage}">
						<div class="error">${errorMessage}</div>
					</c:if>

					<%
					if (isAdmin == null || !isAdmin) {
					%>
					<div class="cart-form">
						<form action="${pageContext.request.contextPath}/cart"
							method="post">
							<input type="hidden" name="action" value="add" /> <input
								type="hidden" name="product_id" value="${product.product_id}" />

							<label for="quantity">Quantity:</label> <input type="number"
								name="quantity" value="1" min="1" required /> <br>
							<button type="submit" class="btn">Add to Cart</button>
						</form>
					</div>
					<%
					}
					%>

					<c:url var="backUrl" value="/Products">
						<c:param name="categoryId" value="${categoryId}" />
						<c:param name="search" value="${search}" />
					</c:url>
					<a class="back" href="${backUrl}"
						style="display: inline-block; width: fit-content; padding: 12px 12px; font-size: 14px;">←
						Back to Products</a>

				</div>
			</div>
		</c:when>
		<c:otherwise>
			<section
				style="<%if (isAdmin != null && isAdmin)
	out.print("margin-left:270px;");%>">
				<div class="container">
					<h2>Product not available</h2>
					<a class="back" href="${pageContext.request.contextPath}/home">←
						Back to home</a>
				</div>
			</section>
		</c:otherwise>
	</c:choose>

	<%
	if (isAdmin == null || !isAdmin) {
	%>
	<jsp:include page="footer.jsp" />
	<%
	}
	%>

</body>
</html>
