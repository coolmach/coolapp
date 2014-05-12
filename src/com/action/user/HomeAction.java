package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.cbuddy.beans.Poit;
import com.cbuddy.services.AdDetailsService;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport{

	private List<Poit> adList = new ArrayList<Poit>();
	
    public List<Poit> getAdList() {
		return adList;
	}

	public void setAdList(List<Poit> adList) {
		this.adList = adList;
	}

	public String execute(){
		return "success";
	}
	
	public String getAdDescription(){
    	
    	AdDetailsService adDetailService =  new AdDetailsService();
    	adList = adDetailService.getAdDetails();
    	
    	return "success";
    }
}
