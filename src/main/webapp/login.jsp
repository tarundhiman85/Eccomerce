<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login - MyCart</title>
    <%@include file="common_css_js.jsp"%>
</head>
<%--<body style="background-image: url('img/purple image.jpg')">--%>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card mt-3">
                <div class="card-header custom-bg text-white">
                    <h3>Login Here</h3>
                </div>
                <div class="card-body">
                    <%@include file="message.jsp"%>
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <%--@declare id="exampleinputemail1"--%><label for="exampleInputEmail1">Email address</label>
                            <input name="email" type="email" class="form-control" productId="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            <small productId="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <%--@declare id="exampleinputpassword1"--%><label for="exampleInputPassword1">Password</label>
                            <input name="password" type="password" class="form-control" productId="exampleInputPassword1" placeholder="Password">
                        </div>
                        <a href="register.jsp" class="text-center d-block mb-2">If Not Registered Click Here</a>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                            <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
