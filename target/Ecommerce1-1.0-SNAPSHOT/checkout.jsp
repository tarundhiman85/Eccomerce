<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not logged in");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout Page</title>
    <%@include file="common_css_js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-6">
<%--        card--%>
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-5">Your Selected Items</h3>
                    <div class="cart-body">
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-6">
<%--        form details--%>
    <div class="card">
        <div class="card-body">
            <h3 class="text-center mb-5">Your Details for Order</h3>
            <form action="">
                <div class="form-group">
                    <label for="name">Your Name</label>
                    <input value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                </div>
                    <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                        <div class="form-group">
                        <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" value="<%=user.getUserAddress()%>" rows="3" placeholder="Enter your Address"></textarea>
                    </div>
                <div class="container text-center">
<%--                    <input type="text" class="form-control" id="payment_field" placeholder="Enter Amount"/>--%>
                    <button class="btn btn-outline-success" onclick="orderNow()">Order Now</button>
                    <button class="btn btn-outline-primary">Continue Shopping</button>
                </div>

                <div class="getOrderData">
<%--                    here we will get product data--%>
                </div>
            </form>
        </div>
    </div>
        </div>
    </div>
</div>
<%@include file="common_modals.jsp"%>
</body>
</html>
