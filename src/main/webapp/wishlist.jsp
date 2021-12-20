<%@ page import="mycart.Helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="mycart.Model.WishList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    User user=(User)session.getAttribute("current-user");
    if(user==null) {
        session.setAttribute("message","You are not logged in");
        response.sendRedirect("login.jsp");
        return; }
%>

<html>
<head>
    <title>Wishlist</title>
    <%@include file="common_css_js.jsp"%>
</head>
<%--<body style="background-image: url('img/purple image.jpg')">--%>
<body>
<%@include file="navbar.jsp"%>
<div class="takingMargin">
<div class="container text-center">
    <h1 style="color: black">All Wishlist</h1>
</div>

<div class="container">
        <div class="row">
    <div class="col-12">
        <%
            Session s=FactoryProvider.getFactory().openSession();
            //Query q=s.createQuery("from Wishlist where user.productId=getUserId()");
            Query q=s.createQuery("from Wishlist");
            List<WishList> list=q.list();
            if(list.isEmpty()){
                %>
         <%--ADD Something to Redirect--%>
         <h1 style="color:black">There is No Wishlist</h1><br>
          <a style="color: black" href="add_wishlist.jsp">Click Here to Add New Wishlist</a>
        <%
            }
            for (WishList wishList: list){
        %>
        <div class="card mt-3">
            <img class="card-img-top m-4 mx-auto" src="img/writing.png" style="max-width: 100px" alt="Card image cap">
            <div class="card-body px-5">
                <h5 class="card-title"><%=wishList.getTitle()%></h5>
                <p class="card-text">
                    <%=wishList.getContent()%>
                </p>
                <c:set var = "now" value = "<%=wishList.getAddedDate()%>" />
                <p><b class="text-primary">Added Date: <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${now}"/></b></p>
                <div class="container text-center">
                    <a href="DeleteWishlistServlet?wishlist_id=<%=wishList.getId()%>" class="btn btn-danger">Delete Wishlist</a>
                    <a href="editWishlist.jsp?wishlist_id=<%=wishList.getId()%>" class="btn btn-primary">Update Wishlist</a>
                </div>
            </div>
            <%
                }
                s.close();
            %>
        </div>
    </div>

</div>
</div>
</div>
</body>
</html>
