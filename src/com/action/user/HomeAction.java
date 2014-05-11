package com.action.user;

import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport{

	public String execute(){
		return "success";
	}
	
    public String getAdDescription(){
    	
    	System.out.println("HomeAction.getAdDescription()");
    	
    	return "success";
    }
}
