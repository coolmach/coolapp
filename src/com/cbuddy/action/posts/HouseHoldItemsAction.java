package com.cbuddy.action.posts;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cbuddy.beans.Pdre;
import com.cbuddy.services.AdDetailsService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class HouseHoldItemsAction extends ActionSupport implements ServletRequestAware,ModelDriven<Pdre>{
	Pdre pdre = new Pdre();
	private List<Pdre> adList = new ArrayList<Pdre>();
	private String category="" ;
	private String subCat="" ;
	private HttpServletRequest request = null;
	public String getSubCat() {
		return subCat;
	}

	public void setSubCat(String subCat) {
		this.subCat = subCat;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<Pdre> getAdList() {
		return adList;
	}

	public void setAdList(List<Pdre> adList) {
		this.adList = adList;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public String getAdListForHouseHoldItems(){
		System.out.println("getAdListForHouseHoldItems() ENTER");
		if(category==""){
			setCategory("HOUSEHOLD");
		}
		
		if( category.equals("HOUSEHOLD") && subCat=="" ){
			setSubCat("Air Conditioners & Coolers");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory(getModel(),subCat);
		System.out.println("HomeAction.getAdListForHouseHoldItems"+adList.size()+" : "+subCat);
		return "success";

	}

	@Override
	public Pdre getModel() {
		// TODO Auto-generated method stub
		return pdre;
	}

}
