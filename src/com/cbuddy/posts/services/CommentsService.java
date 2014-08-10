package com.cbuddy.posts.services;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.cbuddy.beans.ChildComment;
import com.cbuddy.beans.MasterComment;

public class CommentsService {
	
	public List<MasterComment> getComments(){
		
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		Transaction tx = null;
		List<MasterComment> list = null;
		try {
			tx = dbSession.beginTransaction();

			/*Timestamp current = new Timestamp(System.currentTimeMillis());

			MasterComment cmt = new MasterComment();
			cmt.setPostId(Integer.parseInt(postId));
			cmt.setComment(comment);
			cmt.setPostDate(current);
			cmt.setModifiedDate(current);

			ChildComment cmt1 = new ChildComment();
			cmt1.setComment(comment);
			cmt1.setPostDate(current);
			cmt1.setModifiedDate(current);

			cmt.getChildComment().add(cmt1);
			cmt1.setMastercomment(cmt);

			dbSession.save(cmt);
			dbSession.save(cmt1);*/
			tx.commit();
			org.hibernate.Query q = dbSession.createQuery("from MasterComment where postId ='194'");
		//	q.setParameter("id", "194");

			 list= q.list();
			
			dbSession.close();
			for(int i=0;i<list.size();i++){
				List<ChildComment> c =  (List<ChildComment>) list.get(i).getChildComment();
				System.out.println(list.get(i).getCommentId() + ": "+c.size());
			}
			//System.out.println(criteria.s);
			//MasterComment criteria = (MasterComment) dbSession.get(MasterComment.class,14);
			//System.out.println(criteria.getChildComment().size());
			/*criteria.add(Restrictions.eq("commentId", 14));
			List<MasterComment> list= criteria.list();
			for(int i=0;i<list.size();i++){
				ChildComment c = (ChildComment) list.get(i).getChildComment();
				System.out.println(c.getComment()+" : "+c.getModifiedDate());
			}*/
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}

}
