package com.cbuddy.action.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.cbuddy.beans.Pdre;
import com.cbuddy.beans.Poit;
import com.cbuddy.services.AdDetailsService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class HomeAction extends ActionSupport implements ServletRequestAware ,ModelDriven<Pdre>{

    Pdre pdre = new Pdre();
	private List<Poit> adList = new ArrayList<Poit>();
	private String category="" ;
	private String subCat="" ;
	public String getSubCat() {
		return subCat;
	}

	public void setSubCat(String subCat) {
		this.subCat = subCat;
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

		System.out.println("getAdListForRealEstate(dd) pdre.getArea()"+getModel().getArea());
		if(category==""){
			setCategory("REAL ESTATE");
		}
		if( category.equals("REAL ESTATE") && subCat=="" ){
			setSubCat("Apartment/House For Rent");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory(getModel());
		System.out.println("HomeAction.getAdListForRealEstate() subCa"+subCat);
		System.out.println("HomeAction.getAdListForRealEstate()"+adList.size());
		return "success";
	}
	
	public String getAdListForRealEstate(){

		System.out.println("getAdListForRhbhbhbhealEstate(dd) pdre.getArea()"+getModel().getArea());
		if(category==""){
			setCategory("REAL ESTATE");
		}
		if( category.equals("REAL ESTATE") && subCat=="" ){
			setSubCat("Apartment/House For Rent");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory(getModel());
		System.out.println("HomeAction.getAdListForRealEstate() subCa"+subCat);
		System.out.println("HomeAction.getAdListForRealEstate()"+adList.size());
		return "success";
	}

	public String getAdListForCars(){
		
		System.out.println("getAdListForCars(dd)"+subCat);
		if(category==""){
			setCategory("REAL ESTATE");
		}
		if( category.equals("REAL ESTATE") && subCat=="" ){
			setSubCat("Apartment/House For Rent");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory(getModel());
		System.out.println("HomeAction.getAdListForCars()"+adList.size());

		return "success";
	}

	public String getAdListForHouseHoldItems(){

		return "success";
	}

	public String getAdListForMobiles(){

		System.out.println("getAdListForRealEstate(dd)"+subCat);
		if(category==""){
			setCategory("MOBILES");
		}
		if( category.equals("MOBILES") && subCat=="" ){
			setSubCat("Mobile Phones");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory(getModel());
		System.out.println("HomeAction.getAdListForMobiles()"+adList.size());
		return "success";
	}

	public String getAdListForLaptops(){

		System.out.println("getAdListForLaptops(dd)"+subCat);
		if(category==""){
			setCategory("LAPTOPS");
		}
		if( category.equals("LAPTOPS") && subCat=="" ){
			setSubCat("Laptop");
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory(getModel());
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

	@Override
	public Pdre getModel() {
		// TODO Auto-generated method stub
		return pdre;
	}
}
