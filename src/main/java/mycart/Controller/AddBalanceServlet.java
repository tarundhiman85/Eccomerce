package mycart.Controller;

import mycart.Dao.UserDao;
import mycart.Helper.FactoryProvider;
import mycart.Model.Balance;
import mycart.Model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddBalanceServlet", value = "/AddBalanceServlet")
public class AddBalanceServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
          int balanceToAdd = Integer.parseInt(request.getParameter("balance"));

          //db logic
            HttpSession httpSession = request.getSession();
            User user = (User) httpSession.getAttribute("current-user");
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
                Balance balance = userDao.getBalanceByUserId(user.getUserId(), user);
                balance.setAvailBalance(balance.getAvailBalance()+balanceToAdd);
                Session session = FactoryProvider.getFactory().openSession();
                Transaction tx = session.beginTransaction();
                session.update(balance);
                tx.commit();
                session.close();
            httpSession.setAttribute("message","Amount added Successfully");
            response.sendRedirect("mycartBank.jsp");
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
