package com.cbuddy.services;

import java.util.ArrayList;
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
			System.out.println(postDetails.getCity()+ " : "+postDetails.getCorpId());
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
			System.out.println(list.size());
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
				criteria = getCriteriaForMake(criteria, postDetails.getMake());		
			}
			if(postDetails.getModel()!=null){
				criteria = getCriteriaForModel(criteria, postDetails.getModel());		
			}
			if(postDetails.getFuelType()!=null){
				criteria = getCriteriaForFuelType(criteria, postDetails.getFuelType());		
			}	
			if(postDetails.getAmt()!=null){
				criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(),"price");
			}
			if(postDetails.getYearOfMake()!=null){
				criteria = getCriteriaForYear(criteria, postDetails.getYearOfMake());
			}
		}
		
		return criteria;	
	}
	
	public Criteria getCriteriaForYear(Criteria criteria, String yearOfMake) {
		List yearList = new ArrayList();
		String obj[] = yearOfMake.split(",");
		for(String make:obj){
			yearList.add(Integer.parseInt(make));
		}	
		criteria.add(Restrictions.in("year", yearList));

		return criteria;
	}


	public Criteria getCriteriaForMake(Criteria criteria, String makeStr){
		List makesList = new ArrayList();
		String obj[] = makeStr.split(",");
		for(String make:obj){
			makesList.add(make);
		}	
		criteria.add(Restrictions.in("make", makesList));

		return criteria;
	}
	
	public Criteria getCriteriaForModel(Criteria criteria, String modelStr){
		List modelList = new ArrayList();
		String obj[] = modelStr.split(",");
		for(String model:obj){
			modelList.add(model);
		}	
		criteria.add(Restrictions.in("model", modelList));

		return criteria;
	}
	
	public Criteria getCriteriaForFuelType(Criteria criteria, String fuelTypeStr){
		List fuelTypeList = new ArrayList();
		String obj[] = fuelTypeStr.split(",");
		for(String fuelType:obj){
			fuelTypeList.add(fuelType);
		}	
		criteria.add(Restrictions.in("fuelType", fuelTypeList));

		return criteria;
	}

}
