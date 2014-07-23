package com.cbuddy.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.Pdre;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CriteriaUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.model.user.RealEstatePostDetails;

public class RealEstateAdService{

	
	public int getAdListCount(RealEstatePostDetails postDetails, String subCategory){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		
		if(postDetails.getLimit() == null){
			postDetails.setLimit("10");
		}
		if(postDetails.getOffset() == null){
			postDetails.setOffset("0");
		}
		Criteria criteria = session.createCriteria(RealEstatePostDetails.class);
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
	
	@SuppressWarnings("unchecked")
	public List<RealEstatePostDetails> getAdListByCategory(RealEstatePostDetails postDetails, String subCategory){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		List<RealEstatePostDetails> list = null;
		try {
			System.out.println(postDetails.getLimit()+" : "+postDetails.getOffset()+" : "+postDetails.getPage());
			if(postDetails.getLimit() == null){
				postDetails.setLimit("10");
			}
			if(postDetails.getOffset() == null){
				postDetails.setOffset("0");
			}
			Criteria criteria = session.createCriteria(RealEstatePostDetails.class);
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
			System.out.println();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();

		return list;
	}


	private Criteria generateFilters(RealEstatePostDetails postDetails, Criteria criteria, String subCategory) {

		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT)){
			if(postDetails.getLocation()!=null){
				criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
			}
			if(postDetails.getAreaStr()!=null && !postDetails.getAreaStr().equals("")){
				criteria = CriteriaUtil.getCriteriaForArea(criteria, postDetails.getAreaStr());
			}
			if(postDetails.getBhk()!=null){
				criteria = getCriteriaForBhk(criteria, postDetails);		
			}
			if(postDetails.getRent()!=null){
				criteria = getCriteriaForRent(criteria, postDetails);
			}
			if(postDetails.getFacingDirection()!=null){
				criteria = getCriteriaForDirection(criteria, postDetails);
			}
			if(postDetails.getMaritalPreference()!=null){
				criteria = getCriteriaForMaritalPreference(criteria, postDetails);
			}
			if(postDetails.getCarParking()!=null){
				criteria = getCriteriaForCarParking(criteria, postDetails);
			}
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE)){	
			if(postDetails.getLocation()!=null){
				criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
			}
			if(postDetails.getAreaStr()!=null && !postDetails.getAreaStr().equals("")){
				criteria = CriteriaUtil.getCriteriaForArea(criteria, postDetails.getAreaStr());
			}
			if(postDetails.getBhk()!=null){
				criteria = getCriteriaForBhk(criteria, postDetails);		
			}
			if(postDetails.getAmt()!=null){
				criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "priceValue");
			}
			if(postDetails.getNewOrResale()!=null){
				criteria = getCriteriaForgetNewOrResale(criteria, postDetails);
			}
			if(postDetails.getApprovalAuthority()!=null){
				criteria = getCriteriaForApprovalAuthority(criteria, postDetails);
			}
			if(postDetails.getGym()!=null){
				criteria = getCriteriaForGym(criteria, postDetails);
			}
			if(postDetails.getSwimmingPool()!=null){
				criteria = getCriteriaForSwimmingPool(criteria, postDetails);
			}
			if(postDetails.getClubHouse()!=null){
				criteria = getCriteriaForClubHouse(criteria, postDetails);
			}
			if(postDetails.getChildrenPlayArea()!=null){
				criteria = getCriteriaForChildrenPlayArea(criteria, postDetails);
			}
			if(postDetails.getCarParking()!=null){
				criteria = getCriteriaForCarParking(criteria, postDetails);
			}	
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_LAND_SALE)){
			if(postDetails.getLocation()!=null){
				criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
			}
			if(postDetails.getAreaStr()!=null && !postDetails.getAreaStr().equals("")){
				criteria = CriteriaUtil.getCriteriaForArea(criteria, postDetails.getAreaStr());
			}
			if(postDetails.getAmt()!=null){
				criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "priceValue");
			}
			if(postDetails.getApprovalAuthority()!=null){
				criteria = getCriteriaForApprovalAuthority(criteria, postDetails);
			}	
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION)){
			if(postDetails.getLocation()!=null){
				criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
			}
			if(postDetails.getAmt()!=null){
				criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "priceValue");
			}
			if(postDetails.getWifi()!=null){
				criteria = getCriteriaForWifi(criteria, postDetails);
			}
			if(postDetails.getTv()!=null){
				criteria = getCriteriaForTv(criteria, postDetails);
			}
			if(postDetails.getFood()!=null){
				criteria = getCriteriaForFood(criteria, postDetails);
			}
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED)){
			if(postDetails.getShare()!=null){
				criteria = getCriteriaForShare(criteria, postDetails);
			}	
			if(postDetails.getFurnished()!=null){
				criteria = getCriteriaForFurnished(criteria, postDetails);
			}
			if(postDetails.getGender()!=null){
				criteria = getCriteriaForGender(criteria, postDetails);
			}
			if(postDetails.getRegionalPreference()!=null){
				criteria = getCriteriaForRegionalPreference(criteria, postDetails);
			}
		}

		return criteria;	
	}



	public Criteria getCriteriaForBhk(Criteria criteria,Pdre pdre){
		List<Integer> loc = new ArrayList<Integer>();
		String obj[] = pdre.getBhk().split(",");
		for(int i=0;i<obj.length;i++){
			loc.add(Integer.parseInt(NumberFormatterUtil.getNumericValue(obj[i])));
		}	
		criteria.add(Restrictions.in("bedrooms", loc));

		return criteria;
	}

	public Criteria getCriteriaForRent(Criteria criteria ,Pdre pdre){
		String obj[] = pdre.getRent().split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = NumberFormatterUtil.getNumericValue(str);				
				c1 =  Restrictions.le("priceValue", Double.parseDouble(str));
			}
			if(str.contains(">")){
				str = NumberFormatterUtil.getNumericValue(str);				
				c2 =  Restrictions.ge("priceValue", Double.parseDouble(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = NumberFormatterUtil.getNumericValue(res[i]);
				}	
				c3 =  Restrictions.between("priceValue", Double.parseDouble(newRes[0]),Double.parseDouble(newRes[1]));
			}
		}

		if(c1!=null && c2!=null && c3!=null){
			LogicalExpression orExp = Restrictions.or(c1,c2);
			criteria.add(Restrictions.or(orExp, c3));
		}
		else if(c1!=null && c2!=null){
			LogicalExpression orExp = Restrictions.or(c1,c2);
			criteria.add(orExp);
		}
		else if(c2!=null && c3!=null){
			LogicalExpression orExp = Restrictions.or(c2,c3);
			criteria.add(orExp);
		}else if(c3!=null && c1!=null){
			LogicalExpression orExp = Restrictions.or(c1,c3);
			criteria.add(orExp);
		}
		else if(c1!=null ){
			criteria.add(c1);
		}
		else if(c2!=null){
			criteria.add(c2);
		}
		else if(c3!=null){
			criteria.add(c3);
		}

		return criteria;

	}

	public Criteria getCriteriaForDirection(Criteria criteria ,Pdre pdre){

		List<String> dir = new ArrayList<String>();
		String obj[] = pdre.getFacingDirection().split(",");
		for(String str :obj){
			dir.add(str.trim());
		}
		criteria.add(Restrictions.in("facingDirection", dir));

		return criteria;
	}

	public Criteria getCriteriaForMaritalPreference(Criteria criteria ,Pdre pdre){

		List<String> pref = new ArrayList<String>();
		String obj[] = pdre.getMaritalPreference().split(",");
		for(String str :obj){
			pref.add(str.trim());
		}
		criteria.add(Restrictions.in("maritalPreference", pref));

		return criteria;
	}

	public Criteria getCriteriaForCarParking(Criteria criteria ,Pdre pdre){

		List<String> park = new ArrayList<String>();
		String obj[] = pdre.getCarParking().split(",");
		for(String str :obj){
			park.add(str.trim());
		}
		criteria.add(Restrictions.in("carParking", park));

		return criteria;
	}

	public Criteria getCriteriaForgetNewOrResale(Criteria criteria,Pdre pdre){

		List<String> ownership = new ArrayList<String>();
		String obj[] = pdre.getNewOrResale().split(",");
		for(String str :obj){
			ownership.add(str.trim());
		}
		criteria.add(Restrictions.in("newOrResale", ownership));

		return criteria;
	}

	public Criteria getCriteriaForApprovalAuthority(Criteria criteria,Pdre pdre){

		List<String> approval = new ArrayList<String>();
		String obj[] = pdre.getApprovalAuthority().split(",");
		for(String str :obj){
			approval.add(str.trim());
		}
		criteria.add(Restrictions.in("approvalAuthority", approval));

		return criteria;
	}

	public Criteria getCriteriaForGym(Criteria criteria,Pdre pdre){
		criteria.add(Restrictions.eq("gym", pdre.getGym()));
		return criteria;	
	}

	public Criteria getCriteriaForSwimmingPool(Criteria criteria,Pdre pdre){	
		criteria.add(Restrictions.eq("swimmingPool", pdre.getSwimmingPool()));
		return criteria;	
	}

	public Criteria getCriteriaForClubHouse(Criteria criteria,Pdre pdre){
		criteria.add(Restrictions.eq("clubHouse", pdre.getClubHouse()));
		return criteria;	
	}

	public Criteria getCriteriaForChildrenPlayArea(Criteria criteria,Pdre pdre){
		criteria.add(Restrictions.eq("childrenPlayArea", pdre.getChildrenPlayArea()));
		return criteria;	
	}

	public Criteria getCriteriaForShare(Criteria criteria, Pdre pdre){

		String obj[] = pdre.getShare().split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = NumberFormatterUtil.getNumericValue(str);				
				c1 =  Restrictions.le("priceValue", Double.parseDouble(str));
			}
			if(str.contains(">")){
				str = NumberFormatterUtil.getNumericValue(str);				
				c2 =  Restrictions.ge("priceValue", Double.parseDouble(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = NumberFormatterUtil.getNumericValue(res[i]);
				}	
				c3 =  Restrictions.between("priceValue", Double.parseDouble(newRes[0]),Double.parseDouble(newRes[1]));
			}
		}

		if(c1!=null && c2!=null && c3!=null){
			LogicalExpression orExp = Restrictions.or(c1,c2);
			criteria.add(Restrictions.or(orExp, c3));
		}
		else if(c1!=null && c2!=null){
			LogicalExpression orExp = Restrictions.or(c1,c2);
			criteria.add(orExp);
		}
		else if(c2!=null && c3!=null){
			LogicalExpression orExp = Restrictions.or(c2,c3);
			criteria.add(orExp);
		}else if(c3!=null && c1!=null){
			LogicalExpression orExp = Restrictions.or(c1,c3);
			criteria.add(orExp);
		}
		else if(c1!=null ){
			criteria.add(c1);
		}
		else if(c2!=null){
			criteria.add(c2);
		}
		else if(c3!=null){
			criteria.add(c3);
		}

		return criteria;

	}

	public Criteria getCriteriaForWifi(Criteria criteria, Pdre pdre){
		criteria.add(Restrictions.eq("wifi", pdre.getChildrenPlayArea()));
		return criteria;
	}

	public Criteria getCriteriaForTv(Criteria criteria, Pdre pdre){
		criteria.add(Restrictions.eq("tv", pdre.getChildrenPlayArea()));
		return criteria;
	}

	public Criteria getCriteriaForFood(Criteria criteria, Pdre pdre){
		List<String> food = new ArrayList<String>();
		String obj[] = pdre.getFood().split(",");
		for(String str :obj){
			food.add(str.trim());
		}
		criteria.add(Restrictions.in("food", food));

		return criteria;	
	}

	public Criteria getCriteriaForFurnished(Criteria criteria, Pdre pdre){
		List<String> furnished = new ArrayList<String>();
		String obj[] = pdre.getFurnished().split(",");
		for(String str :obj){
			furnished.add(str.trim());
		}
		criteria.add(Restrictions.in("furnished", furnished));

		return criteria;
	}

	public Criteria getCriteriaForGender(Criteria criteria, Pdre pdre){
		List<String> gender = new ArrayList<String>();
		String obj[] = pdre.getGender().split(",");
		for(String str :obj){
			gender.add(str.trim());
		}
		criteria.add(Restrictions.in("gender", gender));

		return criteria;
	}

	public Criteria getCriteriaForRegionalPreference(Criteria criteria, Pdre pdre){
		List<String> pref = new ArrayList<String>();
		String obj[] = pdre.getRegionalPreference().split(",");
		for(String str :obj){
			pref.add(str.trim());
		}
		criteria.add(Restrictions.in("regionalPreference", pref));

		return criteria;
	}

	public RealEstatePostDetails getAdDetailsForRealEstate(RealEstatePostDetails postDetails){
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		RealEstatePostDetails adDetails = (RealEstatePostDetails)session.get(RealEstatePostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
