package com.cbuddy.services;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.model.user.WashingMachinePostDetails;

public class WashingMachineAdService{

	public WashingMachinePostDetails getAdDetailsForWashingMachine(WashingMachinePostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		WashingMachinePostDetails adDetails = (WashingMachinePostDetails)session.get(WashingMachinePostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
