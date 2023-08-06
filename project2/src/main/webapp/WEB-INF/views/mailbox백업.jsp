<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path}/resources/css/mailbox.css" rel="stylesheet"/>
        
    <link rel="stylesheet" href="./css/list.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="./js/jquery-3.6.1.min.js"></script>
       
    <div>
	<div class="index_section">    
        <li style="list-style:none;"><h1>쪽지 <i class="far fa-comment-dots"></i></h1>
            <div class="line"></div>
            <ul class="msgComponent">
            <li style="list-style:none;"><a href="${path}/mailbox"><button type="button" onclick="writeMsg();" class="msg_write_btn openBtn"> 쪽지쓰기 </a></button></li>
            <li style="list-style:none;"><a href="${path}/mailboxReceive"  style="text-decoration: none;">받은쪽지함</a></li>
            <li style="list-style:none;"><a href="${path}/mailboxSend"  style="text-decoration: none;">보낸쪽지함</a></li>
            <li style="list-style:none;"><a href="${path}/mailboxDelete"  style="text-decoration: none;">휴지통</a></li>
            </li>
            </ul>
        </li>
       
      <div class="line"></div>
      </div>
      
      <div class="modalWrite fade">
    <div class="bg"></div>
    <div class="modalContainer">
      <h2 style="margin-left:18px;">쪽지쓰기 </h2>
        <div class="info">
      	  <input type="hidden" id="msgFrom" name="msgFrom" value="<c:out value="${loginMember.user_no}"/>">
          <label>To : </label> <input type="text" id="memSearchInput" name="userName">
        </div>
        <div style="float:right; padding-right:25px; font-size:12px; margin-top:15px;">
          <span id="writeCnt">0</span>/<span id="writeMax">300</span>
        </div>
        <div class ="write_form">
          <textarea class = "form-control" rows="3" id="msgContent" name ="msgContent" style="overflow: scroll;"></textarea>
        </div>
        <div class ="write_form">
	        <button type="button" id="sendBtn" class ="sendBtn">보내기</button>
	        <button type="button" class ="closeBtn">닫기</button>
        </div>
    </div>
  </div>
      
      <!-- 쪽지 보내기 -->
      <div class="container mt-5">       
       <h3 class="heading">님 쪽지보내기</h3><br>
		      <div >
		        <form action="./mailbox" method="post">
		        <div  class="mb-3">
				    <i class="fa fa-comment"></i>
				    <label for="title" class="form-label">제목</label>
				    <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title" required="required">
				  </div>
				  <div class="mb-3">
				  	<i class="fa fa-user"></i>
				    <label for="send" class="form-label">보내는 사람</label>
				    <input type="text" class="form-control" id="send" placeholder="보내는 사람 아이디를 입력하세요" name="send" >
				  </div>
				  <div class="mb-3">
				   	<i class="fa fa-user"></i>
				    <label for="receive" class="form-label">받는 사람</label>
				    <input type="text" class="form-control" id="receive" placeholder="받는 사람 아이디를 입력하세요" name="receive" required="required">
				  </div>
				  <label for="content">내용</label>
					<textarea class="form-control" rows="5" id="content" name="content" required="required"></textarea>
					<br>
				  <button type="submit" class="btn btn-primary">쪽지보내기</button>
				  <button type="reset" class="btn btn-danger">취소</button>
		        </form>
			</div>
      
		</div> 
           
      </table>
      

</head>
</html>