package com.hair.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hair.vo.UsersVO;

@Repository
public class usersDAOImpl implements usersDAO {
	
	@Inject
	SqlSession sqlSession;
	String mapper = "usersMapper.";

	@Override
	public List<UsersVO> usersList() {
		return sqlSession.selectList(mapper+"usersList");
	}
	
	
	@Override
	public void insertUsers (UsersVO vo) {
		sqlSession.insert(mapper+"usersInsert", vo);

	}
		
	@Override
	public UsersVO viewUsers(String uid) {
		return sqlSession.selectOne(mapper+"usersView", uid);
	}


	
	@Override
	public void deleteUsers(String uid) {
		sqlSession.delete(mapper+"usersDelete", uid);
	}

	@Override
	public void updateUsers(UsersVO vo) {
		sqlSession.update(mapper+"usersUpdate", vo);
	}
	

	public boolean checkPw(String uid, String upw) {
		boolean result = false; //임의로 결과는 실패로 선언
		//파이썬에서 사전 (키, 값)===>Map
		//VO를 사용하지 않고 여러값을 동시에 전달
		//Map<키데이터형, 값데이터형>
		Map<String, String> map = new HashMap<String, String>();
		map.put("uid", uid); //Map(키이름, 값)에 추가
		map.put("upw", upw);
		
		int count = sqlSession.selectOne(mapper+"checkPw", map); //데이터베이스 처리
		if(count == 1) result = true;
		
		return result;
	}
	
	
	
	@Override
	public boolean loginCheck(UsersVO vo) {
		String name = sqlSession.selectOne(mapper+"loginCheck", vo);
		//return (name == null) ? false : true;
		if(name == null) {
			return false;
		} else {
			return true;
		}
	}
	
	
	@Override
	public void logout(HttpSession session) {
		
	}
	
	@Override
	public int idCheck(String uid) {
		System.out.println("===> Mybatis로 idCheck");
		int result = sqlSession.selectOne(mapper+"idCheck", uid);
		
		return result;
	}


	@Override
	public int nickCheck(String unick) {
		System.out.println("===> Mybatis로 닉네임");
		int cnt = sqlSession.selectOne(mapper+"nickCheck", unick);
		
		return cnt;
	}
	
	

}
