package com.cbuddy.services;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.Pdau;
import com.model.user.RealEstatePostDetails;

public class AutoMobilesAdService extends AdDetailsService{
	
	@SuppressWarnings("unchecked")
	public List<Pdau> getAdListByCategory(Pdau pdau, String subCategory){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		
		List<Pdau> list = null;
		try {
			Criteria criteria = session.createCriteria(Pdau.class);
			criteria.addOrder(Order.desc("postId"));
			criteria.setMaxResults(20);
			criteria.add(Restrictions.eq("subCategory", subCategory));
			//criteria = generateFilters(postDetails, criteria, subCategory);
			
			list = criteria.list();
			System.out.println(list.size());
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		session.close();

		return list;
	}
	

}
