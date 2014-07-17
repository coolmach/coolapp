package com.cbuddy.listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.cbuddy.cache.MobilePhoneCache;
import com.cbuddy.util.CorporateIndexCreator;
import com.cbuddy.util.LogUtil;
import com.cbuddy.util.MobileIndexCreator;

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
		LogUtil.getInstance().info(">>> Corporate Indexes created successfully");
		
		MobileIndexCreator.getInstance().indexMobileModels(dbSession);
		System.out.println(">>> Mobile Model Indexes created successfully");
		LogUtil.getInstance().info(">>> Mobile Model Indexes created successfully");
		
		MobilePhoneCache.getInstance().initialize(dbSession);
		System.out.println(">>> Mobile Model cache created successfully");
	}
}
