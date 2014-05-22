package com.cbuddy.action.posts;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cbuddy.util.CBuddyConstants;
import com.opensymphony.xwork2.ActionSupport;

public class PostAdAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private String category = "" ;
	private String subcategory = "" ;
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String execute(){
		String output = "success";
		if(category.equals(CBuddyConstants.CATEGORY_REAL_ESTATE)){
			if(subcategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE)){
				output = "real_1";
			}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT)){
				output = "real_2";
			}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_SALE)){
				output = "real_3";
			}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_RENT)){
				output = "real_4";
			}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_LAND_SALE)){
				output = "real_5";
			}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION)){
				output = "real_6";
			}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED)){
				output = "real_7";
			}
		}
		return output;
	}

	private HttpServletRequest request = null;
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
