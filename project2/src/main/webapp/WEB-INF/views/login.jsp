<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>로그인</title>
<%@ include file="./include/header.jsp"%>
<script>
	$("document").ready(
		function(){
			$("#btnLogin").click(
				function(){					
					var uid = $("#uid").val(); //id가 userid인 태그의 value값을 읽어온다.
					var upw = $("#upw").val();
					
					if(uid == ""){ //null 값이 없는 상태, "" 내용이 비어 있는 상태
						alert("아이디를 입력하세요.");
						$("#uid").focus(); //focus는 해당태그로 커서를 이동
						return;
					}
					if(upw == ""){
						alert("비밀번호를 입력하세요.");
						$("#upw").focus();
						return;
					}
					if(uid != uid && upw!=upw){
						alert("아이디 또는 비밀번호가 같지 않습니다.")
					}
					document.form1.action = "${path}/loginCheck";
					document.form1.submit(); //action이 있으면 submit 동작
					
				} 	
			);
			
		}		
	);
	
</script>
</head>
<body>

<div class="sidenav">
         <div class="login-main-text">
            <h1>THE JARAM <br> Login Page</h1>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form name="form1" method="post" action="${path}/loginCheck">
                  <div class="form-group">
                     <label>아이디</label>
                     <input type="text" class="form-control" placeholder="아이디" id="uid" name="uid">
                  </div>
                  <div class="form-group">
                     <label>비밀번호</label>
                     <input type="password" class="form-control" placeholder="비밀번호" id="upw" name="upw">
                  </div>
                  <button type="button" id="btnLogin" class="btn btn-black">로그인</button>
                  <div style="float: right; color: #000;">
                  <a type="button" onclick="location.href='${path}/usersmembership'">회원가입</a>
                  </div>
               </form>
            </div>
         </div>
      </div>
</body>
</html>

<style>

@charset "UTF-8";

body {
    font-family: "Lato", sans-serif;
}



.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 100%;
    background-color: #e9e8e6;
    overflow-x: none;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
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
	width : 20%;
    background-color: #000 !important;
    color: #fff;
}
</style>