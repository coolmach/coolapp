package com.cbuddy.posts.services;

import java.sql.Timestamp;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.cbuddy.beans.ChildComment;
import com.cbuddy.beans.MasterComment;

public class CommentsService {

	public List<MasterComment> getComments(int postId){

		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		Transaction tx = null;
		List<MasterComment> list = null;
		try {
			tx = dbSession.beginTransaction();
			Query q = dbSession.createQuery("from MasterComment where postId = '"+postId+"'");
			list= q.list();
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbSession.close();
		}
		return list;

	}

	public void postComment(int postId, String comment) {
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = dbSession.beginTransaction();

			Timestamp current = new Timestamp(System.currentTimeMillis());

			MasterComment cmt = new MasterComment();
			cmt.setPostId(postId);
			cmt.setComment(comment);
			cmt.setPostDate(current);
			cmt.setModifiedDate(current);

			dbSession.save(cmt);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbSession.close();
		}

	}
	
	public void postChildComment(int postId, String comment , int commentId) {
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = dbSession.beginTransaction();

			Timestamp current = new Timestamp(System.currentTimeMillis());

			MasterComment p = (MasterComment) dbSession.load(MasterComment.class, commentId);

			ChildComment cmt1 = new ChildComment();
			cmt1.setComment(comment);
			cmt1.setPostDate(current);
			cmt1.setModifiedDate(current);

			cmt1.setMastercomment(p);
			p.getChildComment().add(cmt1);
			dbSession.save(cmt1);
			tx.commit();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbSession.close();
		}

	}

}
