package com.cbuddy.services;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.util.CriteriaUtil;
import com.model.user.CameraPostDetails;
import com.model.user.TelevisionPostDetails;

public class CameraAdService{

	public CameraPostDetails getAdDetailsForCamera(CameraPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		CameraPostDetails adDetails = (CameraPostDetails)session.get(CameraPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
	
	public int getAdListCount(CameraPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(CameraPostDetails.class);
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

	public List<CameraPostDetails> getAdListByCategory(CameraPostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		List<CameraPostDetails> list = null;
		try {
			if(postDetails.getLimit() == null){
				postDetails.setLimit("10");
			}
			if(postDetails.getOffset() == null){
				postDetails.setOffset("0");
			}

			Criteria criteria = session.createCriteria(CameraPostDetails.class);
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

	private Criteria generateFilters(CameraPostDetails postDetails, Criteria criteria) {

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
