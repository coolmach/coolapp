package com.cbuddy.posts.action;

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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;

import com.cbuddy.beans.MasterComment;
import com.cbuddy.beans.MobileMaster;
import com.cbuddy.beans.Pdmo;
import com.cbuddy.beans.Poit;
import com.cbuddy.posts.cache.MobilePhoneCache;
import com.cbuddy.posts.model.MobilePostDetails;
import com.cbuddy.posts.services.CommentsService;
import com.cbuddy.posts.services.MobileAdService;
import com.cbuddy.posts.util.PostsUtil;
import com.cbuddy.user.model.User;
import com.cbuddy.util.AutoSuggestMobileService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.cbuddy.util.Utils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class MobileAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<MobilePostDetails>{

	private static final long serialVersionUID = 1L;
	private List<MasterComment> cmList = new ArrayList<MasterComment>();
	MobilePostDetails postDetails = new MobilePostDetails();
	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	private String categoryStr;
	private String subCategoryStr;

	private String responseMsg;

	private List<MobilePostDetails> adList = new ArrayList<MobilePostDetails>();
	private int count;
	
	private String brandNew;
	private String modelSearchStr;
	private JSONArray modelDetailsJsonArray;
	
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
		if(postDetails.getPrice() <= 0){
			addFieldError("errorMsg", "Please enter Price");
			return false;
		}
		if(postDetails.getBrand().equals("")){
			addFieldError("errorMsg", "Please select the Brand");
			return false;
		}
		if(postDetails.getYear() == 0){
			addFieldError("errorMsg", "Please select the year of purchase (model)");
			return false;
		}
		if(postDetails.getColor().equals("")){
			addFieldError("errorMsg", "Please enter the Color");
			return false;
		}
		if(postDetails.getUserEnteredModelStr().equals("")){
			addFieldError("errorMsg", "Please enter the Model");
			return false;
		}
		if(postDetails.getTouchScreen() == null || postDetails.getTouchScreen().equals("")){
			addFieldError("errorMsg", "Please specify if Touch Screen is present");
			return false;
		}
		if(postDetails.getDualSim() == null || postDetails.getDualSim().equals("")){
			addFieldError("errorMsg", "Please specify whether Dual Sim is enabled");
			return false;
		}
		if(postDetails.getOperatingSystem().equals("")){
			addFieldError("errorMsg", "Please enter Operating System");
			return false;
		}
		return true;
	}

	private boolean validateFieldLength(){
		boolean output = true;
		String subCategory = postDetails.getSubCategory();
		String temp = postDetails.getTitle();
		if(temp != null && temp.length() > 100){
			addFieldError("errorMsg", "Please enter a smaller Title (less than 100 characters)");
			return false;
		}
		temp = postDetails.getCity();
		if(temp != null && temp.length() > 8){
			addFieldError("errorMsg", "Invalid City");
			return false;
		}
		temp = postDetails.getUserEnteredLocationStr();
		if(temp != null && temp.length() > 30){
			addFieldError("errorMsg", "Invalid Location");
			return false;
		}
		temp = postDetails.getSelectedLocationCode();
		if(temp != null && temp.length() > 8){
			addFieldError("errorMsg", "Invalid Location");
			return false;
		}
		temp = postDetails.getSelectedLocationStr();
		if(temp != null && temp.length() > 30){
			addFieldError("errorMsg", "Invalid Location");
			return false;
		}

		temp = postDetails.getDescription();
		if(temp != null && temp.length() > 256){
			addFieldError("errorMsg", "Invalid Description");
			return false;
		}

		temp = postDetails.getBrand();
		if(temp != null && temp.length() > 16){
			addFieldError("errorMsg", "Invalid Brand");
			return false;
		}

		temp = postDetails.getModel();
		if(temp != null && temp.length() > 30){
			addFieldError("errorMsg", "Invalid Model");
			return false;
		}

		int year = postDetails.getYear();
		if(year < 2005 || year > 2014){
			addFieldError("errorMsg", "Invalid Year");
			return false;
		}

		temp = postDetails.getDualSim();
		if(temp != null && temp.length() > 1){
			addFieldError("errorMsg", "Invalid Sim Type");
			return false;
		}
		
		temp = postDetails.getTouchScreen();
		if(temp != null && temp.length() > 1){
			addFieldError("errorMsg", "Invalid Touch Screen");
			return false;
		}
		
		temp = postDetails.getOperatingSystem();
		if(temp != null && temp.length() > 16){
			addFieldError("errorMsg", "Invalid Operating System");
			return false;
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
		System.out.println("MobileAction.postAd(): " + uploadContentType + " : " + uploadFileName + " : " + upload);
		User user = (User)session.get("userInfo");
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String userId = String.valueOf(user.getUserId());
		String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType) + "";


		//Checking if user has manually tampered location after selecting from auto suggest list
		if(postDetails.getUserEnteredLocationStr() != null && postDetails.getSelectedLocationStr() != null){
			if(!postDetails.getUserEnteredLocationStr().equals(postDetails.getSelectedLocationStr())){
				addFieldError("errorMsg", "Invalid Location");
				return Action.INPUT;
			}
		}

		//Check if user has selected a different city AFTER choosing a location for a different city
		if(!postDetails.getCity().equals(postDetails.getSelectedCityCode())){
			addFieldError("errorMsg", "Invalid Location");
			return Action.INPUT;
		}

		if(!postDetails.getBrand().equals("OTH")){
			//Checking if the user has manually modified tampered mobile model after selecting from auto suggest list
			if(postDetails.getUserEnteredModelStr() != null && postDetails.getSelectedModelStr() != null){
				if(!postDetails.getUserEnteredModelStr().equals(postDetails.getSelectedModelStr())){
					addFieldError("errorMsg", "Invalid Model");
					return Action.INPUT;
				}
			}

			//Check if user has chosen a different brand after choosing a model for a different brand
			if(!postDetails.getBrand().equals(postDetails.getSelectedBrand())){
				addFieldError("errorMsg", "Invalid Model");
				return Action.INPUT;
			}
		}

		//Make an entry in POIT
//		Poit poit = new Poit();
//		poit.setCategory(CBuddyConstants.CATEGORY_MOBILE);
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
//		poit.setPrice(postDetails.getPrice());
//		poit.setRating(0);
//		poit.setSubCategory(postDetails.getSubCategory());
//		poit.setThumbnailName(null);
//		poit.setThumbnailType(null);
//		poit.setUserFirstName(user.getFirstName());

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();

		dbSession.beginTransaction();
		
		Poit poit = new PostsUtil().createPOIT(postDetails, user, dbSession, uploadContentType, CBuddyConstants.CATEGORY_MOBILE);
		
//		dbSession.save(poit);

		dbSession.flush(); //Flushing to retrieve the auto generated post id

		//Make an entry in PDMO
		Pdmo pdmo = new Pdmo();
		pdmo.setCity(postDetails.getCity());
		pdmo.setCreatedBy(userId);
		pdmo.setCreatedOn(current);
		pdmo.setBrand(postDetails.getBrand());
		pdmo.setColor(postDetails.getColor());
		pdmo.setLocation(postDetails.getSelectedLocationCode());
		pdmo.setMemorySize(postDetails.getMemorySize());
		if(postDetails.getBrand().equals("OTH")){
			//User would not have selected from auto suggest list and the hidden field 'model' would not have been populated.
			//In this case take whatever the user entered in the model text box.
			pdmo.setModel(postDetails.getUserEnteredModelStr());
		}else{
			pdmo.setModel(postDetails.getModel());
		}

		pdmo.setModifiedBy(userId);
		pdmo.setModifiedOn(current);
		pdmo.setPostId(poit.getPostId());
		pdmo.setPrice(postDetails.getPrice());
		pdmo.setProcessorSpeed(postDetails.getProcessorSpeed());
		pdmo.setSubCategory(postDetails.getSubCategory());
		pdmo.setYear(postDetails.getYear());
		pdmo.setDualSim(postDetails.getDualSim());
		pdmo.setTouchScreen(postDetails.getTouchScreen());

		//populateModelDetails(dbSession, pdmo);

		dbSession.save(pdmo);

		if(upload != null){
			writeImage(upload, imgFileName);
		}

		dbSession.getTransaction().commit();

		responseMsg = "Your post has been placed successfully! Post Id is " + poit.getPostId();

		return "success";
	}

	private void populateModelDetails(Session dbSession, Pdmo pdmo){
		String brand = pdmo.getBrand();
		String mobileModel = pdmo.getModel();
		String queryStr = "From MobileMaster where brand = :brand and model = :model";
		Query query = dbSession.createQuery(queryStr);
		query.setParameter("brand", brand);
		query.setParameter("model", mobileModel);
		List<MobileMaster> list = query.list();
		if(list.size() == 0){
			return;
		}
		MobileMaster model = list.get(0);
		pdmo.setCameraResolution(model.getCameraResolution());
		pdmo.setFmRadio(model.getFmRadio());
		pdmo.setFontCamera(model.getFontCamera());
		pdmo.setMemorySize(model.getMemorySize());
		pdmo.setOperatingSystem(model.getOperatingSystem());
		pdmo.setProcessorSpeed(model.getProcessorSpeed());
		pdmo.setScreenSize(model.getScreenSize());
		pdmo.setSmartPhone(model.getSmartPhone());
		pdmo.setTouchScreen(model.getTouchScreen());
		pdmo.setWiFi(model.getWiFi());
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
		for(MobilePostDetails postDetails:adList){
			populateAdditionalDetailsForPost(postDetails, dbSession);
		}
	}
	
	private void populateAdditionalDetailsForPost(MobilePostDetails postDetails, Session dbSession){
		Utils utils = new Utils();
		String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
		String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
		postDetails.setCity(cityName);
		postDetails.setLocation(locName);
		postDetails.setPriceStr(NumberFormatterUtil.formatAmount(postDetails.getPrice()));
		postDetails.setBrandStr(utils.getMobileBrandDesc(postDetails.getBrand()));
		postDetails.setModelStr(MobilePhoneCache.getInstance().getModelName(postDetails.getBrand(), postDetails.getModel()));
	}

	public String getAdListForMobile(){

		if(postDetails.getCategory()==null || postDetails.getCategory().equals("") || !postDetails.getCategory().equals(CBuddyConstants.CATEGORY_MOBILE)){
			postDetails.setCategory(CBuddyConstants.CATEGORY_MOBILE);
		}	

		Utils utils = new Utils();
		categoryStr = utils.getCategoryDesc(postDetails.getCategory());
		subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());

		if(postDetails.getSubCategory()==null || postDetails.getSubCategory().equals("") || subCategoryStr.equals("")){
			postDetails.setSubCategory(CBuddyConstants.SUBCATEGORY_MOBILE_MOBILEPHONES);
			subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		}

		MobileAdService mobileAdService =  new MobileAdService();
		count = mobileAdService.getAdListCount(getModel(), postDetails.getSubCategory());
		adList = mobileAdService.getAdListByCategory(getModel(), postDetails.getSubCategory());
		
		populateAdditionalDetails();

		return "success";
	}

	public String autoPopulateMobileModels(){
		String output = "success";
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		List<MobileMaster> corpList = new AutoSuggestMobileService().autopopulateModels(dbSession, modelSearchStr, brandNew);

		if(corpList != null){
			modelDetailsJsonArray = new JSONArray();

			for(MobileMaster modelDetails:corpList){
				JSONObject obj = new JSONObject();
				obj.put("model", modelDetails.getModel());
				obj.put("modelName", modelDetails.getModelName());
				modelDetailsJsonArray.put(obj);
			}
		}

		return output;
	}

	public String getAdDetails(){

		MobileAdService adService = new MobileAdService();
		postDetails = adService.getAdDetailsForMobile(getModel());

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		
		populateAdditionalDetailsForPost(postDetails, dbSession);
		
		CommentsService service = new CommentsService();
		cmList = service.getComments(postDetails.getPostId());
		
		return "success";
	}

	
	@Override
	public MobilePostDetails getModel() {
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

	public List<MobilePostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<MobilePostDetails> adList) {
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

	public JSONArray getModelDetailsJsonArray() {
		return modelDetailsJsonArray;
	}

	public void setModelDetailsJsonArray(JSONArray modelDetailsJsonArray) {
		this.modelDetailsJsonArray = modelDetailsJsonArray;
	}

	public String getModelSearchStr() {
		return modelSearchStr;
	}

	public void setModelSearchStr(String modelSearchStr) {
		this.modelSearchStr = modelSearchStr;
	}

	public String getBrandNew() {
		return brandNew;
	}

	public void setBrandNew(String brandNew) {
		this.brandNew = brandNew;
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

}
