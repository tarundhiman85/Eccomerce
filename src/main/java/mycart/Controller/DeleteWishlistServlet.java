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
