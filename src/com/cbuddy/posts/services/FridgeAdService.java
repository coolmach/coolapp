package com.cbuddy.posts.services;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.FridgePostDetails;
import com.cbuddy.util.CriteriaUtil;

public class FridgeAdService{

	public FridgePostDetails getAdDetailsForFridge(FridgePostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		FridgePostDetails adDetails = (FridgePostDetails)session.get(FridgePostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
	
	public int getAdListCount(FridgePostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(FridgePostDetails.class);
		criteria.addOrder(Order.desc("postId"));

		if(postDetails.getCity() != null){
			criteria.add(Restrictions.eq("city", postDetails.getCity()));
		}
		if(postDetails.getCorpId() > 0){
			criteria.add(Restrictions.eq("corpId", postDetails.getCorpId()));
		}
		criteria = generateFilters(postDetails, criteria);
		criteria.setCacheable(true);

		int count = (Integer) criteria.setProjection(Projections.rowCount()).uniqueResult();

		return count;
	}

	public List<FridgePostDetails> getAdListByCategory(FridgePostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		List<FridgePostDetails> list = null;
		try {
			if(postDetails.getLimit() == null){
				postDetails.setLimit("10");
			}
			if(postDetails.getOffset() == null){
				postDetails.setOffset("0");
			}

			Criteria criteria = session.createCriteria(FridgePostDetails.class);
			criteria.addOrder(Order.desc("postId"));
			criteria.setFirstResult(Integer.parseInt(postDetails.getOffset()));
			criteria.setMaxResults(Integer.parseInt(postDetails.getLimit()));

			if(postDetails.getCity() != null){
				criteria.add(Restrictions.eq("city", postDetails.getCity()));
			}
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

	private Criteria generateFilters(FridgePostDetails postDetails, Criteria criteria) {

		if(postDetails.getLocation()!=null){
			criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
		}
		if(postDetails.getBrand()!=null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getBrand(), "brand");		
		}
		if(postDetails.getAmt()!=null){
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "price");
		}
		if(postDetails.getYearStr()!=null){
			criteria = CriteriaUtil.createCriteriaForYear(criteria, postDetails.getYearStr());
		}

		return criteria;	
	}
}