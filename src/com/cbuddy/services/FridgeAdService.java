package com.cbuddy.services;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.model.user.FridgePostDetails;

public class FridgeAdService{

	public FridgePostDetails getAdDetailsForFridge(FridgePostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		FridgePostDetails adDetails = (FridgePostDetails)session.get(FridgePostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
