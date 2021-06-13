package com.learn.mycart.servlets;

import com.learn.mycart.entities.WishList;
import com.learn.mycart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteWishlistServlet", value = "/DeleteWishlistServlet")
public class DeleteWishlistServlet extends HttpServlet {
    public DeleteWishlistServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            int wishlist_id=Integer.parseInt(request.getParameter("wishlist_id").trim());
            Session s= FactoryProvider.getFactory().openSession();

            Transaction tx=s.beginTransaction();
            WishList wishList=(WishList) s.get(WishList.class,wishlist_id);
            s.delete(wishList);

            tx.commit();
            s.close();

            response.sendRedirect("wishlist.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
