package com.cbuddy.action.posts;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cbuddy.util.CBuddyConstants;
import com.opensymphony.xwork2.ActionSupport;

public class PostAdAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private String category = "" ;
	private String subCategory = "";
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
	public String execute(){
		String output = "success";
		if(category.equals(CBuddyConstants.CATEGORY_REAL_ESTATE)){
			output = "realEstate";
		}else if(category.equals(CBuddyConstants.CATEGORY_AUTOMOBILES)){
			output = "automobile";
		}else if(category.equals(CBuddyConstants.CATEGORY_COMPUTERS)){
			output = "computers";
		}
		return output;
	}

	private HttpServletRequest request = null;
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
}
