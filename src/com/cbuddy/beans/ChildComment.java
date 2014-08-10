package com.cbuddy.beans;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name = "Child_Comments")
public class ChildComment {
	
	private int childCommentId;
	private String comment;
	private Timestamp postDate;
	private Timestamp modifiedDate;
	private MasterComment mastercomment;
	
	@Id @GeneratedValue
	@Column(name = "COMMENT_ID")
	public int getChildCommentId() {
		return childCommentId;
	}
	public void setChildCommentId(int childCommentId) {
		this.childCommentId = childCommentId;
	}
	
	@Type(type="text")
	@Column(name = "COMMENT")
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Column(name = "POST_DATE")
	public Timestamp getPostDate() {
		return postDate;
	}

	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}

	@Column(name = "MODIFIED_DATE")
	public Timestamp getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	
	@ManyToOne
	@JoinColumn(name = "PARENT_ID", nullable = false)
	public MasterComment getMastercomment() {
		return mastercomment;
	}
	public void setMastercomment(MasterComment mastercomment) {
		this.mastercomment = mastercomment;
	}

}
