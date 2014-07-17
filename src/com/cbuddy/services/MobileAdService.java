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

import com.cbuddy.util.CriteriaUtil;
import com.model.user.MobilePostDetails;

public class MobileAdService{

	@SuppressWarnings("unchecked")
	public List<MobilePostDetails> getAdListByCategory(MobilePostDetails postDetails, String subCategory){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		List<MobilePostDetails> list = null;
		try {
			Criteria criteria = session.createCriteria(MobilePostDetails.class);
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

			System.out.println(list);

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();

		return list;
	}


	private Criteria generateFilters(MobilePostDetails postDetails, Criteria criteria, String subCategory) {

		if(postDetails.getLocation()!=null){
			criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
		}
		if(postDetails.getBrand()!=null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getBrand(), "brand");		
		}
		if(postDetails.getModel()!=null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getModel(), "model");		
		}
		if(postDetails.getAmt()!=null){
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "price");
		}
		if(postDetails.getYearStr()!=null){
			criteria = getCriteriaForYear(criteria, postDetails.getYearStr());
		}
		if(postDetails.getOperatingSystem()!=null){
			criteria = getCriteriaForOS(criteria, postDetails.getOperatingSystem());
		}

		return criteria;	
	}

	private Criteria getCriteriaForSims(Criteria criteria, String sims) {
		List simsList = new ArrayList();
		String obj[] = sims.split(",");
		for(String make:obj){
			simsList.add(make);
		}	
		criteria.add(Restrictions.in("year", simsList));

		return criteria;
	}


	private Criteria getCriteriaForOS(Criteria criteria, String osSTR) {
		List osList = new ArrayList();
		String obj[] = osSTR.split(",");
		for(String make:obj){
			osList.add(make);
		}	
		criteria.add(Restrictions.in("year", osList));

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
}
