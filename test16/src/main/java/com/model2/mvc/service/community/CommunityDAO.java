package com.model2.mvc.service.community;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Post;

public interface CommunityDAO {
	
	public void addPost(Post post) throws Exception;
	
	public Post getPost(int postNo) throws Exception;
	
	public List<Post> getPostList(Search search) throws Exception;
	
	public void updatePost(Post post) throws Exception;
	
	public void deletePost(int postNo) throws Exception;
	
	// DAO에만 있음
	public int getTotalCount(Search search) throws Exception ;
	
	
}
