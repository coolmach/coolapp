package com.cbuddy.services;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.Pdre;
import com.cbuddy.util.CBuddyConstants;
import com.model.user.RealEstatePostDetails;

public class AdDetailsService {

	@SuppressWarnings("unchecked")
	public List<RealEstatePostDetails> getAdListByCategory(RealEstatePostDetails postDetails, String subCategory){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		
		List<RealEstatePostDetails> list = null;
		try {
			Criteria criteria = session.createCriteria(RealEstatePostDetails.class);
			criteria.addOrder(Order.desc("postId"));
			criteria.setMaxResults(20);
			criteria.add(Restrictions.eq("subCategory", subCategory));
			criteria = generateFilters(postDetails, criteria, subCategory);
			
			list = criteria.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();

		return list;
	}
	
	private Criteria generateFilters(RealEstatePostDetails postDetails, Criteria criteria, String subCategory) {

		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT)){
			if(postDetails.getLocation()!=null){
				criteria = getCriteriaForLocation(criteria, postDetails);	
			}
			if(postDetails.getAreaStr()!=null && !postDetails.getAreaStr().equals("")){
				criteria = getCriteriaForArea(criteria, postDetails);
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
				criteria = getCriteriaForLocation(criteria, postDetails);	
			}
			if(postDetails.getAreaStr()!=null && !postDetails.getAreaStr().equals("")){
				criteria = getCriteriaForArea(criteria, postDetails);
			}
			if(postDetails.getBhk()!=null){
				criteria = getCriteriaForBhk(criteria, postDetails);		
			}
			if(postDetails.getAmt()!=null){
				criteria = getCriteriaForAmt(criteria, postDetails);
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
				criteria = getCriteriaForLocation(criteria, postDetails);	
			}
			if(postDetails.getAreaStr()!=null && !postDetails.getAreaStr().equals("")){
				criteria = getCriteriaForArea(criteria, postDetails);
			}
			if(postDetails.getAmt()!=null){
				criteria = getCriteriaForAmt(criteria, postDetails);
			}
			if(postDetails.getApprovalAuthority()!=null){
				criteria = getCriteriaForApprovalAuthority(criteria, postDetails);
			}	
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION)){
			if(postDetails.getLocation()!=null){
				criteria = getCriteriaForLocation(criteria, postDetails);	
			}
			if(postDetails.getAmt()!=null){
				criteria = getCriteriaForAmt(criteria, postDetails);
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

	private Criteria getCriteriaForLocation(Criteria criteria, RealEstatePostDetails postDetails){

		List loc = new ArrayList();
		String obj[] = postDetails.getLocation().split(",");
		for(String str :obj){
			loc.add(str.trim());
		}
		criteria.add(Restrictions.in("location", loc));

		return criteria;
	}

	private Criteria getCriteriaForArea(Criteria criteria, RealEstatePostDetails postDetails){
		String obj[] = postDetails.getAreaStr().split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = getNumericValue(str);
				//Pattern pattern = Pattern.compile("\\w+([0-9]+)\\w+([0-9]+)");				
				c1 =  Restrictions.le("area", Integer.parseInt(str));
			}
			if(str.contains(">")){
				str = getNumericValue(str);				
				c2 =  Restrictions.gt("area", Integer.parseInt(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = getNumericValue(res[i]);
				}	
				c3 =  Restrictions.between("area", Integer.parseInt(newRes[0]),Integer.parseInt(newRes[1]));
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

	private Criteria getCriteriaForBhk(Criteria criteria,Pdre pdre){
		List loc = new ArrayList();
		String obj[] = pdre.getBhk().split(",");
		for(int i=0;i<obj.length;i++){
			loc.add(Integer.parseInt(getNumericValue(obj[i])));
		}	
		criteria.add(Restrictions.in("bedrooms", loc));

		return criteria;
	}

	private Criteria getCriteriaForRent(Criteria criteria ,Pdre pdre){
		String obj[] = pdre.getRent().split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = getNumericValue(str);				
				c1 =  Restrictions.le("priceValue", Double.parseDouble(str));
			}
			if(str.contains(">")){
				str = getNumericValue(str);				
				c2 =  Restrictions.ge("priceValue", Double.parseDouble(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = getNumericValue(res[i]);
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

	private Criteria getCriteriaForDirection(Criteria criteria ,Pdre pdre){

		List dir = new ArrayList();
		String obj[] = pdre.getFacingDirection().split(",");
		for(String str :obj){
			dir.add(str.trim());
		}
		criteria.add(Restrictions.in("facingDirection", dir));

		return criteria;
	}

	private Criteria getCriteriaForMaritalPreference(Criteria criteria ,Pdre pdre){

		List pref = new ArrayList();
		String obj[] = pdre.getMaritalPreference().split(",");
		for(String str :obj){
			pref.add(str.trim());
		}
		criteria.add(Restrictions.in("maritalPreference", pref));

		return criteria;
	}

	private Criteria getCriteriaForCarParking(Criteria criteria ,Pdre pdre){

		List park = new ArrayList();
		String obj[] = pdre.getCarParking().split(",");
		for(String str :obj){
			park.add(str.trim());
		}
		criteria.add(Restrictions.in("carParking", park));

		return criteria;
	}

	private Criteria getCriteriaForgetNewOrResale(Criteria criteria,Pdre pdre){

		List ownership = new ArrayList();
		String obj[] = pdre.getNewOrResale().split(",");
		for(String str :obj){
			ownership.add(str.trim());
		}
		criteria.add(Restrictions.in("newOrResale", ownership));

		return criteria;
	}

	private Criteria getCriteriaForApprovalAuthority(Criteria criteria,Pdre pdre){

		List approval = new ArrayList();
		String obj[] = pdre.getApprovalAuthority().split(",");
		for(String str :obj){
			approval.add(str.trim());
		}
		criteria.add(Restrictions.in("approvalAuthority", approval));

		return criteria;
	}

	private Criteria getCriteriaForGym(Criteria criteria,Pdre pdre){
		criteria.add(Restrictions.eq("gym", pdre.getGym()));
		return criteria;	
	}

	private Criteria getCriteriaForSwimmingPool(Criteria criteria,Pdre pdre){	
		criteria.add(Restrictions.eq("swimmingPool", pdre.getSwimmingPool()));
		return criteria;	
	}

	private Criteria getCriteriaForClubHouse(Criteria criteria,Pdre pdre){
		criteria.add(Restrictions.eq("clubHouse", pdre.getClubHouse()));
		return criteria;	
	}

	private Criteria getCriteriaForChildrenPlayArea(Criteria criteria,Pdre pdre){
		criteria.add(Restrictions.eq("childrenPlayArea", pdre.getChildrenPlayArea()));
		return criteria;	
	}

	private Criteria getCriteriaForAmt(Criteria criteria, Pdre pdre){

		String obj[] = pdre.getAmt().split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = getNumericValue(str);				
				c1 =  Restrictions.le("priceValue", Double.parseDouble(str));
			}
			if(str.contains(">")){
				str = getNumericValue(str);				
				c2 =  Restrictions.ge("priceValue", Double.parseDouble(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = getNumericValue(res[i]);
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

	private Criteria getCriteriaForShare(Criteria criteria, Pdre pdre){

		String obj[] = pdre.getShare().split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = getNumericValue(str);				
				c1 =  Restrictions.le("priceValue", Double.parseDouble(str));
			}
			if(str.contains(">")){
				str = getNumericValue(str);				
				c2 =  Restrictions.ge("priceValue", Double.parseDouble(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = getNumericValue(res[i]);
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

	private Criteria getCriteriaForWifi(Criteria criteria, Pdre pdre){
		criteria.add(Restrictions.eq("wifi", pdre.getChildrenPlayArea()));
		return criteria;
	}

	private Criteria getCriteriaForTv(Criteria criteria, Pdre pdre){
		criteria.add(Restrictions.eq("tv", pdre.getChildrenPlayArea()));
		return criteria;
	}

	private Criteria getCriteriaForFood(Criteria criteria, Pdre pdre){
		List food = new ArrayList();
		String obj[] = pdre.getFood().split(",");
		for(String str :obj){
			food.add(str.trim());
		}
		criteria.add(Restrictions.in("food", food));

		return criteria;	
	}

	private Criteria getCriteriaForFurnished(Criteria criteria, Pdre pdre){
		List furnished = new ArrayList();
		String obj[] = pdre.getFurnished().split(",");
		for(String str :obj){
			furnished.add(str.trim());
		}
		criteria.add(Restrictions.in("furnished", furnished));

		return criteria;
	}

	private Criteria getCriteriaForGender(Criteria criteria, Pdre pdre){
		List gender = new ArrayList();
		String obj[] = pdre.getGender().split(",");
		for(String str :obj){
			gender.add(str.trim());
		}
		criteria.add(Restrictions.in("gender", gender));

		return criteria;
	}

	private Criteria getCriteriaForRegionalPreference(Criteria criteria, Pdre pdre){
		List pref = new ArrayList();
		String obj[] = pdre.getRegionalPreference().split(",");
		for(String str :obj){
			pref.add(str.trim());
		}
		criteria.add(Restrictions.in("regionalPreference", pref));

		return criteria;
	}

	private String getNumericValue(String str){

		Pattern pattern = Pattern.compile("(\\d+\\.\\d+)|(\\d+)");
		try{
			Matcher matcher = pattern.matcher(str);
			matcher.find();
			str = matcher.group();
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}



}
