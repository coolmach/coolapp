package com.cbuddy.user.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Poit;
import com.cbuddy.posts.util.PostsUtil;
import com.cbuddy.user.model.User;
import com.cbuddy.util.CbuddySessionFactory;
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
		
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		
		Query query = dbSession.createQuery("from Poit where created_by = :userId");
		query.setParameter("userId", userId);
		adList = (List<Poit>)query.list();
		
		new PostsUtil().populateAdditionalDetailsForPoit(dbSession, adList);
		
		return Action.SUCCESS;
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
