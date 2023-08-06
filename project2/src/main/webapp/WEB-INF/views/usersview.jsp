<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<!-- CSS에서 id(#), class(.) 사용 -->
<%@ include file="./include/header.jsp" %> <!-- 해당파일을 연결 -->
<!-- 스크립트(Javascript-DOM, ajax, json) -->
<script>
	//현재 문서의 정보를 수집
	$("document").ready(		
		function() { //메소드 생성
			//btnUpdate id를 가지고 있는 버튼을 클릭했을 때
			$("#btnUpdate").click(					
				function(){
					//제약조건(대화상자-예(참,true),아니오(거짓,false))
					if(confirm("수정하시겠습니까?")) {
						//메세지창 alert("aa") - if ~ else ~ 사용할 때 정확한 처리위치 확인
						//문서에 form1 id에 action을 지정
						document.form1.action = "${path}/usersupdate";
						//form1 id를 submit 처리
						document.form1.submit();
					}
				}
			
			);
		}	
	);
	$("document").ready(		
			function() { //메소드 생성
				//btnUpdate id를 가지고 있는 버튼을 클릭했을 때
				$("#btnDelete").click(					
					function(){
						if(confirm("삭제하시겠습니까?")) {
							//메세지창 alert("aa") - if ~ else ~ 사용할 때 정확한 처리위치 확인
							//문서에 form1 id에 action을 지정
							document.form1.action = "${path}/usersdelete";
							//form1 id를 submit 처리
							document.form1.submit();
						}
					}
				
				);
			}	
		);	
</script>

</head>
<body>

<%@ include file="./include/menu.jsp" %> <!-- 해당파일을 연결 -->
<div class="container mt-5">
<h2>회원 상세폼</h2>
<form name="form1" method="post"> <!-- member_list에서 member/write사용(get) -->
	<table border="1" width="500px">
		<tr>
			<td>이름</td>
			<td><input  type="text" name="uname" value="${dto.uname}" readonly> </td>	 		
		</tr>
		<tr><td></td></tr>	
		<tr>
			<!-- 중요한 내용으로 노출을 피할 때는 type=hidden -->
			<td>아이디</td><!-- 기본키 - 구분하는 키, 반드시 데이터베이스 설계 1개이상 존재 -->
			<td><input type="text" name="uid" value="${dto.uid}" readonly ></td>		
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="upw" value="${dto.upw}"></td>			
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="unick" value="${dto.unick}"></td>			
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="tel" name="uphone" value="${dto.uphone}"></td>			
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" name="gender" value="${dto.gender}" readonly></td>			
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<fmt:formatDate value="${dto.ubday}" pattern="yyyy-MM-dd"/>
			</td>			
		</tr>	
		<tr>
			<td>가입날짜</td>
			<td>
				<!-- 모양에 맞춰서 출력 -->
				<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/>
			</td>			
		</tr>	
		
		<!-- form1개로 여러작업을 동시에 구현할 때는 submit사용(X)->javascript, ajax, JSON -->
		<!-- javascript,ajax,JSON은 사용시 반드시 id를 선언 -->
		<tr>
			<td colspan="2">
				<input type="button" id="btnUpdate" value="수정">
				<input type="button" id="btnDelete" value="회원탈퇴">
				<div style="color:red">
					${message}
				</div>
			</td>
			
		</tr>			
	</table>
</form>
</div>
	<%@ include file="./include/footer.jsp"%>
</body>
</html>