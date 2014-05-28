package com.cbuddy.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.Pdre;
import com.cbuddy.beans.Poit;

public class AdDetailsService {

	@SuppressWarnings("unchecked")
	public List<Pdre> getAdListByCategory(Pdre pdre){
	
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		List<Pdre> res = null;
		try {	
			//poit = (List<Poit>)session.createQuery("from Poit").list();
			Criteria criteria = session.createCriteria(Pdre.class);
			criteria = generateFilters(pdre,criteria);
			res = (List<Pdre>) criteria.list();

		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		session.getTransaction().commit();
		session.close();

		return res;
	}

	private Criteria generateFilters(Pdre pdre,Criteria criteria) {
		System.out.println("AdDetailsService.generateFilters()");
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

	public List<Poit> getAdListByCategoryAndPrice(int price){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext()
		.getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		List<Poit> poit = null;
		try {	
			System.out.println(price);
			Query query = session.createQuery("from Poit where price = :price");
			query.setParameter("price", price);
			poit = (List<Poit>)query.list();
			System.out.println("--"+poit);

		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		session.getTransaction().commit();
		session.close();

		return poit;
	}

}
