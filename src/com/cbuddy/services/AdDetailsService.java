package com.cbuddy.services;

import java.util.Date;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.cbuddy.beans.Poit;

public class AdDetailsService {
	
	@SuppressWarnings("unchecked")
	public List<Poit> getAdListByCategory(){
		
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext()
        .getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		List<Poit> poit = null;
		try {	
			poit = (List<Poit>)session.createQuery("from Poit").list();
			
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
         session.getTransaction().commit();
         session.close();

	     return poit;
	}

}
