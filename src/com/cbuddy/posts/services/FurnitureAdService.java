package com.cbuddy.posts.services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.FurniturePostDetails;
import com.cbuddy.posts.model.MobilePostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.CriteriaUtil;

public class FurnitureAdService {
	
	public int getAdListCount(FurniturePostDetails postDetails, String subCategory){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(FurniturePostDetails.class);
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
		
		session.close();
	
		return count;
	}
	
	public FurniturePostDetails getAdDetailsForFurniture(FurniturePostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		FurniturePostDetails adDetails = (FurniturePostDetails)session.get(FurniturePostDetails.class, new Integer(postDetails.getPostIdStr()));
		session.close();
		return adDetails;
	}
	
	public List<FurniturePostDetails> getAdListByCategory(FurniturePostDetails postDetails, String subCategory, int totalNoOfRecords, int requestedPageNo){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		List<FurniturePostDetails> list = null;
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
			
			Criteria criteria = session.createCriteria(FurniturePostDetails.class);
			criteria.add(Restrictions.eq("postStatus", CBuddyConstants.USER_STATUS_ACTIVE));
			criteria.addOrder(Order.desc("postId"));
			criteria.setFirstResult(Integer.parseInt(postDetails.getOffset()));
			criteria.setMaxResults(Integer.parseInt(postDetails.getLimit()));
			
			if(subCategory != null && !subCategory.equals("")){
				criteria.add(Restrictions.eq("subCategory", subCategory));
			}
			
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
	
	private Criteria generateFilters(FurniturePostDetails postDetails, Criteria criteria, String subCategory) {
		
		if(postDetails.getLocation() != null){
			criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());
		}
		if(postDetails.getAmt() != null){
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "price");
		}
		/*if(postDetails.getType() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getType(), "type");
		}*/
		if(postDetails.getYear() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getYear(), "year");
		}
		
		return criteria;
	}

}
