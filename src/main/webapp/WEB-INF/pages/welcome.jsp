<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Welcome to Bluwud</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-image:
		url('${pageContext.request.contextPath}/resources/images/system/homebackground.jpg');
	background-repeat: no-repeat;
	background-position: center center;
	background-attachment: fixed;
	background-size: cover;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #fff;
	text-align: center;
}

.overlay {
	background-color: #a7b48b;
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 0 20px;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

h1 {
	font-size: 5em;
	margin-bottom: 0px;
	color: #fff;
	letter-spacing: 2px;
}

h2 {
	font-size: 3em;
	margin-bottom: 10px;
	color: #fff;
	letter-spacing: 2px;
}

p {
	font-size: 1.2em;
	margin-bottom: 40px;
	color: #ddd;
}

.buttons {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

.button {
	text-decoration: none;
	padding: 14px 30px;
	font-size: 2em;
	background-color: #849461;
	border-radius: 30px;
	color: #fff;
	transition: background-color 0.3s ease;
}

.button:hover {
	background-color: #718545;
}
</style>
</head>
<body>
	<div class="overlay">
		<h1>Welcome to Bluwud</h1>
		<h2>Your Heart Meet Our Design</h2>
		<p>Your trusted destination for elegant and affordable furniture</p>
		<div class="buttons">
			<a href="<%=request.getContextPath()%>/login" class="button">Login</a>
			<a href="<%=request.getContextPath()%>/register" class="button">Register</a>
		</div>
	</div>
</body>
</html>
