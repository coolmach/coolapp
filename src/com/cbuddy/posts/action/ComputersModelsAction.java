package com.cbuddy.posts.action;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.TabMaster;
import com.cbuddy.util.CbuddySessionFactory;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class ComputersModelsAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String make;
	private List<String> tabModels;

	public List<String> getTabModels() {
		return tabModels;
	}

	public void setTabModels(List<String> tabModels) {
		this.tabModels = tabModels;
	}
	
	public String getModelsForTab() {
		
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		dbSession.beginTransaction();
		Criteria criteria =null;

		tabModels = new ArrayList<String>();

		criteria = dbSession.createCriteria(TabMaster.class );
		criteria.addOrder(Order.asc("model"));
		criteria.add(Restrictions.eq("make", make));
		List<TabMaster> modelsList = criteria.list();
		for(TabMaster modelDetails:modelsList){
			tabModels.add(modelDetails.getModel());
		}

		dbSession.close();
		
		return Action.SUCCESS;
	}


	
	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}
}
