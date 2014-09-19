package com.cbuddy.posts.services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.posts.model.OtherPostDetails;
import com.cbuddy.util.CbuddySessionFactory;

public class OtherPostsAdService{

	public OtherPostDetails getAdDetailsForOtherPosts(OtherPostDetails postDetails){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session session = sessionFactory.openSession();
		OtherPostDetails adDetails = (OtherPostDetails)session.get(OtherPostDetails.class, new Integer(postDetails.getPostIdStr()));
		return adDetails;
	}
}
