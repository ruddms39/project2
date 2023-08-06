package com.hair.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hair.dao.CommentDAO;
import com.hair.vo.CommentVO;

@Service
public class CommentService {
@Inject
CommentDAO commentDAO;
	public List<CommentVO> CBList(int bno) {
		return commentDAO.CBList(bno);
	}
	public int CBWrite(CommentVO vo) {
		return commentDAO.CBWrite(vo);
		
	}
	public int CBD(CommentVO vo) {
		return commentDAO.CBD(vo);
	}
	public int CcBW(CommentVO vo) {
		return commentDAO.CcBWrite(vo);
	}
	public int RBC(CommentVO vo) {
		return commentDAO.RBC(vo);
	}
	public CommentVO view(int bno) {
		return commentDAO.view(bno);
	}
	public List<CommentVO> CPList(int pno) {
		return commentDAO.CPList(pno);
	}
	public int CPWrite(CommentVO vo) {
		return commentDAO.CPWrite(vo);
	}
	public int RPC(CommentVO vo) {
		return commentDAO.RPC(vo);
	}
	public int CcPW(CommentVO vo) {
		return commentDAO.CcPWrite(vo);
		
	}
	public int CPD(CommentVO vo) {
		return commentDAO.CPD(vo);
	}

}
