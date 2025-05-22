<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="user" value="${requestScope.user}" />
<c:set var="isAdmin" value="${sessionScope.isAdmin}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Info</title>

<c:choose>
	<c:when test="${isAdmin}">
		<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	background: linear-gradient(to bottom right, #bbd2de, #e6f0f7);
	display: flex;
	min-height: 100vh;
	overflow: hidden;
}

.sidebar {
	width: 250px;
	background: #0e3f57;
	color: #f1f1f1;
	display: flex;
	flex-direction: column;
	padding: 25px 20px;
	box-shadow: 2px 0 8px rgba(0, 0, 0, 0.1);
}

.sidebar h2 {
	margin-bottom: 30px;
	font-size: 20px;
	color: #ffffff;
	text-align: center;
}

.sidebar ul {
	list-style: none;
	padding: 0;
	margin: 0;
	flex-grow: 1;
}

.sidebar ul li {
	margin-bottom: 18px;
	transition: background 0.3s ease, padding-left 0.3s ease;
}

.sidebar ul li a {
	color: #e1e1e1;
	text-decoration: none;
	display: block;
	padding: 8px 12px;
	border-radius: 6px;
}

.sidebar ul li:hover a {
	background-color: #1e5d77;
	padding-left: 18px;
}

.logout {
	margin-top: auto;
	padding-top: 20px;
	border-top: 1px solid #3e5f70;
}

.logout form button {
	width: 100%;
	background-color: transparent;
	color: #ffffff;
	border: 1px solid #ffffff;
	border-radius: 20px;
	padding: 8px;
	cursor: pointer;
	font-weight: bold;
	transition: all 0.3s ease;
}

.logout form button:hover {
	background-color: #ffffff;
	color: #0e3f57;
}

.main-content {
	flex-grow: 1;
	padding: 30px;
	overflow-y: auto;
	background: linear-gradient(to bottom right, #dceefb, #ffffff);
}

.head {
	background-color: #1a1a1a;
	color: white;
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.profile-banner {
	background:
		url('https://images.unsplash.com/photo-1506744038136-46273834b3fb')
		no-repeat center center;
	background-size: cover;
	height: 180px;
	position: relative;
}

.profile-pic {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	border: 5px solid #fff;
	position: absolute;
	bottom: -60px;
	left: 30px;
	background: #fff;
	overflow: hidden;
}

.profile-pic img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.main-content .profile-name {
	font-size: 24px;
	font-weight: 600;
	margin-left: 160px;
	margin-bottom: 20px;
}

.form-title {
	margin: 30px 0 20px;
	font-size: 18px;
	color: #333;
	font-weight: 500;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}

form label {
	font-size: 14px;
	font-weight: 500;
	color: #555;
	display: block;
	margin-bottom: 6px;
}

form input[type="text"], form input[type="email"], form input[type="password"]
	{
	width: 100%;
	padding: 10px 14px;
	margin-bottom: 18px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 14px;
	background-color: #f9f9f9;
}

.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.button-bar {
	text-align: right;
	margin-top: 10px;
}

.button-bar button {
	background-color: #ffffff;
	color: #007bff;
	border: 2px solid #007bff;
	padding: 10px 20px;
	border-radius: 25px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.3s ease;
}

.button-bar button:hover {
	background-color: #007bff;
	color: white;
}

.message {
	margin: 15px 0;
	padding: 12px;
	border-radius: 8px;
	font-size: 14px;
	text-align: center;
}

.error-message {
	background-color: #f8d7da;
	color: #721c24;
}

.success-message {
	background-color: #d4edda;
	color: #155724;
}
</style>
	</c:when>
	<c:otherwise>
		<!-- Customer Style (Before Admin Feature Added) -->
		<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: linear-gradient(to bottom right, #dceefb, #ffffff);
}

body {
	background-color: #c7d3b6;
}

.head {
	background-color: #c7d3b6;
	color: white;
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.head.left {
	font-size: 18px;
	font-weight: bold;
}

.head.right {
	font-size: 14px;
}

.profile-banner {
	background-color: #c7d3b6;
	background-size: cover;
	height: 180px;
	position: relative;
}

.profile-pic {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	border: 5px solid #fff;
	position: absolute;
	bottom: -60px;
	left: 30px;
	background: #fff;
	overflow: hidden;
}

.profile-pic img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.main-content {
	margin: 80px auto 40px;
	padding: 30px;
	max-width: 700px;
	background: #e8ebe2;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.profile-name {
	font-size: 22px;
	font-weight: 600;
	margin-left: 160px;
}

.form-title {
	margin: 30px 0 20px;
	font-size: 18px;
	color: #333;
	font-weight: 500;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}

form label {
	font-size: 14px;
	font-weight: 500;
	color: #555;
	display: block;
	margin-bottom: 6px;
}

form input[type="text"], form input[type="email"], form input[type="password"]
	{
	width: 100%;
	padding: 10px 14px;
	margin-bottom: 18px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 14px;
}

.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.button-bar {
	text-align: right;
	margin-top: 10px;
}

.button-bar button {
	background-color: #ffffff;
	color: #007bff;
	border: 2px solid #007bff;
	padding: 10px 20px;
	border-radius: 25px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.3s ease;
}

.button-bar button:hover {
	background-color: #007bff;
	color: white;
}

.message {
	margin: 15px 0;
	padding: 12px;
	border-radius: 8px;
	font-size: 14px;
	text-align: center;
}

.error-message {
	background-color: #f8d7da;
	color: #721c24;
}

.success-message {
	background-color: #d4edda;
	color: #155724;
}
</style>

		<!-- Customer Header/Footer CSS -->
		<link rel="stylesheet" href="${contextPath}/css/header.css" />
		<link rel="stylesheet" href="${contextPath}/css/footer.css" />
	</c:otherwise>
</c:choose>
</head>

<body class="${isAdmin ? 'admin-body' : ''}">

	<c:choose>
		<c:when test="${isAdmin}">
			<!-- Admin Sidebar -->
			<div class="sidebar">
				<h2>Bluwud Furniture</h2>
				<ul>
					<li><a href="${contextPath}/Dashboard">Dashboard</a></li>
					<li><a href="${contextPath}/Info">Admin Portal</a></li>
					<li><a href="${contextPath}/CustomerController">Customer
							Portal</a></li>
					<li><a href="${contextPath}/Products">Products</a></li>
				</ul>
				<div class="logout">
					<ul>
						<li>
							<form action="${contextPath}/logout" method="POST">
								<button type="submit">⇦ Logout</button>
							</form>
						</li>
					</ul>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<!-- Customer Header -->
			<jsp:include page="header.jsp" />
			<div class="head">
				<div class="left">Bluwud Furniture | Profile Overview</div>
				<div class="right">
					<span>${user.user_name}</span>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<!-- Common Page Content -->




	<div class="main-content">
		<div class="profile-name">Update Your Profile</div>

		<c:if test="${not empty error}">
			<div class="message error-message">${error}</div>
		</c:if>

		<c:if test="${not empty success}">
			<div class="message success-message">${success}</div>
		</c:if>

		<c:if test="${user != null}">
			<form action="${contextPath}/Info" method="post" class="update-form">
				<div class="form-title">Personal details</div>
				<div class="form-grid">
					<div>
						<label for="user_name">Name:</label> <input type="text"
							id="user_name" name="user_name" value="${user.user_name}"
							required />
					</div>
					<div>
						<label for="user_contact">Mobile number:</label> <input
							type="text" id="user_contact" name="user_contact"
							value="${user.user_contact}" required />
					</div>
					<div>
						<label for="user_email">Email:</label> <input type="email"
							id="user_email" name="user_email" value="${user.user_email}"
							required />
					</div>
					<div>
						<label for="user_address">Address:</label> <input type="text"
							id="user_address" name="user_address"
							value="${user.user_address}" required />
					</div>
					<div>
						<label for="user_password">Password:</label> <input
							type="password" id="user_password" name="user_password"
							value="${user.user_password}" required />
					</div>
					<div>
						<label for="confirm_password">Confirm Password:</label> <input
							type="password" id="confirm_password" name="confirm_password"
							required />
					</div>
				</div>
				<div class="button-bar">
					<button type="submit">Save changes</button>
				</div>
			</form>
		</c:if>

		<c:if test="${user == null}">
			<div class="message error-message">User data not available.
				Please log in again.</div>
		</c:if>
	</div>

	<c:if test="${not isAdmin}">
		<jsp:include page="footer.jsp" />
	</c:if>

</body>
</html>
