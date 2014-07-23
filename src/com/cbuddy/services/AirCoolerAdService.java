package com.cbuddy.services;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.model.user.AirCoolerPostDetails;

public class AirCoolerAdService{

	public AirCoolerPostDetails getAdDetailsForAirCooler(AirCoolerPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		AirCoolerPostDetails adDetails = (AirCoolerPostDetails)session.get(AirCoolerPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
