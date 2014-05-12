package com.action.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.cbuddy.beans.Poit;
import com.cbuddy.services.AdDetailsService;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements ServletRequestAware{

	private List<Poit> adList = new ArrayList<Poit>();
	private String category ;
	private HttpServletRequest request = null;
	
    public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

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
    	System.out.println(category+ ": "+request.getParameter("category"));
		setCategory(category);
    	AdDetailsService adDetailService =  new AdDetailsService();
    	adList = adDetailService.getAdDetails();
    	
    	return "success";
    }

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
}
