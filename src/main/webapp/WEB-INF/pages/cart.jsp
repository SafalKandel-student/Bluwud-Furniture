<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Cart</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css" />
<style>
body {
	font-family: Arial;
	background-color: #f2f2f2;
	padding: 20px;
}

.container {
	max-width: 900px;
	margin: auto;
	background: white;
	padding: 20px;
	border-radius: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #3d827f;
	color: white;
}

.product-info {
	text-align: left;
}

.product-name {
	font-weight: bold;
}

.product-desc {
	color: #666;
	font-size: 0.9em;
}

.quantity-input {
	width: 50px;
	text-align: center;
}

.action-form {
	display: inline;
	margin: 0 5px;
}

.btn {
	color: white;
	border: none;
	padding: 6px 12px;
	border-radius: 4px;
	cursor: pointer;
}

.btn-remove {
	background-color: #e74c3c;
}

.btn-remove:hover {
	background-color: #c0392b;
}

.btn-update {
	background-color: #3498db;
}

.btn-update:hover {
	background-color: #2980b9;
}

.total {
	font-size: 1.2em;
	font-weight: bold;
	text-align: right;
	margin-top: 20px;
}

.error {
	color: #e74c3c;
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<h2>Your Shopping Cart</h2>

		<c:if test="${not empty errorMessage}">
			<div class="error">${errorMessage}</div>
		</c:if>

		<c:choose>
			<c:when test="${not empty cartItems}">
				<table>
					<thead>
						<tr>
							<th>Product</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Subtotal</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="total" value="0" />
						<c:forEach var="item" items="${cartItems}">
							<tr>
								
								<td class="product-info">
									
								
									<div class="product-name">${item.product_id.product_name}</div>
									<div class="product-desc">${item.product_id.product_description}</div>
								</td>
								<td>Rs. ${item.product_id.product_unitprice}</td>
								<td>
									<form class="action-form" method="post"
										action="${pageContext.request.contextPath}/cart">
										<input type="hidden" name="action" value="update" /> <input
											type="hidden" name="cart_id" value="${item.cart_id}" /> <input
											type="number" name="quantity" value="${item.cart_quantity}"
											min="1" class="quantity-input" />
										<button type="submit" class="btn btn-update">Update</button>
									</form>
								</td>
								<td>Rs. ${item.product_id.product_unitprice * item.cart_quantity}</td>
								<td>
									<form class="action-form" method="post"
										action="${pageContext.request.contextPath}/cart">
										<input type="hidden" name="action" value="delete" /> <input
											type="hidden" name="cart_id" value="${item.cart_id}" />
										<button type="submit" class="btn btn-remove">Remove</button>
									</form>
								</td>
							</tr>
							<c:set var="total"
								value="${total + (item.product_id.product_unitprice * item.cart_quantity)}" />
						</c:forEach>
					</tbody>
				</table>
				<div class="total">Total: Rs. ${total}</div>
			</c:when>
			<c:otherwise>
				<p>Your cart is empty.</p>
			</c:otherwise>
		</c:choose>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>