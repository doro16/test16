package com.model2.mvc.service.community.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.community.CommunityDAO;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.Post;

@Repository("communityDAOImpl")
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void SqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CommunityDAOImpl() {
		System.out.println(this.getClass());
	}


	public Post getPost(int postNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CommunityMapper.getPost", postNo);
		
	}
	
	public List<Post> getPostList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getPostList", search);

	}

	public void addPost(Post post) throws Exception {
		sqlSession.insert("CommunityMapper.addPost", post);

	}

	public void updatePost(Post post) throws Exception {
		sqlSession.update("CommunityMapper.updatePost", post);

	}

	public void deletePost(int postNo) throws Exception {
		sqlSession.delete("CommunityMapper.deletePost", postNo);

	}
	
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getPostTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getPostTotalCount", search);
	}
	
	public Comment getComment(int commentNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getComment", commentNo);
	}
	
	public List<Comment> getCommentList(int postNo) throws Exception{
		return sqlSession.selectList("CommunityMapper.getCommentList", postNo);
	}
	
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommunityMapper.addComment", comment);
	}
	
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommunityMapper.updateComment", comment);
	}
	
	public void deleteComment(int commentNo) throws Exception {
		sqlSession.delete("CommunityMapper.deleteComment", commentNo);
	}
	
	public int getCommentTotalCount(int postNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getCommentTotalCount", postNo);
	}
	

}
