<%@ page import="mycart.Helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="mycart.Model.WishList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Wishlist</title>
    <%@include file="common_css_js.jsp"%>
</head>
<%--<body style="background-image: url('img/purple image.jpg')">--%>
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
                <%--@declare id="title"--%><label for="title" class="form-label">Wishlist Title</label>
                <input
                        name="title"
                        required
                        type="text"
                        class="form-control"
                        productId="title"
                        placeholder="Enter here"
                        value="<%=wishlist.getTitle()%>"
                        aria-describedby="emailHelp"/>
            </div>
            <div class="mb-3">
                <%--@declare id="content"--%><label for="content" class="form-label">Wishlist Content</label>
                <textarea
                        name="content"
                        required
                        productId="content"
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
