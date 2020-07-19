package com.model2.mvc.service.domain;

import java.sql.Date;

import com.model2.mvc.service.domain.*;

/**
 * @author user
 *
 */
public class Post {
	
	private String postType;
	private int postNo;
	private String postName;
	private String postContent; 
	private String postImage; 
	private Date regDate; 
	private String qnaRegType;
	private String qnaCode;
	private String blindCode; 
	private int viewCount;
	private int commentCount; 
	private int reportCount; 
	//private String posterId;
	private User user;
	//private List<Comment> commentList;
	public String getPostType() {
		return postType;
	}
	public void setPostType(String postType) {
		this.postType = postType;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostImage() {
		return postImage;
	}
	public void setPostImage(String postImage) {
		this.postImage = postImage;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getQnaRegType() {
		return qnaRegType;
	}
	public void setQnaRegType(String qnaRegType) {
		this.qnaRegType = qnaRegType;
	}
	public String getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getBlindCode() {
		return blindCode;
	}
	public void setBlindCode(String blindCode) {
		this.blindCode = blindCode;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String toString() {
		return "PostVO º¾½Ã´Ù" + postType + postNo + postName + postContent + postImage +
		regDate + qnaRegType +  qnaCode + blindCode + viewCount + commentCount + reportCount+user;
	}	
	

}