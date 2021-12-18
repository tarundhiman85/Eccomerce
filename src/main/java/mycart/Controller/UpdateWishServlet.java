package mycart.Controller;

import mycart.Helper.FactoryProvider;
import mycart.Model.WishList;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
