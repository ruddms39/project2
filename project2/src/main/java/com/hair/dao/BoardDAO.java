package com.hair.dao;

import java.util.List;

import com.hair.vo.BoardVO;

public interface BoardDAO {

	public int selectCount();

	public List<BoardVO> selectList(BoardVO send);

	public void insert(BoardVO vo);

	public BoardVO view(int bno);

	public int update(BoardVO vo);

	public void delete(BoardVO vo) ;

	public void increaseViewcnt(int bno);

	public int totalCount(String searchOption, String keyword);

	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword);

}
