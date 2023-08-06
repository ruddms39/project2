package com.hair.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hair.vo.UsersVO;

public interface usersService {
	
	//회원목록
	public List<UsersVO> usersList(); //여러회원의 정보를 조회
	
	//회원등록
	public void insertUsers(UsersVO vo); //한명의 정보를 저장
	
	
	//회원상세(수정시 필요)
	public UsersVO viewUsers(String uid); //한명의 정보를 조회
	
	 
	//회원삭제
	public void deleteUsers(String uid);
	
	//회원수정
	public void updateUsers(UsersVO vo); //한명의 정보를 수정
	
	
	//회원 확인
	public boolean checkPw(String uid, String upw);
	
	//로그인 체크
	public boolean loginCheck(UsersVO vo, HttpSession session);
	
	//로그아웃
	public void logout(HttpSession session);

	//아이디 중복
	public int idCheck(String uid);
	
	//닉네임 중복
	public int nickCheck(String unick);	


}
