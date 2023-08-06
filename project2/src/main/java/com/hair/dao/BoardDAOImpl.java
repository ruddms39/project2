package com.hair.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hair.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String mapper = "boardMapper.";
	
	@Override
	public List<BoardVO> selectList(BoardVO send){		
		return sqlSession.selectList(mapper + "selectList", send);
	}

	@Override
	public void insert(BoardVO vo) {
		sqlSession.insert(mapper + "insert", vo);
	}
	
	@Override
	public BoardVO view(int bno)  {
		return sqlSession.selectOne(mapper + "view", bno);
	}

	@Override
	public int update(BoardVO vo) {
		return sqlSession.update(mapper + "update", vo);
	}

	
	@Override
	public void increaseViewcnt(int bno)  {
		sqlSession.update(mapper + "increaseViewcnt", bno); 
	}

	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSession.selectList(mapper + "listAll", map);
	}

	@Override
	public int selectCount()  {
		return sqlSession.selectOne(mapper + "selectCount");
	}

	@Override
	public int totalCount(String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne(mapper+"totalCount", map);
	}

	@Override
	public void delete(BoardVO vo) {
		sqlSession.update(mapper+"delete", vo);
		
	}

	
}