<%@ page import="com.bluwud.model.UserModel"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/register.css" />
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
	<div class="container">
		<h1>Register Account</h1>
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
		<form action="${pageContext.request.contextPath}/register"
			method="post" enctype="multipart/form-data">

			<div class="row">
				<div class="col">
					<label for="user_name">Name:</label> <input type="text"
						id="user_name" name="user_name" placeholder="Name" required>
				</div>

			</div>
			<div class="row">
				<div class="col">
					<label for="user_contact">Phone Number:</label> <input type="text"
						id="user_contact" name="user_contact"
						placeholder="e.g. 9876543210" required>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<label for="user_address">Address:</label> <input type="text"
						id="user_address" name="user_address" placeholder="e.g Kathmandu"
						required>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<label for="user_email">Email:</label> <input type="email"
						id="user_email" name="user_email"
						placeholder="e.g. BluwudFurniture@gmail.com" required>
				</div>
			</div>



			<div class="row">
				<div class="col">
					<label for="user_password">Password:</label> <input type="password"
						id="user_password" name="user_password"
						placeholder="Enter password" required>
				</div>
				<div class="col">
					<label for="retypePassword">Retype Password:</label> <input
						type="password" id="retypePassword" name="retypePassword"
						placeholder="Confirm password" required>
				</div>
			</div>



			<div class="row buttons-row">
				<button type="submit">Create Account</button>
			</div>
		</form>
	</div>
</body>
</html>