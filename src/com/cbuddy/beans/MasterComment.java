package com.cbuddy.beans;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;


@Entity
@Table(name = "Master_Comments")
public class MasterComment {
	
	private int commentId;;
	private int postId;
	private String comment;
	private Timestamp postDate;
	private Timestamp modifiedDate;
	private Collection<ChildComment> childComment =  new ArrayList<ChildComment>();
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "COMMENT_ID", unique = true, nullable = false)
	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	
	@Column(name = "POST_ID")
	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = ChildComment.class)
	public Collection<ChildComment> getChildComment() {
		return childComment;
	}

	public void setChildComment(Collection<ChildComment> childComment) {
		this.childComment = childComment;
	}

}
