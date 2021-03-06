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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.cbuddy.beans.MasterComment;
import com.cbuddy.beans.MobileMaster;
import com.cbuddy.beans.Pdmo;
import com.cbuddy.beans.Poit;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.posts.cache.MobilePhoneCache;
import com.cbuddy.posts.model.MobilePostDetails;
import com.cbuddy.posts.services.CommentsService;
import com.cbuddy.posts.services.MobileAdService;
import com.cbuddy.posts.util.PostsUtil;
import com.cbuddy.user.model.User;
import com.cbuddy.util.AutoSuggestMobileService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.FormatterUtil;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.Utils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class MobileAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<MobilePostDetails>{

	private static final long serialVersionUID = 1L;
	private List<MasterComment> cmList = new ArrayList<MasterComment>();
	MobilePostDetails postDetails = new MobilePostDetails();
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;

	private String categoryStr;
	private String subCategoryStr;

	private String sprice; // Price entered by user on the screen

	private String responseMsg;

	private String itemType;

	private List<MobilePostDetails> adList = new ArrayList<MobilePostDetails>();
	private int count;

	private int totalPages;
	private int requestedPage;
	private int currentPage;

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getRequestedPage() {
		return requestedPage;
	}

	public void setRequestedPage(int requestedPage) {
		this.requestedPage = requestedPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

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
		//		if(postDetails.getSelectedLocationCode().equals("")){
		//			addFieldError("errorMsg", "Invalid Location");
		//			return false;
		//		}
		if(postDetails.getPrice() <= 0){
			addFieldError("errorMsg", "Please enter Price");
			return false;
		}

		if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_MOBILE_MOBILEPHONES)){
			if(postDetails.getBrand().equals("")){
				addFieldError("errorMsg", "Please select the Brand");
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
		}else if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_MOBILE_ACCESORIES)){
			if(postDetails.getAccessoryType() == null || postDetails.getAccessoryType().equals("-1")){
				addFieldError("errorMsg", "Please select the Accessory Type");
				return false;
			}
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
		//		temp = postDetails.getUserEnteredLocationStr();
		//		if(temp != null && temp.length() > 30){
		//			addFieldError("errorMsg", "Invalid Location");
		//			return false;
		//		}
		temp = postDetails.getLocation();
		if(temp == null || temp.length() > 8){
			addFieldError("errorMsg", "Invalid Location");
			return false;
		}
		//		temp = postDetails.getSelectedLocationStr();
		//		if(temp != null && temp.length() > 30){
		//			addFieldError("errorMsg", "Invalid Location");
		//			return false;
		//		}

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
		if(year > 0){
			if(year < 2001 || year > 2014){
				addFieldError("errorMsg", "Invalid Year");
				return false;
			}
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

		temp = postDetails.getAccessoryType();
		if(temp != null && temp.length()>32){
			addFieldError("errorMsg", "Invalid Accessory Type");
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
		System.out.println("MobileAction.postAd(): " + uploadContentType + " : " + uploadFileName + " : " + upload);
		User user = (User)session.get("userInfo");
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String userId = String.valueOf(user.getUserId());
		//String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType[0]) + "";


		//		//Checking if user has manually tampered location after selecting from auto suggest list
		//		if(postDetails.getUserEnteredLocationStr() != null && postDetails.getSelectedLocationStr() != null){
		//			if(!postDetails.getUserEnteredLocationStr().equals(postDetails.getSelectedLocationStr())){
		//				addFieldError("errorMsg", "Invalid Location");
		//				return Action.INPUT;
		//			}
		//		}
		//
		//		//Check if user has selected a different city AFTER choosing a location for a different city
		//		if(!postDetails.getCity().equals(postDetails.getSelectedCityCode())){
		//			addFieldError("errorMsg", "Invalid Location");
		//			return Action.INPUT;
		//		}

		if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_MOBILE_MOBILEPHONES)){
			if(postDetails.getBrand() == null || postDetails.getBrand().equals("-1")){
				addFieldError("errorMsg", "Invalid Brand");
				return Action.INPUT;
			}

			if(postDetails.getModel() == null || postDetails.getModel().equals("-1")){
				addFieldError("errorMsg", "Invalid Model");
				return Action.INPUT;
			}
		}

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();

		dbSession.beginTransaction();

		PostsUtil postsUtil = new PostsUtil();

		Poit poit = postsUtil.createPOIT(postDetails, user, dbSession, uploadContentType, CBuddyConstants.CATEGORY_MOBILE);

		//		dbSession.save(poit);

		dbSession.flush(); //Flushing to retrieve the auto generated post id

		//Make an entry in PDMO
		Pdmo pdmo = new Pdmo();
		pdmo.setAccessoryType(postDetails.getAccessoryType());
		pdmo.setCity(postDetails.getCity());
		pdmo.setCreatedBy(userId);
		pdmo.setCreatedOn(current);
		pdmo.setBrand(postDetails.getBrand());
		pdmo.setColor(postDetails.getColor());
		pdmo.setLocation(postDetails.getLocation());
		pdmo.setMemorySize(postDetails.getMemorySize());
		pdmo.setModel(postDetails.getModel());
		pdmo.setModifiedBy(userId);
		pdmo.setModifiedOn(current);
		pdmo.setPostId(poit.getPostId());
		pdmo.setPrice(postDetails.getPrice());
		pdmo.setProcessorSpeed(postDetails.getProcessorSpeed());
		pdmo.setSubCategory(postDetails.getSubCategory());
		pdmo.setYear(postDetails.getYear());
		pdmo.setDualSim(postDetails.getDualSim());
		pdmo.setTouchScreen(postDetails.getTouchScreen());
		pdmo.setOperatingSystem(postDetails.getOperatingSystem());
		//populateModelDetails(dbSession, pdmo);

		dbSession.save(pdmo);

		if(upload != null){
			postsUtil.writeImage(upload, poit.getImageFileName());
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
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		for(MobilePostDetails postDetails:adList){
			populateAdditionalDetailsForPost(postDetails, dbSession);
		}
	}

	private void populateAdditionalDetailsForPost(MobilePostDetails postDetails, Session dbSession){
		if(postDetails == null){
			return;
		}
		Utils utils = new Utils();
		String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
		String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
		postDetails.setCity(cityName);
		postDetails.setLocation(locName);
		postDetails.setPriceStr(FormatterUtil.formatAmount(postDetails.getPrice()));
		postDetails.setBrandStr(utils.getMobileBrandDesc(postDetails.getBrand()));
		postDetails.setModelStr(MobilePhoneCache.getInstance().getModelName(postDetails.getBrand(), postDetails.getModel()));
		postDetails.setPostedDateStr(FormatterUtil.formatDate(postDetails.getCreatedOn()));
	}

	public String getAdListForMobile(){

		if(postDetails == null){
			return null;
		}

		if(postDetails.getCategory()==null || postDetails.getCategory().equals("") || !postDetails.getCategory().equals(CBuddyConstants.CATEGORY_MOBILE)){
			postDetails.setCategory(CBuddyConstants.CATEGORY_MOBILE);
		}	

		Utils utils = new Utils();
		categoryStr = utils.getCategoryDesc(postDetails.getCategory());
		subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		System.out.println(categoryStr+ " : "+subCategoryStr);
		if(postDetails.getSubCategory()==null || postDetails.getSubCategory().equals("") || subCategoryStr.equals("")){
			postDetails.setSubCategory(CBuddyConstants.SUBCATEGORY_MOBILE_MOBILEPHONES);
			subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		}
		System.out.println(postDetails.getSubCategory());
		MobileAdService mobileAdService =  new MobileAdService();
		count = mobileAdService.getAdListCount(getModel(), postDetails.getSubCategory());

		totalPages = (count%10==0)?count/10:(count/10) + 1;

		if(currentPage == 0){
			currentPage = 1;
		}else{
			currentPage = requestedPage;
		}

		adList = mobileAdService.getAdListByCategory(getModel(), postDetails.getSubCategory(), count, requestedPage);
		System.out.println("MobileAction.getAdListForMobile()"+adList.size());
		populateAdditionalDetails();

		return "success";
	}

	public String autoPopulateMobileModels() throws JSONException{
		String output = "success";
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
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

	private List mobileModelsList= new ArrayList();
	public List getMobileModelsList() {
		return mobileModelsList;
	}

	public void setMobileModelsList(List mobileModelsList) {
		this.mobileModelsList = mobileModelsList;
	}

	public String getAdDetails(){

		MobileAdService adService = new MobileAdService();
		postDetails = adService.getAdDetailsForMobile(getModel());

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();

		populateAdditionalDetailsForPost(postDetails, dbSession);

		CommentsService service = new CommentsService();

		if(postDetails != null){
			cmList = service.getComments(postDetails.getPostId());
		}

		return "success";
	}

	public String getRelevantPage(){
		if(postDetails == null){
			return null;
		}
		String subCategory = postDetails.getSubCategory();
		String output = "MobilePhones";
		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_MOBILE_MOBILEPHONES)){
			output = "MobilePhones";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_MOBILE_ACCESORIES)){
			output = "Accessories";
		}
		return output;
	}

	@Override
	public MobilePostDetails getModel() {
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

	public String getSprice() {
		return sprice;
	}

	public void setSprice(String sprice) {
		this.sprice = sprice;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public MobilePostDetails getPostDetails() {
		return postDetails;
	}

	public void setPostDetails(MobilePostDetails postDetails) {
		this.postDetails = postDetails;
	}

}
