<%@ page import="mycart.Model.User" %>
<%@ page import="mycart.Dao.CategoryDao" %>
<%@ page import="mycart.Helper.FactoryProvider" %>
<%@ page import="mycart.Model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="mycart.Helper.Helper" %>
<%@ page import="java.util.Map" %>


<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message","You are not logged in Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else {
        if (user.getUserType().equals("normal")){
            session.setAttribute("message","You are not Admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%
    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cDao.getCategories();

    //getting count
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Panel</title>
    <%@include file="common_css_js.jsp"%>
</head>
<%--<body style="background-image: url('img/purple image.jpg')">--%>
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
                                    <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/group.png" alt="user_icon">
                                </div>
                                <h1><%=m.get("userCount")%></h1>
                                <h1 class="text-uppercase text-muted">
                                 Users
                             </h1>
                            </div>
                        </div>
                    </div>
        <%--    Second col--%>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                                </div>
                                <h1><%=list.size()%></h1>
                                <h1 class="text-uppercase text-muted">
                                    Categories
                                </h1>
                            </div>
                        </div>
                    </div>
        <%--    Third col--%>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
                                </div>
                                <h1><%=m.get("productCount")%></h1>
                                <h1 class="text-uppercase text-muted">
                                    Products
                                </h1>
                            </div>
                        </div>
                    </div>
        </div>
        <%--    Second row--%>
        <div class="row mt-3">
                    <div class="col-md-6">
        <%--                second row 1st col--%>
                        <div class="card " data-toggle="modal" data-target="#add-category-model">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon">
                                </div>
                                <p class="mt-2">Click here to Add New Category</p>
                                <h1 class="text-uppercase text-muted">
                                    Add Category
                                </h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
        <%--                second row second col--%>
                        <div class="card " data-toggle="modal" data-target="#add-product-model">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                                </div>
                                <p class="mt-2">Click here to Add New Product</p>
                                <h1 class="text-uppercase text-muted">
                                    Add Product
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
       </div>


<%--add category model--%>
    <div class="modal fade" productId="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" productId="exampleModalLabel">Fill Category Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post">
                        <input type="hidden" name="operation" value="addcategory">
                        <div class="form-group">
                            <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
                        </div>
                        <div class="form-group">
                            <textarea style="height: 150px" class="form-control" placeholder="Enter Category Description" name="catDescription" required></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success">
                                Add Category
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<%--end add category model--%>

<%--++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

<%--product modal--%>
    <div class="modal fade" productId="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" productId="exampleModalLabel1">Fill Product Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
<%--                    encytype because in our form we have multipath data like image--%>
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        <%--product title--%>
                        <input type="hidden" name="operation" value="addproduct">
                        <div class="form-group">
                            <input type="text" class="form-control" name="pName" placeholder="Enter Product Title" required/>
                        </div>
                       <%--product description--%>
                        <div class="form-group">
                            <textarea style="height: 150px" class="form-control" placeholder="Enter Product Description" name="pDesc" required></textarea>
                        </div>
                        <%--product price--%>
                        <div class="form-group">
                            <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required/>
                        </div>
                            <%--product description--%>
                        <div class="form-group">
                            <input type="text" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required/>
                        </div>
                            <%--product quantity--%>
                        <div class="form-group">
                            <input type="text" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required/>
                        </div>

                        <div class="form-group">
                            <select name="catId" class="form-control" productId="">
                                <%--product category--%>
                                <%
                                    for (Category c:list) {
                                %>
                                <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                            <%--product file--%>
                            <div class="form-group">
                                <%--@declare id="ppic"--%><label for="pPic">Select Picture of Product </label><br>
                                <input type="file" productId="pPic" name="pPic" required/>
                            </div>

                            <%--submit--%>
                        <div class="container text-center">
                            <button class="btn btn-outline-success">
                                Add Product
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<%--end product modal--%>

</body>
</html>
