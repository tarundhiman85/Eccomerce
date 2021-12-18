package mycart.Helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

//if you want to open factory then open factory provider get factory else to close
//call factory provider close factory
public class FactoryProvider {
    public static SessionFactory factory;
    public static SessionFactory getFactory(){
        //we will create factory till factory has null
            if (factory == null) {
                Configuration cfg = new Configuration();
                cfg.configure("hibernate.cfg.xml");
                factory = cfg.buildSessionFactory();
                //  factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
        return factory;
    }
    public void closeFactory(){
        if(factory.isOpen()){
            factory.close();
        }
    }
}
