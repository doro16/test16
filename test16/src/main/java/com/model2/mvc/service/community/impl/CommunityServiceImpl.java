package com.model2.mvc.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.community.CommunityDAO;
import com.model2.mvc.service.community.CommunityService;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.Post;


@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {
	
	///Field	
	@Autowired 	
	@Qualifier("communityDAOImpl")
	private CommunityDAO communityDAO;
	
	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}
	
	///Constructor
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}


	public Post getPost(int postNo) throws Exception {
		return communityDAO.getPost(postNo);
	}
	
	public Map<String, Object> getPostList(Search search) throws Exception {
		List<Post> list = communityDAO.getPostList(search);
		int totalCount = communityDAO.getPostTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}

	public void addPost(Post post) throws Exception {
		communityDAO.addPost(post);
	}
	
	public void updatePost(Post post) throws Exception {
		communityDAO.updatePost(post);
	}

	public void deletePost(int postNo) throws Exception {
		communityDAO.deletePost(postNo);
	}
	
	public Comment getComment(int commentNo) throws Exception {
		return communityDAO.getComment(commentNo);
	}
	
	public Map<String, Object> getCommentList(int postNo) throws Exception {
		List<Comment> list = communityDAO.getCommentList(postNo);
		int totalCount = communityDAO.getCommentTotalCount(postNo);	// 쓰려면 search필요한가...	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}
	
	public void addComment(Comment comment) throws Exception {
		communityDAO.addComment(comment);
	}
	
	public void updateComment(Comment comment) throws Exception {
		communityDAO.updateComment(comment);
	}
	
	public void deleteComment(int commentNo) throws Exception {
		communityDAO.deleteComment(commentNo);
	}
}
