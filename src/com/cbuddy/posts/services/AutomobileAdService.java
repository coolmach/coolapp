package com.cbuddy.posts.services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.AutomobilePostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.CriteriaUtil;

public class AutomobileAdService{

	public int getAdListCount(AutomobilePostDetails postDetails, String subCategory){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
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
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		AutomobilePostDetails adDetails = (AutomobilePostDetails)session.get(AutomobilePostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}


	public List<AutomobilePostDetails> getAdListByCategory(AutomobilePostDetails postDetails, String subCategory){
		return getAdListByCategory(postDetails, subCategory, 0, 0);
	}
	
	@SuppressWarnings("unchecked")
	public List<AutomobilePostDetails> getAdListByCategory(AutomobilePostDetails postDetails, String subCategory, int totalNoOfRecords, int requestedPageNo){

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		List<AutomobilePostDetails> list = null;
		try {
			System.out.println(postDetails.getLimit()+" : "+postDetails.getOffset()+" : "+postDetails.getPage());
			/*if(postDetails.getLimit() == null){
				postDetails.setLimit("10");
			}
			if(postDetails.getOffset() == null){
				postDetails.setOffset("0");
			}*/
			postDetails.setLimit("10");
			int pageIndex = requestedPageNo - 1;
			if(pageIndex >= 0 && (10 * pageIndex) < totalNoOfRecords){
				//Calculate Offset
				int offset = (10 * pageIndex);
				postDetails.setOffset(String.valueOf(offset));
			}else{
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
				subCategory.equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS) || subCategory.equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CYCLES)){
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
				criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(),"price");
			}
			if(postDetails.getYear() != null){
				if(postDetails.getSubCategory().equals(CBuddyConstants.SUBCATEGORY_AUTOMOBILES_CARS)){
					criteria = getCriteriaForYear(criteria, postDetails.getYear(), postDetails.getSubCategory());
				}else{
					criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getYear(), "year");
				}
			}
			if(postDetails.getRegState() != null){
				criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getRegState(), "regState");
			}
		}

		return criteria;	
	}

	private void getYearsFromAgeAndAddToList(List<String> years, String age){
		
		int i_age = Integer.valueOf(age.trim());
		
		Calendar now = Calendar.getInstance();
		int currentYear = now.get(Calendar.YEAR);	
		
		/*
		 * If age = 1, it means 2014
		 * If age = 2, it means 2012, 2013
		 * If age = 3, it means 2010, 2011
		 * If age = 4, it means 2008, 2009
		 * If age = 5, it means 2006, 2007
		 * If age = 6, it means 2004, 2005
		 * If age = 7, it means "More than 5 years old"
		 */
		
		if(i_age == 1){
			// 2014
			years.add(String.valueOf(currentYear));
		}else if(i_age == 2){
			// 2012, 2013
			years.add(String.valueOf(currentYear - 1));
			years.add(String.valueOf(currentYear - 2));
		}else if(i_age == 3){
			//2010, 2011
			years.add(String.valueOf(currentYear - 3));
			years.add(String.valueOf(currentYear - 4));
		}else if(i_age == 4){
			//2008, 2009
			years.add(String.valueOf(currentYear - 5));
			years.add(String.valueOf(currentYear - 6));
		}else if(i_age == 5){
			//2006, 2007
			years.add(String.valueOf(currentYear - 7));
			years.add(String.valueOf(currentYear - 8));
		}else if(i_age == 6){
			//2004, 2005
			years.add(String.valueOf(currentYear - 9));
			years.add(String.valueOf(currentYear - 10));
		}else if(i_age == 6){
			//More than 5 years old
			for(int index=11; index<10; index++){
				years.add(String.valueOf(currentYear - index));
			}
		}
	}
	
	private Criteria getCriteriaForYear(Criteria criteria, String yearStr, String subCategory) {
		/* 
		 * For Cars, 
		 * 		PDAU.year represents the actual year of manufacture: "2004", "2005", etc.
		 * For Bikes and Cycles,
		 * 		PDAU.year represents the age of the vehicle: "1" (Less than 1 year old), "2" (1 - 2 years old) etc.
		 * 
		 * However, for all the three sub categories, in the Filters screen, we display filters like "Less than 1 year old", "2 - 3 years old", etc. and NOT the actual year of manufacture.
		 * That is, postDetails.getYear() would yield the age of the vehicle and not the actual year of manufacture.
		 * Hence, for cars, we first need to convert this "age" into "year of manufacture" and then search.
		 */
		List yearList = new ArrayList();
		String obj[] = yearStr.split(",");

		for(String age:obj){
			//Convert the age to year(s) and then add the result to the criteria list
			getYearsFromAgeAndAddToList(yearList, age);
		}			

		criteria.add(Restrictions.in("year", yearList));

		return criteria;
	}



}
