package com.cbuddy.user.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogOutAction extends ActionSupport implements SessionAware{

	private Map<String,Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;

	}

	public String logout()  {
		
		clearFieldErrors();
		session.remove("userInfo");
		session.remove("userLoggedIn");
		session.remove("username");

		return "success";
	}

}
