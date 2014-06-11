package com.cbuddy.action.posts;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Pdre;
import com.cbuddy.beans.Poit;
import com.cbuddy.services.AdDetailsService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.cbuddy.util.Utils;
import com.model.user.RealEstatePostDetails;
import com.model.user.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RealEstateAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<RealEstatePostDetails>{

	private static final long serialVersionUID = 1L;

	RealEstatePostDetails postDetails = new RealEstatePostDetails();
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	
	private String categoryStr;
	private String subCategoryStr;
	
	private String responseMsg;
	
	private List<RealEstatePostDetails> adList = new ArrayList<RealEstatePostDetails>();
	private String category = "" ;
	private String subCategory = "" ;
	//private String basePath = "";

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

	private String getExtension(String contentType){
		String extension = contentType;
		if(contentType != null){
			int indexSlash = contentType.indexOf("/");
			if(indexSlash>=0){
				extension = contentType.substring(indexSlash + 1);
			}
		}
		return extension;
	}

	public String postAd(){
		System.out.println("RealEstatePostAction.postAd()"+uploadContentType+" : "+uploadFileName+" : "+upload);
		User user = (User)session.get("userInfo");
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String userId = String.valueOf(user.getUserId());
		String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType) + "";

		//Make an entry in POIT
		Poit poit = new Poit();
		poit.setCategory(CBuddyConstants.CATEGORY_REAL_ESTATE);
		poit.setTitle(postDetails.getTitle());
		poit.setCity(postDetails.getCity());
		poit.setContactNo(postDetails.getContactNo());
		poit.setContactPersonName(postDetails.getContactPersonName());
		poit.setCorpId(user.getCorpId());
		poit.setCreatedBy(String.valueOf(userId));
		poit.setCreatedOn(current);
		poit.setDescription(postDetails.getDescription());
		poit.setImageFileName(imgFileName);
		poit.setImageType(getExtension(uploadContentType));
		poit.setLocation(postDetails.getLocation());
		poit.setModifiedBy(userId);
		poit.setModifiedOn(current);
		poit.setNegotiable(null);
		poit.setPrice(postDetails.getPriceValue());
		poit.setRating(0);
		poit.setSubCategory(postDetails.getSubCategory());
		poit.setThumbnailName(null);
		poit.setThumbnailType(null);
		poit.setUserFirstName(user.getFirstName());

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();

		dbSession.beginTransaction();
		dbSession.save(poit);
		//dbSession.getTransaction().commit();

		dbSession.flush(); //Flushing to retrieve the auto generated post id

		//Make an entry in PDRE
		Pdre pdre = new Pdre();
		pdre.setAgeUnit("YEARS");
		pdre.setAgeValue(postDetails.getAgeValue());
		pdre.setAmt(postDetails.getAmt());
		pdre.setApprovalAuthority(postDetails.getApprovalAuthority());
		pdre.setExpectedCompletionDate(postDetails.getExpectedCompletionDate());
		pdre.setReadyToOccupy(postDetails.getReadyToOccupy());
		pdre.setArea(postDetails.getArea());
		pdre.setBedrooms(postDetails.getBedrooms());
		pdre.setBuilderName(postDetails.getBuilderName());
		pdre.setCarParking(postDetails.getCarParking());
		pdre.setChildrenPlayArea(postDetails.getChildrenPlayArea());
		pdre.setCity(postDetails.getCity());
		pdre.setClubHouse(postDetails.getClubHouse());
		pdre.setCreatedBy(userId);
		pdre.setCreatedOn(current);
		pdre.setFacingDirection(postDetails.getFacingDirection());
		pdre.setFloorNumber(postDetails.getFloorNumber());
		pdre.setFoodPreference(postDetails.getFoodPreference());
		pdre.setFurnished(postDetails.getFurnished());
		pdre.setGender(postDetails.getGender());
		pdre.setGym(postDetails.getGym());
		//pdre.setImageFileName(this.uploadFileName);
		pdre.setLocation(postDetails.getLocation());
		pdre.setMaintenance(postDetails.getMaintenance());
		pdre.setMaritalPreference(postDetails.getMaritalPreference());
		pdre.setModifiedBy(userId);
		pdre.setModifiedOn(current);
		pdre.setNewOrResale(postDetails.getNewOrResale());
		pdre.setNoOfRoommates(postDetails.getNoOfRoommates());
		pdre.setPostId(poit.getPostId());
		pdre.setPriceUnit("INR");
		pdre.setPriceValue(postDetails.getPriceValue());
		pdre.setRegionalPreference(postDetails.getRegionalPreference());
		pdre.setSharing(postDetails.getSharing());
		pdre.setSubCategory(postDetails.getSubCategory());
		pdre.setSwimmingPool(postDetails.getSwimmingPool());
		pdre.setTv(postDetails.getTv());
		pdre.setWifi(postDetails.getWifi());

		dbSession.save(pdre);
		
		if(upload != null){
			writeImage(upload, imgFileName);
		}

		dbSession.getTransaction().commit();
		
		responseMsg = "Your post has been placed successfully! Post Id is " + poit.getPostId();
		
		return "success";
	}

	private void writeImage(File inputFile, String outputFileName){
		String filePath = "C:\\Shiva\\";
		//String filePath = request.getSession().getServletContext().getRealPath("");
		File outputFile = new File(filePath + "/images/posts", outputFileName);

		try {
			System.out.println(outputFile.getAbsolutePath());
			FileUtils.copyFile(inputFile, outputFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			postDetails.setMaintenanceStr(NumberFormatterUtil.formatAmount(postDetails.getMaintenance()));
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
		
		//basePath = request.getSession().getServletContext().getRealPath("");
		
		category = postDetails.getCategory();
		subCategory = postDetails.getSubCategory();
		
		categoryStr = Utils.getInstance().getCategoryDesc(category);
		subCategoryStr = Utils.getInstance().getSubCategoryDesc(category, subCategory);
		
		if(category==null || category.equals("")){
			setCategory(CBuddyConstants.CATEGORY_REAL_ESTATE);
		}
		if(category.equals(CBuddyConstants.CATEGORY_REAL_ESTATE) && (subCategory==null || subCategory.equals(""))){
			setSubCategory(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT);
		}
		
		AdDetailsService adDetailService =  new AdDetailsService();
		adList = adDetailService.getAdListByCategory(getModel(), subCategory);
		
		populateAdditionalDetails();
		
		System.out.println("HomeAction.getAdListForRealEstate()"+adList.size()+" : "+subCategory);
		return "success";
	}

	@Override
	public RealEstatePostDetails getModel() {
		return postDetails;
	}


	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public List<RealEstatePostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<RealEstatePostDetails> adList) {
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

//	public String getBasePath() {
//		return basePath;
//	}
//
//	public void setBasePath(String basePath) {
//		this.basePath = basePath;
//	}

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
}
