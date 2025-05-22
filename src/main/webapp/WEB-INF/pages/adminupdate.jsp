<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="user" value="${requestScope.user}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update User</title>
<style>
body {
	margin: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f6f9;
	display: flex;
	height: 100vh;
}

.sidebar {
	width: 270px;
	background: #0e3f57;
	padding: 20px;
	color: #fff;
	overflow: hidden;
	transition: all 0.3s ease;
	display: flex;
	flex-direction: column;
	box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
}

.sidebar:hover {
	width: 300px;
	box-shadow: 4px 0 10px rgba(0, 0, 0, 0.2);
	background: #12506f; 

.sidebar h2 {
	color: #ffffff;
	font-size: 24px;
	margin-bottom: 20px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin: 18px 0;
	cursor: pointer;
	transition: background-color 0.3s, padding-left 0.3s;
	padding: 5px;
	border-radius: 4px;
}

.sidebar ul li a {
	color: white;
	text-decoration: none;
	font-size: 18px;
	display: block;
}

.sidebar ul li:hover {
	background-color: #1e5d77;
	padding-left: 15px;
}

.logout {
	margin-top: auto;
	font-size: 20px;
}

.content {
	flex-grow: 1;
	padding: 50px;
	background-color: #bbd2de;
	overflow-y: auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.update-form {
	background-color: #fefefe;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
	max-width: 750px;
	width: 100%;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.update-form:hover {
	transform: scale(1.01);
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
}

h2 {
	color: #2c3e50;
	margin-bottom: 25px;
	font-size: 26px;
	text-align: center;
}

.row {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	margin-bottom: 20px;
}

.col {
	flex: 1;
	min-width: 280px;
	display: flex;
	flex-direction: column;
}

label {
	font-weight: 600;
	color: #34495e;
	margin-bottom: 8px;
}

input[type="text"], input[type="email"] {
	padding: 12px 15px;
	border: 2px solid #ccc;
	border-radius: 8px;
	font-size: 15px;
	transition: border-color 0.3s;
	background-color: #fcfcfc;
}

input[type="text"]:focus, input[type="email"]:focus {
	border-color: #3498db;
	outline: none;
	background-color: #fff;
}

.error-message {
	background-color: #ffe6e6;
	color: #d93025;
	border-left: 5px solid #d93025;
	padding: 10px 15px;
	margin-bottom: 20px;
	border-radius: 6px;
}

.success-message {
	background-color: #e6f4ea;
	color: #188038;
	border-left: 5px solid #188038;
	padding: 10px 15px;
	margin-bottom: 20px;
	border-radius: 6px;
}

.form-buttons {
	text-align: right;
	margin-top: 30px;
}

button {
	padding: 12px 24px;
	background-color: #3498db;
	color: #fff;
	border: none;
	font-size: 16px;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.2s;
}

button:hover {
	background-color: #2c81ba;
	transform: scale(1.05);
}

@media ( max-width : 768px) {
	body {
		flex-direction: column;
	}
	.sidebar {
		width: 100%;
		text-align: center;
	}
	.content {
		padding: 20px;
	}
	.form-buttons {
		text-align: center;
	}
}
</style>
</head>
<body>
	<div class="sidebar">
		<h2>Bluwud Furniture</h2>
		<ul>
			<li><a href="${contextPath}/Dashboard">Dashboard</a></li>
			<li><a href="${contextPath}/Info">Admin Portal</a></li>
			<li><a href="${contextPath}/CustomerController"> User List</a></li>
			<li><a href="${pageContext.request.contextPath}/Products">Products</a></li>
		</ul>
		<div class="logout">
			<ul>
				<li>
					<form action="${contextPath}/logout" method="POST"
						style="display: inline;">
						<button type="submit"
							style="background: none; border: none; color: inherit; font: inherit; cursor: pointer; padding: 0;">
							⇦ Logout</button>
					</form>
				</li>
			</ul>
		</div>
	</div>

	<div class="content">
		<form action="${contextPath}/Update" method="post" class="update-form">
			<h2>Update User Information</h2>

			<c:if test="${not empty error}">
				<div class="error-message">${error}</div>
			</c:if>

			<c:if test="${not empty success}">
				<div class="success-message">${success}</div>
			</c:if>

			<input type="hidden" name="action" value="update" /> <input
				type="hidden" name="user_id" value="${user.user_id}" />

			<div class="row">
				<div class="col">
					<label for="user_name">Name:</label> <input type="text"
						id="user_name" name="user_name" value="${user.user_name}" required />
				</div>

				<div class="col">
					<label for="user_contact">Contact:</label> <input type="text"
						id="user_contact" name="user_contact" value="${user.user_contact}"
						required />
				</div>
			</div>

			<div class="row">
				<div class="col">
					<label for="user_address">Address:</label> <input type="text"
						id="user_address" name="user_address" value="${user.user_address}"
						required />
				</div>

				<div class="col">
					<label for="user_email">Email:</label> <input type="email"
						id="user_email" name="user_email" value="${user.user_email}"
						required />
				</div>
			</div>

			<div class="form-buttons">
				<button type="submit">Update User Details</button>
			</div>
		</form>
	</div>
</body>
</html>
