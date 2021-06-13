<%@ page import="com.learn.mycart.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.learn.mycart.entities.WishList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Wishlist</title>
    <%@include file="common_css_js.jsp"%>
</head>
<body>
        <%@include file="navbar.jsp"%>
        <%
            int wishListId=Integer.parseInt(request.getParameter("wishlist_id").trim());
            Session s= FactoryProvider.getFactory().openSession();
            WishList wishlist =(WishList) s.get(WishList.class,wishListId);
        %>
        <form action="UpdateWishServlet" method="post">
            <input value="<%=wishlist.getId()%>" name="wishlist_id" type="hidden"/>
            <div class="mb-3">
                <label for="title" class="form-label">Wishlist Title</label>
                <input
                        name="title"
                        required
                        type="text"
                        class="form-control"
                        id="title"
                        placeholder="Enter here"
                        value="<%=wishlist.getTitle()%>"
                        aria-describedby="emailHelp"/>
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">Wishlist Content</label>
                <textarea
                        name="content"
                        required
                        id="content"
                        placeholder="Enter your Content here"
                        class="form-control"
                        style="height: 300px"
                ><%=wishlist.getContent()%></textarea>
            </div>
            <div class="container text-center">
                <button type="submit" class="btn btn-success">Save your Wishlist</button>
            </div>
        </form>
</body>
</html>
