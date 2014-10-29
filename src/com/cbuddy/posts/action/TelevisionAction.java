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
import com.cbuddy.beans.PTelevision;
import com.cbuddy.beans.Poit;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.posts.model.TelevisionPostDetails;
import com.cbuddy.posts.services.CommentsService;
import com.cbuddy.posts.services.TelevisionAdService;
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

public class TelevisionAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<TelevisionPostDetails>{

	private static final long serialVersionUID = 1L;
	private List<MasterComment> cmList = new ArrayList<MasterComment>();
	TelevisionPostDetails postDetails = new TelevisionPostDetails();
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;

	private String sprice; // Price entered by user on the screen
	
	private String categoryStr;
	private String subCategoryStr;
	private int count;

	private String responseMsg;

	private List<TelevisionPostDetails> adList = new ArrayList<TelevisionPostDetails>();

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

	public String getRelevantPage(){
		return Action.SUCCESS;
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
//			addFieldError("errorMsg", "Please enter Location");
//			return false;
//		}
		if(postDetails.getPrice() <= 0){
			addFieldError("errorMsg", "Please enter Price");
			return false;
		}
		if(postDetails.getBrand().equals("")){
			addFieldError("errorMsg", "Please enter the Brand");
			return false;
		}
		if(postDetails.getScreenType().equals("-1")){
			addFieldError("errorMsg", "Please enter the Screen Type");
			return false;
		}
		return true;
	}

	private boolean validateFieldLength(){
		boolean output = true;

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

		//It does not denote the actual year, but the age of the item, in no. of years.
		temp = postDetails.getYear();
		if(temp.length() > 4){
			addFieldError("errorMsg", "Invalid Age in Years");
			return false;
		}

		temp = postDetails.getBillAvailable();
		if(temp != null && (!temp.equals("Y") && !temp.equals("N"))){
			addFieldError("errorMsg", "Please choose if Bill is available");
			return false;
		}

		temp = postDetails.getScreenType();
		if(temp != null && temp.length()>8){
			addFieldError("errorMsg", "Invalid Screen Type");
			return false;
		}

		temp = postDetails.getStabilizer();
		if(temp != null && temp.length()>1){
			addFieldError("errorMsg", "Invalid Stabilizer Availability");
			return false;
		}

		temp = postDetails.getUsb();
		if(temp != null && temp.length()>1){
			addFieldError("errorMsg", "Invalid USB Port Availability");
			return false;
		}

		temp = postDetails.getHdmi();
		if(temp != null && temp.length()>1){
			addFieldError("errorMsg", "Invalid HDMI Availability");
			return false;
		}

		temp = postDetails.getScreenSize();
		if(temp != null && temp.length() > 4){
			addFieldError("errorMsg", "Invalid Screen Size");
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
		System.out.println("ComputersAction.postAd(): " + uploadContentType + " : " + uploadFileName + " : " + upload);
		User user = (User)session.get("userInfo");
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String userId = String.valueOf(user.getUserId());
		//String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType[0]) + "";

//		//Checking if user has manually tampered location after selecting from auto suggest list
//		if(postDetails.getUserEnteredLocationStr() != null && postDetails.getSelectedLocationStr()!=null){
//			if(!postDetails.getUserEnteredLocationStr().equals(postDetails.getSelectedLocationStr())){
//				addFieldError("errorMsg", "Invalid Location");
//				return Action.INPUT;
//			}
//		}

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();

		dbSession.beginTransaction();
		
		PostsUtil postsUtil = new PostsUtil();
		
		Poit poit = postsUtil.createPOIT(postDetails, user, dbSession, uploadContentType, CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD);
		
//		dbSession.save(poit);

		dbSession.flush(); //Flushing to retrieve the auto generated post id

		//Make an entry in PTelevision
		PTelevision entity = new PTelevision();
		entity.setPostId(poit.getPostId());
		entity.setBillAvailable(postDetails.getBillAvailable());
		entity.setBrand(postDetails.getBrand());
		entity.setCity(postDetails.getCity());
		entity.setYear(postDetails.getYear());
		entity.setCreatedBy(userId);
		entity.setCreatedOn(current);
		entity.setHdmi(postDetails.getHdmi());
		entity.setLocation(postDetails.getLocation());
		entity.setModel(postDetails.getModel());
		entity.setModifiedBy(userId);
		entity.setModifiedOn(current);
		entity.setPrice(postDetails.getPrice());
		entity.setScreenSize(postDetails.getScreenSize());
		entity.setScreenType(postDetails.getScreenType());
		entity.setStabilizer(postDetails.getStabilizer());
		entity.setUsb(postDetails.getUsb());
		entity.setYear(postDetails.getYear());

		dbSession.save(entity);

		if(upload != null){
			postsUtil.writeImage(upload, poit.getImageFileName());
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
		for(TelevisionPostDetails postDetails:adList){
			populateAdditionalDetailsForPost(postDetails, dbSession);
		}
	}

	private void populateAdditionalDetailsForPost(TelevisionPostDetails postDetails, Session dbSession){
		String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
		String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
		postDetails.setCity(cityName);
		postDetails.setLocation(locName);
		postDetails.setPriceStr(FormatterUtil.formatAmount(postDetails.getPrice()));
		postDetails.setPostedDateStr(FormatterUtil.formatDate(postDetails.getCreatedOn()));
	}

	public String getAdListForCriteria(){
		System.out.println(postDetails.getMake()+" : "+postDetails.getAmt()+" : "+postDetails.getYearStr());
		if(postDetails.getCategory()==null || postDetails.getCategory().equals("") || !postDetails.getCategory().equals(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD)){
			postDetails.setCategory(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD);
		}	
		
		Utils utils = new Utils();
		categoryStr = utils.getCategoryDesc(postDetails.getCategory());
		subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());

		if(postDetails.getSubCategory()==null || postDetails.getSubCategory().equals("") || subCategoryStr.equals("")){
			postDetails.setSubCategory(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_TELEVISION);
			subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		}

		TelevisionAdService adService = new TelevisionAdService();
		count = adService.getAdListCount(getModel());
		adList = adService.getAdListByCategory(getModel());
		System.out.println("list"+adList.size());
		populateAdditionalDetails();

		return "success";
	}

	public String getAdDetails(){

		TelevisionAdService adService = new TelevisionAdService();
		postDetails = adService.getAdDetailsForTelevision(getModel());

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();

		populateAdditionalDetailsForPost(postDetails, dbSession);
		
		CommentsService service = new CommentsService();
		cmList = service.getComments(postDetails.getPostId());

		return "success";
	}

	@Override
	public TelevisionPostDetails getModel() {
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

	public List<TelevisionPostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<TelevisionPostDetails> adList) {
		this.adList = adList;
	}

	@Transient
	public String getCategoryStr() {
		return categoryStr;
	}

	public void setCategoryStr(String categoryStr) {
		this.categoryStr = categoryStr;
	}

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

	public TelevisionPostDetails getPostDetails() {
		return postDetails;
	}

	public void setPostDetails(TelevisionPostDetails postDetails) {
		this.postDetails = postDetails;
	}
}
