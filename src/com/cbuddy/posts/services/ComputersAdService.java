package com.cbuddy.posts.services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.posts.model.ComputersPostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.CriteriaUtil;
import com.cbuddy.util.FormatterUtil;

public class ComputersAdService{

	public int getAdListCount(ComputersPostDetails postDetails, String subCategory){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		Criteria criteria = session.createCriteria(ComputersPostDetails.class);
		criteria.add(Restrictions.eq("postStatus", CBuddyConstants.USER_STATUS_ACTIVE));
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
	public List<ComputersPostDetails> getAdListByCategory(ComputersPostDetails postDetails, String subCategory){

		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();

		List<ComputersPostDetails> list = null;
		try {
			
			if(postDetails.getLimit() == null){
				postDetails.setLimit("10");
			}
			if(postDetails.getOffset() == null){
				postDetails.setOffset("0");
			}
			
			Criteria criteria = session.createCriteria(ComputersPostDetails.class);
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
			criteria = CriteriaUtil.createCriteriaForYear(criteria, postDetails.getYearStr());
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
				str = FormatterUtil.getNumericValue(str);				
				c1 =  Restrictions.le("hddSize", Integer.parseInt(str));
			}
			if(str.contains(">")){
				str = FormatterUtil.getNumericValue(str);				
				c2 =  Restrictions.ge("hddSize", Integer.parseInt(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = FormatterUtil.getNumericValue(res[i]);
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
					str = FormatterUtil.getNumericValue(str);				
					c1 =  Restrictions.le("processorSize", Integer.parseInt(str));
				}
				if(str.contains(">")){
					str = FormatterUtil.getNumericValue(str);				
					c2 =  Restrictions.ge("processorSize", Integer.parseInt(str));
				}
				if(str.contains("-")){
					String res[] = str.split("-");
					String newRes[] = new String[2];
					for(int i=0;i<res.length;i++){
						newRes[i] = FormatterUtil.getNumericValue(res[i]);
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
	
	public ComputersPostDetails getAdDetailsForComputers(ComputersPostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		ComputersPostDetails adDetails = (ComputersPostDetails)session.get(ComputersPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
