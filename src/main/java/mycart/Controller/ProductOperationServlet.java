package mycart.Controller;

import mycart.Dao.CategoryDao;
import mycart.Dao.ProductDao;
import mycart.Helper.FactoryProvider;
import mycart.Model.Category;
import mycart.Model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet(name = "ProductOperationServlet", value = "/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
//            add category add product  2 method
              String op=request.getParameter("operation");
              if(op.trim().equals("addcategory")){
                  //            fetching category data
                  String title=request.getParameter("catTitle");
                  String description=request.getParameter("catDescription");
                  Category category = new Category();
                  category.setCategoryTitle(title);
                  category.setCategoryDescription(description);

                  //category save on database
                  CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                  int catId = categoryDao.saveCategory(category);
                  HttpSession httpSession = request.getSession();
                  httpSession.setAttribute("message","Category Added successfully: "+catId);
                  response.sendRedirect("admin.jsp");
                  return;
              }
              else if(op.trim().equals("addproduct")){
                  //            fetching Product data
                  String pName = request.getParameter("pName");
                  String pDesc = request.getParameter("pDesc");
                  int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                  int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                  int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                  int catId = Integer.parseInt(request.getParameter("catId"));
                  Part part=request.getPart("pPic");
                  Product p = new Product();
                  p.setpName(pName);
                  p.setpDesc(pDesc);
                  p.setpPrice(pPrice);
                  p.setpDiscount(pDiscount);
                  p.setpQuantity(pQuantity);
                  p.setpPhoto(part.getSubmittedFileName());  //we have only saved name to database

                  //i need get category by id
                  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                  Category category=cdao.getCategoryById(catId);

                  p.setCategory(category);  //we have saved our category also which we have mapped to product table by one to many

                  //product save on db
                  ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                  pDao.saveProduct(p);

                  //photo name in db and db extract photo by folder pic upload
//                  find out the path to upload    file separator to added /
                  String path=request.getRealPath("img")+ File.separator+"products"+File.separator+part.getSubmittedFileName();
                  System.out.println(path);

                  try {
                      //uploading code
                      FileOutputStream fos = new FileOutputStream(path);
                      InputStream is = part.getInputStream();    //we have converted the data into into stream and converted into string

                      //reading data
                      byte[] data = new byte[is.available()];
                      is.read(data);

                      //writing the data
                      fos.write(data);
                      fos.close();
                  }
                  catch (Exception e){
                      e.printStackTrace();
                  }
                  out.println("Product Save Success");
                  HttpSession httpSession = request.getSession();
                  httpSession.setAttribute("message","Product Added successfully..");
                  response.sendRedirect("admin.jsp");
                  return;
              }


        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
}
