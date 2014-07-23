package com.cbuddy.action.posts;

import java.util.Map;

import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.model.user.AutomobilePostDetails;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TempAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<AutomobilePostDetails>{

	private static final long serialVersionUID = 1L;

	AutomobilePostDetails postDetails = new AutomobilePostDetails();

	private String categoryStr;
	private String subCategoryStr;

	private HttpServletRequest request = null;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	private Map<String,Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	public void validate(){

	}

	public String getAdDetails(){

		postDetails = new AutomobilePostDetails();
		postDetails.setTitle("Dummy Title");
		postDetails.setLocation("Madipakkam");
		postDetails.setCity("Bangalore");

		categoryStr = "Automobiles";
		subCategoryStr = "Cars";
		
		return "success";
	}


	@Override
	public AutomobilePostDetails getModel() {
		return postDetails;
	}

	@Transient
	public String getCategoryStr() {
		return categoryStr;
	}

	public void setCategoryStr(String categoryStr) {
		this.categoryStr = categoryStr;
	}

	@Transient
	public String getSubCategoryStr() {
		return subCategoryStr;
	}

	public void setSubCategoryStr(String subCategoryStr) {
		this.subCategoryStr = subCategoryStr;
	}
}
