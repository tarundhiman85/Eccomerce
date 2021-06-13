package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            //coding
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            //validations

            //Authenticating User
            UserDao userDao=new UserDao(FactoryProvider.getFactory());
            User user=userDao.getUserByEmailAndPassword(email,password);
            //System.out.println(user);
            HttpSession httpSession=request.getSession();
            if(user==null){
                out.println("<h1>Invalid Details</h1>");
                httpSession.setAttribute("message","Invalid Details !! Try Another One");
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                out.println("<h1>Welcome "+user.getUserName()+"</h1>");
                //login                      key          value
                httpSession.setAttribute("current-user",user);
                if(user.getUserType().equals("admin")){
                    //admin.jsp
                    response.sendRedirect("admin.jsp");
                }
                else if (user.getUserType().equals("normal")){
                    // normal.jsp
                    response.sendRedirect("normal.jsp");
                }
                else{
                    out.println("We Have not Identified UserType");
                }



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
