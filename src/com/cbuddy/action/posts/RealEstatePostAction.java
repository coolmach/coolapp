package com.cbuddy.action.posts;

import java.sql.Timestamp;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Poit;
import com.cbuddy.util.CBuddyConstants;
import com.model.user.RealEstatePostDetails;
import com.model.user.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RealEstatePostAction extends ActionSupport implements SessionAware, ModelDriven<RealEstatePostDetails>{

	private static final long serialVersionUID = 1L;
	
	RealEstatePostDetails postDetails = new RealEstatePostDetails();

	private Map<String,Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	public void validate(){
		
	}

	
	public void postAd(){
		
		User user = (User)session.get("userInfo");
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String userId = String.valueOf(user.getUserId());
		
		//Make an entry in POIT
		Poit poit = new Poit();
		poit.setCategory(CBuddyConstants.CATEGORY_REAL_ESTATE);
		poit.setTitle(postDetails.getTitle());
		poit.setCity(postDetails.getCity());
		poit.setContactNo(postDetails.getContactNo());
		poit.setContactPersonName(postDetails.getContactPersonName());
		poit.setCorpId(user.getCorpId());
		poit.setCreatedBy(String.valueOf(userId));
		poit.setCreatedOn(current);
		poit.setDescription(postDetails.getDescription());
		poit.setImageFileName(postDetails.getImageFileName());
		poit.setImageType(null);
		poit.setLocation(postDetails.getLocation());
		poit.setModifiedBy(userId);
		poit.setModifiedOn(current);
		poit.setNegotiable(null);
		poit.setPrice(postDetails.getPriceValue());
		poit.setRating(0);
		poit.setSubCategory(postDetails.getSubcategory());
		poit.setThumbnailName(null);
		poit.setThumbnailType(null);
		poit.setUserFirstName(user.getFirstName());
		
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		
		dbSession.beginTransaction();
		dbSession.save(poit);
		dbSession.getTransaction().commit();
		
		//Make an entry in PDRE
	}

	@Override
	public RealEstatePostDetails getModel() {
		return postDetails;
	}
}
