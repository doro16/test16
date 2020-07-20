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

	public void addPost(Post post) throws Exception {
		communityDAO.addPost(post);

	}

	public Post getPost(int postNo) throws Exception {
		
		return communityDAO.getPost(postNo);
	}
	
	public Map<String, Object> getPostList(Search search) throws Exception {
		List<Post> list = communityDAO.getPostList(search);
		int totalCount = communityDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}

	

	public void updatePost(Post post) throws Exception {
		communityDAO.updatePost(post);

	}


	public void deletePost(int postNo) throws Exception {
		communityDAO.deletePost(postNo);

	}

}
