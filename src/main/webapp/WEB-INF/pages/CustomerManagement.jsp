<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Management</title>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #bbd2de;
	display: flex;
}

.sidebar {
	width: 300px;
	height: 100vh; /* collapsed width */
	background: #0e3f57;
	padding: 20px 10px;
	color: #ccd9e0;
	overflow: hidden;
	transition: width 0.3s ease;
}

.sidebar:hover {
	width: 270px; /* expanded width */
}

.sidebar h2 {
	font-size: 20px;
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
	color: white; /* Set text color */
	text-decoration: none; /* Remove underline */
	display: block; /* Make entire list item clickable */
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
	flex: 1;
	padding: 20px;
}

.topbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.topbar h2 {
	font-size: 24px;
	color: #333;
}

.customer-table {
	width: 100%;
	border-collapse: collapse;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.customer-table th, .customer-table td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #eee;
}

.customer-table th {
	background-color: #f1f4f8;
	color: #333;
}

.customer-table tr:hover {
	background-color: #f9f9f9;
}

.view-btn {
	padding: 6px 12px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.view-btn:hover {
	background-color: #0056b3;
}

.search-bar {
	margin-bottom: 15px;
	display: flex;
	justify-content: space-between;
}

.search-bar input {
	padding: 8px;
	width: 250px;
	border-radius: 4px;
	border: 1px solid #ccc;
}

.export-btn {
	padding: 8px 12px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.export-btn:hover {
	background-color: #218838;
}
</style>
</head>
<body>

	<!-- Sidebar -->
	<div class="sidebar">
		<h2>Bluwud Furniture</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/Dashboard">Dashboard</a></li>
			<li><a href="${pageContext.request.contextPath}/Info">Admin
					Portal</a></li>
			<li><a
				href="${pageContext.request.contextPath}/CustomerManagement">User List</a></li>
			<li><a href="${pageContext.request.contextPath}/Products">Products</a></li>
		</ul>

		<div class="logout">
			<ul>
				<li>
					<form action="${pageContext.request.contextPath}/logout"
						method="POST" style="display: inline;">
						<button type="submit"
							style="background: none; border: none; color: inherit; font: inherit; cursor: pointer; padding: 0;">
							⇦ Logout</button>
					</form>
				</li>
			</ul>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main">
		<div class="topbar">
			<h2>Customer Management > Customers</h2>
			<button class="export-btn">Export Report</button>
		</div>

		<div class="search-bar">
			<input type="text" placeholder="Search customers...">
		</div>

		<table class="customer-table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Mobile Number</th>
					<th>Order Count</th>
					<th>Total Spend</th>
					<th>Is a Member</th>
					<th>Credit Balance</th>
					<th>Last Login</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<!-- Sample Row -->
				<tr>
					<td>John Doe</td>
					<td>john@example.com</td>
					<td>1234567890</td>
					<td>7</td>
					<td>$218.20</td>
					<td>✔</td>
					<td>300</td>
					<td>2023-08-21 3:23PM</td>
					<td><button class="view-btn">View</button></td>
				</tr>
				<!-- Add more rows as needed -->
			</tbody>
		</table>
	</div>

</body>
</html>
