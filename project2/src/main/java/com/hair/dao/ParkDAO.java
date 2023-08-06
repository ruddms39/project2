package com.hair.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hair.vo.SeMessageDTO;

@Repository
public class ParkDAO {
	
	@Autowired
	private SqlSession sqlSession;	
	
	// 쪽지보내기
	public int insertMailbox(SeMessageDTO seMessageDTO) {
		return sqlSession.insert("park.insertMailbox", seMessageDTO);
	}

	// 쪽지보내기2
	public int insertMailbox2(SeMessageDTO seMessageDTO) {
		return sqlSession.insert("park.insertMailbox2", seMessageDTO);
	}
	
	// 받은쪽지함
	public List<SeMessageDTO> mailboxReceive(SeMessageDTO seMessageDTO) {
		return sqlSession.selectList("park.mailboxReceive", seMessageDTO);
	}
	
	// 받은쪽지함 상세보기
	public SeMessageDTO mailboxDetail(SeMessageDTO seMessageDTO) {
		return sqlSession.selectOne("park.mailboxDetail", seMessageDTO);
	}
	
	// 보낸쪽지함
	public List<SeMessageDTO> mailboxSend(SeMessageDTO seMessageDTO) {
		return sqlSession.selectList("park.mailboxSend", seMessageDTO);
	}
	
	// 쪽지 삭제
	public int mailboxDelete(SeMessageDTO seMessageDTO) {
	    return sqlSession.delete("park.mailboxDelete", seMessageDTO);
	}
	// 체크박스로 삭제
	public int checkDelete(Integer id) {
	    return sqlSession.delete("park.checkDelete", id);
	}
	
	// 받은쪽지함 검색
	public List<SeMessageDTO> searchMailboxReceive(Map<String, String> searchParams) {
	    return sqlSession.selectList("park.searchMailboxReceive", searchParams);
	}	
	
	// 보낸쪽지함 검색
	public List<SeMessageDTO> searchMailboxSend(Map<String, String> searchParams) {
		return sqlSession.selectList("park.searchMailboxSend", searchParams);
	}
	
	// 받은 총 횟수
	public int receiveTotalcount(SeMessageDTO seMessageDTO) {
		return sqlSession.selectOne("park.receiveTotalcount", seMessageDTO);
	}

	// 보낸 총 횟수
	public int sendTotalcount(SeMessageDTO seMessageDTO) {
		return sqlSession.selectOne("park.sendTotalcount", seMessageDTO);
	}
	
}
