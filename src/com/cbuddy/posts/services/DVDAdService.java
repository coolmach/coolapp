package com.cbuddy.posts.services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.DVDPostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.CriteriaUtil;

public class DVDAdService{

	public DVDPostDetails getAdDetailsForDVD(DVDPostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		DVDPostDetails adDetails = (DVDPostDetails)session.get(DVDPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
	
	public int getAdListCount(DVDPostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(DVDPostDetails.class);
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

		return count;
	}

	public List<DVDPostDetails> getAdListByCategory(DVDPostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		List<DVDPostDetails> list = null;
		try {
			if(postDetails.getLimit() == null){
				postDetails.setLimit("10");
			}
			if(postDetails.getOffset() == null){
				postDetails.setOffset("0");
			}

			Criteria criteria = session.createCriteria(DVDPostDetails.class);
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

	private Criteria generateFilters(DVDPostDetails postDetails, Criteria criteria) {

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
		if(postDetails.getPlayerType() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getPlayerType(), "playerType");
		}
		return criteria;	
	}
}
