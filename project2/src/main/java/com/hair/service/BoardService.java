package com.hair.service;

import java.util.List;

import com.hair.vo.BoardVO;

public interface BoardService {
	public int selectCount();

	public void insert(BoardVO vo);

	public BoardVO view(int bno);

	public int update(BoardVO vo);

	public void delete(BoardVO vo);

	public void increaseViewcnt(int bno); // 게시�? 증�?


	public int totalCount(String searchOption, String keyword);

	public List<BoardVO> selectList(BoardVO send);

	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword);

}
