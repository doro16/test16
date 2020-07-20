package com.model2.mvc.service.domain;

import java.sql.Date;

public class Comment {
	
	/// Field
	private int commentNo;
	private String commentContent;
	private String commentImage;
	private Date regDate;
	
	private User user;
	private Post post;
	
	
	/// Constructor
	public Comment() {
		
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public String getCommentContent() {
		return commentContent;
	}


	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}


	public String getCommentImage() {
		return commentImage;
	}


	public void setCommentImage(String commentImage) {
		this.commentImage = commentImage;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Post getPost() {
		return post;
	}


	public void setPost(Post post) {
		this.post = post;
	}
	
	

}
