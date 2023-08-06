package com.hair.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hair.dao.BoardDAO;
import com.hair.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boarddao;
	@Override
	public List<BoardVO> selectList(BoardVO send) {
		// TODO Auto-generated method stub
		return boarddao.selectList(send);
	}

	public void insert(BoardVO vo){
		boarddao.insert(vo);
	}

	public BoardVO view(int bno) {
		return boarddao.view(bno);
	}

	public int update(BoardVO vo) {
		return boarddao.update(vo);
	}


	public void increaseViewcnt(int bno) {
		boarddao.increaseViewcnt(bno);
	}

	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) {
		return boarddao.listAll(start, end, searchOption, keyword);
	}

	@Override
	public int selectCount()  {
		return boarddao.selectCount();
	}


	@Override
	public void delete(BoardVO vo) {
		boarddao.delete(vo);
	}

	@Override
	public int totalCount(String searchOption, String keyword) {
		return boarddao.totalCount(searchOption, keyword);
	}

	
}
