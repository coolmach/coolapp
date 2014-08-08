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
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.PFurniture;
import com.cbuddy.beans.Poit;
import com.cbuddy.posts.model.FurniturePostDetails;
import com.cbuddy.posts.services.FurnitureAdService;
import com.cbuddy.posts.util.PostsUtil;
import com.cbuddy.user.model.User;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.cbuddy.util.Utils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FurnitureAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<FurniturePostDetails>{

	private static final long serialVersionUID = 1L;

	FurniturePostDetails postDetails = new FurniturePostDetails();
	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	private String categoryStr;
	private String subCategoryStr;

	private String responseMsg;

	private List<FurniturePostDetails> adList = new ArrayList<FurniturePostDetails>();
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
		if(postDetails.getType() == null || postDetails.getType().equals("")){
			addFieldError("errorMsg", "Please select the Furniture Type");
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

		temp = postDetails.getType();
		if(temp != null && temp.length() > 16){
			addFieldError("errorMsg", "Invalid Furniture Type");
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
		System.out.println("FurnitureAction.postAd(): " + uploadContentType + " : " + uploadFileName + " : " + upload);
		User user = (User)session.get("userInfo");
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String userId = String.valueOf(user.getUserId());
		String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType) + "";

		//Checking if user has manually tampered location after selecting from auto suggest list
		if(postDetails.getUserEnteredLocationStr() != null && postDetails.getSelectedLocationStr()!=null){
			if(!postDetails.getUserEnteredLocationStr().equals(postDetails.getSelectedLocationStr())){
				return Action.INPUT;
			}
		}

		//Make an entry in POIT
//		Poit poit = new Poit();
//
//		poit.setCategory(CBuddyConstants.CATEGORY_FURNITURE);
//		poit.setSubCategory(findSubCategory(postDetails.getType())); //For future use only.
//
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
//		poit.setThumbnailName(null);
//		poit.setThumbnailType(null);
//		poit.setUserFirstName(user.getFirstName());

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();

		dbSession.beginTransaction();
		
		Poit poit = new PostsUtil().createPOIT(postDetails, user, dbSession, uploadContentType, CBuddyConstants.CATEGORY_FURNITURE);
		
//		dbSession.save(poit);

		dbSession.flush(); //Flushing to retrieve the auto generated post id

		//Make an entry in PFurniture
		PFurniture entity = new PFurniture();
		entity.setPostId(poit.getPostId());
		entity.setSubCategory(postDetails.getSubCategory());
		entity.setCity(postDetails.getCity());
		entity.setYear(postDetails.getYear());
		entity.setLocation(postDetails.getSelectedLocationCode());
		entity.setType(postDetails.getType());
		entity.setCreatedBy(userId);
		entity.setCreatedOn(current);
		entity.setModifiedBy(userId);
		entity.setModifiedOn(current);
		entity.setPrice(postDetails.getPrice());

		dbSession.save(entity);

		if(upload != null){
			writeImage(upload, imgFileName);
		}

		dbSession.getTransaction().commit();

		responseMsg = "Your post has been placed successfully! Post Id is " + poit.getPostId();

		return "success";
	}

	private String findSubCategory(String type) {

		if(type=="COT_WOOD")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_COT_WOOD;
		else if(type=="COT_STEEL")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_COT_STEEL;
		else if(type=="MATTRESS")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_MATTRESS;
		else if(type=="DINING")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_DINING;
		else if(type=="SHOE")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_SHOE;
		else if(type=="TV")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_TV;
		else if(type=="TABLE")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_TABLE;
	    else if(type=="CHAIR_WOOD")
	    	return CBuddyConstants.SUBCATEGORY_FURNITURE_CHAIR_WOOD;
		else if(type=="CHAIR_PLASTIC")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_CHAIR_PLASTIC;
		else if(type=="OTHERS")
			return CBuddyConstants.SUBCATEGORY_FURNITURE_OTHERS;


												return null;
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
		Utils utils = new Utils();
		for(FurniturePostDetails postDetails:adList){
			String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
			String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
			postDetails.setCity(cityName);
			postDetails.setLocation(locName);
			postDetails.setPriceStr(NumberFormatterUtil.formatAmount(postDetails.getPrice()));
			postDetails.setFurnitureTypeStr(utils.getFurnitureTypeDesc(postDetails.getType()));
		}
	}

	public String getAdListForFurniture(){

		if(postDetails.getCategory()==null || postDetails.getCategory().equals("") || !postDetails.getCategory().equals(CBuddyConstants.CATEGORY_FURNITURE)){
			postDetails.setCategory(CBuddyConstants.CATEGORY_FURNITURE);
		}	

		Utils utils = new Utils();
		categoryStr = utils.getCategoryDesc(postDetails.getCategory());
		subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());

		if(postDetails.getSubCategory()==null || postDetails.getSubCategory().equals("") || subCategoryStr.equals("")){
			postDetails.setSubCategory(CBuddyConstants.SUBCATEGORY_FURNITURE_COT_WOOD);
			subCategoryStr = utils.getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubCategory());
		}
 
		FurnitureAdService furnitureAdService =  new FurnitureAdService();
		count = furnitureAdService.getAdListCount(getModel(), postDetails.getSubCategory());
		adList = furnitureAdService.getAdListByCategory(getModel(), postDetails.getSubCategory());

		populateAdditionalDetails();

		return "success";
	}


	@Override
	public FurniturePostDetails getModel() {
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

	public List<FurniturePostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<FurniturePostDetails> adList) {
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
}
