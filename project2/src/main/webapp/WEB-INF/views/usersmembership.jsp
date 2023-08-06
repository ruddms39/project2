<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 명령어 대체 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 국가별 설정 -->	
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 스크립트 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1"><!--반응형웹-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<title>회원가입</title>
<%@ include file="./include/header.jsp"%>
<!-- 해당파일을 연결 -->
<script>
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("gender");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	$("document").ready(function() {
		$("#Btnsubmit").click(function() {
			var uname = $("#uname").val(); //id가 userid인 태그의 value값을 읽어온다.
			var uid = $("#uid").val();
			var upw = $("#upw").val();
			var upw2 = $("#upw2").val();
			var unick = $("#unick").val();
			var uphone = $("#uphone").val();
			var gender = $("#gender").val();
			var ubday = $("#ubday").val();
		
			
			let num = /[0-9]/g;
			let eng = /[a-zA-Z]/g;
			let kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
			let spe = /[`~!@@#$%^&*|₩₩₩''₩"";:₩/?]/g;

			if(uname == ""){ //null 값이 없는 상태, "" 내용이 비어 있는 상태
				alert("이름을 입력해주세요");
				$("#uname").focus(); //focus는 해당태그로 커서를 이동
				return;
			}
			if((uid == "") || (spe.test(uid)) || (kor.test(uid))){
				alert("아이디는 영문, 숫자만 사용 가능합니다.");
				$("#uid").focus();
				return;
			}
			if((uid.length < 6) || (uid.length > 20)){
				alert("아이디를 6~20자 이내로 입력해주세요.");
				$("#uid").focus(); 
				return;
			}
			if(idcheck == "N"){
				alert("아이디 중복확인을 해주세요.");
				return;
			}
			if((upw == "") || (spe.test(upw) == "") || (num.test(upw)=="") ){
				alert("비밀번호는 영문, 숫자, 특수문자를 사용해야합니다.");
				$("#upw").focus();
				return;
			}
			if((upw.length > 10) || (upw.length < 20)){
				alert("비밀번호는 10~20자 이내로 입력해주세요.");
				$("#upw").focus();
				return;
			} 
			if(upw != upw2){
				alert("비밀번호가 다릅니다. 다시 확인하여 입력해주세요.");
				$("#upw2").focus();
				return;
			}
			if(unick == ""){ //null 값이 없는 상태, "" 내용이 비어 있는 상태
				alert("닉네임을 입력해주세요");
				$("#uncik").focus(); //focus는 해당태그로 커서를 이동
				return;
			}
			if(nickcheck == "N"){
				alert("닉네임 중복확인을 해주세요.");
				return;
			}
			if(uphone == ""){ //null 값이 없는 상태, "" 내용이 비어 있는 상태
				alert("전화번호를 입력해주세요");
				$("#uphone").focus(); //focus는 해당태그로 커서를 이동
				return;
			}
			if(uphone.length != 11){
				alert("정확한 번호를 입력해주세요.")
				return;
			}
			
			if(gender == 0) {
				alert("성별을 선택하세요")
				return;
			}
		
			if(ubday == ""){ //null 값이 없는 상태, "" 내용이 비어 있는 상태
				alert("생년월일을 입력해주세요");
				$("ubday").focus(); //focus는 해당태그로 커서를 이동
				return;
			}


			document.form1.action = "${path}/usersinsert";
			document.form1.submit(); //action이 있으면 submit 동작
			
		} 	
		
	);
	
}		
);
	$(document).ready(function(e){
		$('#idcheck').click(function(){
	
			$.ajax({
				url: "${path}/idCheck",
				type: "GET",
				data:{
					"uid":$('#uid').val()
				},dataType : 'json',
				success: function(result){
					if(result == 0 && $.trim($('#uid').val()) != ''){
						
						$("#idcheck").attr("value", "Y");
						var html="<span style='color: green'>사용가능한 아이디입니다.</span>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
						
					}else{
						var html="<span style='color: red'>사용할수없는 아이디입니다.</span>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
						
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});
		
	});
	$(document).ready(function(e){
		
		$('#nickcheck').click(function(){
			
			$.ajax({
				url: "${path}/nickCheck",
				type: "GET",
				data:{
					"unick":$('#unick').val()
				},dataType : 'json',
				success: function(cnt){
					if(cnt == 0 && $.trim($('#unick').val()) != '' ){
						$("#nickcheck").attr("value", "Y");
						
						var html="<span style='color: green'>사용가능한 닉네임입니다,</span>";
						$('#nickCheck').empty();
						$('#nickCheck').append(html);
						
						
						
					}else{
						var html="<span style='color: red'>사용불가능한 닉네임입니다.</span>";
						$('#nickCheck').empty();
						$('#nickCheck').append(html);
						
						
						
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});
		
	});
</script>

</head>
<body>

<div class="sidenav">
 <div class="login-main-text">
    <h1>THE JARAM <br> Register Page</h1>
    <p>Login or register from here to access.</p>
 </div>
</div> 
       <div class="main">
			<form name="form1" method="post" action="${path}/usersinsert">
			<div class="col-md-7 col-sm-15">
			<h2>회원가입</h2> 
			<br>
                          <div class="form-group">
                          	이름
                              <input type="text" class="form-control" placeholder="이름 *" id="uname" name="uname" >
                          </div>
                          
						<div class="form-group">	
						아이디
                          <div class="input-group">
							  <input type="text" class="form-control" placeholder="아이디(6~20자) *" id="uid" name="uid" />
							  <div class="input-group-append">
							    <button class="idcheck" type="button" id="idcheck" value="N">중복확인</button>
							  </div>
						 </div>
						 <span id="idCheck"></span>
						 </div>

                          <div class="form-group">
                          	비밀번호
                              <input type="password" maxlength="20" class="form-control" placeholder="비밀번호 *" id="upw" name="upw">
                          </div>

                          <div class="form-group">
                          	비밀번호 확인
                              <input type="password" class="form-control" placeholder="비밀번호 확인*" id="upw2" name="upw2" >
                          </div>
                          
                          <div class="form-group">	
						닉네임
                          <div class="input-group">
							  <input type="text" class="form-control" placeholder="닉네임 *" id="unick" name="unick" />
							  <div class="input-group-append">
							    <button class="nickcheck" type="button" id="nickcheck" value="N">중복확인</button>
							  </div>
						 </div>
						 <span id="nickCheck"></span>
						 </div>
                                                           
                          <div class="form-group">
                          	전화번호
                              <input type="tel" class="form-control" placeholder="전화번호 *" id="uphone" name="uphone" >
                          </div>
                          <div class="form-group">
                          	생년월일	
								<input type="date" class="form-control" id="ubday"  name="ubday">
               		   </div>
                          <div class="form-group">
                              <div class="maxl">
                                  <label class="radio inline">
                                      <input type="checkbox" name="gender" value="남자" onclick="doOpenCheck(this);">
                                      <span> 남자 </span> 
                                  </label>
                                  <label class="radio inline"> 
                                      <input type="checkbox" name="gender" value="여자" onclick="doOpenCheck(this);">
                                      <span>여자 </span> 
                                  </label>
                              </div>
                          </div>
                      </div>
                   </form>
                  <button type="button" id="Btnsubmit" class="btn btn-black">확인</button>
                  </div>
</body>
</body>
</html>

<style>
@charset "UTF-8";
body {
font-family: "Lato", sans-serif;
}



.main-head{
height: 200px;
background: #FFF;

}

.sidenav {
height: 100%;
background-color: #e9e8e6;
overflow-x: hidden;
padding-top: 20px;
}


.main {
padding: 130px 120px;
}

@media screen and (max-height: 450px) {
.sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
.login-form{
margin-top: 10%;
}

.register-form{
margin-top: 10%;
}
}

@media screen and (min-width: 768px){
.main{
margin-left: 40%; 
}

.sidenav{
width: 40%;
position: fixed;
z-index: 1;
top: 0;
left: 0;
}

.login-form{
margin-top: 70%;
}

.register-form{
margin-top: 20%;
}
}


.login-main-text{
margin-top: 25%;
padding: 200px;
color: #000;
}

.login-main-text h2{
font-weight: 300;
}

.btn-black{
background-color: #000 !important;
color: #fff;
}
</style>