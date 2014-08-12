package com.cbuddy.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class MailUtil {
	public void sendMail(String toId, String firstName, String messageText, String applicationContextRoot, String activationCode){
		LogUtil.getInstance().info(">>> MailUtil.sendMail()");
		LogUtil.getInstance().info(">>> messageText: " + messageText);
		LogUtil.getInstance().info(">>> applicationContextRoot: " + applicationContextRoot);
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
 
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("cbuddyguys","cbuddy123");
				}
			});
 
		try {
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("admin@cbuddy.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toId));
			message.setSubject("cBuddy account activation link");
			message.setText(messageText);
 
			LogUtil.getInstance().info(">>> Sending Message");
			
			Transport.send(message);
			
			LogUtil.getInstance().info(">>> Message sent!");
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			LogUtil.getInstance().info(">>> Error while sending Message. " + e.getMessage());
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}