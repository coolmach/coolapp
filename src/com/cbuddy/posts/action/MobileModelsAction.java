package com.cbuddy.posts.action;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.MobileMaster;
import com.cbuddy.util.CbuddySessionFactory;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class MobileModelsAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String brand;
	private List<String> mobileModels;

	public List<String> getMobileModels() {
		return mobileModels;
	}

	public void setMobileModels(List<String> mobileModels) {
		this.mobileModels = mobileModels;
	}
	
	public String getModels() {
		
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		dbSession.beginTransaction();
		Criteria criteria = dbSession.createCriteria( MobileMaster.class );
		criteria.addOrder(Order.desc("model"));
		criteria.add(Restrictions.eq("brand", brand));

		List<MobileMaster> mobileModelsList = criteria.list();
		if(mobileModelsList != null){
			mobileModels = new ArrayList<String>();
			for(MobileMaster modelDetails:mobileModelsList){
				mobileModels.add(modelDetails.getModel());
			}	
		}
		
		dbSession.close();
		
		return Action.SUCCESS;
	}


	
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
}
