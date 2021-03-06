package com.cbuddy.posts.services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.FridgePostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.CriteriaUtil;

public class FridgeAdService{

	public FridgePostDetails getAdDetailsForFridge(FridgePostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		FridgePostDetails adDetails = (FridgePostDetails)session.get(FridgePostDetails.class, new Integer(postDetails.getPostIdStr()));
		session.close();
		return adDetails;
	}
	
	public int getAdListCount(FridgePostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(FridgePostDetails.class);
		criteria.add(Restrictions.eq("postStatus", CBuddyConstants.USER_STATUS_ACTIVE));
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
		
		session.close();

		return count;
	}

	public List<FridgePostDetails> getAdListByCategory(FridgePostDetails postDetails, int totalNoOfRecords, int requestedPageNo){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		List<FridgePostDetails> list = null;
		try {
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

			Criteria criteria = session.createCriteria(FridgePostDetails.class);
			criteria.add(Restrictions.eq("postStatus", CBuddyConstants.USER_STATUS_ACTIVE));
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
//		if(postDetails.getYearStr()!=null){
//			criteria = CriteriaUtil.createCriteriaForYear(criteria, postDetails.getYearStr());
//		}
		if(postDetails.getYear() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getYear(), "year");
		}
		if(postDetails.getDoubleDoor() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getDoubleDoor(), "doubleDoor");
		}
		return criteria;	
	}
}
