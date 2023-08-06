package com.hair.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hair.dao.usersDAO;
import com.hair.vo.UsersVO;

@Service
public class usersServiceImpl implements usersService {
	
	@Inject
	usersDAO usersdao;

	
	public List<UsersVO> usersList() {
		return usersdao.usersList();
	}
	
	
	public void insertUsers(UsersVO vo) {
		usersdao.insertUsers(vo);

	}

	
	public UsersVO viewUsers(String uid) {
		return usersdao.viewUsers(uid);
	}
	
	
	public void deleteUsers(String uid) {
		usersdao.deleteUsers(uid);
	}

	
	public void updateUsers(UsersVO vo) {
		usersdao.updateUsers(vo);
	}


	
	public boolean loginCheck(UsersVO vo, HttpSession session) {

		boolean result = usersdao.loginCheck(vo);
		if(result) { //정상적인 로그인이면
			//로그인된 회원의 정보를 읽어온다.
			UsersVO vo2 = usersdao.viewUsers(vo.getUid());
			session.setAttribute("uid", vo2.getUid()); //섹션영역에 아이디와 이름을 저장
			session.setAttribute("unick", vo2.getUnick());
			session.setAttribute("role", vo2.getRole());
		}
		return result;
	}

	
	public void logout(HttpSession session) {
		session.invalidate();
		
	}

	
	public boolean checkPw(String uid, String upw) {
		return usersdao.checkPw(uid, upw);
	}
	
	//아이디 중복 체크
	public int idCheck(String uid) {
		int result = usersdao.idCheck(uid);
		return result;
	}


	@Override
	public int nickCheck(String unick) {
		int cnt = usersdao.nickCheck(unick);
		return cnt;
	}
}
