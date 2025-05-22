<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Management</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            display: flex;
            height: 100vh;
        }

        .container {
            display: flex;
            width: 100%;
        }

            .sidebar {
    width: 270px;
    background: #0e3f57;
    padding: 20px;
    color: #fff;
    overflow: hidden;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
    box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
}

.sidebar:hover {
    width: 300px;
    box-shadow: 4px 0 10px rgba(0, 0, 0, 0.2);
    background: #12506f; 
}
      

        .sidebar h2 {
            color: #ffffff;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 18px 0;
            cursor: pointer;
            transition: background-color 0.3s, padding-left 0.3s;
            padding: 5px;
            border-radius: 4px;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            display: block;
        }

        .sidebar ul li:hover {
            background-color: #1e5d77;
            padding-left: 15px;
        }

        .logout {
            margin-top: auto;
            font-size: 20px;
        }
        
        .nav {
            list-style: none;
            padding: 0;
        }

        .nav li {
            margin: 15px 0;
        }

        .nav li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            display: flex;
            align-items: center;
            transition: padding-left 0.3s;
        }

        .nav li a:hover {
            padding-left: 10px;
            color: #aad3e6;
        }

        .icon {
            margin-right: 10px;
        }

        .content {
            flex-grow: 1;
            padding: 40px;
            background-color: #bbd7e6;
            overflow-y: auto;
        }

        .table-container {
            background: #e2f0f7;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        h3 {
            margin-bottom: 20px;
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        thead {
            background-color: #3498db;
            color: white;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action-btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .action-btn:hover {
            background-color: #2c81ba;
            transform: scale(1.05);
        }

        .error-message {
            background-color: #ffe6e6;
            color: #d93025;
            border-left: 5px solid #d93025;
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 6px;
        }

        .success-message {
            background-color: #e6f4ea;
            color: #188038;
            border-left: 5px solid #188038;
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 6px;
        }

        @media (max-width: 768px) {
            body, .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                text-align: center;
            }

            .nav li a {
                justify-content: center;
            }

            .content {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <h2>Bluwud Furniture</h2>
     <ul>
			<li><a href="${contextPath}/Dashboard">Dashboard</a></li>
			<li><a href="${contextPath}/Info">Admin Portal</a></li>
			<li><a href="${contextPath}/CustomerController"> User List</a></li>
			<li><a href="${pageContext.request.contextPath}/Products">Products</a></li>
		</ul>
        <div class="logout">
            <ul>
                <li>
                    <form action="${contextPath}/logout" method="POST" style="display: inline;">
                        <button type="submit"
                            style="background: none; border: none; color: inherit; font: inherit; cursor: pointer; padding: 0;">
                            ⇦ Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
    <div class="content">
        <div class="table-container">

            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>

            <c:if test="${not empty success}">
                <p class="success-message">${success}</p>
            </c:if>

            <h3>User List</h3>

            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.user_id}</td>
                        <td>${user.user_name}</td>
                        <td>${user.user_contact}</td>
                        <td>${user.user_address}</td>
                        <td>${user.user_email}</td>
                        <td>
                            <form action="${contextPath}/Update" method="post" style="display: inline;">
                                <input type="hidden" name="user_id" value="${user.user_id}">
                                <input type="hidden" name="action" value="updateForm">
                                <button class="action-btn" type="submit">Edit</button>
                            </form>
                            <form action="${contextPath}/Update" method="post" style="display: inline;">
                                <input type="hidden" name="user_id" value="${user.user_id}">
                                <input type="hidden" name="action" value="delete">
                                <button class="action-btn" type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
