package com.cbuddy.user.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.cbuddy.beans.Pdre;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class HomeAction extends ActionSupport implements SessionAware, ServletRequestAware ,ModelDriven<Pdre>{

    Pdre pdre = new Pdre();
//	private List<RealEstatePostDetails> adList = new ArrayList<RealEstatePostDetails>();
	private String category="" ;
	private String subCat="" ;
	private String basePath = "";
	
	private Map<String,Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}

	public String getSubCat() {
		return subCat;
	}

	public void setSubCat(String subCat) {
		this.subCat = subCat;
	}

	private HttpServletRequest request = null;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

//	public List<RealEstatePostDetails> getAdList() {
//		return adList;
//	}
//
//	public void setAdList(List<RealEstatePostDetails> adList) {
//		this.adList = adList;
//	}


	/*public String execute(){
		System.out.println("getAdListForRealEstate(dd) pdre.getArea(): " + getModel().getArea());
		basePath = request.getSession().getServletContext().getRealPath("");
		if(category.equals("")){
			setCategory(CBuddyConstants.CATEGORY_REAL_ESTATE);
		}
		if(category.equals(CBuddyConstants.CATEGORY_REAL_ESTATE) && subCat.equals("")){
			setSubCat(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT);
		}
		AdDetailsService adDetailService =  new AdDetailsService();
		
		
		
		adList = adDetailService.getAdListByCategory(getModel(), subCat);
		System.out.println("HomeAction.getAdListForRealEstate() subCa"+subCat);
		System.out.println("HomeAction.getAdListForRealEstate()"+adList.size());
		return "success";
	}
	
	private void populateAdditionalDetails(){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		for(RealEstatePostDetails postDetails:adList){
			String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
			String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
			postDetails.setCity(cityName);
			postDetails.setLocation(locName);
			postDetails.setPriceValueStr(NumberFormatterUtil.formatAmount(postDetails.getPriceValue()));
			String temp = "";
			if(postDetails.getNewOrResale().equals("N")){
				//New
				if(postDetails.getReadyToOccupy().equals("Y")){
					temp = "New - Ready to Move";
				}else{
					if(postDetails.getExpectedCompletionDate()!=null){
						temp = "New - Expected Completion: " + postDetails.getExpectedCompletionDate();
					}else{
						temp = "New - Under Construction";
					}
				}
			}else{
				//Resale
				if(postDetails.getAgeValue()>0){
					temp = "Resale - " + postDetails.getAgeValue() + " years old";
				}else{
					temp = "Resale";
				}
			}
			postDetails.setNewOrResaleStr(temp);
		}
	}
	
	public String getAdListForRealEstate(){

		System.out.println("getAdListForRealEstate() ENTER");
		
		basePath = request.getSession().getServletContext().getRealPath("");
		
		if(category.equals("")){
			setCategory(CBuddyConstants.CATEGORY_REAL_ESTATE);
		}
		if(category.equals(CBuddyConstants.CATEGORY_REAL_ESTATE) && subCat.equals("")){
			setSubCat(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT);
		}
		
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory(getModel(),subCat);
		
		populateAdditionalDetails();
		
		System.out.println("HomeAction.getAdListForRealEstate()"+adList.size()+" : "+subCat);
		return "success";
	}

*/	/*public String getAdListForCars(){
		
		System.out.println("getAdListForCars(dd)"+subCat);
		basePath = request.getSession().getServletContext().getRealPath("");
		
		if(category==""){
			setCategory("REAL ESTATE");
		}
		if( category.equals("REAL ESTATE") && subCat=="" ){
			setSubCat("Apartment/House For Rent");
		}
		CriteriaUtil adDetailService =  new CriteriaUtil();
		//adList = adDetailService.getAdListByCategory(getModel(),subCat);
		//System.out.println("HomeAction.getAdListForCars()"+adList.size());

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
		CriteriaUtil adDetailService =  new CriteriaUtil();
		//adList = adDetailService.getAdListByCategory(getModel(),subCat);
		//System.out.println("HomeAction.getAdListForMobiles()"+adList.size());
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
		CriteriaUtil adDetailService =  new CriteriaUtil();
		//adList = adDetailService.getAdListByCategory(getModel(),subCat);
		//System.out.println("HomeAction.getAdListForLaptops()"+adList.size());
		return "success";
		
	}*/

	public String getAdListForBooksAndDvds(){

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
