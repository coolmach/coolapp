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
	public List<RealEstatePostDetails> getAdListByCategory(Pdre pdre, String subCategory){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		
		List<RealEstatePostDetails> list = null;
		try {
			Criteria criteria = session.createCriteria(RealEstatePostDetails.class);
			criteria.addOrder(Order.desc("postId"));
			criteria.setMaxResults(20);
			criteria.add(Restrictions.eq("subCategory", subCategory));
			criteria = generateFilters(pdre, criteria, subCategory);
			
			list = criteria.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();

		return list;
	}
	
	public List<Pdre> getAdListByCategory_(Pdre pdre,String subCategory){
		//getNewAdListByCategory();
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		List<Pdre> res = null;
		try {	
			//poit = (List<Poit>)session.createQuery("from Poit").list();
			Criteria criteria = session.createCriteria(Pdre.class);
			criteria = generateFilters(pdre, criteria, subCategory);
			res = (List<Pdre>) criteria.list();

		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		session.getTransaction().commit();
		session.close();

		return res;
	}

	private Criteria generateFilters(Pdre pdre,Criteria criteria,String subCategory) {

		if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_RENT)){
			if(pdre.getLocation()!=null){
				criteria = getCriteriaForLocation(criteria, pdre);	
			}
			if(pdre.getArea()!=null){
				criteria = getCriteriaForArea(criteria,pdre);
			}
			if(pdre.getBhk()!=null){
				criteria = getCriteriaForBhk(criteria,pdre);		
			}
			if(pdre.getRent()!=null){
				criteria = getCriteriaForRent(criteria, pdre);
			}
			if(pdre.getFacingDirection()!=null){
				criteria = getCriteriaForDirection(criteria, pdre);
			}
			if(pdre.getMaritalPreference()!=null){
				criteria = getCriteriaForMaritalPreference(criteria, pdre);
			}
			if(pdre.getCarParking()!=null){
				criteria = getCriteriaForCarParking(criteria, pdre);
			}
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_APARTMENT_FOR_SALE)){	
			if(pdre.getLocation()!=null){
				criteria = getCriteriaForLocation(criteria, pdre);	
			}
			if(pdre.getArea()!=null){
				criteria = getCriteriaForArea(criteria,pdre);
			}
			if(pdre.getBhk()!=null){
				criteria = getCriteriaForBhk(criteria,pdre);		
			}
			if(pdre.getAmt()!=null){
				criteria = getCriteriaForAmt(criteria, pdre);
			}
			if(pdre.getNewOrResale()!=null){
				criteria = getCriteriaForgetNewOrResale(criteria, pdre);
			}
			if(pdre.getApprovalAuthority()!=null){
				criteria = getCriteriaForApprovalAuthority(criteria, pdre);
			}
			if(pdre.getGym()!=null){
				criteria = getCriteriaForGym(criteria, pdre);
			}
			if(pdre.getSwimmingPool()!=null){
				criteria = getCriteriaForSwimmingPool(criteria, pdre);
			}
			if(pdre.getClubHouse()!=null){
				criteria = getCriteriaForClubHouse(criteria, pdre);
			}
			if(pdre.getChildrenPlayArea()!=null){
				criteria = getCriteriaForChildrenPlayArea(criteria, pdre);
			}
			if(pdre.getCarParking()!=null){
				criteria = getCriteriaForCarParking(criteria, pdre);
			}	
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_LAND_SALE)){
			if(pdre.getLocation()!=null){
				criteria = getCriteriaForLocation(criteria, pdre);	
			}
			if(pdre.getArea()!=null){
				criteria = getCriteriaForArea(criteria,pdre);
			}
			if(pdre.getAmt()!=null){
				criteria = getCriteriaForAmt(criteria, pdre);
			}
			if(pdre.getApprovalAuthority()!=null){
				criteria = getCriteriaForApprovalAuthority(criteria, pdre);
			}	
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_PG_ACCOMODATION)){
			if(pdre.getLocation()!=null){
				criteria = getCriteriaForLocation(criteria, pdre);	
			}
			if(pdre.getAmt()!=null){
				criteria = getCriteriaForAmt(criteria, pdre);
			}
			if(pdre.getWifi()!=null){
				criteria = getCriteriaForWifi(criteria, pdre);
			}
			if(pdre.getTv()!=null){
				criteria = getCriteriaForTv(criteria, pdre);
			}
			if(pdre.getFood()!=null){
				criteria = getCriteriaForFood(criteria, pdre);
			}
		}else if(subCategory.equals(CBuddyConstants.SUBCATEGORY_REAL_ESTATE_ROOMMATE_REQUIRED)){
			if(pdre.getShare()!=null){
				criteria = getCriteriaForShare(criteria, pdre);
			}	
			if(pdre.getFurnished()!=null){
				criteria = getCriteriaForFurnished(criteria, pdre);
			}
			if(pdre.getGender()!=null){
				criteria = getCriteriaForGender(criteria, pdre);
			}
			if(pdre.getRegionalPreference()!=null){
				criteria = getCriteriaForRegionalPreference(criteria, pdre);
			}
		}

		return criteria;	
	}

	private Criteria getCriteriaForLocation(Criteria criteria ,Pdre pdre){

		List loc = new ArrayList();
		String obj[] = pdre.getLocation().split(",");
		for(String str :obj){
			loc.add(str.trim());
		}
		criteria.add(Restrictions.in("location", loc));

		return criteria;
	}

	private Criteria getCriteriaForArea(Criteria criteria,Pdre pdre){
		String obj[] = pdre.getArea().split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = getNumericValue(str);
				//Pattern pattern = Pattern.compile("\\w+([0-9]+)\\w+([0-9]+)");				
				c1 =  Restrictions.le("areaSq", Integer.parseInt(str));
			}
			if(str.contains(">")){
				str = getNumericValue(str);				
				c2 =  Restrictions.ge("areaSq", Integer.parseInt(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = getNumericValue(res[i]);
				}	
				c3 =  Restrictions.between("areaSq", Integer.parseInt(newRes[0]),Integer.parseInt(newRes[1]));
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
