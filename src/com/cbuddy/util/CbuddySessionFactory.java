package com.cbuddy.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class CbuddySessionFactory {

	private static SessionFactory factory = null;

	private CbuddySessionFactory() {

	}

	public static final SessionFactory getSessionFactory()    
	{    
		if ( factory == null )  {  
			synchronized (SessionFactory.class) {  
				if (factory == null)  
					factory = new AnnotationConfiguration().configure().buildSessionFactory();  
				System.out.println("CbuddySessionFactory.getSessionFactory(fact)"+factory);
			}  
		}  
		return factory;       
	}

}
