<%@ page import="mycart.Model.User" %><%
    User user1=(User)session.getAttribute("current-user");
%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg" >
<div class="container">
    <a class="navbar-brand" href="index.jsp">
    </a>
    <div class="collapse navbar-collapse" productId="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="mycartBank.jsp">Wallet</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="wishlist.jsp">Wishlist</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="add_wishlist.jsp">Add Wishlist</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 30px"></i><span class="ml-2 cart-items" style="margin-top: -10px;font-size:20px"></span> </a>
            </li>
            <%
                //this is conditional rendering
                if(user1==null){
                    %>
            <li class="nav-item active">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="register.jsp">Register</a>
            </li>
            <%
                } else {
            %>

            <li class="nav-item active">
                <a class="nav-link" href="viewOrders.jsp">View Orders</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#"><%=user1.getUserName()%></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>
         <%}%>
        </ul>
    </div>
</div>
</nav>