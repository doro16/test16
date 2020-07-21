package com.model2.mvc.service.community;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.Post;

public interface CommunityDAO {
	
	// post
	public void addPost(Post post) throws Exception;
	
	public Post getPost(int postNo) throws Exception;
	
	public List<Post> getPostList(Search search) throws Exception;
	
	public void updatePost(Post post) throws Exception;
	
	public void deletePost(int postNo) throws Exception;
	
	// DAO에만 있음
	public int getPostTotalCount(Search search) throws Exception ;
	
	
	// comment
	public void addComment(Comment comment) throws Exception;
	
	public Comment getComment(int commentNo) throws Exception;
	
	public List<Comment> getCommentList(int postNo) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(int commentNo) throws Exception;
	
	// DAO에만 있음
	public int getCommentTotalCount(int postNo) throws Exception;
}
