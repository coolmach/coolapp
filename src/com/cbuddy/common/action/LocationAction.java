package com.cbuddy.common.action;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.cbuddy.beans.Location;
import com.cbuddy.beans.NameValuePair;
import com.cbuddy.beans.Neighborhood;
import com.cbuddy.util.AutoSuggestLocationService;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.LogUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class LocationAction extends ActionSupport implements SessionAware, ServletRequestAware, Serializable{

	private static final long serialVersionUID = 1L;
	private String city = "" ;
	private String location = "" ;
	private JSONArray jsonArray;
	private NameValuePair selectedLocation;
	private List<NameValuePair> neighborhoodLocations;

	private HttpServletRequest request = null;
	private Map<String,Object> session;
	
	public String getLocations() throws JSONException{
		System.out.println("LocationAction.getLocations() - ENTER");
		LogUtil.getInstance().info(">>> LocationAction.getLocations() - ENTER");
		String city = request.getParameter("city");
		String locationStr = request.getParameter("location");

		//setting default city to Bangalore
		if(city==null)
			city="BLR";
		
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		
		AutoSuggestLocationService service = new AutoSuggestLocationService();
		List<Location> locationList = null;
		try{
			locationList = service.getList(dbSession, city, locationStr);
		}catch(IOException e){
			e.printStackTrace();
		}
		
		jsonArray = new JSONArray();
		
		for(Location location:locationList){
			JSONObject obj = new JSONObject();
			obj.put("value", location.getLocName());
			obj.put("id", location.getLocCode());
			jsonArray.put(obj);
		}
		
		LogUtil.getInstance().info(">>> LocationAction.getLocations() - Returning List of size: " + locationList.size());
		
		System.out.println("LocationAction.getLocations() - EXIT");
		LogUtil.getInstance().info(">>> LocationAction.getLocations() - EXIT");
		return Action.SUCCESS;
	}
	
	public String getNeighborhood(){
		String city = request.getParameter("city");
		String locCode = request.getParameter("location");
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		String locName = LocationUtil.getLocationName(dbSession, city, locCode);
		selectedLocation = new NameValuePair(locCode, locName);
		
		Query query = dbSession.createQuery("from Neighborhood where loc_code = :locCode");
		query.setParameter("locCode", locCode);
		List<Neighborhood> listOfNeighbors = query.list();
		neighborhoodLocations = new ArrayList<NameValuePair>();
		for(Neighborhood neighbor:listOfNeighbors){
			neighborhoodLocations.add(new NameValuePair(neighbor.getNeighborLocCode(), neighbor.getNeighborLocName()));
		}
		
		return Action.SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public JSONArray getJsonArray() {
		return jsonArray;
	}

	public void setJsonArray(JSONArray jsonArray) {
		this.jsonArray = jsonArray;
	}

	public NameValuePair getSelectedLocation() {
		return selectedLocation;
	}

	public void setSelectedLocation(NameValuePair selectedLocation) {
		this.selectedLocation = selectedLocation;
	}

	public List<NameValuePair> getNeighborhoodLocations() {
		return neighborhoodLocations;
	}

	public void setNeighborhoodLocations(List<NameValuePair> neighborhoodLocations) {
		this.neighborhoodLocations = neighborhoodLocations;
	}
}
