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

	public User activateUser(String activationCode, String personalEmailId) throws CBuddyException{

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
		
		//Get Ucred information, for Corp Email Id
		tempQuery = dbSession.createQuery("from Ucred where user_id = :userId");
		tempQuery.setParameter("userId", uprof.getUserId());
		Ucred ucred = (Ucred)tempQuery.uniqueResult();
	
		User user = new User();
		user.setCorpId(uprof.getCorpId());
		user.setEmailId(ucred.getCorpEmailId());
		user.setFirstName(uprof.getFirstName());
		user.setMobileNo(uprof.getMobileNo());
		user.setStatus(uprof.getUserStatus());
		user.setUserId(uprof.getUserId());
		
		return user;
	}

	public User authenticateUser(String userNameString, String password)
			throws CBuddyException{

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		Ucred ucred = null;
		Uprof uprof = null;
		
		//Check if the value entered by the user in 'User Name' field is his email id or mobile number.
		if(TextUtil.isNumeric(userNameString)){
			//Mobile number
			uprof = getUserProfileForMobileNumber(userNameString, session);
		}else if(TextUtil.isValidEmail(userNameString)){
			//Email Id
			uprof = getUserProfileForEmailId(userNameString, session);
		}else{
			//Invalid value
			throw new CBuddyException("Invalid User Name entered", CBuddyConstants.INVALID_USER_NAME);
		}

		if(uprof == null){
			throw new CBuddyException("Invalid User Name or Email Id", CBuddyConstants.NON_EXISTENT_USER_ID);
		}

		ucred = getUserCredentials(uprof.getUserId(), session);
		
		if(!ucred.getPwd().equals(password)){
			logUnsuccessfulAttempt(ucred.getUserId(), ucred, session);
			throw new CBuddyException("Invalid Password", CBuddyConstants.INVALID_PASSWORD);
		}else{
			logSuccessfulAttempt(ucred.getUserId(), ucred, session);
		}

		//Uprof uprof = getUserProfile(ucred.getUserId(), session);

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

	private Uprof getUserProfileForMobileNumber(String mobileNumber, Session session){
		Query query = session.createQuery("from Uprof where mobile_no = :mobileNo");
		query.setParameter("mobileNo", mobileNumber);
		List<Uprof> uprofList = (List<Uprof>)query.list();
		Uprof uprof = null;
		if(uprofList.size()>0){
			uprof = uprofList.get(0);
		}
		return uprof;
	}

	private Uprof getUserProfileForEmailId(String email, Session session){
		Query query = session.createQuery("from Uprof where personal_email_id = :emailId");
		query.setParameter("emailId", email);
		List<Uprof> uprofList = (List<Uprof>)query.list();
		Uprof uprof = null;
		if(uprofList.size()>0){
			uprof = uprofList.get(0);
		}
		return uprof;
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

	private Ucred getUserCredentials(int userId, Session session){
		Query query = session.createQuery("from Ucred where user_id = :userId");
		query.setParameter("userId", String.valueOf(userId));
		Ucred ucred = (Ucred)query.uniqueResult();
		return ucred;
	}

	public User registerUser(Ucred ucred, String contextPath) throws CBuddyException{

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		String userName = "SYSTEM";
		Timestamp now = new Timestamp(System.currentTimeMillis());

		validateCorporateEmailId(ucred.getCorpId(), ucred.getCorpEmailId(), session);

		validatePersonalEmailId(ucred.getPersonalEmailId(), session);

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
		String messageText = "Warm Regards from cBuddy team!" + "\n\n";
		messageText = messageText + "Company Email Id: " + user.getEmailId() + "\n\n";
		messageText = messageText + "Please click on the following link for activating your cBuddy account:" + "\n\n";
		messageText = messageText + contextPath + "/activate?activationCode=" + activationCode;
		try{
			//TODO (Temp Change done for ALPHA TESTING): Don't send mail to personal mail id. Send it to official mail id.
			new MailUtil().sendMail(uprof.getPersonalEmailId(), user.getFirstName(), messageText, contextPath, activationCode);
			//new MailUtil().sendMail(user.getEmailId(), user.getFirstName(), contextPath, activationCode);
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
			throw new CBuddyException("Domain " + domainId + " is not registered", CBuddyConstants.DOMAIN_NOT_REGISTERED);
		}

		//Check for duplicate
		query = dbSession.createQuery("from Ucred where corp_email_id = :corpEmailId");
		query.setParameter("corpEmailId", corpEmail);
		Ucred result = (Ucred) query.uniqueResult();
		if(result!=null){
			throw new CBuddyException("Email id '" + corpEmail + "' is already registered!", CBuddyConstants.EXISTENT_USER_ID);
		}
	}

	private void validatePersonalEmailId(String emailId, Session dbSession)
	throws CBuddyException{
		//Check for duplicate
		Query query = dbSession.createQuery("from Uprof where personal_email_id = :emailId");
		query.setParameter("emailId", emailId);
		List<Uprof> uprofList = (List<Uprof>)query.list();
		if(uprofList != null && uprofList.size() > 0){
			throw new CBuddyException("Email Id '" + emailId + "' is already registered!", CBuddyConstants.EXISTENT_USER_ID);
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
