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
import com.cbuddy.beans.Pcomp;
import com.cbuddy.beans.Poit;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.posts.model.ComputersPostDetails;
import com.cbuddy.posts.services.CommentsService;
import com.cbuddy.posts.services.ComputersAdService;
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

public class ComputersAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<ComputersPostDetails>{

	private static final long serialVersionUID = 1L;
	private List<MasterComment> cmList = new ArrayList<MasterComment>();
	ComputersPostDetails postDetails = new ComputersPostDetails();
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;

	private String categoryStr;
	private String subCategoryStr;

	private String sprice; // Price entered by user on the screen
	
	private String responseMsg;

	private List<ComputersPostDetails> adList = new ArrayList<ComputersPostDetails>();
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
//		if(postDetails.getSelectedLocationCode().equals("")){
//			addFieldError("errorMsg", "Please enter Location");
//			return false;
//		}
		if(postDetails.getPrice() <= 0){
			addFieldError("errorMsg", "Please enter Price");
			return false;
		}
		
		if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_DESKTOPS) || 
				postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_LAPTOPS) ||
				postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_TABS)){
			if(postDetails.getMake().equals("")){
				addFieldError("errorMsg", "Please select the Make");
				return false;
			}
			if(postDetails.getYear().equals("-1")){
				addFieldError("errorMsg", "Please specify how old is your Computer");
				return false;
			}
		}
		
		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_DESKTOPS) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_LAPTOPS)){
			if(postDetails.getProcessorSize() == 0){
				addFieldError("errorMsg", "Please enter Processor size");
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

		temp = postDetails.getMake();
		if(temp != null && temp.length() > 16){
			addFieldError("errorMsg", "Invalid Make");
			return false;
		}

		temp = postDetails.getModel();
		if(temp != null && temp.length() > 30){
			addFieldError("errorMsg", "Invalid Model");
			return false;
		}

		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_DESKTOPS) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_LAPTOPS)){
			int processorSize = postDetails.getProcessorSize();
			if(processorSize <= 0){
				addFieldError("errorMsg", "Invalid Processor Size");
				return false;
			}
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

		//Checking if user has manually tampered location after selecting from auto suggest list
//		if(postDetails.getUserEnteredLocationStr() != null && postDetails.getSelectedLocationStr()!=null){
//			if(!postDetails.getUserEnteredLocationStr().equals(postDetails.getSelectedLocationStr())){
//				return Action.INPUT;
//			}
//		}

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();

		dbSession.beginTransaction();
		
		PostsUtil postsUtil = new PostsUtil();
		
		Poit poit = postsUtil.createPOIT(postDetails, user, dbSession, uploadContentType, CBuddyConstants.CATEGORY_COMPUTERS);
		
//		dbSession.save(poit);

		dbSession.flush(); //Flushing to retrieve the auto generated post id

		//Make an entry in PCOMP
		Pcomp pcomp = new Pcomp();
		pcomp.setCity(postDetails.getCity());
		pcomp.setCreatedBy(userId);
		pcomp.setCreatedOn(current);
		pcomp.setHddSize(postDetails.getHddSize());
		pcomp.setLocation(postDetails.getLocation());
		pcomp.setMake(postDetails.getMake());
		pcomp.setModel(postDetails.getModel());
		pcomp.setModifiedBy(userId);
		pcomp.setModifiedOn(current);
		pcomp.setPostId(poit.getPostId());
		pcomp.setPrice(postDetails.getPrice());
		pcomp.setProcessorSize(postDetails.getProcessorSize());
		pcomp.setSubCategory(postDetails.getSubCategory());
		pcomp.setYear(postDetails.getYear());
		pcomp.setAccessoryType(postDetails.getAccessoryType());
		dbSession.save(pcomp);

		if(upload != null){
			postsUtil.writeImage(upload, poit.getImageFileName());
		}

		dbSession.getTransaction().commit();

		responseMsg = "Your post has been placed successfully! Post Id is " + poit.getPostId();

		return "success";
	}
	
	public String getRelevantPage(){
		if(postDetails == null){
			return null;
		}
		String subCategory = postDetails.getSubCategory();
		String output = "";
		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_DESKTOPS)){
			output = "Desktops";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_LAPTOPS)){
			output = "Laptops";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_TABS)){
			output = "Tablets";
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_COMPUTERS_ACCESSORIES)){
			output = "Accessories";
		}
		return output;
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

	private void populateAdditionalDetailsForPost(ComputersPostDetails postDetails, Session dbSession){
		Utils utils = new Utils();
		String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
		String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
		postDetails.setCity(cityName);
		postDetails.setLocation(locName);
		postDetails.setPriceStr(FormatterUtil.formatAmount(postDetails.getPrice()));
		postDetails.setMakeStr(utils.getLaptopMakeDesc(postDetails.getMake()));
		postDetails.setPostedDateStr(FormatterUtil.formatDate(postDetails.getCreatedOn()));
	}
	
	private void populateAdditionalDetails(){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		for(ComputersPostDetails postDetails:adList){
			populateAdditionalDetailsForPost(postDetails, dbSession);
		}
	}

	public String getAdListForComputers(){

		if(postDetails.getCategory()==null || postDetails.getCategory().equals("") || !postDetails.getCategory().equals(CBuddyConstants.CATEGORY_COMPUTERS)){
			postDetails.setCategory(CBuddyConstants.CATEGORY_COMPUTERS);
		}	

		Utils utils = new Utils();
		categoryStr = utils.getCategoryDesc(postDetails.getCategory());
		subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());

		if(postDetails.getSubCategory()==null || postDetails.getSubCategory().equals("") || subCategoryStr.equals("")){
			postDetails.setSubCategory(CBuddyConstants.SUBCATEGORY_COMPUTERS_DESKTOPS);
			subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		}
 
		ComputersAdService computersAdService =  new ComputersAdService();
		count = computersAdService.getAdListCount(getModel(), postDetails.getSubCategory());
		
		totalPages = (count%10==0)?count/10:(count/10) + 1;

		if(currentPage == 0){
			currentPage = 1;
		}else{
			currentPage = requestedPage;
		}
		
		adList = computersAdService.getAdListByCategory(getModel(), postDetails.getSubCategory(), count, requestedPage);
		System.out.println(count+" : "+adList.size());
		populateAdditionalDetails();

		return "success";
	}

	public String getAdDetails(){

		ComputersAdService adService = new ComputersAdService();
		postDetails = adService.getAdDetailsForComputers(getModel());

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		
		populateAdditionalDetailsForPost(postDetails, dbSession);
		
		CommentsService service = new CommentsService();
		cmList = service.getComments(postDetails.getPostId());
		
		return "success";
	}
	
	@Override
	public ComputersPostDetails getModel() {
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

	public List<ComputersPostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<ComputersPostDetails> adList) {
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

	public ComputersPostDetails getPostDetails() {
		return postDetails;
	}

	public void setPostDetails(ComputersPostDetails postDetails) {
		this.postDetails = postDetails;
	}
}
