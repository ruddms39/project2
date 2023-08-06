package com.hair.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardVO {
	
	int bno ; //번호
	String btitle, bdel; //제목
	String bcontent; //내용
	String bwriter; //작성자
	Date regdate; //작성날짜
	Date updatedate; //수정날짜
	int viewcnt; //조회수
	
	
	
	public String getBdel() {
		return bdel;
	}
	public void setBdel(String bdel) {
		this.bdel = bdel;
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "boardVO [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwriter=" + bwriter
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", viewcnt=" + viewcnt + "]";
	}
	
}	