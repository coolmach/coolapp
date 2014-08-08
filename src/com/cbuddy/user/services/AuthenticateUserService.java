package com.cbuddy.user.services;

import java.sql.Timestamp;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.DomainMaster;
import com.cbuddy.beans.Pact;
import com.cbuddy.beans.Poit;
import com.cbuddy.beans.Uact;
import com.cbuddy.beans.Ucred;
import com.cbuddy.beans.Uprof;
import com.cbuddy.exception.CBuddyException;
import com.cbuddy.user.model.User;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.MailUtil;
import com.cbuddy.util.TextUtil;
import com.cbuddy.util.Utils;

public class AuthenticateUserService {

	public void activateUser(String activationCode, String personalEmailId) throws CBuddyException{
		
		if(activationCode == null || activationCode.trim().equals("")){
			throw new CBuddyException("Invalid Activation Code");
		}
		
		if(personalEmailId == null || personalEmailId.trim().equals("")){
			throw new CBuddyException("Invalid Email Id");
		}
		
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		dbSession.beginTransaction();
		
		Query query = dbSession.createQuery("from Uact where activation_code = :activationCode");
		query.setParameter("activationCode", activationCode);
		List<Uact> uacts = (List<Uact>)query.list();
		
		if(uacts.size() == 0){
			throw new CBuddyException("Invalid Activation Code");
		}
		
		Uact uact = uacts.get(0);
		
		Query tempQuery = dbSession.createQuery("from Uprof where user_id = :userId");
		tempQuery.setParameter("userId", uact.getUserId());
		List<Uprof> uprofs = (List<Uprof>)tempQuery.list();
		Uprof uprof = uprofs.get(0);
		
		if(!uprof.getPersonalEmailId().equals(personalEmailId)){
			throw new CBuddyException("Invalid Activation Code or Email Id");
		}
		
		if(uprof.getUserStatus().equals(CBuddyConstants.USER_STATUS_ACTIVE)){
			throw new CBuddyException("User is already active");
		}
		
		Timestamp current = new Timestamp(System.currentTimeMillis());
		
		uact.setActivationStatus(CBuddyConstants.USER_STATUS_ACTIVE);
		uact.setActivationDate(current);
		dbSession.save(uact);
		
		uprof.setUserStatus(CBuddyConstants.USER_STATUS_ACTIVE);
		uprof.setModifiedOn(current);
		dbSession.save(uprof);
		
		//Activate Posts
		tempQuery = dbSession.createQuery("from Pact where activation_code = :activationCode");
		tempQuery.setParameter("activationCode", activationCode);
		List<Pact> pacts = (List<Pact>)tempQuery.list();
		if(pacts != null){
			for(Pact pact:pacts){
				pact.setActivationStatus(CBuddyConstants.USER_STATUS_ACTIVE);
				pact.setActivationDate(current);
				dbSession.save(pact);
				
				Query temp2Query = dbSession.createQuery("from Poit where post_id = :postId");
				temp2Query.setParameter("postId", pact.getPostId());
				List<Poit> poits = temp2Query.list();
				Poit poit = poits.get(0);
				poit.setPostStatus(CBuddyConstants.USER_STATUS_ACTIVE);
				poit.setModifiedOn(current);
				dbSession.save(poit);
			}
		}
		dbSession.getTransaction().commit();
	}
	
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
		System.out.println(uprof.getFirstName());
		user.setFirstName(uprof.getFirstName());
		user.setMobileNo(ucred.getMobileNo());
		user.setEmailId(ucred.getCorpEmailId());
		user.setCorpId(uprof.getCorpId());
		user.setStatus(uprof.getUserStatus());
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
	
	public User registerUser(Ucred ucred, String contextPath) throws CBuddyException{

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("from Ucred where CORP_EMAIL_ID = :CorpEmailId");
		query.setParameter("CorpEmailId", ucred.getCorpEmailId());
		Ucred result = (Ucred) query.uniqueResult();
		if(result!=null){
			throw new CBuddyException("User already exists with this Corporate Email", CBuddyConstants.EXISTENT_USER_ID);
		}
		
		String userName = "SYSTEM";
		Timestamp now = new Timestamp(System.currentTimeMillis());
		
		validateCorporateEmailId(ucred.getCorpId(), ucred.getCorpEmailId(), session);
		
		Ucred newUcred = new Ucred();
		newUcred.setPwd(ucred.getPwd());
		newUcred.setMobileNo(ucred.getMobileNo());
		newUcred.setCorpEmailId(ucred.getCorpEmailId());
		newUcred.setCreatedBy(userName);
		newUcred.setCreatedOn(now);
		newUcred.setModifiedBy(userName);
		newUcred.setModifiedOn(now);
		
		try{
			session.save(newUcred);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		Uprof uprof = new Uprof();
		uprof.setFirstName(ucred.getFirstName());
		uprof.setPersonalEmailId(ucred.getPersonalEmailId());
		uprof.setCorpId(ucred.getCorpId());
		uprof.setCreatedBy(userName);
		uprof.setCreatedOn(now);
		uprof.setModifiedBy(userName);
		uprof.setModifiedOn(now);
		uprof.setUserId(newUcred.getUserId());
		uprof.setPersonalEmailId(ucred.getPersonalEmailId());
		uprof.setUserStatus(CBuddyConstants.USER_STATUS_PENDING_VERIFICATION);
		uprof.setMobileNo(ucred.getMobileNo());
		
		session.save(uprof);
		
		//Create a record for activation
		Uact uact = new Uact();
		//Generate Activation Code
		String activationCode = new Utils().generateActivationCode();
		uact.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		uact.setActivationStatus(CBuddyConstants.USER_STATUS_PENDING_VERIFICATION);
		uact.setRecordId(String.valueOf(uprof.getUserId()));
		uact.setUserId(uprof.getUserId());
		uact.setActivationCode(activationCode);
		
		session.save(uact);
		
		session.getTransaction().commit();
		
		User user = new User();
		user.setUserId(newUcred.getUserId());
		user.setFirstName(uprof.getFirstName());
		user.setMobileNo(newUcred.getMobileNo());
		user.setEmailId(newUcred.getCorpEmailId());
		user.setCorpId(uprof.getCorpId());
		user.setStatus(uprof.getUserStatus());
		user.setActivationCode(activationCode);
		
		//Sending activation code through email
		try{
			new MailUtil().sendMail(user.getEmailId(), user.getFirstName(), contextPath, activationCode);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return user;
	}
	
	private void validateCorporateEmailId(int corpId, String corpEmail, Session dbSession) throws CBuddyException{
		Query query = dbSession.createQuery("from DomainMaster where corpId = :corpId");
		query.setParameter("corpId", corpId);
		String domainId = getDomainFromEmailId(corpEmail);
		if(domainId == null){
			throw new CBuddyException("Invalid Corporate Email Id");
		}
		List<DomainMaster> domains = query.list();
		boolean isMatchFound = false;
		for(DomainMaster domain:domains){
			if(domainId.equals(domain.getDomainId())){
				isMatchFound = true;
				break;
			}
		}
		if(isMatchFound == false){
			throw new CBuddyException("Domain Name not registered in our database. We have logged your request. Please try again tomorrow");
		}
	}
	
	private String getDomainFromEmailId(String emailId){
		int index = emailId.indexOf("@");
		String domain = null;
		if(index > 0){
			domain = emailId.substring(index + 1);
		}
		return domain;
	}
}
