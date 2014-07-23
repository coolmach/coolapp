package com.cbuddy.services;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.model.user.TelevisionPostDetails;

public class TelevisionAdService{

	public TelevisionPostDetails getAdDetailsForTelevision(TelevisionPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		TelevisionPostDetails adDetails = (TelevisionPostDetails)session.get(TelevisionPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
