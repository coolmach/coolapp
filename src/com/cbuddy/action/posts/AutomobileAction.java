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

import com.cbuddy.beans.Pdau;
import com.cbuddy.beans.Poit;
import com.cbuddy.services.AutomobileAdService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.cbuddy.util.Utils;
import com.model.user.AutomobilePostDetails;
import com.model.user.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AutomobileAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<AutomobilePostDetails>{

	private static final long serialVersionUID = 1L;

	AutomobilePostDetails postDetails = new AutomobilePostDetails();
	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	private String categoryStr;
	private String subCategoryStr;

	private String responseMsg;

	private List<AutomobilePostDetails> adList = new ArrayList<AutomobilePostDetails>();
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

	public String postAd(){
		System.out.println("AutomobileAction.postAd()"+uploadContentType+" : "+uploadFileName+" : "+upload);
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
		pdau.setModel(postDetails.getModel());
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
		for(AutomobilePostDetails postDetails:adList){
			String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
			String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
			postDetails.setCity(cityName);
			postDetails.setLocation(locName);
			postDetails.setPriceStr(NumberFormatterUtil.formatAmount(postDetails.getPrice()));
			if(postDetails.getFuelType()!=null){
				postDetails.setFuelTypeStr(Utils.getInstance().getFuelTypeDesc(postDetails.getFuelType()));	
			}
			if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS)){
				postDetails.setMakeStr(Utils.getInstance().getCarMakeDesc(postDetails.getMake()));
				postDetails.setModelStr(Utils.getInstance().getCarModelDesc(postDetails.getMake(), postDetails.getModel()));
			}else if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_MOTORCYCLES)){
				postDetails.setMakeStr(Utils.getInstance().getBikeMakeDesc(postDetails.getMake()));
				postDetails.setModelStr(Utils.getInstance().getBikeModelDesc(postDetails.getMake(), postDetails.getModel()));
			}
		}
	}

	public String getAdListForAutomobile(){

		category = postDetails.getCategory();
		subCategory = postDetails.getSubCategory();

		categoryStr = Utils.getInstance().getCategoryDesc(category);
		subCategoryStr = Utils.getInstance().getSubCategoryDesc(category, subCategory);
		
		if(category==null || category.equals("")){
			setCategory(CBuddyConstants.CATEGORY_AUTOMOBILES);
		}
		if(category.equals(CBuddyConstants.CATEGORY_AUTOMOBILES) && (subCategory==null || subCategory.equals(""))){
			setSubCategory(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_MOTORCYCLES);
		}

		AutomobileAdService automobileAdService =  new AutomobileAdService();
		adList = automobileAdService.getAdListByCategory(getModel(), subCategory);

		populateAdditionalDetails();

		return "success";
	}

	@Override
	public AutomobilePostDetails getModel() {
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

	public List<AutomobilePostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<AutomobilePostDetails> adList) {
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
