package com.cbuddy.posts.action;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.MasterComment;
import com.cbuddy.beans.NameValuePair;
import com.cbuddy.beans.Pdre;
import com.cbuddy.beans.Poit;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.posts.model.RealEstatePostDetails;
import com.cbuddy.posts.services.CommentsService;
import com.cbuddy.posts.services.RealEstateAdService;
import com.cbuddy.posts.util.PostsUtil;
import com.cbuddy.user.model.User;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.FormatterUtil;
import com.cbuddy.util.Utils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RealEstateAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<RealEstatePostDetails>{

	private static final long serialVersionUID = 1L;

	private List<MasterComment> cmList = new ArrayList<MasterComment>();
	RealEstatePostDetails postDetails = new RealEstatePostDetails();
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;

	private String categoryStr;
	private String subCategoryStr;

	private String propertyType;

	private String sprice; // Price entered by user on the screen
	private String smaintenance ;//Maintenance entered by user on the screen
	private String sdeposit; // Deposit entere by user on the screen


	private String responseMsg;

	private List<RealEstatePostDetails> adList = new ArrayList<RealEstatePostDetails>();
	private int count;
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

	//	private String getExtension(String contentType){
	//		String extension = contentType;
	//		if(contentType != null){
	//			int indexSlash = contentType.indexOf("/");
	//			if(indexSlash>=0){
	//				extension = contentType.substring(indexSlash + 1);
	//			}
	//		}
	//		return extension;
	//	}

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
		if(postDetails.getCity()==null || postDetails.getCity().equals("")){
			addFieldError("errorMsg", "Please enter City");
			return false;
		}
		if(postDetails.getSelectedLocationCode()==null || postDetails.getSelectedLocationCode().equals("")){
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
			if(postDetails.getBedrooms()==null || postDetails.getBedrooms().trim().equals("-1")){
				addFieldError("errorMsg", "Please specify Number Of Bedrooms");
				return false;
			}
			//			if(postDetails.getFacingDirection().equals("")){
			//				addFieldError("errorMsg", "Please enter Facing Direction");
			//				return false;
			//			}
			//			if(postDetails.getFloorNumber().equals("")){
			//				addFieldError("errorMsg", "Please enter Floor number");
			//				return false;
			//			}
		}

		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_SALE) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE)){
			if(postDetails.getNewOrResale() == null || postDetails.getNewOrResale().trim().equals("")){
				addFieldError("errorMsg", "Please select New or Resale");
				return false;
			}
		}

		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED)){
			if(postDetails.getGender()==null || postDetails.getGender().trim().equals("")){
				addFieldError("errorMsg", "Please choose the Gender");
				return false;
			}
		}

		//		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE)){
		//			String newOrResale = postDetails.getNewOrResale();
		//			if(newOrResale.equals("")){
		//				addFieldError("errorMsg", "Please select if it is a new property or for resale");
		//				return false;
		//			}else{
		//				if(newOrResale.equals(CBuddyConstants.NEW_OR_RESALE_RESALE)){
		//					if(postDetails.getAgeValue() == 0){
		//						addFieldError("errorMsg", "Please enter the age of the property");
		//						return false;
		//					}
		//				}
		//			}
		//		}

		return true;
	}

	private boolean validateFieldLength(){
		boolean output = true;
		String temp = postDetails.getTitle();
		if(temp!=null && temp.length()>100){
			addFieldError("errorMsg", "Please enter a smaller Title (less than 100 characters)");
			return false;
		}
		temp = postDetails.getCity();
		if(temp!=null && temp.length()>8){
			addFieldError("errorMsg", "Invalid City");
			return false;
		}
		temp = postDetails.getUserEnteredLocationStr();
		if(temp!=null && temp.length()>30){
			addFieldError("errorMsg", "Invalid Location");
			return false;
		}
		temp = postDetails.getSelectedLocationCode();
		if(temp!=null && temp.length()>8){
			addFieldError("errorMsg", "Invalid Location");
			return false;
		}
		temp = postDetails.getSelectedLocationStr();
		if(temp!=null && temp.length()>30){
			addFieldError("errorMsg", "Invalid Location");
			return false;
		}
		int tempInt = postDetails.getArea();
		if(tempInt > 100000){
			addFieldError("errorMsg", "Invalid Area");
			return false;
		}
		temp = postDetails.getBedrooms();
		if(temp!=null && temp.length() > 4){
			addFieldError("errorMsg", "Invalid number of Bedrooms");
			return false;
		}

		tempInt = postDetails.getBathrooms();
		if(tempInt > 5){
			addFieldError("errorMsg", "Invalid number of Bathrooms");
			return false;
		}

		temp = postDetails.getMaritalPreference();
		if(temp!=null && temp.length()>1){
			addFieldError("errorMsg", "Invalid Family Preference");
			return false;
		}
		temp = postDetails.getFurnished();
		if(temp!=null && temp.length()>1){
			addFieldError("errorMsg", "Invalid Furnishing");
			return false;
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
			return false;
		}
		tempD = postDetails.getMaintenance();
		if(tempD > 100000000){
			addFieldError("errorMsg", "Invalid Maintenance");
			return false;
		}
		tempD = postDetails.getDeposit();
		if(tempD > 100000000){
			addFieldError("errorMsg", "Invalid Deposit");
			return false;
		}
		//		temp = postDetails.getFacingDirection();
		//		if(temp!=null && temp.length()>1){
		//			addFieldError("errorMsg", "Invalid Facing Direction");
		//			return false;
		//		}
		//		temp = postDetails.getFloorNumber();
		//		if(temp!=null && temp.length()>2){
		//			addFieldError("errorMsg", "Invalid Floor Number");
		//			return false;
		//		}
		temp = postDetails.getDescription();
		if(temp!=null && temp.length()>256){
			addFieldError("errorMsg", "Invalid Description");
			return false;
		}
		return output;
	}

	public String postAd(){

		try{
			double price = FormatterUtil.convertStrToAmount(sprice);
			postDetails.setPrice(price);
			postDetails.setPriceValue(price);
		}catch(CBuddyException e){
			addFieldError("errorMsg", "Invalid Amount");
			return Action.INPUT;
		}


		//Validating Maintenance
		if(smaintenance!=null && !smaintenance.trim().equals("")){
			try{
				double maintenance = FormatterUtil.convertStrToAmount(smaintenance);
				if(maintenance < 100 || maintenance > 100000){
					addFieldError("errorMsg", "Please enter a proper value for Maintenance");
					return Action.INPUT;
				}
				postDetails.setMaintenance(maintenance);
			}catch(Exception e){
				addFieldError("errorMsg", "Please enter a proper value for Maintenance");
				return Action.INPUT;
			}
		}

		//Validating Deposit
		if(sdeposit!=null && !sdeposit.trim().equals("")){
			try{
				double deposit = FormatterUtil.convertStrToAmount(sdeposit);
				if(deposit < 10000 || deposit > 1000000){
					addFieldError("errorMsg", "Please enter a proper value for Deposit");
					return Action.INPUT;
				}
				postDetails.setDeposit(deposit);
			}catch(Exception e){
				addFieldError("errorMsg", "Please enter a proper value for Deposit");
			}
		}
		
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
		//String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType) + "";

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
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
		//		Poit poit = new Poit();
		//		poit.setCategory(CBuddyConstants.CATEGORY_REAL_ESTATE);
		//		poit.setTitle(postDetails.getTitle());
		//		poit.setCity(postDetails.getCity());
		//		poit.setContactNo(postDetails.getContactNo());
		//		poit.setContactPersonName(postDetails.getContactPersonName());
		//		poit.setCorpId(user.getCorpId());
		//		poit.setCreatedBy(String.valueOf(userId));
		//		poit.setCreatedOn(current);
		//		poit.setDescription(postDetails.getDescription());
		//		poit.setImageFileName(imgFileName);
		//		poit.setImageType(getExtension(uploadContentType));
		//		poit.setLocation(postDetails.getSelectedLocationCode());
		//		poit.setModifiedBy(userId);
		//		poit.setModifiedOn(current);
		//		poit.setNegotiable(null);
		//		poit.setPrice(postDetails.getPriceValue());
		//		poit.setRating(0);
		//		poit.setSubCategory(postDetails.getSubCategory());
		//		poit.setThumbnailName(null);
		//		poit.setThumbnailType(null);
		//		poit.setUserFirstName(user.getFirstName());

		dbSession.beginTransaction();
		//dbSession.save(poit);

		PostsUtil postsUtil = new PostsUtil();

		Poit poit = postsUtil.createPOIT(postDetails, user, dbSession, uploadContentType, CBuddyConstants.CATEGORY_REAL_ESTATE);

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
		pdre.setBathrooms(postDetails.getBathrooms());
		pdre.setBuilderName(postDetails.getBuilderName());
		pdre.setCarParking(postDetails.getCarParking()!=null && (postDetails.getCarParking().equals("true") || postDetails.getCarParking().equals("Y"))?"Y":null);
		pdre.setChildrenPlayArea(postDetails.getChildrenPlayArea()!=null && (postDetails.getChildrenPlayArea().equals("true") || postDetails.getChildrenPlayArea().equals("Y"))?"Y":null);
		pdre.setCity(postDetails.getCity());
		pdre.setClubHouse(postDetails.getClubHouse()!=null && postDetails.getClubHouse().equals("true")?"Y":null);
		pdre.setCreatedBy(userId);
		pdre.setCreatedOn(current);
		pdre.setFacingDirection(postDetails.getFacingDirection());
		pdre.setFloorNumber(postDetails.getFloorNumber());
		pdre.setFoodPreference(postDetails.getFoodPreference());
		pdre.setFood(postDetails.getFood());
		pdre.setFurnished(postDetails.getFurnished());
		pdre.setGender(postDetails.getGender());
		pdre.setGym(postDetails.getGym()!=null && postDetails.getGym().equals("true")?"Y":null);
		//pdre.setImageFileName(this.uploadFileName);
		pdre.setLocation(postDetails.getSelectedLocationCode());
		pdre.setMaintenance(postDetails.getMaintenance());
		pdre.setDeposit(postDetails.getDeposit());
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
		pdre.setSwimmingPool(postDetails.getSwimmingPool()!=null && postDetails.getSwimmingPool().equals("true")?"Y":null);
		pdre.setTv(postDetails.getTv()!=null && postDetails.getTv().equals("true")?"Y":null);
		pdre.setWifi(postDetails.getWifi()!=null && postDetails.getWifi().equals("true")?"Y":null);
		pdre.setPowerBackup(postDetails.getPowerBackup()!=null && postDetails.getPowerBackup().equals("true")?"Y":null);

		dbSession.save(pdre);

		if(upload != null){
			postsUtil.writeImage(upload, poit.getImageFileName());
		}

		dbSession.getTransaction().commit();

		responseMsg = "Your post has been placed successfully! Post Id is " + poit.getPostId();

		return "success";
		//return "redirect";
	}

	private void populateAdditionalDetails(){
		if(adList == null){
			return;
		}
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		for(RealEstatePostDetails postDetails:adList){
			populateAdditionalDetailsForPost(postDetails, dbSession);
		}
	}

	private void populateAdditionalDetailsForPost(RealEstatePostDetails postDetails, Session dbSession){
		if(postDetails == null){
			return;
		}
		Utils utils = new Utils();
		String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
		String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
		postDetails.setCity(cityName);
		postDetails.setLocation(locName);
		postDetails.setPriceValueStr(FormatterUtil.formatAmount(postDetails.getPriceValue()));
		postDetails.setMaintenanceStr(FormatterUtil.formatAmount(postDetails.getMaintenance()));
		postDetails.setDepositStr(FormatterUtil.formatAmount(postDetails.getDeposit()));
		postDetails.setFacingDirectionStr(utils.getDirectionDesc(postDetails.getFacingDirection()));
		postDetails.setFloorNumberStr(utils.getFloorNumberDesc(postDetails.getFloorNumber()));
		postDetails.setFurnishedStr(utils.getFurnishedDesc(postDetails.getFurnished()));
		String maritalPreference = postDetails.getMaritalPreference();
		if(maritalPreference != null){
			if(maritalPreference.equals("B")){
				postDetails.setMaritalPreference("Bachelors");
			}else if(maritalPreference.equals("F")){
				postDetails.setMaritalPreference("Family");
			}else{
				postDetails.setMaritalPreference("None");
			}
		}
		String genderPreference = postDetails.getGender();
		if(genderPreference != null){
			postDetails.setGender(genderPreference.equals("M")?"Male":"Female");
		}

		String temp = "";
		if(postDetails.getNewOrResale()!= null){
			if(postDetails.getNewOrResale().equals("N")){
				//New
				if(postDetails.getReadyToOccupy() == null || postDetails.getReadyToOccupy().trim().equals("")){
					temp = "New House";
				}else if(postDetails.getReadyToOccupy().equals("Y")){
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
					temp = "For Resale";
				}
			}
		}
		postDetails.setNewOrResaleStr(temp);
		postDetails.setPostedDateStr(FormatterUtil.formatDate(postDetails.getCreatedOn()));
	}

	public String getAdListForRealEstate(){

		Utils utils = new Utils();

		if(postDetails == null){
			return null;
		}

		if(postDetails.getCategory()==null || postDetails.getCategory().equals("") || !postDetails.getCategory().equals(CBuddyConstants.CATEGORY_REAL_ESTATE)){
			postDetails.setCategory(CBuddyConstants.CATEGORY_REAL_ESTATE);
		}	

		categoryStr = utils.getCategoryDesc(postDetails.getCategory());
		subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());

		if(postDetails.getSubCategory()==null || postDetails.getSubCategory().equals("") || subCategoryStr.equals("")){
			postDetails.setSubCategory(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE);
			subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		}

		RealEstateAdService realEstateAdService =  new RealEstateAdService();
		count = realEstateAdService.getAdListCount(getModel(), postDetails.getSubCategory());
		adList = realEstateAdService.getAdListByCategory(getModel(), postDetails.getSubCategory());

		populateAdditionalDetails();

		return "success";
	}

	public String getAdDetails(){

		RealEstateAdService adService = new RealEstateAdService();
		postDetails = adService.getAdDetailsForRealEstate(getModel());

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();

		populateAdditionalDetailsForPost(postDetails, dbSession);

		if(postDetails != null){
			CommentsService service = new CommentsService();
			cmList = service.getComments(postDetails.getPostId());
		}

		return "success";
	}

	public String getRelevantPage(){
		String subCategory = postDetails.getSubCategory();
		String output = "ApartmentForRent";
		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE)){
			output = "ApartmentForSale";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT)){
			output = "ApartmentForRent";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_SALE)){
			output = "IndependentHouseForSale";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_RENT)){
			output = "IndependentHouseForRent";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION)){
			output = "PGAccommodation";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_LAND_SALE)){
			output = "LandForSale";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED)){
			output = "RoommateRequired";
		}
		return output;
	}


	@Override
	public RealEstatePostDetails getModel() {
		return postDetails;
	}


	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public List<RealEstatePostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<RealEstatePostDetails> adList) {
		this.adList = adList;
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
		System.out.println(responseMsg);
		this.responseMsg = responseMsg;
	}

	public RealEstatePostDetails getPostDetails() {
		return postDetails;
	}

	public void setPostDetails(RealEstatePostDetails postDetails) {
		this.postDetails = postDetails;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<MasterComment> getCmList() {
		return cmList;
	}

	public void setCmList(List<MasterComment> cmList) {
		this.cmList = cmList;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	@Transient
	public String getSprice() {
		return sprice;
	}

	public void setSprice(String sprice) {
		this.sprice = sprice;
	}

	@Transient
	public String getSmaintenance() {
		return smaintenance;
	}

	public void setSmaintenance(String smaintenance) {
		this.smaintenance = smaintenance;
	}

	@Transient
	public String getSdeposit() {
		return sdeposit;
	}

	public void setSdeposit(String sdeposit) {
		this.sdeposit = sdeposit;
	}

}
