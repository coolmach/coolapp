package com.cbuddy.services;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.model.user.OtherPostDetails;

public class OtherPostsAdService{

	public OtherPostDetails getAdDetailsForOtherPosts(OtherPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		OtherPostDetails adDetails = (OtherPostDetails)session.get(OtherPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
