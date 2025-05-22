<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bluwud.model.UserModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css" />
</head>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #a7b48b;
	background-size: cover;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #fff;
}
</style>

<body>
	<div class="login-box">
		<%
		String errorMessage = (String) request.getAttribute("error");
		String successMessage = (String) request.getAttribute("success");

		if (errorMessage != null && !errorMessage.isEmpty()) {
			out.println("<p class=\"error-message\">" + errorMessage + "</p>");
		}

		if (successMessage != null && !successMessage.isEmpty()) {
		%>
		<p class="success-message"><%=successMessage%></p>
		<%
		}
		%>

		<h2>Access Your Account</h2>
		<form action="${pageContext.request.contextPath}/login" method="post">
			<div class="row">
				<div class="col">
					<label for="user_name">Name:</label> <input type="text"
						id="user_name" name="user_name" placeholder="Enter your name"
						required>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="user_password">Password:</label> <input type="password"
						id="user_password" name="user_password"
						placeholder="Enter your password" required>
				</div>
			</div>
			<div class="row">
				<button type="submit" class="login-button">login</button>
			</div>
		</form>

		<div class="row">
			<a href="${pageContext.request.contextPath}/register"
				class="register-button">Register</a>
		</div>
	</div>
</body>
</html>