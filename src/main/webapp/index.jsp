<%@ page import="mycart.Dao.ProductDao" %>
<%@ page import="mycart.Helper.FactoryProvider" %>
<%@ page import="mycart.Model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="mycart.Dao.CategoryDao" %>
<%@ page import="mycart.Model.Category" %>
<%@ page import="mycart.Helper.Helper" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyCart</title>
    <%@include file="common_css_js.jsp"%>
</head>
<%--<body style="background-image: url('img/purple image.jpg')">--%>
<body>
<%@include file="navbar.jsp"%>
<div class="container text-center">
    <h1 style="color: black">Welcome <span class="animate"></span></h1>
</div>
<%--<div class="container-fluid" style="background-image: url('img/purple image.jpg')">--%>
<div class="container-fluid" >
<div class="row mt-2 mx-auto">
    <%
        String cat = request.getParameter("category");
       // out.println(cat);
        ProductDao dao = new ProductDao(FactoryProvider.getFactory());
       // List<Product> list = dao.getAllProducts();
        List<Product> list = null;
        if (cat==null)
        {
            list = dao.getAllProducts();
        }
             else if (cat.trim().equals("all"))
             {
                list = dao.getAllProducts();
            }
             else {
                int cid = Integer.parseInt(cat.trim());
                list = dao.getAllProductsById(cid);
            }
        CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
        List<Category> clist = cdao.getCategories();
    %>
    <%--show categories--%>
    <div class="text-left mt-4">
        <div class="list-group">
            <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                All Products
            </a>
            <%
                for(Category c:clist){
            %>
            <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
            <%
                }
            %>
        </div>
    </div>

    <%--show products--%>
    <div class="col-md-10">
     <%--Row--%>
        <div class="row mt-4">
     <%--Col:takes 12 grid--%>
            <div class="col-md-12">
                <div class="card-columns">
      <%--Traversing show products--%>
                    <%
                        for (Product p:list){
                    %>
      <%--Product Card--%>
                    <div class="card product-card">
                        <div class="container text-center">
                            <img src="img/products/<%=p.getpPhoto()%>" style="max-height: 200px;width: auto;" class="card-img-top m-3 image-resize" alt="">
                        <div class="card-body">
                            <h5 class="card-title">
                                <%=p.getpName()%>
                            </h5>
                            <p class="card-text">
                                <%=Helper.get10Words(p.getpDesc())%>
                            </p>
                        </div>
                        </div>
                        <div class="card-footer text-center">
                            <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getPid()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                            <button class="btn btn-outline-success">&#8377;<%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label">&#8377;<%=p.getpPrice()%> <%=p.getpDiscount()%>%off</span></button>
                        </div>
                    </div>
                    <%
                        }
                        if(list.size()==0){
                            out.println("<h3>No items in this Category</h3>");
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Start footer  -->
<footer class="container-fluid bg-dark text-white" style="border-top:3px solid #DC3545; margin-top: 200px">
    <div class="container">
        <div class="row py-3">
            <div class="col-md-6 col-sm-12">
                <div>
                <small>Designed By <span style="color:greenyellow">Tarun Dhiman</span>&copy; 2021</small>
            </div>
        </div>
    </div>
    </div>
</footer>
    <script>
        let animate=new Typed('.animate',{
            strings:["to MyCart"],
            typeSpeed:150,
            backSpeed:150,
            loop:true,
        })
    </script>
<%@include file="common_modals.jsp"%>
</body>
</html>