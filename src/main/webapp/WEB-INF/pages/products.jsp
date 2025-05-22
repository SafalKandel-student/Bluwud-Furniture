<%@ page import="java.util.List"%>
<%@ page import="com.bluwud.model.ProductModel"%>
<%@ page import="com.bluwud.model.CategoryModel"%>
<%
List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");
List<CategoryModel> categories = (List<CategoryModel>) request.getAttribute("categories");
Integer selectedCategoryId = (Integer) request.getAttribute("selectedCategoryId");
Boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
<style>
/* --- Styling remains unchanged --- */
body {
	background-color: #c7d3b6;
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.img, .slider {
	text-align: center;
	width: 100%;
	padding: 10px;
	margin: 0;
}

.img img {
	width: 100vw;
	height: 100px;
	display: block;
	margin: 0;
}

.slider {
	width: 100%;
	max-width: 100vw;
	height: 700px;
	overflow: hidden;
	position: relative;
	margin-top: 80px;
}

.slides {
	display: flex;
	width: 400%;
	height: 100%;
	animation: slide 25s infinite;
}

.slides img {
	width: 100vw;
	height: 700px;
	object-fit: cover;
}

@keyframes slide {
	0% { transform: translateX(0); }
	25% { transform: translateX(-100vw); }
	50% { transform: translateX(-200vw); }
	75% { transform: translateX(-300vw); }
	100% { transform: translateX(0); }
}

.Row {
	display: flex;
	padding: 40px 60px;
	gap: 20px;
}

.product-column {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.product-card {
	background-color: #e8ebe2;
	padding: 20px;
	border-radius: 8px;
	text-align: center;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.product-card:hover {
	transform: scale(1.05);
}

.image {
	width: 100%;
	max-width: 300px;
	height: 250px;
	object-fit: cover;
	margin: auto;
	display: block;
	transition: transform 0.3s ease;
}

.product-card:hover .image {
	transform: scale(1.1);
}

.button, .btn {
	display: block;
	padding: 10px 15px;
	margin: 10px auto 0;
	background-color: #3d827f;
	color: white;
	text-decoration: none;
	font-size: 16px;
	border-radius: 8px;
	width: 90%;
	text-align: center;
	box-sizing: border-box;
	border: none;
	cursor: pointer;
}

.button:hover, .btn:hover {
	background-color: #275d5b;
}

.btn-danger {
	background-color: #dc3545;
}

.btn-danger:hover {
	background-color: #a71d2a;
}

/* Sidebar Styling */
.sidebar {
	width: 250px;
	background-color: #3d827f;
	color: white;
	padding: 20px;
	position: fixed;
	top: 0;
	left: 0;
	height: 100vh;
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
</head>
<body>

<% if (isAdmin != null && isAdmin) { %>
	<!-- Admin Sidebar -->
	<div class="sidebar">
		<h2>Bluwud Furniture</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/Dashboard">Dashboard</a></li>
			<li><a href="${pageContext.request.contextPath}/Info">Admin Portal</a></li>
			<li><a href="${pageContext.request.contextPath}/CustomerController">Customer Portal</a></li>
			<li><a href="${pageContext.request.contextPath}/Products">Products</a></li>
		</ul>
		<div class="logout">
			<ul>
				<li>
					<form action="${pageContext.request.contextPath}/logout" method="POST">
						<button type="submit">Logout</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
<% } else { %>
	<jsp:include page="header.jsp" />

	<!-- Slider Section -->
	<div class="img">
		<div class="slider">
			<div class="slides">
				<img src="${pageContext.request.contextPath}/resources/images/system/b2.jpg" />
				<img src="${pageContext.request.contextPath}/resources/images/system/D1.png" />
				<img src="${pageContext.request.contextPath}/resources/images/system/chair1.png" />
				<img src="${pageContext.request.contextPath}/resources/images/system/sofa 1.png" />
				<img src="${pageContext.request.contextPath}/resources/images/system/d5.jpg" />
				<img src="${pageContext.request.contextPath}/resources/images/system/c2.jpg" />
				<img src="${pageContext.request.contextPath}/resources/images/system/bed 7.png" />
				<img src="${pageContext.request.contextPath}/resources/images/system/chair12.png" />
				<img src="${pageContext.request.contextPath}/resources/images/system/sofa 10.png" />
				<img src="${pageContext.request.contextPath}/resources/images/system/d15.png" />
			</div>
		</div>
	</div>
<% } %>

<!-- Admin Add Button -->
<% if (isAdmin != null && isAdmin) { %>
	<div style="text-align: center; margin-top: 20px; margin-left: 270px;">
		<a href="<%=request.getContextPath()%>/Products?action=add" class="button">Add Product</a>
	</div>
<% } %>

<!-- Product Display in 3 Columns -->
<div class="Row" style="<% if (isAdmin != null && isAdmin) out.print("margin-left:270px;"); %>">
	<%
	int totalProducts = products.size();
	int itemsPerColumn = (int) Math.ceil(totalProducts / 3.0);
	for (int col = 0; col < 3; col++) {
	%>
	<div class="product-column">
	<%
	for (int i = col * itemsPerColumn; i < Math.min((col + 1) * itemsPerColumn, totalProducts); i++) {
		ProductModel p = products.get(i);
	%>
		<div class="product-card">
			<img src="<%= request.getContextPath() + "/" + p.getImage_path() %>" class="image" />
			<p><%= p.getProduct_name() %></p>
			<h2>Rs. <%= p.getProduct_unitprice() %></h2>

			<% if (isAdmin != null && isAdmin) { %>
				<a href="<%=request.getContextPath()%>/Products?action=details&id=<%=p.getProduct_id()%>" class="button">Details</a>
				<a href="<%=request.getContextPath()%>/Products?action=edit&id=<%=p.getProduct_id()%>" class="button">Edit</a>
				<form action="<%=request.getContextPath()%>/Products" method="post" class="action-form"
					  onsubmit="return confirm('Are you sure you want to delete this product?');">
					<input type="hidden" name="action" value="delete" />
					<input type="hidden" name="id" value="<%=p.getProduct_id()%>" />
					<button type="submit" class="button btn-danger">Delete</button>
				</form>
			<% } else { %>
				<a href="<%= request.getContextPath() %>/Products?action=details&id=<%= p.getProduct_id() %>
<%= selectedCategoryId != null ? "&categoryId=" + selectedCategoryId : "" %>
<%= request.getAttribute("searchQuery") != null ? "&search=" + request.getAttribute("searchQuery") : "" %>" class="button">View Detail</a>
			<% } %>
		</div>
	<% } %>
	</div>
	<% } %>
</div>

<% if (isAdmin == null || !isAdmin) { %>
	<jsp:include page="footer.jsp" />
<% } %>

</body>
</html>
