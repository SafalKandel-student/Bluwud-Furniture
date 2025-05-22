<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bluwud.model.ContactModel" %>
<%@ page import="java.util.List" %>
<%
    String contextPath = request.getContextPath();
    List<ContactModel> contactMessages = (List<ContactModel>) request.getAttribute("contactMessages");
    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Contact Messages</title>
    <style>
        /* Your provided styles go here */
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
            display: flex;
            flex-direction: column;
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
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        .sidebar ul li:hover {
            background-color: #1e5d77;
            padding-left: 15px;
        }

        .logout {
            margin-top: auto;
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

        .action-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .action-btn:hover {
            background-color: #c0392b;
        }

        .success-message, .error-message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
        }

        .success-message {
            background-color: #e6f4ea;
            color: #188038;
            border-left: 5px solid #188038;
        }

        .error-message {
            background-color: #ffe6e6;
            color: #d93025;
            border-left: 5px solid #d93025;
        }

        @media (max-width: 768px) {
            body, .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <h2>Bluwud Furniture</h2>
        <ul>
            <li><a href="<%= contextPath %>/Dashboard">Dashboard</a></li>
            <li><a href="<%= contextPath %>/Info">Admin Portal</a></li>
            <li><a href="<%= contextPath %>/CustomerController">User List</a></li>
            <li><a href="<%= contextPath %>/Products">Products</a></li>
        </ul>
        <div class="logout">
            <form action="<%= contextPath %>/logout" method="POST">
                <button type="submit"
                        style="background: none; border: none; color: white; font-size: 18px; cursor: pointer;">
                    ⇦ Logout
                </button>
            </form>
        </div>
    </div>
    <div class="content">
        <h2>All Contact Messages</h2>

        <% if (successMessage != null) { %>
            <div class="success-message"><%= successMessage %></div>
        <% } %>
        <% if (errorMessage != null) { %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>

        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Message</th>
                    <th>User ID</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <% if (contactMessages != null && !contactMessages.isEmpty()) {
                    for (ContactModel contact : contactMessages) { %>
                        <tr>
                            <td><%= contact.getContact_form_id() %></td>
                            <td><%= contact.getFull_name() %></td>
                            <td><%= contact.getEmail() %></td>
                            <td><%= contact.getMessage() %></td>
                            <td><%= contact.getUser_id() != null ? contact.getUser_id().getUser_id() : "N/A" %></td>
                            <td>
                                <a class="action-btn"
                                   href="<%= contextPath %>/contact?action=delete&id=<%= contact.getContact_form_id() %>"
                                   onclick="return confirm('Are you sure you want to delete this message?');">
                                    Delete
                                </a>
                            </td>
                        </tr>
                <%  }
                   } else { %>
                    <tr>
                        <td colspan="6">No contact messages found.</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>