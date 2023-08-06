package com.hair.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hair.vo.CommentVO;

@Repository
public class CommentDAO {
@Inject
SqlSession sqlSession;
	String mapper = "comment.";
	public List<CommentVO> CBList(int bno) {
		return sqlSession.selectList(mapper+"CBL", bno);
	}
	public int CBWrite(CommentVO vo) {
		return sqlSession.insert(mapper+"CBW", vo);
	}
	public CommentVO view(int bno) {
		return sqlSession.selectOne(mapper+"CBL", bno);
	}
	public List<CommentVO> CPList(int pno) {
		return sqlSession.selectList(mapper+"CPL",pno);
	}
	public int CPWrite(CommentVO vo) {
		return sqlSession.insert(mapper+"CPW", vo);
	}
	public int CcPWrite(CommentVO vo) {
		return sqlSession.insert(mapper+"CcPW", vo);
	}
	public int RPC(CommentVO vo) {
		return sqlSession.update(mapper+"RPC", vo);
	}
	public int RBC(CommentVO vo) {
		return sqlSession.update(mapper+"RBC", vo);
		
	}
	public int CBD(CommentVO vo) {
		return sqlSession.delete(mapper+"CBD", vo);
	}
	public int CcBWrite(CommentVO vo) {
		return sqlSession.insert(mapper+"CcBW", vo);
	}
	public int CPD(CommentVO vo) {
		return sqlSession.delete(mapper+"CPD", vo);
	}

}
