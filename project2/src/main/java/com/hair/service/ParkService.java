package com.hair.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.dao.ParkDAO;
import com.hair.vo.SeMessageDTO;

@Service
public class ParkService {

	@Autowired
	private ParkDAO parkDAO;
	
	// 쪽지보내기
	public int insertMailbox(SeMessageDTO seMessageDTO) {
		return parkDAO.insertMailbox(seMessageDTO);
	}

	// 쪽지보내기2
	public int insertMailbox2(SeMessageDTO seMessageDTO) {
		return parkDAO.insertMailbox2(seMessageDTO);
	}
	
	// 받은쪽지함
	public List<SeMessageDTO> mailboxReceive(SeMessageDTO seMessageDTO) {
		return parkDAO.mailboxReceive(seMessageDTO);
	}
	
	// 받은쪽지함 상세보기
	public SeMessageDTO mailboxDetail(SeMessageDTO seMessageDTO) {
		return parkDAO.mailboxDetail(seMessageDTO);
	}
	
	// 보낸쪽지함
	public List<SeMessageDTO> mailboxSend(SeMessageDTO seMessageDTO) {
		return parkDAO.mailboxSend(seMessageDTO);
	}
	
	// 쪽지 삭제
	public int mailboxDelete(SeMessageDTO seMessageDTO) {
	    return parkDAO.mailboxDelete(seMessageDTO);
	}
	
	// 체크박스로 삭제
	public int checkDelete(Integer id) {
	    return parkDAO.checkDelete(id);
	}
	
	// 받은쪽지함 검색
	public List<SeMessageDTO> searchMailboxReceive(Map<String, String> searchParams) {
	    return parkDAO.searchMailboxReceive(searchParams);
	}
	
	// 보낸쪽지함 검색
	public List<SeMessageDTO> searchMailboxSend(Map<String, String> searchParams) {
		return parkDAO.searchMailboxSend(searchParams);
	}
	
	// 받은 총 횟수
	public int receiveTotalcount(SeMessageDTO seMessageDTO) {
		return parkDAO.receiveTotalcount(seMessageDTO);
	}
		
	// 보낸 총 횟수
	public int sendTotalcount(SeMessageDTO seMessageDTO) {
		return parkDAO.sendTotalcount(seMessageDTO);
	}
}