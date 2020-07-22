package com.model2.mvc.web.community;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.model2.mvc.service.community.CommunityService;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;



@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;	
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public CommunityRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value="/json/getComment/{commentNo}", method=RequestMethod.GET)
	public Comment getComment( @PathVariable("commentNo") int commentNo) throws Exception {
		
		System.out.println("^^^^^^^^"+ "/community/json/getComment : GET");
		
		Comment comment = communityService.getComment(commentNo);
		
		return comment;
		// Controller는 View Page 리턴 
		// RestController는 객체(VO,DTO) 반환하기만 하면, 객체데이터는 application/json 형식의 HTTP ResponseBody에 직접 작성됨
	}
	
	@RequestMapping(value="/json/getCommentList/{postNo}", method=RequestMethod.GET)
	public Map<String, Object> getCommentList( @PathVariable("postNo") int postNo) throws Exception {
		
		System.out.println("^^^^^^^^"+ "/community/json/getCommentList : GET");
		
		Map<String, Object> map = communityService.getCommentList(postNo);
		
		map.put("list", map.get("list"));
		return map;
		// Controller는 View Page 리턴 
		// RestController는 객체(VO,DTO) 반환하기만 하면, 객체데이터는 application/json 형식의 HTTP ResponseBody에 직접 작성됨
	}
	
	@RequestMapping(value="/json/addComment", method=RequestMethod.POST)
	public void addComment(@ModelAttribute Comment comment, HttpSession session) throws Exception{
		User user = ((User)session.getAttribute("user"));
		comment.setUser(user);
		communityService.addComment(comment);
		
		
	}
	
	 
	/* 
	 * 
	 * 
	@RequestMapping(value="/json/getComment/{commentNo}", method=RequestMethod.GET)
	public ModelAndView getComment(@RequestParam("commentNo") int commentNo) throws Exception {
		System.out.println("^^^^^^^^"+ "/community/json/getComment : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		
		Comment comment = communityService.getComment(commentNo);
		
		modelAndView.setViewName("/community/comment.jsp");
		modelAndView.addObject("comment", comment);
		
		return modelAndView;
	}
	
	 * @RequestMapping(value="getPostList")
	public ModelAndView getPostList(@ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("^^^^^^^"+ "/community/getPostList");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		
		Map<String, Object> map = communityService.getPostList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),
									((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(resultPage);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("totalCount", map.get("totalCount"));
		modelAndView.setViewName("/community/getPostList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addPost", method=RequestMethod.GET)
	public String addPost() throws Exception {
		
		return "redirect:/community/addPost.jsp";
	}
	
	@RequestMapping(value="addPost", method=RequestMethod.POST)
	public ModelAndView addPost(@ModelAttribute("post") Post post, HttpSession session) throws Exception {
		System.out.println("^^^^^^^"+ "/community/addPost");
		
		User user = ((User)session.getAttribute("user"));
		post.setUser(user);
		ModelAndView modelAndView = new ModelAndView();
		communityService.addPost(post);
		modelAndView.addObject("post", post);
		modelAndView.setViewName("/community/getPostList.jsp");
		
		return modelAndView;
	}					 
	
	@RequestMapping(value="updatePost", method=RequestMethod.GET)
	public ModelAndView updatePost(@RequestParam("postNo") int postNo) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		Post post = communityService.getPost(postNo);
		modelAndView.addObject("post", post);
		modelAndView.setViewName("/community/updatePost.jsp");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="updatePost", method=RequestMethod.POST)
	public ModelAndView updatePost(@ModelAttribute("post") Post post) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		communityService.updatePost(post);
		//int postNo = post.getPostNo();
		modelAndView.setViewName("/community/getPost.jsp");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="deletePost", method=RequestMethod.GET)
	public ModelAndView deletePost(@RequestParam("postNo") int postNo) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		communityService.deletePost(postNo);
		modelAndView.setViewName("/community/getPostList");
		
		return modelAndView;
	}
	 
	  */
	
	
	
	
}
