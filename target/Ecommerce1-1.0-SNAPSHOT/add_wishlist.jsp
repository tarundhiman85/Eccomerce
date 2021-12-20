
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not logged in");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Add Wishlist</title>
    <%@include file="common_css_js.jsp"%>
</head>
<%--<body style="background-image: url('img/purple image.jpg')">--%>
<body>
<%@include file="navbar.jsp"%>
<div class="takingMargin">
<div class="container text-center">
    <h1 style="color: black">Please fill your Wishlist Details</h1>
</div>
<br>
<%--This is Add Form--%>
<form action="SaveWishlistServlet" method="post">
    <div class="container">
    <div class="mb-3">
        <%--@declare id="title"--%><label style="color: black" for="title" class="form-label">WishList Category</label>
        <input
                name="title"
                required
                type="text"
                class="form-control"
                productId="title"
                placeholder="Enter the Category Here"
                aria-describedby="emailHelp"/>
    </div>
    <div class="mb-3">
        <%--@declare id="content"--%><label style="color: black" for="content" class="form-label">Wishlist Items</label>
        <textarea
                name="content"
                required
                productId="content"
                placeholder="Enter your Items here"
                class="form-control"
                style="height: 200px"
        ></textarea>
    </div>
    <div class="container text-center">
        <button type="submit" class="btn btn-primary">Add Wishlist</button>
    </div>
    </div>
</form>
</div>
</body>
</html>
