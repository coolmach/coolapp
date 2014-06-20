package com.cbuddy.services;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Ucred;
import com.cbuddy.beans.Uprof;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.TextUtil;
import com.model.user.User;

public class AuthenticateUserService {

	@SuppressWarnings("unchecked")
	public User authenticateUser(String userNameString, String password)
			throws CBuddyException{

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		Ucred ucred = null;
		//Check if the value entered by the user in 'User Name' field is his email id or mobile number.
		if(TextUtil.isNumeric(userNameString)){
			//Mobile number
			ucred = getUserCredentialsForMobileNumber(userNameString, session);
		}else if(TextUtil.isValidEmail(userNameString)){
			//Email Id
			ucred = getUserCredentialsForEmailId(userNameString, session);
		}else{
			//Invalid value
			throw new CBuddyException("Invalid User Name entered", CBuddyConstants.INVALID_USER_NAME);
		}

		if(ucred == null){
			throw new CBuddyException("Invalid User Name or Email Id", CBuddyConstants.NON_EXISTENT_USER_ID);
		}
		
		if(!ucred.getPwd().equals(password)){
			logUnsuccessfulAttempt(ucred.getUserId(), ucred, session);
			throw new CBuddyException("Invalid Password", CBuddyConstants.INVALID_PASSWORD);
		}else{
			logSuccessfulAttempt(ucred.getUserId(), ucred, session);
		}
		
		Uprof uprof = getUserProfile(ucred.getUserId(), session);
		
		User user = new User();
		user.setUserId(ucred.getUserId());
		user.setFirstName(uprof.getFirstName());
		user.setMobileNo(ucred.getMobileNo());
		user.setEmailId(ucred.getCorpEmailId());
		user.setCorpId(uprof.getCorpId());
		session.close();
		
		return user;
	}
	
	private Ucred getUserCredentialsForMobileNumber(String mobileNumber, Session session){
		Query query = session.createQuery("from Ucred where mobile_no = :mobileNo");
		query.setParameter("mobileNo", mobileNumber);
		List<Ucred> ucredList = (List<Ucred>)query.list();
		Ucred ucred = null;
		if(ucredList.size()>0){
			ucred = ucredList.get(0);
		}
		return ucred;
	}
	
	private Ucred getUserCredentialsForEmailId(String email, Session session){
		Query query = session.createQuery("from Ucred where corp_email_id = :emailId");
		query.setParameter("emailId", email);
		List<Ucred> ucredList = (List<Ucred>)query.list();
		Ucred ucred = null;
		if(ucredList.size()>0){
			ucred = ucredList.get(0);
		}
		return ucred;
	}
	
	private void logUnsuccessfulAttempt(int userId, Ucred ucred, Session session){
		String userIdStr = String.valueOf(userId);
		ucred.setNoOfAtmpts(ucred.getNoOfAtmpts() + 1);
		ucred.setModifiedBy(userIdStr);
		ucred.setModifiedOn(new Timestamp(System.currentTimeMillis()));
		session.save(ucred);
		session.getTransaction().commit();
	}
	
	private void logSuccessfulAttempt(int userId, Ucred ucred, Session session){
		String userIdStr = String.valueOf(userId);
		ucred.setNoOfAtmpts(0);
		ucred.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
		ucred.setModifiedBy(userIdStr);
		ucred.setModifiedOn(new Timestamp(System.currentTimeMillis()));
		session.save(ucred);
		session.getTransaction().commit();
	}
	
	private Uprof getUserProfile(int userId, Session session){
		Query query = session.createQuery("from Uprof where user_id = :userId");
		query.setParameter("userId", String.valueOf(userId));
		List<Uprof> uprofList = (List<Uprof>)query.list();
		return uprofList.get(0);
	}
	
	public String registerUser(Ucred ucred) throws CBuddyException{

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("from Ucred where CORP_EMAIL_ID = :CorpEmailId");
		query.setParameter("CorpEmailId", ucred.getCorpEmailId());
		Ucred result = (Ucred) query.uniqueResult();
		if(result!=null){
			throw new CBuddyException("User already exists with this Corporate Email", CBuddyConstants.EXISTENT_USER_ID);
		}
		
		Ucred newUcred = new Ucred();
		newUcred.setPwd(ucred.getPwd());
		newUcred.setMobileNo(ucred.getMobileNo());
		newUcred.setCorpEmailId(ucred.getCorpEmailId());
		session.save(newUcred);
		
		Uprof uprof = new Uprof();
		uprof.setFirstName(ucred.getFirstName());
		uprof.setPersonalEmailId(ucred.getPersonalEmailId());
		session.save(uprof);
		
		session.getTransaction().commit();
		
		return null;
		
	}
}
