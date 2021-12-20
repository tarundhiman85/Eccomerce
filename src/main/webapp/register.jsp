<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New User</title>
    <%@include file="common_css_js.jsp"%>

</head>
<body style="background-image: url('img/purple image.jpg')">
   <%@include file="navbar.jsp"%>
   <div class="container-fluid">
       <div class="row mt-5">
           <div class="col-md-4 offset-md-4">
               <div class="card">
                   <%@include file="message.jsp"%>
                   <div class="card-body px-5">
                       <div class="container text-center">
                           <img class="img-fluid" src="img/sign-up.png" style="max-width: 100px" alt="Card image cap">
                       </div>
                       <h3 class="text-center my-3">Sign Up Here!!</h3>
                       <form action="RegisterServlet" method="post">
                           <div class="form-group">
                               <%--@declare id="name"--%><label for="name">User Name</label>
                               <input name="user_name" type="text" class="form-control" productId="name" placeholder="Enter Here" aria-describedby="emailHelp" >
                           </div>
                           <div class="form-group">
                               <%--@declare id="email"--%><label for="email">User Email</label>
                               <input name="user_email" type="email" class="form-control" productId="email" placeholder="Enter Here" aria-describedby="emailHelp" >
                           </div>
                           <div class="form-group">
                               <%--@declare id="password"--%><label for="password">User Password</label>
                               <input name="user_password" type="password" class="form-control" productId="password" placeholder="Enter Here" aria-describedby="emailHelp" >
                           </div>
                           <div class="form-group">
                               <%--@declare id="phone"--%><label for="phone">User Phone</label>
                               <input name="user_phone" type="number" class="form-control" productId="phone" placeholder="Enter Here" aria-describedby="emailHelp" >
                           </div>
                           <div class="form-group">
                               <label for="phone">User Address</label>
                               <textarea name="user_address" style="height: 150px" class="form-control" placeholder="Enter your Address">
                   </textarea>
                           </div>
                           <div class="container text-center">
                               <button class="btn btn-outline-success">Register</button>
                               <button class="btn btn-outline-warning">Reset</button>
                           </div>
                       </form>
                   </div>
               </div>
           </div>
       </div>
   </div>
</body>
</html>
