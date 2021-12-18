package mycart.Controller;

import mycart.Helper.FactoryProvider;
import mycart.Model.User;
import mycart.Model.WishList;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            HttpSession httpSession = request.getSession();
            User user = (User) httpSession.getAttribute("current-user");
            WishList wishList =new WishList(title,content,new Date(),user);
            Session s=FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            s.save(wishList);
            tx.commit();
            s.close();
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            response.sendRedirect("wishlist.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
