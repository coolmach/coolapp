package com.cbuddy.user.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Poit;
import com.cbuddy.user.model.User;
import com.cbuddy.util.LocationUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = -4318473253175032745L;
	private List<Poit> adList = new ArrayList<Poit>();
	private String userId;
	
	private Map<String,Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	
	
	public String execute(){
		return "success";
	}
	
	public String mydashboard(){
		
		if(userId == null || userId.trim().equals("")){
			addFieldError("errorMsg", "Invalid user");
			return Action.ERROR;
		}
		
		User user = (User)session.get("userInfo");
		if(user == null || !userId.equals(String.valueOf(user.getUserId()))){
			addFieldError("errorMsg", "Invalid session");
			return Action.ERROR;
		}
		
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		
		Query query = dbSession.createQuery("from Poit where created_by = :userId");
		query.setParameter("userId", userId);
		adList = (List<Poit>)query.list();
		
		populateAdditionalDetails();
		
		return Action.SUCCESS;
	}

	private void populateAdditionalDetails(){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		for(Poit postDetails:adList){
			String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
			String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
			postDetails.setCity(cityName);
			postDetails.setLocation(locName);
			//.setPriceStr(NumberFormatterUtil.formatAmount(postDetails.getPrice()));
			if(postDetails.getDescription().length() > 80){
				postDetails.setDescription(postDetails.getDescription().substring(0,80) + "...");
			}
		}
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}



	public List<Poit> getAdList() {
		return adList;
	}



	public void setAdList(List<Poit> adList) {
		this.adList = adList;
	}

}
