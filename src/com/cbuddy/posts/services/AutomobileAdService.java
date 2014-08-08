package com.cbuddy.posts.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.AutomobilePostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CriteriaUtil;

public class AutomobileAdService{
	
	public int getAdListCount(AutomobilePostDetails postDetails, String subCategory){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(AutomobilePostDetails.class);
		criteria.add(Restrictions.eq("postStatus", CBuddyConstants.USER_STATUS_ACTIVE));
		criteria.addOrder(Order.desc("postId"));
		criteria.add(Restrictions.eq("subCategory", subCategory));
		if(postDetails.getCity() != null){
			criteria.add(Restrictions.eq("city", postDetails.getCity()));
		}
		if(postDetails.getCorpId() > 0){
			criteria.add(Restrictions.eq("corpId", postDetails.getCorpId()));
		}
		criteria = generateFilters(postDetails, criteria, subCategory);
		criteria.setCacheable(true);
		
		int count = (Integer) criteria.setProjection(Projections.rowCount()).uniqueResult();
	
		return count;
	}
	
	public AutomobilePostDetails getAdDetails(AutomobilePostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		AutomobilePostDetails adDetails = (AutomobilePostDetails)session.get(AutomobilePostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<AutomobilePostDetails> getAdListByCategory(AutomobilePostDetails postDetails, String subCategory){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		
		List<AutomobilePostDetails> list = null;
		try {
			System.out.println(postDetails.getLimit()+" : "+postDetails.getOffset()+" : "+postDetails.getPage());
			if(postDetails.getLimit() == null){
				postDetails.setLimit("10");
			}
			if(postDetails.getOffset() == null){
				postDetails.setOffset("0");
			}
			Criteria criteria = session.createCriteria(AutomobilePostDetails.class);
			criteria.add(Restrictions.eq("postStatus", CBuddyConstants.USER_STATUS_ACTIVE));
			criteria.addOrder(Order.desc("postId"));
			criteria.setFirstResult(Integer.parseInt(postDetails.getOffset()));
			criteria.setMaxResults(Integer.parseInt(postDetails.getLimit()));
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
			if(postDetails.getAutomobileModel()!=null){
				criteria = getCriteriaForModel(criteria, postDetails.getAutomobileModel());		
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
