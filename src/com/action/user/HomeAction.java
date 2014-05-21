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
	private String category="" ;
	private String subCategory="" ;
	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	private int price;
	private HttpServletRequest request = null;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

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

	public String getAdListForRealEstate(){

		System.out.println("getAdListForRealEstate(dd)"+subCategory);
		if(category==""){
			setCategory("REAL ESTATE");
		}
		if( category.equals("REAL ESTATE") && subCategory=="" ){
			setSubCategory("Apartment/House For Rent");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory();
		System.out.println("HomeAction.getAdListForRealEstate()"+adList.size());
		return "success";
	}

	public String getAdListForCars(){

		return "success";
	}

	public String getAdListForHouseHoldItems(){

		return "success";
	}

	public String getAdListForMobiles(){

		System.out.println("getAdListForRealEstate(dd)"+subCategory);
		if(category==""){
			setCategory("MOBILES");
		}
		if( category.equals("MOBILES") && subCategory=="" ){
			setSubCategory("Mobile Phones");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory();
		System.out.println("HomeAction.getAdListForMobiles()"+adList.size());
		return "success";
	}

	public String getAdListForLaptops(){

		System.out.println("getAdListForLaptops(dd)"+subCategory);
		if(category==""){
			setCategory("LAPTOPS");
		}
		if( category.equals("LAPTOPS") && subCategory=="" ){
			setSubCategory("Laptop");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory();
		System.out.println("HomeAction.getAdListForLaptops()"+adList.size());
		return "success";
		
	}

	public String getAdListForBooksAndDvds(){

		return "success";
	}

	public String getAdDetails(){

		setCategory(category);
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategoryAndPrice(price);

		return "success";

	}

	public String postAd(){

		return "success";

	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}
}