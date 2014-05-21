package com.cbuddy.action.user;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven{
	
	public String execute(){
		return "success";
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
