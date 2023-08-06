<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path}/resources/css/mailbox.css" rel="stylesheet"/>
</head>
<body>   

    <div>
	<div class="index_section">     
        <li style="list-style:none;"><h1>쪽지 <i class="far fa-comment-dots"></i></h1>
            <div class="line"></div>
            <ul class="msgComponent">
            <li style="list-style:none;"><a href="${path}/mailbox" style="text-decoration: none;"><button type="button" onclick="writeMsg();" class="msg_write_btn openBtn"> 쪽지쓰기 </button></a></li>
            <li style="list-style:none;"><a href="${path}/mailboxReceive"  style="text-decoration: none;">받은쪽지함</a></li>
            <li style="list-style:none;"><a href="${path}/mailboxSend"  style="text-decoration: none;">보낸쪽지함</a></li>
            
            </li>
            </ul>        
        </li>      
      <div class="line"></div>
    </div>
    
    <div class="messageList">
        <h2 class="msg_title" style="margin:0; text-align:left;">휴지통</h2>
          <div class="megSearchBox" style="float:right">
            <form action="${path}/message/list" method="get">
              <select class="msgSearchList" name="msgSearchList">
                <option value="all">전체</option>
                <option value="name">이름</option>
                <option value="content">내용</option>
              </select>
              <input type="search" placeholder="원하는 검색어를 입력하세요" name="msgSearchText">
              <button type="submit" class="msg_btn_search">검색</button>
            </form>
          </div>

          <div class="msgComponent">
            <button id="msg_delete_btn" name="msgNoList" type="button" class="msg_btn">삭제</button>
            <button type="button" class="msg_btn" onclick="saveSelected();">보관</button>
            <button type="button" class="msg_btn" onclick="readCheck();">미수신</button>
          </div>
            <table class="message_table" style="table-layout: fixed">
            <colgroup>
                <col style="width:5%"/>
                <col style="width:12%"/>
                <col style="width:65%"/>
                <col style="width:18%"/>
            </colgroup>
              <tr>
                <th><input type="checkbox" id="checkAll" onclick="chkAll();"></th>
                <th>보낸사람</th>
                <th colspan="">제목</th>
                <th>날짜</th>
              </tr>          

				<c:forEach var="receive" items="${list}">
				<tr id="msgListTable()">
				<td style="width:50px" ><input type="checkbox" name="msgNoList" value="${message.msgNo1}"></td>
					
                        <td><span class="senderName" id="send">${receive.send}</span></td>
                        <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
                        <a href="/mailboxDetail?msgNo1=${receive.msgNo1}" id="detail">${receive.title}</a></td>
                        <td style="width:20%"><fmt:formatDate value="${receive.regdate}" pattern="yyyy년 MM월 dd일 a hh:mm:ss" timeZone="Asia/Seoul" /></td>
                       
                </tr></c:forEach>
                                       
 
            </div>
     </body>           

</html>