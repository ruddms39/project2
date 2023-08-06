package com.hair.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hair.vo.BoardVO;
import com.hair.vo.ProductVO;
import com.hair.vo.UsersVO;

@Repository
public class AdminDAO {
	@Inject
	SqlSession sqlSession;
	String mapper = "admin.";
	public List<UsersVO> userAll(UsersVO usersVO, int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usersVO", usersVO);
		map.put("start", start);
		map.put("end", end);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectList(mapper+"listU", map);
	}
	public int userTotalCnt(String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne(mapper+"totalCountU", map);
	}
	public int adminUsersUpdate(UsersVO usersVO) {
		return sqlSession.update(mapper+"update", usersVO);
	}
	public UsersVO adminUsers(int uno) {
		return sqlSession.selectOne(mapper+"listOne", uno);
		
	}
	public List<BoardVO> adminBoardList(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSession.selectList(mapper + "listB", map);
	}
	public int totalCountB(String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne(mapper+"totalCountB", map);
	}
	public BoardVO viewB(int bno) {
		return sqlSession.selectOne(mapper + "viewB", bno);
	}
	public List<ProductVO> adminProductList(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSession.selectList(mapper + "listP", map);
	}
	public int totalCountP(String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne(mapper+"totalCountP", map);
	}
	public int adminBoardD(BoardVO vo) {
		return sqlSession.update(mapper+"delete", vo);
	}
	
	public int adminBoardRD(BoardVO vo) {
		return sqlSession.update(mapper+"redelete", vo);
	}
}
