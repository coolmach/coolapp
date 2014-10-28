package com.cbuddy.posts.action;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.BikeMaster;
import com.cbuddy.beans.CarMaster;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class AutomobileModelsAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String vehicleType;
	private String make;
	private List<String> automobileModels;

	public List<String> getAutomobileModels() {
		return automobileModels;
	}

	public void setAutomobileModels(List<String> automobileModels) {
		this.automobileModels = automobileModels;
	}
	
	public String getModels() {
		
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		dbSession.beginTransaction();
		Criteria criteria =null;

		automobileModels = new ArrayList<String>();
		if(vehicleType.equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS)){
			criteria = dbSession.createCriteria( CarMaster.class );
			criteria.addOrder(Order.asc("model"));
			criteria.add(Restrictions.eq("make", make));
			List<CarMaster> carModelsList = criteria.list();
			for(CarMaster modelDetails:carModelsList){
				automobileModels.add(modelDetails.getModel());
			}
		} else if(vehicleType.equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_MOTORCYCLES)){
			criteria = dbSession.createCriteria( BikeMaster.class );
			criteria.addOrder(Order.asc("model"));
			criteria.add(Restrictions.eq("make", make));
			List<BikeMaster> bikeModelsList = criteria.list();
			for(BikeMaster modelDetails:bikeModelsList){
				automobileModels.add(modelDetails.getModel());
			}
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

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	
}
