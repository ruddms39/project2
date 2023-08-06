<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<%@ include file="./include/header.jsp" %>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${path}/resources/css/mailbox.css" rel="stylesheet" />

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const deleteBtn = document.getElementById('btn_delete');
        deleteBtn.addEventListener('click', function (event) {
            event.preventDefault();
            const confirmation = confirm('정말로 삭제하시겠습니까?');
            if (confirmation) {
                const deleteForm = document.getElementById('delete_form');
                deleteForm.submit();
            }
        });
    });
</script>
</head>

<body>
<%@ include file="./include/menu.jsp" %>
<!-- 왼쪽 메뉴 -->
<div>
	<div class="index_section" style="background-color:#E8F5FF; position: absolute;">
        <li style="list-style:none;"><h1>쪽지</h1>
            <div class="line"></div>
            <ul class="msgComponent">
            <li style="list-style:none;"><a href="${path}/mailbox" style="text-decoration: none;"><button type="button" onclick="writeMsg();" class="msg_write_btn openBtn"> 쪽지쓰기 </button></a></li>
            <li style="list-style:none;"><a href="${path}/mailboxReceive"  style="text-decoration: none;">받은쪽지함</a></li>
            <li style="list-style:none;"><a href="${path}/mailboxSend"  style="text-decoration: none;">보낸쪽지함</a></li>
            
            </li>
            </ul>
        </li>

		<!-- 메인페이지 뷰 -->
		<div class="line"></div>
	</div>
	<div class="messageList">
		<h2 class="msg_title" style="margin: 0; text-align: left; font-family: RIDIBatang;">쪽지상세내용</h2>
		<form id="delete_form" action="${path}/mailboxDelete" method="post">
		
		<div class="msgComponent">
			<button type="button" id="btn_delete" class="msg_btn">삭제</button>		
			<a href="${path}/mailbox" style="text-decoration: none;"><button type="button" class="msg_btn" onclick="saveSelected();">답장</button></a>			
    		<input type="hidden" name="msgNo1" value="${detail.msgNo1}"/>   								
		</div>
				
		<table class="message_table" style="table-layout: fixed">
			<input type="hidden" value="${detail.msgNo1 }"/>	
			<th colspan="">${detail.title}</th>
			<tr id="msgListTable()">
				<td style="text-overflow: ellipsis;">${detail.content}</td>				
		</table>
	</div>
</div>
<%@ include file="./include/footer.jsp" %>
</body>
</html>
