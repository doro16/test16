package com.model2.mvc.service.community;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Post;

public interface CommunityService {
	
	public void addPost(Post post) throws Exception;
	
	public Post getPost(int postNo) throws Exception;
	
	public Map<String, Object>getPostList(Search search) throws Exception;

	public void updatePost(Post post) throws Exception;
	
	public void deletePost(int postNo) throws Exception;
	
	
}
