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

import com.cbuddy.beans.NameValuePair;
import com.cbuddy.beans.Pdre;
import com.cbuddy.beans.Poit;
import com.cbuddy.services.RealEstateAdService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.cbuddy.util.Utils;
import com.model.user.RealEstatePostDetails;
import com.model.user.User;
import com.opensymphony.xwork2.Action;
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

	/* TODO: The two attributes selectedLocation and neighborhoodLocations are added only to retain the values populated by LocationAction (that is,
	 * when the user refreshes the list page after filtering based on a location and when the page is reloaded, the location selected by the user should be
	 * shown and be selected by default. 
	 */
	private NameValuePair selectedLocation;
	private List<NameValuePair> neighborhoodLocations;

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

	private boolean validateMandatoryFields(){
		String subCategory = postDetails.getSubCategory();
		
		//Common validations
		if(postDetails.getTitle().equals("")){
			addFieldError("errorMsg", "Please enter Title");
			return false;
		}
		if(postDetails.getContactNo().equals("")){
			addFieldError("errorMsg", "Please enter Contact Number");
			return false;
		}
		if(postDetails.getContactPersonName().equals("")){
			addFieldError("errorMsg", "Please enter Contact Person Name");
			return false;
		}
		if(postDetails.getCity().equals("")){
			addFieldError("errorMsg", "Please enter City");
			return false;
		}
		if(postDetails.getSelectedLocationCode().equals("")){
			addFieldError("errorMsg", "Please enter Location");
			return false;
		}

		//Subcategory specific validations
		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_RENT) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_SALE)){
			if(postDetails.getArea() == 0){
				addFieldError("errorMsg", "Please enter Area");
				return false;
			}
			if(postDetails.getBedrooms()==0){
				addFieldError("errorMsg", "Please enter number of bedrooms");
				return false;
			}
			if(postDetails.getFacingDirection().equals("")){
				addFieldError("errorMsg", "Please enter Facing Direction");
				return false;
			}
			if(postDetails.getFloorNumber().equals("")){
				addFieldError("errorMsg", "Please enter Floor number");
				return false;
			}
		}
		
		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE)){
			String newOrResale = postDetails.getNewOrResale();
			if(newOrResale.equals("")){
				addFieldError("errorMsg", "Please select if it is a new property or for resale");
				return false;
			}else{
				if(newOrResale.equals(CBuddyConstants.NEW_OR_RESALE_RESALE)){
					if(postDetails.getAgeValue() == 0){
						addFieldError("errorMsg", "Please enter the age of the property");
						return false;
					}
				}
			}
		}
		
		return true;
	}

	private boolean validateFieldLength(){
		boolean output = true;
		String temp = postDetails.getTitle();
		if(temp!=null && temp.length()>100){
			addFieldError("errorMsg", "Please enter a smaller Title (less than 100 characters)");
		}
		temp = postDetails.getCity();
		if(temp!=null && temp.length()>8){
			addFieldError("errorMsg", "Invalid City");
		}
		temp = postDetails.getUserEnteredLocationStr();
		if(temp!=null && temp.length()>30){
			addFieldError("errorMsg", "Invalid Location");
		}
		temp = postDetails.getSelectedLocationCode();
		if(temp!=null && temp.length()>8){
			addFieldError("errorMsg", "Invalid Location");
		}
		temp = postDetails.getSelectedLocationStr();
		if(temp!=null && temp.length()>30){
			addFieldError("errorMsg", "Invalid Location");
		}
		int tempInt = postDetails.getArea();
		if(tempInt > 100000){
			addFieldError("errorMsg", "Invalid Area");
		}
		tempInt = postDetails.getBedrooms();
		if(tempInt > 10){
			addFieldError("errorMsg", "Invalid number of Bedrooms");
		}
		temp = postDetails.getMaritalPreference();
		if(temp!=null && temp.length()>1){
			addFieldError("errorMsg", "Invalid Family Preference");
		}
		temp = postDetails.getFurnished();
		if(temp!=null && temp.length()>1){
			addFieldError("errorMsg", "Invalid Furnishing");
		}
		double tempD = postDetails.getPriceValue();
		if(tempD > 100000000 || tempD == 0){
			String subCategory = postDetails.getSubCategory();
			if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT) || 
					subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_RENT) ||
					subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION) ||
					subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED)
					){
				addFieldError("errorMsg", "Invalid Rent");	
			}else{
				addFieldError("errorMsg", "Invalid Price");
			}
		}
		tempD = postDetails.getMaintenance();
		if(tempD > 100000000){
			addFieldError("errorMsg", "Invalid Maintenance");
		}
		temp = postDetails.getFacingDirection();
		if(temp!=null && temp.length()>1){
			addFieldError("errorMsg", "Invalid Facing Direction");
		}
		temp = postDetails.getFloorNumber();
		if(temp!=null && temp.length()>2){
			addFieldError("errorMsg", "Invalid Floor Number");
		}
		temp = postDetails.getDescription();
		if(temp!=null && temp.length()>256){
			addFieldError("errorMsg", "Invalid Description");
		}
		return output;
	}

	public String postAd(){
		if(!validateMandatoryFields()){
			return Action.INPUT;
		}
		if(!validateFieldLength()){
			return Action.INPUT;
		}
		System.out.println("RealEstatePostAction.postAd()"+uploadContentType+" : "+uploadFileName+" : "+upload);
		User user = (User)session.get("userInfo");
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String userId = String.valueOf(user.getUserId());
		String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType) + "";

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();

		//Checking if user has manually tampered location after selecting from auto suggest list

		if(!postDetails.getUserEnteredLocationStr().equals(postDetails.getSelectedLocationStr())){
			//Check if the user entered value is valid
			String locCode = LocationUtil.getLocationCode(dbSession, postDetails.getSelectedLocationCode(), postDetails.getUserEnteredLocationStr());
			if(locCode == null){
				addFieldError("errorMsg", "Invalid Location");
				return Action.INPUT;
			}else{
				//Updating new location
				postDetails.setSelectedLocationStr(postDetails.getUserEnteredLocationStr());
				postDetails.setSelectedLocationCode(locCode);
			}
		}else if(!postDetails.getCity().equals(postDetails.getSelectedCityCode())){
			//User selects a different City after choosing a location for a different city
			String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getSelectedLocationCode());
			if(locName.equals(postDetails.getSelectedLocationCode())){
				addFieldError("errorMsg", "Invalid Location");
				return Action.INPUT;
			}
		}

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
		poit.setLocation(postDetails.getSelectedLocationCode());
		poit.setModifiedBy(userId);
		poit.setModifiedOn(current);
		poit.setNegotiable(null);
		poit.setPrice(postDetails.getPriceValue());
		poit.setRating(0);
		poit.setSubCategory(postDetails.getSubCategory());
		poit.setThumbnailName(null);
		poit.setThumbnailType(null);
		poit.setUserFirstName(user.getFirstName());

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
		pdre.setLocation(postDetails.getSelectedLocationCode());
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
		//return "redirect";
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
			postDetails.setFacingDirectionStr(Utils.getInstance().getDirectionDesc(postDetails.getFacingDirection()));
			postDetails.setFloorNumberStr(Utils.getInstance().getFloorNumberDesc(postDetails.getFloorNumber()));
			postDetails.setFurnishedStr(Utils.getInstance().getFurnishedDesc(postDetails.getFurnished()));

			String temp = "";
			if(postDetails.getNewOrResale()!= null){
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
			}
			postDetails.setNewOrResaleStr(temp);
		}
	}

	public String getAdListForRealEstate(){

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

		RealEstateAdService realEstateAdService =  new RealEstateAdService();
		adList = realEstateAdService.getAdListByCategory(getModel(), subCategory);

		populateAdditionalDetails();

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
