package com.cbuddy.services;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CriteriaUtil;
import com.model.user.AutomobilePostDetails;

public class AutomobileAdService{
	
	@SuppressWarnings("unchecked")
	public List<AutomobilePostDetails> getAdListByCategory(AutomobilePostDetails postDetails, String subCategory){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		
		List<AutomobilePostDetails> list = null;
		try {
			Criteria criteria = session.createCriteria(AutomobilePostDetails.class);
			criteria.addOrder(Order.desc("postId"));
			criteria.setMaxResults(20);
			criteria.add(Restrictions.eq("subCategory", subCategory));
			if(postDetails.getCity() != null){
				criteria.add(Restrictions.eq("city", postDetails.getCity()));
			}
			if(postDetails.getCorpId() > 0){
				criteria.add(Restrictions.eq("corpId", postDetails.getCorpId()));
			}
			criteria = generateFilters(postDetails, criteria, subCategory);
			
			list = criteria.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();

		return list;
	}
	
	
	private Criteria generateFilters(AutomobilePostDetails postDetails, Criteria criteria, String subCategory) {

		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_MOTORCYCLES)||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS)){
			if(postDetails.getLocation()!=null){
				criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
			}
			if(postDetails.getAreaStr()!=null && !postDetails.getAreaStr().equals("")){
				criteria = CriteriaUtil.getCriteriaForArea(criteria, postDetails.getAreaStr());
			}
			if(postDetails.getMake()!=null){
				criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getMake(), "make");		
			}
			if(postDetails.getModel()!=null){
				criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getModel(), "model");
			}
			if(postDetails.getFuelType()!=null){
				criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getFuelType(), "fuelType");
			}	
			if(postDetails.getAmt()!=null){
				criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "price");
			}
		}
		
		return criteria;	
	}
	
}
