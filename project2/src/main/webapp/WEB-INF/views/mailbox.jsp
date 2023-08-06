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
        
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="./js/jquery-3.6.1.min.js"></script>
	<%@ include file="./include/header.jsp" %>

<script>
$(document).ready(function() {
	    //id명
		$("#btn_submit").click(function(){
		
		    // 폼 필드에서 입력 값을 가져옴
		    var title = $("#title").val().trim();
		    var receive = $("#receive").val().trim();
		    var send = $("#send").val().trim();
		    var content = $("#content").val().trim();

		    // 필수 입력 값인지 확인
		    if(title === '') {
		      alert('제목을 입력해주세요.');
		      return false;
		    }
		    if(send === '') {
		      alert('보내는 사람을 입력해주세요.');
		      return false;
		    }
		    
		    if(receive === '') {
			      alert('받는 사람을 입력해주세요.');
			      return false;
			}
		    
		    if(content === '') {
			      alert('내용을 입력해주세요.');
			      return false;
		    }

	    
		    // 모든 유효성 검사를 통과하면 alert 창을 띄웁니다.
	        //alert("성공적으로 발송되었습니다");
	        //document.name명.
	        document.form1.action="${path}/mailbox";
	        
	        document.form1.submit();
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
            <li style="list-style:none;"><a href="${path}/mailbox" style="text-decoration: none;"><button type="button" onclick="writeMsg();" class="msg_write_btn"> 쪽지쓰기 </button></a></li>
            <li style="list-style:none;"><a href="${path}/mailboxReceive"  style="text-decoration: none;">받은쪽지함</a></li>
            <li style="list-style:none;"><a href="${path}/mailboxSend"  style="text-decoration: none;">보낸쪽지함</a></li>
            
            </li>
            </ul>
        </li>
       
     <div class="line"></div>
     </div>
      
           
      <section>
      <!-- 쪽지 보내기 -->
      <div class="w-50" style="position: absolute; left: 300px; top: 120px; ">             	    
      <h3 class="heading">${sessionScope.unick}님의 쪽지보내기</h3><br>
      <p>※실험기능! 바나나 및 구아바 퀄리티 판별※<br> 
      <!-- 파일 업로드에서는 enctype(인코딩타입)을 multipart/form-data로 반드시 설정 -->
	  <form action="fileupload" method="post" enctype="multipart/form-data">
			파일 선택 : <input type="file" name="file"> 
	  <input type="submit" value="이미지 탐지" style="position: absolute;"></form><br>
	   
	  1.파일명은 c1.jpg로 할 것　　2.이미지 탐지 후 새로고침(소요시간 1분내외)　　3.분석한 이미지는 서버에서 삭제하지 않는한 계속 출력됨
	  <img src="resources/assets/img/ret_spring.jpg"/></p><br>
	  
		    <div class="container" style="position: absolute; right:10px;">
		        <form name="form1" action="./mailboxSend" method="post">	       
		        <div class="mb-3" >
				    <i class="fa fa-comment"></i>
				    <label for="title" class="form-label">제목</label>
				    <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title" required="required">
				  </div>
				  <div class="mb-3">
				  	<i class="fa fa-user"></i>
				    <label for="send" class="form-label">보내는 사람</label>
				    <input type="text" class="form-control" id="send" placeholder="보내는 사람 아이디를 입력하세요" name="send" value="${sessionScope.uid }" readonly="readonly">
				  </div>
				  <div class="mb-3">
				   	<i class="fa fa-user"></i>
				    <label for="receive" class="form-label">받는 사람</label>
				    <input type="text" class="form-control" id="receive" placeholder="받는 사람 아이디를 입력하세요" name="receive" required="required">
				  </div>
				  <label for="content">내용</label>
					<textarea class="form-control" rows="5" id="content" name="content" required="required"></textarea>
					<br>
				  <button type="button" id="btn_submit" class="btn btn-primary">쪽지보내기</button>
				  <button type="reset" class="btn btn-danger">취소</button>
		        </form>
			</div>   
	  </div> 	  
      </section>      
</body>
</html>