package com.cbuddy.utilities;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;


public class HibernateUtililities {
	
	private SessionFactory sessionFactory;
	private ServiceRegistry serviceRegistry;
	private Session session;
	
	public Session initSession(){

		try{
		Configuration cfg = new Configuration().configure();
		serviceRegistry = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();
		sessionFactory = cfg.buildSessionFactory(serviceRegistry);
		session = sessionFactory.openSession();
		}catch(Exception e){
			e.printStackTrace();
		}
		return session;
		
	}

}
