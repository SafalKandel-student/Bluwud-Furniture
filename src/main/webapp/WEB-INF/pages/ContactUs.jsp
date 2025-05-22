<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
<style>
body {
	margin: 0;
	font-family: 'Segoe UI', Tahoma, sans-serif;
	background-image:
		url('${pageContext.request.contextPath}/resources/images/system/homebackground.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.contact-wrapper {
	display: flex;
	background: #e9f7ef;
	border-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	max-width: 1000px;
	margin: 40px auto;
}

.info-box {
	background: #e9f7ef;
	padding: 30px 20px;
	width: 40%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	gap: 30px;
	border-right: 1px solid #eee;
}

.info-item h3 {
	color: #007bff;
	margin-bottom: 5px;
}

.info-item p {
	margin: 0;
	color: #555;
}

.form-box {
	padding: 40px 30px;
	width: 60%;
}

.form-box h2 {
	margin-bottom: 25px;
	color: #333;
}

.form-box form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.form-box input, .form-box textarea {
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 16px;
}

.form-box textarea {
	resize: vertical;
	height: 100px;
}

.form-box button {
	padding: 12px;
	background-color: #2e3546;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.contact-wrapper:hover {
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
	transform: scale(1.01);
	transition: all 0.3s ease;
}

.contact-wrapper {
	transition: all 0.3s ease;
}

.form-box button:hover {
	background-color: #1b202b;
}
</style>
</head>
<body>

	<!-- Include Header -->
	<jsp:include page="header.jsp" />
	
	<!-- Contact Form Section -->
	<div class="contact-wrapper">
		<div class="info-box">
			<div class="info-item">
				<h3>📍 Location</h3>
				<p>Kamal Marg, Kamal Pokhari</p>
			</div>
			<div class="info-item">
				<h3>📞 Phone</h3>
				<p>01-6632958</p>
			</div>
			<div class="info-item">
				<h3>⏰ Hours</h3>
				<p>Mon - Fri: 9am - 6pm</p>
			</div>
		</div>

		<div class="form-box">
			<h2>Contact Form</h2>
			<form method="post" action="${pageContext.request.contextPath}/contact">
				<input type="text" name="full_name" placeholder="Full Name" required> 
				<input type="email" name="email" placeholder="Email" required>
				<textarea name="message" placeholder="Comment or message" required></textarea>
				<button type="submit">Submit</button>
			</form>
		</div>
	</div>

	<!-- Include Footer -->
	<jsp:include page="footer.jsp" />

</body>
</html>