<%@ page import="mycart.Model.UserOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="mycart.Dao.ProductDao" %>
<%@ page import="mycart.Helper.FactoryProvider" %><%--
  Created by IntelliJ IDEA.
  User: Tarun Dhiman
  Date: 19-12-2021
  Time: 06:48 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message","You are not logged in Login first");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Your Orders</title>
    <%@include file="common_css_js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container">
        <div class="col-md-10">
            <%--Row--%>
            <div class="row mt-4">
                <%--Col:takes 12 grid--%>
                <div class="col-md-12">
                    <div class="card-columns">
            <%
                List<UserOrder> userOrderList = new ProductDao(FactoryProvider.getFactory()).getAllOrderedProducts(user.getUserId());
                                for (UserOrder p: userOrderList){
                            %>
        <%--Product Card--%>
        <div class="card product-card">
            <div class="container text-center">
                <div class="card-body">
                    <h5 class="card-title">
                        <%=p.getProductName()%>
                    </h5>
                    <p class="card-text">
                        <%=p.getProductPrice()%>
                    </p>
                    <p class="card-text">
                        <%=p.getProductQuantity()%>
                    </p>
                </div>
            </div>
            <div class="card-footer text-center">

            </div>
        </div>
<%
        }%>
            </div>
            </div>
            </div>
            </div>
</div>
</body>
</html>
