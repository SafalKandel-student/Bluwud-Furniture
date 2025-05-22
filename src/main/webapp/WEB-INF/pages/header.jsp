<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="page-wrapper">
	<div id="header">
		<header class="header">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/home"> <img
					src="${pageContext.request.contextPath}/resources/images/system/logomain.png"
					alt="Company Logo" />
				</a>
			</div>
			<ul class="main-nav" role="navigation">
				<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
				<li class="dropdown">
    <a href="#">Product</a>
    <ul class="dropdown-menu">
        <c:forEach var="category" items="${categories}">
            <li>
                <a href="${pageContext.request.contextPath}/Products?categoryId=${category.category_id}">
                    ${category.category_type}
                </a>
            </li>
        </c:forEach>
    </ul>
</li>

				<li><a href="${pageContext.request.contextPath}/about">AboutUs</a></li>
				<li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
				<li><a href="${pageContext.request.contextPath}/Info">Profile</a></li>
				<li><a href="${pageContext.request.contextPath}/cart">Cart</a></li>
				<li><form action="${pageContext.request.contextPath}/logout"
						method="POST" style="display: inline;">
						<button type="submit"
							style="background: none; border: none; color: inherit; font: inherit; cursor: pointer; padding: 0;">Logout</button>
					</form></li>
			</ul>
			<div class="search-bar-wrapper">
				<form class="search-bar"
      action="${pageContext.request.contextPath}/Products" method="GET"
      aria-label="Site Search">
    <input type="text" name="search" placeholder="Search..."
           value="${searchQuery != null ? searchQuery : ''}">
    <button type="submit">Search</button>
</form>

			</div>
		</header>
	</div>
</div>
