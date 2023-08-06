package com.hair.vo;

import java.util.Date;

public class SeMessageDTO {
	
	//
		private int msgNo1; /* */
		private String title;  /* */
		private String content; /* */
		private String send; /*  */
		private Date regdate; /*  */
		
		//
		private int msgNo2;  /*  */
		//msgNo1 , /*  */
		private String receive;  /* */
		private int confirm; /*  */
		private int startPage;
		private int lastPage;
		
		
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public int getLastPage() {
			return lastPage;
		}
		public void setLastPage(int lastPage) {
			this.lastPage = lastPage;
		}
		public int getMsgNo1() {
			return msgNo1;
		}
		public void setMsgNo1(int msgNo1) {
			this.msgNo1 = msgNo1;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getSend() {
			return send;
		}
		public void setSend(String send) {
			this.send = send;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public int getMsgNo2() {
			return msgNo2;
		}
		public void setMsgNo2(int msgNo2) {
			this.msgNo2 = msgNo2;
		}
		public String getReceive() {
			return receive;
		}
		public void setReceive(String receive) {
			this.receive = receive;
		}
		public int getConfirm() {
			return confirm;
		}
		public void setConfirm(int confirm) {
			this.confirm = confirm;
		}
		
		
		
		
		public SeMessageDTO() {
			super();
		}
		
		@Override
		public String toString() {
			return "SeMessageDTO [msgNo1=" + msgNo1 + ", title=" + title + ", content=" + content + ", send=" + send
					+ ", regdate=" + regdate + ", msgNo2=" + msgNo2 + ", receive=" + receive + ", confirm=" + confirm + "]";
		}
		
		
		public SeMessageDTO(int msgNo1, String title, String content, String send, Date regdate, int msgNo2,
				String receive, int confirm) {
			super();
			this.msgNo1 = msgNo1;
			this.title = title;
			this.content = content;
			this.send = send;
			this.regdate = regdate;
			this.msgNo2 = msgNo2;
			this.receive = receive;
			this.confirm = confirm;
		}
		
		
	   
	 
	
	
}
