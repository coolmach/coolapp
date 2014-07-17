package com.cbuddy.action.posts;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Transient;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.Poit;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CriteriaUtil;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.Utils;
import com.model.user.CommonPostDetails;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommonPostsAction extends ActionSupport implements SessionAware, ServletRequestAware, ModelDriven<Poit>{

	private static final long serialVersionUID = 1L;

	CommonPostDetails postDetails = new CommonPostDetails();
	
	private String categoryStr;

	private String responseMsg;

	private List<CommonPostDetails> adList = new ArrayList<CommonPostDetails>();
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
	
	private void populateAdditionalDetails(){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		for(Poit postDetails:adList){
			String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
			String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
			postDetails.setCity(cityName);
			postDetails.setLocation(locName);
			//.setPriceStr(NumberFormatterUtil.formatAmount(postDetails.getPrice()));
			if(postDetails.getDescription().length() > 80){
				postDetails.setDescription(postDetails.getDescription().substring(0,80) + "...");
			}
		}
	}

	public String getAdListForCriteria(){

		category = postDetails.getCategory();
		categoryStr = Utils.getInstance().getCategoryDesc(category);

		if(category == null || category.equals("")){
			setCategory(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD);
		}
		
		adList = getAdListByCategory(postDetails);

		populateAdditionalDetails();
		
		return "success";
	}
	
	
	private List<CommonPostDetails> getAdListByCategory(CommonPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		List<CommonPostDetails> list = null;
		try {
			Criteria criteria = session.createCriteria(Poit.class);
			criteria.addOrder(Order.desc("postId"));
			criteria.setMaxResults(20);
			criteria.add(Restrictions.eq("category", CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD));
			
			if(postDetails.getCity() != null){
				criteria.add(Restrictions.eq("city", postDetails.getCity()));
			}
			if(postDetails.getCorpId() > 0){
				criteria.add(Restrictions.eq("corpId", postDetails.getCorpId()));
			}
			if(postDetails.getLocation()!=null){
				criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
			}
			list = criteria.list();
			
			System.out.println(list);
			
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();
		return list;
	}
	
	@Override
	public Poit getModel() {
		return postDetails;
	}

	public List<CommonPostDetails> getAdList() {
		return adList;
	}

	public void setAdList(List<CommonPostDetails> adList) {
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
