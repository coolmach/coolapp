package com.cbuddy.posts.action;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.MasterComment;
import com.cbuddy.beans.Pdau;
import com.cbuddy.beans.Poit;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.posts.model.AutomobilePostDetails;
import com.cbuddy.posts.services.AutomobileAdService;
import com.cbuddy.posts.services.CommentsService;
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

public class AutomobileAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<AutomobilePostDetails>{

	private static final long serialVersionUID = 1L;
	private List<MasterComment> cmList = new ArrayList<MasterComment>();
	AutomobilePostDetails postDetails = new AutomobilePostDetails();
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;

	private String categoryStr;
	private String subCategoryStr;

	private String sprice; // Price entered by user on the screen
	
	private String responseMsg;

	private List<AutomobilePostDetails> adList = new ArrayList<AutomobilePostDetails>();
	private int count;

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
		if(postDetails.getPrice()==0){
			addFieldError("errorMsg", "Please enter Location");
			return false;
		}
		if(postDetails.getMake().equals("")){
			addFieldError("errorMsg", "Please select the Make of the vehicle");
			return false;
		}
		if(postDetails.getAutomobileModel().equals("")){
			addFieldError("errorMsg", "Please select the Model of the vehicle");
			return false;
		}
		if(postDetails.getYear() == 0){
			addFieldError("errorMsg", "Please select the year of purchase (model)");
			return false;
		}
		if(postDetails.getNoOfOwners() == 0){
			addFieldError("errorMsg", "Please enter the number of owners");
			return false;
		}

		//Subcategory specific validations
		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS)){
			if(postDetails.getFuelType() == null || postDetails.getFuelType().equals("")){
				addFieldError("errorMsg", "Is it a Petrol or Diesel vehicle?");
				return false;
			}
		}

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

		temp = postDetails.getDescription();
		if(temp!=null && temp.length()>256){
			addFieldError("errorMsg", "Invalid Description");
			return false;
		}

		temp = postDetails.getMake();
		if(temp!=null && temp.length()>16){
			addFieldError("errorMsg", "Invalid Make");
			return false;
		}

		temp = postDetails.getAutomobileModel();
		if(temp!=null && temp.length()>16){
			addFieldError("errorMsg", "Invalid Model");
			return false;
		}

		int year = postDetails.getYear();
		if(year<1950 || year>2014){
			addFieldError("errorMsg", "Invalid Year");
			return false;
		}

		int noOfOwners = postDetails.getNoOfOwners();
		if(noOfOwners<=0 || noOfOwners>10){
			addFieldError("errorMsg", "Invalid No. Of Owners");
			return false;
		}
		return output;
	}

	public String postAd(){
		
		double price = 0;
		try{
			price = FormatterUtil.convertStrToAmount(sprice);
			postDetails.setPrice(price);
		}catch(CBuddyException e){
			addFieldError("errorMsg", "Invalid Amount");
			return Action.INPUT;
		}
		
		if(!validateMandatoryFields()){
			return Action.INPUT;
		}
		if(!validateFieldLength()){
			return Action.INPUT;
		}
		System.out.println("AutomobileAction.postAd()"+uploadContentType+" : "+uploadFileName+" : "+upload);
		User user = (User)session.get("userInfo");
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String userId = String.valueOf(user.getUserId());
		String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType[0]) + "";

		//Checking if user has manually tampered location after selecting from auto suggest list
		if(postDetails.getUserEnteredLocationStr() != null && postDetails.getSelectedLocationStr()!=null){
			if(!postDetails.getUserEnteredLocationStr().equals(postDetails.getSelectedLocationStr())){
				return Action.INPUT;
			}
		}

		//Make an entry in POIT
//		Poit poit = new Poit();
//		poit.setCategory(CBuddyConstants.CATEGORY_AUTOMOBILES);
//		poit.setTitle(postDetails.getTitle());
//		poit.setCity(postDetails.getCity());
//		poit.setContactNo(postDetails.getContactNo());
//		poit.setContactPersonName(postDetails.getContactPersonName());
//		//	poit.setCorpId(user.getCorpId());
//		poit.setCreatedBy(String.valueOf(userId));
//		poit.setCreatedOn(current);
//		poit.setDescription(postDetails.getDescription());
//		poit.setImageFileName(imgFileName);
//		poit.setImageType(getExtension(uploadContentType));
//		poit.setLocation(postDetails.getSelectedLocationCode());
//		poit.setModifiedBy(userId);
//		poit.setModifiedOn(current);
//		poit.setNegotiable(null);
//		poit.setPrice(postDetails.getPrice());
//		poit.setRating(0);
//		poit.setSubCategory(postDetails.getSubCategory());
//		poit.setThumbnailName(null);
//		poit.setThumbnailType(null);
//		poit.setUserFirstName(user.getFirstName());
//
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();

		dbSession.beginTransaction();
		
		PostsUtil postsUtil = new PostsUtil();
		
		Poit poit = postsUtil.createPOIT(postDetails, user, dbSession, uploadContentType, CBuddyConstants.CATEGORY_AUTOMOBILES);
		
//		dbSession.save(poit);


		dbSession.flush(); //Flushing to retrieve the auto generated post id

		//Make an entry in PDAU
		Pdau pdau = new Pdau();
		pdau.setCity(postDetails.getCity());
		pdau.setColor(postDetails.getColor());
		pdau.setCreatedBy(userId);
		pdau.setCreatedOn(current);
		pdau.setFuelType(postDetails.getFuelType());
		pdau.setInsuranceAvailable(postDetails.getInsuranceAvailable());
		pdau.setKms(postDetails.getKms());
		pdau.setLocation(postDetails.getSelectedLocationCode());
		pdau.setMake(postDetails.getMake());
		pdau.setAutomobileModel(postDetails.getAutomobileModel());
		pdau.setModifiedBy(userId);
		pdau.setModifiedOn(current);
		pdau.setNoOfOwners(postDetails.getNoOfOwners());
		pdau.setPostId(poit.getPostId());
		pdau.setPrice(postDetails.getPrice());
		pdau.setPriceNegotiable(postDetails.getPriceNegotiable());
		pdau.setRegCity(postDetails.getRegCity());
		pdau.setRegNo(postDetails.getRegNo());
		pdau.setRegState(postDetails.getRegState());
		pdau.setSubCategory(postDetails.getSubCategory());
		pdau.setYear(postDetails.getYear());

		dbSession.save(pdau);

		if(upload != null){
			postsUtil.writeImage(upload, imgFileName);
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
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		for(AutomobilePostDetails postDetails:adList){
			populateAdditionalDetailsForPost(postDetails, dbSession);
		}
	}

	private void populateAdditionalDetailsForPost(AutomobilePostDetails postDetails, Session dbSession){
		if(postDetails == null){
			return;
		}
		Utils utils = new Utils();
		String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
		String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
		postDetails.setCity(cityName);
		postDetails.setLocation(locName);
		postDetails.setPriceStr(FormatterUtil.formatAmount(postDetails.getPrice()));
		if(postDetails.getFuelType()!=null){
			postDetails.setFuelTypeStr(utils.getFuelTypeDesc(postDetails.getFuelType()));	
		}
		if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS)){
			postDetails.setMakeStr(utils.getCarMakeDesc(postDetails.getMake()));
			postDetails.setModelStr(utils.getCarModelDesc(postDetails.getMake(), postDetails.getAutomobileModel()));
		}else if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_MOTORCYCLES)){
			postDetails.setMakeStr(utils.getBikeMakeDesc(postDetails.getMake()));
			postDetails.setModelStr(utils.getBikeModelDesc(postDetails.getMake(), postDetails.getAutomobileModel()));
		}
	}
	
	public String getAdListForAutomobile(){

		if(postDetails.getCategory()==null || postDetails.getCategory().equals("") || !postDetails.getCategory().equals(CBuddyConstants.CATEGORY_AUTOMOBILES)){
			postDetails.setCategory(CBuddyConstants.CATEGORY_AUTOMOBILES);
		}	

		Utils utils = new Utils();
		
		categoryStr = utils.getCategoryDesc(postDetails.getCategory());
		subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());

		if(postDetails.getSubCategory()==null || postDetails.getSubCategory().equals("") || subCategoryStr.equals("")){
			postDetails.setSubCategory(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS);
			subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		}

		AutomobileAdService automobileAdService =  new AutomobileAdService();
		count = automobileAdService.getAdListCount(getModel(), postDetails.getSubCategory());
		adList = automobileAdService.getAdListByCategory(getModel(), postDetails.getSubCategory());
		
		populateAdditionalDetails();

		return "success";
	}
	
	public String getAdDetails(){

		AutomobileAdService adService = new AutomobileAdService();
		postDetails = adService.getAdDetails(getModel());

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		
		populateAdditionalDetailsForPost(postDetails, dbSession);
		
		CommentsService service = new CommentsService();
		cmList = service.getComments(postDetails.getPostId());
		
		return "success";
	}


	@Override
	public AutomobilePostDetails getModel() {
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

	public List<AutomobilePostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<AutomobilePostDetails> adList) {
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
	
	public List<MasterComment> getCmList() {
		return cmList;
	}

	public void setCmList(List<MasterComment> cmList) {
		this.cmList = cmList;
	}

	public String getSprice() {
		return sprice;
	}

	public void setSprice(String sprice) {
		this.sprice = sprice;
	}
}
