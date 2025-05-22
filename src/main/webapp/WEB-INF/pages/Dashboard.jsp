<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	background-color: #bbd2de;
	display: flex;
	height: 100vh;
	overflow: hidden;
}

.sidebar {
	width: 270px;
	background: #0e3f57;
	padding: 20px;
	color: #ccd9e0;
	transition: width 0.3s ease;
	overflow: hidden;
}

.sidebar:hover {
	width: 270px;
}

.sidebar h2 {
	margin-bottom: 20px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin: 15px 0;
	cursor: pointer;
	transition: background-color 0.3s, padding-left 0.3s;
	padding: 5px;
	border-radius: 4px;
}

.sidebar ul li a {
	color: white;
	text-decoration: none;
	display: block;
}

.sidebar ul li:hover {
	background-color: #1e5d77;
	padding-left: 15px;
}

.logout {
	margin-top: 550px;
	font-size: 20px;
}

.main {
	flex-grow: 1;
	padding: 20px;
	overflow-y: auto;
	transition: margin-left 0.3s ease;
}

.cards {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
}

.card {
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	flex: 1;
	min-width: 150px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	color: white;
}

.card1 {
	background-color: #cd475e;
}

.card2 {
	background-color: #90bd4c;
}

.card3 {
	background-color: #656fb6;
}

.card4 {
	background-color: #cebf5f;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.charts {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.row {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.chart-box, .calendar-box {
	background: #e0ebf1;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	flex: 1;
	min-width: 200px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.chart-box canvas {
    max-width: 400px;
    max-height: 400px;
    width: 100%;
    height: auto;
    margin: auto;
    display: block;
}


.chart-box:hover, .calendar-box:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.full-width {
	width: 100%;
}

textarea {
	width: 100%;
	box-sizing: border-box;
	padding: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
}

button {
	padding: 10px 15px;
	margin-top: 10px;
	background-color: #4e73df;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #2e59d9;
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
			<li><a href="${pageContext.request.contextPath}/contact">messages</a></li>
			
			<li><a href="${pageContext.request.contextPath}/admin/cart">orders</a></li>
		</ul>
		<div class="logout">
			<ul>
				<li>
					<form action="${pageContext.request.contextPath}/logout"
						method="POST">
						<button type="submit">⇦ Logout</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
	<div class="main">
		<h1>Dashboard</h1>
		<div class="cards">
			<div class="card card1">
				Total Customers<br> <strong><%=request.getAttribute("customers")%></strong>
			</div>
			<div class="card card2">
				Total Revenue<br> <strong><%=request.getAttribute("revenue")%></strong>
			</div>
			<div class="card card3">
				Total Orders<br> <strong><%=request.getAttribute("totalOrders")%></strong>
			</div>
			<div class="card card4">
				Total Returns<br> <strong><%=request.getAttribute("totalReturns")%></strong>
			</div>
		</div>
		<div class="charts">
			<div class="chart-box">
				<h3>Category Types Distribution</h3>
				<canvas id="categoryTypePieChart"></canvas>
				<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
				<script>
    const categoryTypeLabels = [
        <%Map<String, Integer> categoryTypeMap = (Map<String, Integer>) request.getAttribute("categoryTypeMap");
for (String key : categoryTypeMap.keySet()) {%>"<%=key%>",<%}%>
    ];
    
    const categoryTypeData = [
        <%for (Integer value : categoryTypeMap.values()) {%><%=value%>,<%}%>
    ];

    const ctx = document.getElementById('categoryTypePieChart').getContext('2d');
    const categoryTypeChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: categoryTypeLabels,
            datasets: [{
                label: 'Category Type Distribution',
                data: categoryTypeData,
                backgroundColor: [
                    '#FF6384', '#36A2EB', '#FFCE56', '#8BC34A', '#FF9800', '#9C27B0'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: { color: '#000' }
                }
            }
        }
    });
</script>
			</div>
		</div>
	</div>
</body>
</html>
