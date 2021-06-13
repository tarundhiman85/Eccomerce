package com.learn.mycart.servlets;

import com.learn.mycart.entities.WishList;
import com.learn.mycart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "UpdateWishServlet", value = "/UpdateWishServlet")
public class UpdateWishServlet extends HttpServlet {
    public UpdateWishServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String title=request.getParameter("title");
            String content=request.getParameter("content");
            int wishlist_id=Integer.parseInt(request.getParameter("wishlist_id").trim());
            Session s= FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            WishList wishList=s.get(WishList.class, wishlist_id);
            wishList.setTitle(title);
            wishList.setContent(content);
            wishList.setAddedDate(new Date());
            tx.commit();
            s.close();
            response.sendRedirect("wishlist.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
