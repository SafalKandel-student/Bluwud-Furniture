<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />

<style>
body {
	margin: 0;
	font-family: sans-serif;
	background-color: #dcd8ca;
	background-image:
		url('${pageContext.request.contextPath}/resources/images/system/homebackground.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.a, .b {
	display: flex;
	align-items: stretch;
	height: 500px;
	padding: 0;
	margin-bottom: 40px;
	gap: 30px; 
}

.text1, .text2 {
	background-color: #b9c4a1;
	width: 50%;
	padding: 40px;
	box-sizing: border-box;
	color: white;
	text-align: center;
	font-size: 18px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	border-radius: 200px;
}

.text1 h2, .text2 h1 {
	margin-bottom: 15px;
}

.image1, .image2 {
	width: 50%;
}

.image1 .image, .image2 .image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
	border-radius: 200px;
}

.image3 {
	width: 100%;
}

.image3 .image {
	width: 100%;
	height: 800px;
	object-fit: cover;
	display: block;
}

.text3 {
	background-color: #b9c4a1;
	padding: 30px 20px;
	text-align: center;
	color: white;
	font-size: 18px;
}

.text3 h1 {
	margin-bottom: 40px;
}

.a:hover, .b:hover, .text1:hover, .text2:hover, .text3:hover, .image1:hover,
	.image2:hover, .image3:hover {
	transform: scale(1.02);
	transition: transform 0.4s ease, background-color 0.4s ease;
	background-color: rgba(0, 0, 0, 0.05); 
}

.image1 .image:hover, .image2 .image:hover, .image3 .image:hover {
	transform: scale(1.05);
	transition: transform 0.4s ease;
	filter: brightness(1.1);
	cursor: pointer;
	border-radius: 220px; 
}

.text1:hover, .text2:hover {
	box-shadow: 4px 20px rgba(0, 0, 0, 0.2);
	color: #f5f5f5;
}

.text3:hover {
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
	color: white;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp" />
	<br>
	<br>

	<div class="main">
	
		<div class="a">
			<div class="text1">
				<h2>About Us: Bluwud Furniture – The Elegance of Nepal</h2>
				<p>
					Welcome to Bluwud Furniture, where craftsmanship meets comfort and
					style.<br> At Bluwud, we believe that furniture is more than
					just utility—it’s a reflection of who you are. That’s why we design
					and craft pieces that bring elegance, durability, and warmth into
					every home and workspace.<br> Our expert team of designers and
					craftsmen are passionate about blending modern aesthetics with
					practical functionality. We use high-quality materials and
					state-of-the-art technology to ensure every product stands the test
					of time.
				</p>
			</div>
			<div class="image1">
				<img
					src="${pageContext.request.contextPath}/resources/images/system/aboutus1.jpg"
					class="image" />
			</div>
		</div>

		<div class="b">
			<div class="image2">
				<img
					src="${pageContext.request.contextPath}/resources/images/system/aboutus2.jpg"
					class="image" />
			</div>
			<div class="text2">
				<h1>Why Choose Bluwud?</h1>
				<p>Custom designs to match your vision</p>
				<p>High-quality materials and finishes</p>
				<p>Timely delivery and professional installation</p>
				<p>Excellent after-sales support</p>
				<p>Creative-first approach</p>
				<p>Purpose-driven design and collaborative culture</p>
			</div>
		</div>

		<div class="image3">
			<img
				src="${pageContext.request.contextPath}/resources/images/system/aboutus1.jpg"
				class="image" />
		</div>

		<br>

		<div class="text3">
			<h1>How It Started</h1>
			<p>
				Bluwud began as a spark—an idea rooted in passion, creativity, and
				the desire to build something different. It wasn’t born in a
				boardroom or with a big budget. It started small—just a few minds, a
				lot of heart, and a shared vision: to create a space where design
				meets purpose, and stories come alive through art, innovation, and
				culture.<br> <br> In the early days, it was all about
				experimenting—long nights, countless cups of coffee, and the
				relentless pursuit of “something more.” What began as a side project
				quickly gained momentum as people noticed the bold ideas, clean
				aesthetic, and the unmistakable vibe that Bluwud carried.<br> <br>
				From those humble beginnings, Bluwud has grown—not just in size, but
				in soul. It’s more than a brand. It’s a movement. A mindset. And
				it's just getting started.
			</p>
		</div>
	</div>

	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>
