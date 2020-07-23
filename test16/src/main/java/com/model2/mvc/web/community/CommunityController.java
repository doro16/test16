package com.model2.mvc.web.community;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.community.CommunityService;
import com.model2.mvc.service.domain.Post;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;	
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public CommunityController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="getPost", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getPost(@RequestParam("postNo") int postNo) throws Exception {
		
		System.out.println("^^^^^^^^"+ "/community/getPost : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		
		Post post = communityService.getPost(postNo);
		//post.setRegDate(post.getRegDate().replace("-", "")); 
		
		modelAndView.setViewName("/community/getPost.jsp");
		modelAndView.addObject("post", post);
		//System.out.println("toString^^^" + post.toString());
		
		return modelAndView;
	}
	
	@RequestMapping(value="getPostList")
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
		modelAndView.setViewName("/community/getPostList");
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
