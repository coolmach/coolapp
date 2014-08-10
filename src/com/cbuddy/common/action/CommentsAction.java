package com.cbuddy.common.action;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.ChildComment;
import com.cbuddy.beans.MasterComment;
import com.cbuddy.posts.model.RealEstatePostDetails;
import com.cbuddy.posts.services.CommentsService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommentsAction extends ActionSupport implements SessionAware, ServletRequestAware {

	private String postId;
	private String comment;
	private String commentId;
	
	//MasterComment cmList = new MasterComment();

	private List<MasterComment> cmList = new ArrayList<MasterComment>();
	
	private HttpServletRequest request = null;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public List<MasterComment> getCmList() {
		return cmList;
	}

	public void setCmList(List<MasterComment> cmList) {
		this.cmList = cmList;
	}

	private Map<String,Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String postComment(){
		System.out.println("dddd "+postId+comment);
		
		
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = dbSession.beginTransaction();

			Timestamp current = new Timestamp(System.currentTimeMillis());

			MasterComment cmt = new MasterComment();
			cmt.setPostId(Integer.parseInt(postId));
			cmt.setComment(comment);
			cmt.setPostDate(current);
			cmt.setModifiedDate(current);

			/*ChildComment cmt1 = new ChildComment();
			cmt1.setComment(comment);
			cmt1.setPostDate(current);
			cmt1.setModifiedDate(current);

			cmt.getChildComment().add(cmt1);
			cmt1.setMastercomment(cmt);*/

			dbSession.save(cmt);
			//dbSession.save(cmt1);
			tx.commit();
			//org.hibernate.Query q = dbSession.createQuery("from MasterComment where postId ='194'");
		//	q.setParameter("id", "194");

			//List<MasterComment> list= q.list();
			
			CommentsService ser = new CommentsService();
			cmList = ser.getComments();
			System.out.println(cmList);
			dbSession.close();
			/*for(int i=0;i<list.size();i++){
				List<ChildComment> c =  (List<ChildComment>) list.get(i).getChildComment();
				System.out.println(list.get(i).getCommentId() + ": "+c.size());
			}*/
			//System.out.println(criteria.s);
			//MasterComment criteria = (MasterComment) dbSession.get(MasterComment.class,14);
			//System.out.println(criteria.getChildComment().size());
			//criteria.add(Restrictions.eq("commentId", 14));
			/*List<MasterComment> list= criteria.list();
			for(int i=0;i<list.size();i++){
				ChildComment c = (ChildComment) list.get(i).getChildComment();
				System.out.println(c.getComment()+" : "+c.getModifiedDate());
			}*/
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "success";
	}

	public String postChildComment(){
		System.out.println("dddd "+postId+comment + commentId);
		SessionFactory sessionFactory = (SessionFactory) ServletActionContext.getServletContext().getAttribute("sessionFactory");
		Session dbSession = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = dbSession.beginTransaction();

			Timestamp current = new Timestamp(System.currentTimeMillis());

			MasterComment p = (MasterComment) dbSession.load(MasterComment.class, Integer.parseInt(commentId));
			System.out.println(p);
			ChildComment cmt1 = new ChildComment();
			cmt1.setComment(comment);
			cmt1.setPostDate(current);
			cmt1.setModifiedDate(current);

			cmt1.setMastercomment(p);
			p.getChildComment().add(cmt1);
			dbSession.save(cmt1);
			tx.commit();
			
			CommentsService ser = new CommentsService();
			cmList = ser.getComments();
			System.out.println(cmList);
			
			dbSession.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "success";
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	
}
