package com.model2.mvc.web.community;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
		//User user = comment.getUser();
		//comment.setUser(user);
		return comment;
		// Controller는 View Page 리턴 
		// RestController는 객체(VO,DTO) 반환하기만 하면, 객체데이터는 application/json 형식의 HTTP ResponseBody에 직접 작성됨
	}
	
	@RequestMapping(value="/json/getCommentList/{postNo}", method=RequestMethod.GET)
	public Map<String, Object> getCommentList( @PathVariable("postNo") int postNo) throws Exception {
		
		System.out.println("^^^^^^^^"+ "/community/json/getCommentList : GET");
		
		Map<String, Object> map = communityService.getCommentList(postNo);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonManyValue = objectMapper.writeValueAsString(map.get("list"));
		
		List<Comment> list =  objectMapper.readValue(jsonManyValue, new TypeReference<List<Comment>>() {});
		
		for (int i=0; i<list.size(); i++) {
			Comment str = list.get(i);
			System.out.println("000"+str.getUser().getNickname());
		}

		map.put("list", map.get("list"));
		
		return map;
	}
	
	@RequestMapping(value="/json/addComment", method=RequestMethod.POST)
	public void addComment(@RequestBody Map<String, Object> map2,  HttpSession session, Comment comment) throws Exception{
		System.out.println("^^^^^^^^"+ "/community/json/addComment : POST");
		User user = ((User)session.getAttribute("user"));
		comment.setPostNo((int) map2.get("postNo"));
		comment.setCommentContent((String) map2.get("commentContent"));
		comment.setUser(user);
		communityService.addComment(comment);
			
	}
	
	@RequestMapping(value="/json/updateComment/{commentNo}", method=RequestMethod.GET)
	public Comment updateComment(@PathVariable("commentNo") int commentNo) throws Exception{
		System.out.println("^^^^^^^^"+ "/community/json/updateComment 할 거 가져오자");
		Comment comment = communityService.getComment(commentNo);
		
		return comment;
	}
	
	@RequestMapping(value="/json/updateComment", method=RequestMethod.POST)
	public void updateComment(@RequestBody Map<String, Object> map2, HttpSession session, Comment comment) throws Exception{
		System.out.println("updateComment입니다");
		User user = ((User)session.getAttribute("user"));
		comment.setPostNo((int)map2.get("postNo"));
		comment.setCommentContent((String)map2.get("commentContent"));
		comment.setUser(user);
		communityService.updateComment(comment);
	}
	
	
	@RequestMapping(value="/json/deleteComment/{commentNo}", method=RequestMethod.GET)
	public void deleteComment(@PathVariable("commentNo") int commentNo) throws Exception{
		System.out.println("deleteComment입니다");
		
		communityService.deleteComment(commentNo);
	}
	
	
	
	
}
