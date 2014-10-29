package com.cbuddy.common.action;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

import com.cbuddy.beans.Corp;
import com.cbuddy.util.CbuddySessionFactory;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class CompaniesListAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private HashMap<String, String> companyMap = new HashMap<String, String>();
	
	public String getCompanies() {
		
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		dbSession.beginTransaction();
		Criteria criteria = null;

		criteria = dbSession.createCriteria(Corp.class);
		criteria.addOrder(Order.asc("corpName"));
		List<Corp> corpList = criteria.list();
		for(Corp corp:corpList){
			companyMap.put(String.valueOf(corp.getCorpId()), corp.getCorpShortName());
		}

		dbSession.close();
		
		return Action.SUCCESS;
	}

	public HashMap<String, String> getCompanyMap() {
		return companyMap;
	}

	public void setCompanyMap(HashMap<String, String> companyMap) {
		this.companyMap = companyMap;
	}

}
