package com.hair.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hair.dao.AdminDAO;
import com.hair.vo.BoardVO;
import com.hair.vo.ProductVO;
import com.hair.vo.UsersVO;

@Service
public class AdminService {
	@Inject
	AdminDAO adminDAO;


	public List<UsersVO> userAll(UsersVO usersVO, int start, int end, String searchOption, String keyword) {
		return adminDAO.userAll(usersVO, start, end, searchOption, keyword);
	}
	public List<BoardVO> adminBoardList(int start, int end, String searchOption, String keyword) {
		return adminDAO.adminBoardList(start, end, searchOption, keyword);
	}
	public List<ProductVO> adminProductList(int start, int end, String searchOption, String keyword) {
		return adminDAO.adminProductList(start, end, searchOption, keyword);
	}

	public int adminUsersUpdate(UsersVO usersVO) {
		return adminDAO.adminUsersUpdate(usersVO);
	}

	public UsersVO adminUsers(int uno) {
		return adminDAO.adminUsers(uno);

	}
	public BoardVO viewB(int bno) {
		return adminDAO.viewB(bno);
	}

	public int userTotalCnt(String searchOption, String keyword) {
		return adminDAO.userTotalCnt(searchOption, keyword);
	}
	public int totalCountB(String searchOption, String keyword) {
		return adminDAO.totalCountB(searchOption, keyword);
	}

	public int totalCountP(String searchOption, String keyword) {
		return adminDAO.totalCountP(searchOption, keyword);
	}
	public int adminBoardD(BoardVO vo) {
		return adminDAO.adminBoardD(vo);
	}
	public int adminBoardRD(BoardVO vo) {
		return adminDAO.adminBoardRD(vo);
	}




}
