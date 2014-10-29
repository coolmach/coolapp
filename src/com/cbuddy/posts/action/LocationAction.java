package com.cbuddy.posts.action;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.Location;
import com.cbuddy.util.CbuddySessionFactory;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class LocationAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String city;
	private HashMap<String, String> locationMap = new HashMap<String, String>();
	
	public String getLocationsForCity() {
		
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		dbSession.beginTransaction();
		Criteria criteria = null;

		criteria = dbSession.createCriteria(Location.class);
		criteria.addOrder(Order.asc("loc_name"));
		criteria.add(Restrictions.eq("city_code", city));
		List<Location> locationsList = criteria.list();
		for(Location location:locationsList){
			locationMap.put(location.getLocCode(), location.getLocName());
		}

		dbSession.close();
		
		return Action.SUCCESS;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public HashMap<String, String> getLocationMap() {
		return locationMap;
	}


	public void setLocationMap(HashMap<String, String> locationMap) {
		this.locationMap = locationMap;
	}
}
