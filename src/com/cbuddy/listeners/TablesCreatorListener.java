package com.cbuddy.listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.cbuddy.util.CorporateIndexCreator;

public class TablesCreatorListener implements ServletContextListener{
	
    private SessionFactory factory;

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("TablesCreatorListner.contextDestroyed()");
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("TablesCreatorListner.contextInitialized(): Start");
		factory = new AnnotationConfiguration().configure().buildSessionFactory();
		System.out.println("TablesCreatorListner.contextInitialized(): " + factory);
		event.getServletContext().setAttribute("sessionFactory", factory);
		
		Session dbSession = factory.openSession();
		CorporateIndexCreator.getInstance().indexCorporates(dbSession);
		System.out.println(">>> Corporate Indexes created successfully");
	}
}
