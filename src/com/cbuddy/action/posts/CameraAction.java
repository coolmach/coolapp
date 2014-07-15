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
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.PCamera;
import com.cbuddy.beans.Poit;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CriteriaUtil;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.cbuddy.util.Utils;
import com.model.user.CameraPostDetails;
import com.model.user.ComputersPostDetails;
import com.model.user.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CameraAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<CameraPostDetails>{

	private static final long serialVersionUID = 1L;

	CameraPostDetails postDetails = new CameraPostDetails();
	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	private String categoryStr;

	private String responseMsg;

	private List<CameraPostDetails> adList = new ArrayList<CameraPostDetails>();
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
		System.out.println(">>> ");
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
			addFieldError("errorMsg", "Please enter the Brand");
			return false;
		}
		if(postDetails.getYear() == 0){
			addFieldError("errorMsg", "Please select the year of purchase");
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
		if(year < 1950 || year > 2014){
			addFieldError("errorMsg", "Invalid Year");
			return false;
		}

		temp = postDetails.getBillAvailable();
		if(temp == null || (!temp.equals("Y") && !temp.equals("N"))){
			addFieldError("errorMsg", "Please choose if Bill is available");
			return false;
		}
		
		temp = postDetails.getResolution();
		if(temp != null && temp.length() > 4){
			addFieldError("errorMsg", "Invalid Resolution");
			return false;
		}
		
		temp = postDetails.getZoom();
		if(temp != null && temp.length() > 4){
			addFieldError("errorMsg", "Invalid Zoom Factor");
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
		
		poit.setCategory(CBuddyConstants.CATEGORY_COMPUTERS);
		poit.setSubCategory(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_TELEVISION);
		
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
		poit.setThumbnailName(null);
		poit.setThumbnailType(null);
		poit.setUserFirstName(user.getFirstName());

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();

		dbSession.beginTransaction();
		dbSession.save(poit);
		//dbSession.getTransaction().commit();

		dbSession.flush(); //Flushing to retrieve the auto generated post id

		//Make an entry in PDVD
		PCamera entity = new PCamera();
		entity.setPostId(poit.getPostId());
		entity.setCity(postDetails.getCity());
		entity.setYear(postDetails.getYear());
		entity.setLocation(postDetails.getSelectedLocationCode());
		entity.setBillAvailable(postDetails.getBillAvailable());
		entity.setBrand(postDetails.getBrand());
		entity.setCreatedBy(userId);
		entity.setCreatedOn(current);
		entity.setModel(postDetails.getModel());
		entity.setModifiedBy(userId);
		entity.setModifiedOn(current);
		entity.setPrice(postDetails.getPrice());
		entity.setResolution(postDetails.getResolution());
		entity.setZoom(postDetails.getZoom());
		
		dbSession.save(entity);

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
		for(CameraPostDetails postDetails:adList){
			String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
			String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
			postDetails.setCity(cityName);
			postDetails.setLocation(locName);
			postDetails.setPriceStr(NumberFormatterUtil.formatAmount(postDetails.getPrice()));
		}
	}

	public String getAdListForCriteria(){

		category = postDetails.getCategory();
		categoryStr = Utils.getInstance().getCategoryDesc(category);

		if(category == null || category.equals("")){
			setCategory(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD);
		}
		
		adList = getAdListByCategory(getModel());

		populateAdditionalDetails();

		return "success";
	}
	
	private List<CameraPostDetails> getAdListByCategory(CameraPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		List<CameraPostDetails> list = null;
		try {
			Criteria criteria = session.createCriteria(CameraPostDetails.class);
			criteria.addOrder(Order.desc("postId"));
			criteria.setMaxResults(20);
			criteria.add(Restrictions.eq("subCategory", subCategory));
			
			/*if(postDetails.getCity() != null){
				criteria.add(Restrictions.eq("city", postDetails.getCity()));
			}*/
			if(postDetails.getCorpId() > 0){
				criteria.add(Restrictions.eq("corpId", postDetails.getCorpId()));
			}
			criteria = generateFilters(postDetails, criteria);

			list = criteria.list();
			
			System.out.println(list);
			
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();
		return list;
	}
	
	private Criteria generateFilters(CameraPostDetails postDetails, Criteria criteria) {

		if(postDetails.getLocation() != null){
			criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
		}
		if(postDetails.getBrand() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getBrand(), "brand");		
		}
		if(postDetails.getAmt() != null){
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "price");
		}
		if(postDetails.getYearStr() != null){
			criteria = CriteriaUtil.createCriteriaForYear(criteria, postDetails.getYearStr());
		}		
		return criteria;	
	}
	
	
	@Override
	public CameraPostDetails getModel() {
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

	public List<CameraPostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<CameraPostDetails> adList) {
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

	public String getResponseMsg() {
		return responseMsg;
	}

	public void setResponseMsg(String responseMsg) {
		this.responseMsg = responseMsg;
	}
}
