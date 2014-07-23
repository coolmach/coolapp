package com.cbuddy.services;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.model.user.CameraPostDetails;

public class CameraAdService{

	public CameraPostDetails getAdDetailsForCamera(CameraPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		CameraPostDetails adDetails = (CameraPostDetails)session.get(CameraPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
