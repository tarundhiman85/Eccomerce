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
                    <%--@declare id="name"--%><label for="name">Your Name</label>
                    <input value="<%=user.getUserName()%>" type="text" class="form-control" productId="name" aria-describedby="emailHelp" placeholder="Enter name">
                </div>
                    <div class="form-group">
                    <%--@declare id="exampleinputemail1"--%><label for="exampleInputEmail1">Email address</label>
                    <input value="<%=user.getUserEmail()%>" type="email" class="form-control" productId="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    <small productId="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                        <div class="form-group">
                        <%--@declare id="exampleformcontroltextarea1"--%><label for="exampleFormControlTextarea1">Your Shipping Address</label>
                        <textarea class="form-control" productId="exampleFormControlTextarea1" rows="3" placeholder="Enter your Address"></textarea>
                    </div>
                <div class="container text-center">
<%--                    <input type="text" class="form-control" productId="payment_field" placeholder="Enter Amount"/>--%>
                    <button class="btn btn-outline-success" id="clickOrder">Order Now</button>
                    <button class="btn btn-outline-primary">Continue Shopping</button>
                </div>
            </form>
        </div>
    </div>

</div>
    </div>
    <div class="col-md-6">
        <%--        form details--%>
        <div class="card">
            <div class="getOrderData">
                <%-- Here we will get product data--%>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
    $('#clickOrder').click(function (e){
        e.preventDefault()
        let cartString = localStorage.getItem("cart");
        let cart = JSON.parse(cartString);
        $.ajax(
            {
                url:'OrderServlet',
                data:JSON.stringify(cart),
                contentType: 'application/json',
                type:'POST',
                data_type:'json',
                success:function(data){
                    alert("order Successful you will receive your order within 7 days")
                    emptyCart()
                    window.location='index.jsp'
                },
                error:function (error){
                    //invoked when error
                    alert("Dont have enough balance Add Balance")
                    window.location='mycartBank.jsp'
                }
            }
        )
    })})
    function emptyCart(){
        let cart=JSON.parse(localStorage.getItem('cart'));
        let newcart=null;
        localStorage.setItem('cart',JSON.stringify(newcart));
    }
</script>
<%@include file="common_modals.jsp"%>
</body>
</html>
