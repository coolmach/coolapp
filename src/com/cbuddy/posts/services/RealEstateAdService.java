package com.cbuddy.posts.services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.RealEstatePostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.CriteriaUtil;

public class RealEstateAdService{

	
	public int getAdListCount(RealEstatePostDetails postDetails, String subCategory){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Criteria criteria = createCriteria(session, postDetails);
		criteria.setCacheable(true);
		
		int count = (Integer) criteria.setProjection(Projections.rowCount()).uniqueResult();
	
		return count;
	}
	
	private Criteria createCriteria(Session dbSession, RealEstatePostDetails postDetails){
		Criteria criteria = dbSession.createCriteria(RealEstatePostDetails.class);
		criteria.addOrder(Order.desc("postId"));
		criteria.add(Restrictions.eq("postStatus", CBuddyConstants.USER_STATUS_ACTIVE));
		criteria.add(Restrictions.eq("subCategory", postDetails.getSubCategory()));
		
		if(postDetails.getCity() != null){
			criteria.add(Restrictions.eq("city", postDetails.getCity()));
		}
		if(postDetails.getCorpId() > 0){
			criteria.add(Restrictions.eq("corpId", postDetails.getCorpId()));
		}
		criteria = generateFilters(postDetails, criteria, postDetails.getSubCategory());
		return criteria;
	}
	
	
	public List<RealEstatePostDetails> getAdListByCategory(RealEstatePostDetails postDetails, String subCategory){
		return getAdListByCategory(postDetails, subCategory, 0, 0);
	}
	
	@SuppressWarnings("unchecked")
	public List<RealEstatePostDetails> getAdListByCategory(RealEstatePostDetails postDetails, String subCategory, int totalNoOfRecords, int requestedPageNo){

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		List<RealEstatePostDetails> list = null;
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
			
			Criteria criteria = createCriteria(session, postDetails);
			
			criteria.setFirstResult(Integer.parseInt(postDetails.getOffset()));
			criteria.setMaxResults(Integer.parseInt(postDetails.getLimit()));

			list = criteria.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();

		return list;
	}


	private Criteria generateFilters(RealEstatePostDetails postDetails, Criteria criteria, String subCategory) {
		if(postDetails.getLocation()!=null && !postDetails.getLocation().equals("")){
			criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
		}
		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_RENT)){
			criteria = CriteriaUtil.getCriteriaForArea(criteria, postDetails.getAreaStr());
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getBhk(), "bedrooms");
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getRent(), "priceValue");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getFacingDirection(), "facingDirection");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getMaritalPreference(), "maritalPreference");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getCarParking(), "carParking");
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE) ||
				subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_IND_HOUSE_FOR_SALE)){	
			criteria = CriteriaUtil.getCriteriaForArea(criteria, postDetails.getAreaStr());
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getBhk(), "bedrooms");
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "priceValue");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getNewOrResale(), "newOrResale");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getFacingDirection(), "facingDirection");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getApprovalAuthority(), "approvalAuthority");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getGym(), "gym");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getSwimmingPool(), "swimmingPool");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getClubHouse(), "clubHouse");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getChildrenPlayArea(), "childrenPlayArea");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getCarParking(), "carParking");	
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_LAND_SALE)){
			criteria = CriteriaUtil.getCriteriaForArea(criteria, postDetails.getAreaStr());
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getRent(), "priceValue");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getApprovalAuthority(), "approvalAuthority");	
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION)){
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "priceValue");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getWifi(), "wifi");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getTv(), "tv");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getFood(), "food");
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED)){
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getShare(), "priceValue");	
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getFurnished(), "furnished");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getGender(), "gender");
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getRegionalPreference(), "regionalPreference");
		}

		return criteria;	
	}

	public RealEstatePostDetails getAdDetailsForRealEstate(RealEstatePostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		RealEstatePostDetails adDetails = (RealEstatePostDetails)session.get(RealEstatePostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
