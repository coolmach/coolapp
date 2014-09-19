package com.cbuddy.common.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.cbuddy.beans.MasterComment;
import com.cbuddy.posts.services.CommentsService;
import com.opensymphony.xwork2.ActionSupport;

public class CommentsAction extends ActionSupport implements SessionAware, ServletRequestAware {

	private String postId;
	private String comment;
	private String commentId;
	private List<MasterComment> cmList = new ArrayList<MasterComment>();

	private HttpServletRequest request = null;
	private Map<String,Object> session;

	public String postComment(){

		CommentsService ser = new CommentsService();
		System.out.println(postId);
		ser.postComment(Integer.parseInt(postId),comment);
		cmList = ser.getComments(Integer.parseInt(postId));

		return "success";
	}

	public String postChildComment(){

			CommentsService ser = new CommentsService();
			ser.postChildComment(Integer.parseInt(postId),comment,Integer.parseInt(commentId));
			cmList = ser.getComments(Integer.parseInt(postId));

		return "success";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public List<MasterComment> getCmList() {
		return cmList;
	}

	public void setCmList(List<MasterComment> cmList) {
		this.cmList = cmList;
	}

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
}
