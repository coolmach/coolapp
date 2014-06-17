package com.cbuddy.action.posts;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.cbuddy.beans.Pdau;
import com.cbuddy.beans.Pdre;
import com.cbuddy.services.AdDetailsService;
import com.cbuddy.services.AutoMobilesAdService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.Utils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AutoMobilesAction extends ActionSupport implements SessionAware,ServletRequestAware,ModelDriven<Pdau>{

	Pdau pdau = new Pdau();
	private List<Pdau> adList = new ArrayList<Pdau>();
	private HttpServletRequest request = null;
	private String category = "" ;
	private String subCategory = "" ;
	private String categoryStr;
	private String subCategoryStr;
	private Map<String,Object> session;


	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public Pdau getModel() {
		// TODO Auto-generated method stub
		return pdau;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public String getAdListForAutoMobiles(){

		category = pdau.getCategory();
		subCategory = pdau.getSubCategory();
		//System.out.println(category + " ____"+subCategory);
		categoryStr = Utils.getInstance().getCategoryDesc(category);
		subCategoryStr = Utils.getInstance().getSubCategoryDesc(category, subCategory);
		//System.out.println(categoryStr + " ____"+subCategoryStr);
		if(category==null || category.equals("")){
			setCategory(CBuddyConstants.CATEGORY_AUTOMOBILES);
		}
		if(category.equals(CBuddyConstants.CATEGORY_AUTOMOBILES) && (subCategory==null || subCategory.equals(""))){
			setSubCategory(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS);
		}

		AutoMobilesAdService autoMobileAdService =  new AutoMobilesAdService();
		adList = autoMobileAdService.getAdListByCategory(getModel(), subCategory);

		//populateAdditionalDetails();

		return "success";
	}

	public List<Pdau> getAdList() {
		return adList;
	}

	public void setAdList(List<Pdau> adList) {
		this.adList = adList;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getCategoryStr() {
		return categoryStr;
	}

	public void setCategoryStr(String categoryStr) {
		this.categoryStr = categoryStr;
	}

	public String getSubCategoryStr() {
		return subCategoryStr;
	}

	public void setSubCategoryStr(String subCategoryStr) {
		this.subCategoryStr = subCategoryStr;
	}

}
