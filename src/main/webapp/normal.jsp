<%@ page import="mycart.Model.User" %>

<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not logged in");
        response.sendRedirect("login.jsp");
        return;
    }
    else {
        if (user.getUserType().equals("normal")){
            session.setAttribute("message","You are Logged In!");
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>This is Normal user Panel</h1>
</body>
</html>
