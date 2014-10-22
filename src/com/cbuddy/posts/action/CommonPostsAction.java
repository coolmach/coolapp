package com.cbuddy.posts.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Poit;
import com.cbuddy.posts.model.CommonPostDetails;
import com.cbuddy.posts.services.CommonAdService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.Utils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommonPostsAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<Poit>{

	private static final long serialVersionUID = 1L;

	CommonPostDetails postDetails = new CommonPostDetails();

	private String categoryStr;
	private String subCategoryStr;

	private String responseMsg;

	private List<CommonPostDetails> adList = new ArrayList<CommonPostDetails>();

	private HttpServletRequest request = null;

	private int count;

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

	private void populateAdditionalDetails(){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
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
			postDetails.setSubCategory(new Utils().getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory()));
		}
	}

	public String getAdListForCriteria(){
		System.out.println(postDetails.getSubCategory()+ " : "+postDetails.getCategory());
		if(postDetails.getCategory()==null || postDetails.getCategory().equals("") || !postDetails.getCategory().equals(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD)){
			postDetails.setCategory(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD);
		}	

		Utils utils = new Utils();
		categoryStr = utils.getCategoryDesc(postDetails.getCategory());
		subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());

		if(postDetails.getSubCategory()==null || postDetails.getSubCategory().equals("") || subCategoryStr.equals("")){
			//postDetails.setSubCategory(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_ALL);
			//subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		}

		CommonAdService adService = new CommonAdService();
		count = adService.getAdListCount(postDetails);
		adList = adService.getAdListByCategory(postDetails);

		populateAdditionalDetails();

		return "success";
	}

	@Override
	public Poit getModel() {
		return postDetails;
	}

	public List<CommonPostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<CommonPostDetails> adList) {
		this.adList = adList;
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

	public String getResponseMsg() {
		return responseMsg;
	}

	public void setResponseMsg(String responseMsg) {
		this.responseMsg = responseMsg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
