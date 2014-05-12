package com.cbuddy.listners;

import javax.servlet.*;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class TablesCreatorListner implements ServletContextListener{
	
    private SessionFactory factory;

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("TablesCreatorListner.contextDestroyed()");
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("TablesCreatorListner.contextInitialized()");
		factory = new AnnotationConfiguration().configure().buildSessionFactory();
		System.out.println("TablesCreatorListner.contextInitialized()"+factory);
		event.getServletContext().setAttribute("sessionFactory", factory);
		
	}
	
	
	

}
