package com.cbuddy.posts.services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.MobilePostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.CriteriaUtil;

public class MobileAdService{

	public int getAdListCount(MobilePostDetails postDetails, String subCategory){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(MobilePostDetails.class);
		criteria.addOrder(Order.desc("postId"));
		criteria.add(Restrictions.eq("postStatus", CBuddyConstants.USER_STATUS_ACTIVE));
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

	@SuppressWarnings("unchecked")
	public List<MobilePostDetails> getAdListByCategory(MobilePostDetails postDetails, String subCategory, int totalNoOfRecords, int requestedPageNo){

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		List<MobilePostDetails> list = null;
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

			Criteria criteria = session.createCriteria(MobilePostDetails.class);
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

			System.out.println(list);

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();

		return list;
	}


	private Criteria generateFilters(MobilePostDetails postDetails, Criteria criteria, String subCategory) {

		if(postDetails.getLocation() != null){
			criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
		}
		if(postDetails.getBrand() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getBrand(), "brand");		
		}
		if(postDetails.getModel() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getModel(), "model");		
		}
		if(postDetails.getAmt() != null){
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "price");
		}
		if(postDetails.getYearStr() != null){
			//criteria = getCriteriaForYear(criteria, postDetails.getYearStr());
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getYearStr(), "year");
		}
		if(postDetails.getOperatingSystem() != null){
			//criteria = getCriteriaForOS(criteria, postDetails.getOperatingSystem());
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getOperatingSystem(), "operatingSystem");
		}
		if(postDetails.getDualSim() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getDualSim(), "dualSim");
		}
		if(postDetails.getTouchScreen() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getTouchScreen(), "touchScreen");
		}
		if(postDetails.getAccessoryType() != null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getAccessoryType(), "accessoryType");
		}
		return criteria;	
	}

	/*private Criteria getCriteriaForSims(Criteria criteria, String sims) {
		List simsList = new ArrayList();
		String obj[] = sims.split(",");
		for(String make:obj){
			simsList.add(make);
		}	
		criteria.add(Restrictions.in("year", simsList));

		return criteria;
	}

	 */
	/*private Criteria getCriteriaForOS(Criteria criteria, String osSTR) {
		List osList = new ArrayList();
		String obj[] = osSTR.split(",");
		for(String make:obj){
			osList.add(make);
		}	
		criteria.add(Restrictions.in("year", osList));

		return criteria;
	}*/


	/*public Criteria getCriteriaForYear(Criteria criteria, String yearOfMake) {
		List yearList = new ArrayList();
		String obj[] = yearOfMake.split(",");
		for(String make:obj){
			yearList.add(Integer.parseInt(make));
		}	
		criteria.add(Restrictions.in("year", yearList));

		return criteria;
	}*/

	public MobilePostDetails getAdDetailsForMobile(MobilePostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		MobilePostDetails adDetails = (MobilePostDetails)session.get(MobilePostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}

}
