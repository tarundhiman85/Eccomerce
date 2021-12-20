package mycart.Controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import mycart.Dao.UserDao;
import mycart.Helper.FactoryProvider;
import mycart.Model.Balance;
import mycart.Model.Orders;
import mycart.Model.User;
import mycart.Model.UserOrder;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        JsonObject jsonObject = JsonValue.ValueType.
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. get received JSON data from request
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String json = "";
        if(br != null){
            json = br.readLine();
            System.out.println(json);
        }
        // 2. initiate jackson mapper
        ObjectMapper mapper = new ObjectMapper();

        // 3. Convert received JSON to Order
         UserOrder[] userOrder = mapper.readValue(json,UserOrder[].class);

         // 4. Set response type to JSON
        response.setContentType("application/json");
        int totalPrice = 0;
        for(int i=0; i<userOrder.length; i++){
            totalPrice+=userOrder[i].getProductPrice();
        }
        Orders order = new Orders();
        order.setTotalPrice(totalPrice);
        for (int i=0; i<userOrder.length; i++){
            userOrder[i].setOrder(order);
        }
        //db logic
        HttpSession httpSession = request.getSession();
        User user =(User) httpSession.getAttribute("current-user");
        Balance balance = new UserDao(FactoryProvider.getFactory()).getBalanceByUserId(user.getUserId(), user);
        order.setUser(user);
        if(balance.getAvailBalance()>=totalPrice){
            balance.setAvailBalance(balance.getAvailBalance()-totalPrice);
            Session session = FactoryProvider.factory.openSession();
            Transaction tx = session.beginTransaction();
            for (int i=0; i<userOrder.length; i++){
                UserOrder userOrder1 = userOrder[i];
                session.save(userOrder1);
            }
            session.update(balance);
            tx.commit();
            session.close();
            response.setContentType("text/html");
            response.getWriter().print("200");
        }
        else{
            try {
                throw new Exception();
            } catch (Exception e) {
                e.printStackTrace();
            }
            // 6. Send List<Order> as JSON to client
//        mapper.writeValue(response.getOutputStream(), orderList);
    }
    }
}
