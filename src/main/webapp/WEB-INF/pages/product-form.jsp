<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect(request.getContextPath() + "/");
        return;
    }

    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>${product != null ? "Edit" : "Add"} Product</title>
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

        form label {
            font-size: 14px;
            font-weight: 500;
            color: #555;
            display: block;
            margin-top: 15px;
            margin-bottom: 6px;
        }

        form input[type="text"],
        form input[type="number"],
        form select,
        form input[type="file"] {
            width: 100%;
            padding: 10px 14px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            background-color: #f9f9f9;
        }

        button[type="submit"] {
            background-color: #ffffff;
            color: #007bff;
            border: 2px solid #007bff;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
        }

        button[type="submit"]:hover {
            background-color: #007bff;
            color: white;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>
   <div class="sidebar">
		<h2>Bluwud Furniture</h2>
		<ul>
			<li><a href="${pageContext.request.contextPath}/Dashboard">Dashboard</a></li>
			<li><a href="${pageContext.request.contextPath}/Info">Admin Portal</a></li>
			<li><a href="${pageContext.request.contextPath}/CustomerController">Customer Portal</a></li>
			<li><a href="${pageContext.request.contextPath}/Products">Products</a></li>
		</ul>
		<div class="logout">
			<ul>
				<li>
					<form action="${pageContext.request.contextPath}/logout" method="POST">
						<button type="submit">⇦ Logout</button>
					</form>
				</li>
			</ul>
		</div>
	</div>

    <div class="main-content">
        <h2>${product != null ? "Edit" : "Add"} Product</h2>
        <form action="${pageContext.request.contextPath}/Products" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="save"/>
            <c:if test="${product != null}">
                <input type="hidden" name="product_id" value="${product.product_id}" />
            </c:if>

            <label for="image_path">Room Image:</label>
            <input type="file" id="image_path" name="image_path" accept="image/*" />

            <label>Product Name:</label>
            <input type="text" name="product_name" value="${product.product_name}" required />

            <label>Description:</label>
            <input type="text" name="product_description" value="${product.product_description}" required />

            <label>Unit Price:</label>
            <input type="number" step="0.01" name="product_unitprice" value="${product.product_unitprice}" required />

            <label>Category:</label>
            <select name="category_id" required>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.category_id}"
                        <c:if test="${product != null && product.category_id.category_id == category.category_id}">selected</c:if>>
                        ${category.category_type}
                    </option>
                </c:forEach>
            </select>

            <label>Supplier:</label>
            <select name="supplier_id" required>
                <c:forEach var="supplier" items="${suppliers}">
                    <option value="${supplier.supplier_id}"
                        <c:if test="${product != null && product.supplier_id.supplier_id == supplier.supplier_id}">selected</c:if>>
                        ${supplier.supplier_name}
                    </option>
                </c:forEach>
            </select>

            <button type="submit">${product != null ? "Update" : "Add"} Product</button>
        </form>

        <a href="${pageContext.request.contextPath}/Products">⇦ Back to List</a>
    </div>
</body>
</html>
