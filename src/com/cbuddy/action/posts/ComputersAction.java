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

import com.cbuddy.beans.Pcomp;
import com.cbuddy.beans.Poit;
import com.cbuddy.services.ComputersAdService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.cbuddy.util.Utils;
import com.model.user.ComputersPostDetails;
import com.model.user.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ComputersAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<ComputersPostDetails>{

	private static final long serialVersionUID = 1L;

	ComputersPostDetails postDetails = new ComputersPostDetails();
	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	private String categoryStr;
	private String subCategoryStr;

	private String responseMsg;

	private List<ComputersPostDetails> adList = new ArrayList<ComputersPostDetails>();
	private String category = "" ;
	private String subCategory = "" ;

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
			addFieldError("errorMsg", "Please enter Price");
			return false;
		}
		if(postDetails.getMake().equals("")){
			addFieldError("errorMsg", "Please select the Make");
			return false;
		}
		if(postDetails.getYear() == 0){
			addFieldError("errorMsg", "Please select the year of purchase (model)");
			return false;
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
		
		int year = postDetails.getYear();
		if(year<1950 || year>2014){
			addFieldError("errorMsg", "Invalid Year");
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
		System.out.println("ComputersAction.postAd(): " + uploadContentType + " : " + uploadFileName + " : " + upload);
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
		Poit poit = new Poit();
		poit.setCategory(CBuddyConstants.CATEGORY_AUTOMOBILES);
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
		poit.setPrice(postDetails.getPrice());
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

		//Make an entry in PCOMP
		Pcomp pcomp = new Pcomp();
		pcomp.setCity(postDetails.getCity());
		pcomp.setCreatedBy(userId);
		pcomp.setCreatedOn(current);
		pcomp.setHddSize(postDetails.getHddSize());
		pcomp.setLocation(postDetails.getSelectedLocationCode());
		pcomp.setMake(postDetails.getMake());
		pcomp.setModifiedBy(userId);
		pcomp.setModifiedOn(current);
		pcomp.setPostId(postDetails.getPostId());
		pcomp.setPrice(postDetails.getPrice());
		pcomp.setProcessorSize(postDetails.getProcessorSize());
		pcomp.setSubCategory(postDetails.getSubCategory());
		pcomp.setYear(postDetails.getYear());
		
		dbSession.save(pcomp);

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
		for(ComputersPostDetails postDetails:adList){
			String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
			String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
			postDetails.setCity(cityName);
			postDetails.setLocation(locName);
			postDetails.setPriceStr(NumberFormatterUtil.formatAmount(postDetails.getPrice()));
		}
	}

	public String getAdListForComputers(){

		category = postDetails.getCategory();
		subCategory = postDetails.getSubCategory();

		categoryStr = Utils.getInstance().getCategoryDesc(category);
		subCategoryStr = Utils.getInstance().getSubCategoryDesc(category, subCategory);
		
		if(category == null || category.equals("")){
			setCategory(CBuddyConstants.CATEGORY_AUTOMOBILES);
		}
		if(category.equals(CBuddyConstants.CATEGORY_COMPUTERS) && (subCategory==null || subCategory.equals(""))){
			setSubCategory(CBuddyConstants.SUBCATEGORY_COMPUTERS_DESKTOPS);
		}

		ComputersAdService computersAdService =  new ComputersAdService();
		adList = computersAdService.getAdListByCategory(getModel(), subCategory);

		populateAdditionalDetails();

		return "success";
	}

	@Override
	public ComputersPostDetails getModel() {
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

	public List<ComputersPostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<ComputersPostDetails> adList) {
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