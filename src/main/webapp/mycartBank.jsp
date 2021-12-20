<%@ page import="mycart.Model.Balance" %>
<%@ page import="mycart.Dao.UserDao" %>
<%@ page import="mycart.Helper.FactoryProvider" %><%--
  Created by IntelliJ IDEA.
  User: Tarun Dhiman
  Date: 19-12-2021
  Time: 06:40 PM
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
    HttpSession httpSession = request.getSession();
    Balance balance = new UserDao(FactoryProvider.getFactory()).getBalanceByUserId(user.getUserId(), user);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyCartBank</title>
    <%@include file="common_css_js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container admin">
    <div class="container-fluid mt-3">
        <%@include file="message.jsp"%>
    </div>
    <div class="row mt-3">
        <%--    First col--%>
        <div class="col-md-4">
            <%--                first-box--%>
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/availableBalance.png" alt="user_icon">
                    </div>
                    <h1><%=balance.getAvailBalance()%></h1>
                    <h1 class="text-uppercase text-muted">
                        Available Balance
                    </h1>
                </div>
            </div>
        </div>
        <%--    Second col--%>
        <div class="col-md-4">
            <div class="card"  data-toggle="modal" data-target="#exampleModal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/addBalance.png" alt="user_icon">
                    </div>
                    <h1 class="text-uppercase text-muted">
                        Add Balance
                    </h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Payment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="AddBalanceServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter Card Number" required/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter CVV Number" required/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="balance" class="form-control" placeholder="Enter Balance" required/>
                    </div>
                    <div class="form-group text-center">
                        <input type="submit" value="Add Balance"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
