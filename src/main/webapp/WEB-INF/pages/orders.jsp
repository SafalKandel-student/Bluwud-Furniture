<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>All Orders</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	display: flex;
	background-color: #bbd2de;
	height: 100vh;
	overflow: hidden;
}

.sidebar {
	width: 270px;
	background: #0e3f57;
	padding: 20px;
	color: #ccd9e0;
	height: 100vh;
}

.sidebar h2 {
	margin-bottom: 20px;
	font-size: 22px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin: 15px 0;
}

.sidebar ul li a {
	color: white;
	text-decoration: none;
	display: block;
	padding: 8px 12px;
	border-radius: 4px;
	transition: background-color 0.3s, padding-left 0.3s;
}

.sidebar ul li a:hover {
	background-color: #1e5d77;
	padding-left: 20px;
}

.logout {
	margin-top: 50px;
}

.main-content {
	flex: 1;
	padding: 20px;
	overflow-y: auto;
}

.logout button {
	background-color: #4e73df;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
}

.logout button:hover {
	background-color: #2e59d9;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

th, td {
	padding: 12px;
	text-align: center;
	border: 1px solid #ccc;
}

th {
	background-color: #0e3f57;
	color: white;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #e1f5fe;
}
</style>
</head>
<body>
	<div class="sidebar">
		<h2>Bluwud Furniture</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/Dashboard">Dashboard</a></li>
			<li><a href="${pageContext.request.contextPath}/Info">Admin
					Portal</a></li>
			<li><a
				href="${pageContext.request.contextPath}/CustomerController">Customer
					Portal</a></li>
			<li><a href="${pageContext.request.contextPath}/Products">Products</a></li>
			<li><a href="${pageContext.request.contextPath}/contact">Messages</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/cart">Orders</a></li>
		</ul>
		<div class="logout">
			<form action="${pageContext.request.contextPath}/logout"
				method="POST">
				<button type="submit">⇦ Logout</button>
			</form>
		</div>
	</div>
	<div class="main-content">
		<h2>All Cart Items</h2>
		<table>
			<tr>
				<th>User</th>
				<th>Product</th>
				<th>Quantity</th>
				<th>Unit Price</th>
				<th>Total Price</th>
			</tr>
			<c:forEach var="item" items="${allCartItems}">
				<tr>
					<td>${item.user_id.user_name}</td>
					<td>${item.product_id.product_name}</td>
					<td>${item.cart_quantity}</td>
					<td>Rs. ${item.product_id.product_unitprice}</td>
					<td>Rs. ${item.cart_quantity * item.product_id.product_unitprice}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
