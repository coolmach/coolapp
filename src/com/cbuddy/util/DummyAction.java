package com.cbuddy.util;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Ucred;
import com.cbuddy.beans.Uprof;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class DummyAction extends ActionSupport implements ServletRequestAware{


	private static final long serialVersionUID = -3906995616035628679L;
	private HttpServletRequest request = null;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String updateCorpEmailId(){
		String emailId = request.getParameter("emailId");

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		Query query = dbSession.createQuery("from Ucred where corp_email_id = :emailId");
		query.setParameter("emailId", emailId);
		try{
			List<Ucred> ucreds = (List<Ucred>)query.list();
			if(ucreds.size()>0){
				Ucred ucred = ucreds.get(0);
				ucred.setCorpEmailId(generateEmailId(ucred.getCorpEmailId()));
				ucred.setModifiedBy("API");
				ucred.setModifiedOn(new Timestamp(System.currentTimeMillis()));
				
				dbSession.beginTransaction();
				
				dbSession.save(ucred);
				
				dbSession.getTransaction().commit();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}
	
	public String updatePersonalEmailId(){
		String emailId = request.getParameter("emailId");

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		Query query = dbSession.createQuery("from Uprof where personal_email_id = :emailId");
		query.setParameter("emailId", emailId);
		try{
			List<Uprof> uprofs = (List<Uprof>)query.list();
			if(uprofs.size()>0){
				Uprof uprof = uprofs.get(0);
				uprof.setPersonalEmailId(generateEmailId(uprof.getPersonalEmailId()));
				uprof.setModifiedBy("API");
				uprof.setModifiedOn(new Timestamp(System.currentTimeMillis()));
				
				dbSession.beginTransaction();
				
				dbSession.save(uprof);
				
				dbSession.getTransaction().commit();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}

	private String generateEmailId(String originalEmailId){
		String currentTime = String.valueOf(System.currentTimeMillis()).substring(0,10);
		String mailAccountName = originalEmailId.substring(0, originalEmailId.indexOf("@"));
		return originalEmailId.replace(mailAccountName, mailAccountName + "_" + currentTime);
	}
}
