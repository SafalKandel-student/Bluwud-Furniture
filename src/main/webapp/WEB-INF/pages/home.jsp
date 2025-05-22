<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.page-wrapper {
	background-color: #c7d3b6;
	font-family: Arial, sans-serif;
}

.slider {
	width: 100%;
	height: 700px;
	overflow: hidden;
	position: relative;
	margin-top: 40px;
}

.slides {
	display: flex;
	height: 100%;
}

.slides img {
	width: 100%;
	height: 700px;
	object-fit: cover;
}

.slider-one .slides-one {
	width: 400%;
	animation: slideOne 25s infinite;
}

@keyframes slideOne {
	0% { transform: translateX(0); }
	25% { transform: translateX(-100vw); }
	50% { transform: translateX(-200vw); }
	75% { transform: translateX(-300vw); }
	100% { transform: translateX(0); }
}

.slider-two .slides-two {
	width: 500%;
	display: flex;
	margin-top: 10px;
	animation: slideTwo 50s infinite;
}
@keyframes slideTwo {
	0% { transform: translateX(0); }
	60% { transform: translateX(-100vw); }
	100% { transform: translateX(-200vw); }
	160% { transform: translateX(-300vw); }
	200% { transform: translateX(-400vw); }
	250% { transform: translateX(0); }
}

.a {
	text-align: center;
	color: white;
	font-size: 25px;
	margin: 30px;
}

.c {
	display: flex;
	justify-content: space-between;
	padding: 20px;
}

.img1, .img11, .img2, .img22 {
	width: 1000px;
	height: 400px;
	max-width: 100%;
}

.img1 img, .img11 img, .img2 img, .img22 img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
	gap: 10px;
}

.Row {
	padding: 80px;
	justify-content: center;
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
	max-width: 80%;
	margin: 0 auto;
	margin-top: 30px;
}

.product-column1, .product-column2, .product-column3 {
	flex: 1;
}

.product-card {
	width: 100%;
	border-radius: 12px;
	overflow: hidden;
	background-color: #fff;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	transition: transform 0.3s ease-in-out;
	cursor: pointer;
}

.product-card img {
	width: 100%;
	height: auto;
	object-fit: cover;
	display: block;
}

.image {
	width: 325px;
	height: 300px;
	object-fit: cover;
	transition: transform 0.3s ease-in-out;
}

.btn {
	background-color: lemonchiffon;
	width: 325px;
	height: 50px;
	margin-bottom: 10%;
}

.b {
	display: flex;
	justify-content: space-between;
	gap: 0px;
	padding: 20px;
}
.text-slider-section {
	display: flex;
	justify-content: space-between;
	padding: 80px;
	gap: 10px;
	height: 400px; /* Fixed consistent height */
	box-sizing: border-box;
}

.textbox {
	flex: 1;
	background-color: #a7b890;
	padding: 30px;
	box-sizing: border-box;
	height: 100%; /* Match parent height */
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin-top: 10px;
	
}

.slider-two {
	flex: 1;
	max-width: 50%;
	height: 100%; /* Match parent height */
	overflow: hidden;
	box-sizing: border-box;
}

.slider-two img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.textbox h3 {
	color: #8b7c5b;
	font-size: 12px;
	letter-spacing: 2px;
	margin-bottom: 10px;
}

.textbox h2 {
	font-size: 26px;
	margin: 10px 0;
	color: #506336;
}

.textbox p {
	font-size: 20px;
	line-height: 1.6;
	color: #506336;
}

.textbox a {
	display: inline-block;
	margin-top: 10px;
	color: #8b7c5b;
	font-weight: bold;
	text-decoration: none;
}

.slider-two {
	flex: 1;
	max-width: 60%;
	height: 170%;
	overflow: hidden;
}

/* Hover effect */
img:hover {
	transform: scale(1.05);
	transition: transform 0.3s ease-in-out;
}

/* Animation for text */
@keyframes fadeInUp {
	0% {
		opacity: 0;
		transform: translateY(30px);
	}
	100% {
		opacity: 1;
		transform: translateY(0);
	}
}
.textbox{
width: 1000px;
	height: 400px;
	max-width: 100%;
	padding-left: 10px;
}
textbox:hover {
	transform: scale(1.05);
	transition: transform 0.3s ease-in-out;
}
</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
</head>

<body>
	<div class="page-wrapper">
		<jsp:include page="header.jsp" />
		<br><br>

		<!-- First Slider -->
		<div class="slider slider-one">
			<div class="slides slides-one">
				<img src="${pageContext.request.contextPath}/resources/images/system/mainslider1.jpg" alt="Slide 1" />
				<img src="${pageContext.request.contextPath}/resources/images/system/mainslider1.jpg" alt="Slide 2" />
				<img src="${pageContext.request.contextPath}/resources/images/system/mainslider1.jpg" alt="Slide 3" />
				<img src="${pageContext.request.contextPath}/resources/images/system/mainslider1.jpg" alt="Slide 4" />
			</div>
		</div>

		<!-- Heading -->
		<div class="a">
			<h2>High-Quality Furniture For Your Dream Home<br>Make it Classic and Aesthetic</h2>
		</div>

		<!-- Side Images -->
		<div class="c">
			<div class="img1">
				<img src="${pageContext.request.contextPath}/resources/images/system/room4.jpg" alt="Side Image">
			</div>
			<div class="img11">
				<img src="${pageContext.request.contextPath}/resources/images/system/dd.png" alt="Side Image" />
			</div>
		</div>

		<div class="a">
			<h2>From Our Heart To Your Home <br/> "Built for your moments. Designed for your life."</h2>
		</div>
<!-- Text and Slider Side by Side -->
<div class="text-slider-section">
	<div class="textbox">
		<h3>Bluwud Furniture</h3>
		<h2> "Where design meets durability – BluWud Furniture."</h2>
		<p>
			At BluWud, furniture is more than function—it’s a reflection of who you are. Each piece is thoughtfully designed and meticulously crafted to bring elegance, comfort, and longevity into your space. We blend contemporary aesthetics with timeless craftsmanship, using premium materials that stand the test of time. Whether it’s a dining table that hosts family traditions, a wardrobe that organizes your world, or a work desk that fuels your ambition—BluWud furniture transforms everyday living into an experience of enduring style and purpose. When you choose BluWud, you’re not just furnishing a home—you’re curating a lifestyle.

			
		</p>
	</div>

			<!-- Half Width Slider -->
			<div class="slider slider-two" style="flex: 1; max-width: 50%; margin-top: 8px;">
				<div class="slides slides-two">
					<img src="${pageContext.request.contextPath}/resources/images/system/H1.jpg" alt="Slide 1" />
					<img src="${pageContext.request.contextPath}/resources/images/system/H2.jpg" alt="Slide 2" />
					<img src="${pageContext.request.contextPath}/resources/images/system/H3.jpg" alt="Slide 3" />
					<img src="${pageContext.request.contextPath}/resources/images/system/home4.jpg" alt="Slide 4" />
					<img src="${pageContext.request.contextPath}/resources/images/system/home7.png" alt="Slide 5" />
					<img src="${pageContext.request.contextPath}/resources/images/system/home9.jpg" alt="Slide 5" />
				</div>
			</div>
		</div>

		<!-- Product Columns -->
		<div class="Row">
			<div class="product-column1">
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home2.jpg" />
				</div>
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home1.jpg" />
				</div>
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home4.jpg" />
				</div>
			</div>
			<div class="product-column2">
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home5.jpg" />
				</div>
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home6.jpg" />
				</div>
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home7.png" />
				</div>
			</div>
			<div class="product-column3">
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home8.jpg" />
				</div>
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home9.jpg" />
				</div>
				<div class="product-card">
					<img src="${pageContext.request.contextPath}/resources/images/system/home10.jpg" style="height: 650px; object-fit: cover; width: 100%;" />
				</div>
			</div>
		</div>

		<!-- Two Final Big Images -->
		<div class="b">
			<div class="img2">
				<img src="${pageContext.request.contextPath}/resources/images/system/room.jpg" class="image" />
			</div>
			<div class="img22">
				<img src="${pageContext.request.contextPath}/resources/images/system/img22.png" class="image" />
			</div>
		</div>

		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
