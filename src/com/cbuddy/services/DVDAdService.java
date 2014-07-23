package com.cbuddy.services;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.model.user.DVDPostDetails;

public class DVDAdService{

	public DVDPostDetails getAdDetailsForDVD(DVDPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		DVDPostDetails adDetails = (DVDPostDetails)session.get(DVDPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
