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
import org.hibernate.criterion.Restrictions;

import com.cbuddy.util.CriteriaUtil;
import com.cbuddy.util.NumberFormatterUtil;
import com.model.user.ComputersPostDetails;

public class ComputersAdService{

	@SuppressWarnings("unchecked")
	public List<ComputersPostDetails> getAdListByCategory(ComputersPostDetails postDetails, String subCategory){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();

		List<ComputersPostDetails> list = null;
		try {
			Criteria criteria = session.createCriteria(ComputersPostDetails.class);
			criteria.addOrder(Order.desc("postId"));
			criteria.setMaxResults(20);
			criteria.add(Restrictions.eq("subCategory", subCategory));
			
			/*if(postDetails.getCity() != null){
				criteria.add(Restrictions.eq("city", postDetails.getCity()));
			}*/
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


	private Criteria generateFilters(ComputersPostDetails postDetails, Criteria criteria, String subCategory) {

		if(postDetails.getLocation()!=null){
			criteria = CriteriaUtil.getCriteriaForLocation(criteria, postDetails.getLocation());	
		}
		if(postDetails.getMake()!=null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getMake(), "make");		
		}
		if(postDetails.getModel()!=null){
			criteria = CriteriaUtil.createCriteriaForIn(criteria, postDetails.getModel(), "model");		
		}
		if(postDetails.getAmt()!=null){
			criteria = CriteriaUtil.getCriteriaForAmt(criteria, postDetails.getAmt(), "price");
		}
		if(postDetails.getYearStr()!=null){
			criteria = getCriteriaForYear(criteria, postDetails.getYearStr());
		}
		if(postDetails.getProcessorSizeStr()!=null){
			criteria = getCriteriaForProcessorSize(criteria, postDetails.getProcessorSizeStr());
		}
		if(postDetails.getHddSizeStr()!=null){
			criteria = getCriteriaForHddSize(criteria, postDetails.getHddSizeStr());
		}
		
		return criteria;	
	}
	
	private Criteria getCriteriaForHddSize(Criteria criteria, String hddSizeStr) {
		// TODO Auto-generated method stub
		String obj[] = hddSizeStr.split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = NumberFormatterUtil.getNumericValue(str);				
				c1 =  Restrictions.le("hddSize", Integer.parseInt(str));
			}
			if(str.contains(">")){
				str = NumberFormatterUtil.getNumericValue(str);				
				c2 =  Restrictions.ge("hddSize", Integer.parseInt(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = NumberFormatterUtil.getNumericValue(res[i]);
				}	
				
				c3 =  Restrictions.between("hddSize", Integer.parseInt(newRes[0]),Integer.parseInt(newRes[1]));
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


	private Criteria getCriteriaForProcessorSize(Criteria criteria,
			String processorSizeStr) {

			String obj[] = processorSizeStr.split(",");
			Criterion  c1 = null;
			Criterion  c2 = null;
			Criterion  c3 = null;

			for(String str :obj){
				if(str.contains("<") ){
					str = NumberFormatterUtil.getNumericValue(str);				
					c1 =  Restrictions.le("processorSize", Integer.parseInt(str));
				}
				if(str.contains(">")){
					str = NumberFormatterUtil.getNumericValue(str);				
					c2 =  Restrictions.ge("processorSize", Integer.parseInt(str));
				}
				if(str.contains("-")){
					String res[] = str.split("-");
					String newRes[] = new String[2];
					for(int i=0;i<res.length;i++){
						newRes[i] = NumberFormatterUtil.getNumericValue(res[i]);
					}	
					
					c3 =  Restrictions.between("processorSize", Integer.parseInt(newRes[0]),Integer.parseInt(newRes[1]));
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


	public Criteria getCriteriaForYear(Criteria criteria, String yearOfMake) {
		List yearList = new ArrayList();
		String obj[] = yearOfMake.split(",");
		for(String make:obj){
			yearList.add(Integer.parseInt(make));
		}	
		criteria.add(Restrictions.in("year", yearList));

		return criteria;
	}
}
