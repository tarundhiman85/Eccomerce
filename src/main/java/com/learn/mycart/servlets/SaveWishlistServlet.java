package com.learn.mycart.servlets;

import com.learn.mycart.entities.WishList;
import com.learn.mycart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "SaveWishlistServlet", value = "/SaveWishlistServlet")
public class SaveWishlistServlet extends HttpServlet {
    public SaveWishlistServlet() {
        super();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //title,content fetch
            String title=request.getParameter("title");
            String content=request.getParameter("content");
            WishList wishList =new WishList(title,content,new Date());
            //System.out.println(note.getId()+":"+note.getTitle());
            // Hibernate :save()
            Session s=FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            s.save(wishList);
            tx.commit();
            s.close();
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            response.sendRedirect("wishlist.jsp");
//            out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
//            out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'</h1>");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
