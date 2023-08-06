<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> // 로그인 체크 스크립트
@PostMapping("/idCheck") // 컨트롤러 부분
@ResponseBody
public String idCheck(@RequestParam("id") String id) {
	int result = *Service.idCheck(id);
	return  result+"";
}
@PostMapping("/pwCheck")
@ResponseBody
public String pwCheck(@RequestParam("id") String id ,@RequestParam("pw") String pw) {
	String result = Service.pwCheck(id);
	if(result.equals(pw)){
		String user_del = Service.delCheck(id);
		if(user_del.equals("1")) // 숨김형 삭제 -> 값이 1로 변경 시 삭제된 아이디 취급, 데이터베이스에는 회원정보가 남아있음(관리자계정으로 복구가능)  
			return "-1";
		return "1";
	}
	return "0";
}
    function login_check() {
        $.ajax({
            url: "./idCheck",
            type: 'post',
            data: {"id": $("#loginid").val()},
            dataType: "html",
            success: function (result) {
                if(result == 1){
                    $.ajax({
                        url: "./pwCheck",
                        type: 'post',
                        data: {"id": $("#loginid").val(),"pw": $("#loginpw").val()},
                        dataType: "html",
                        success: function (result) {
                            if(result == 1){
                                document.Frm.action= "./login";
                                document.Frm.submit();
                            }
                            else if(result==-1){
                                alert("계정이 삭제되었습니다.")
                            }
                            else{
                                alert("패스워드가 잘못되었습니다.");
                            }
                        },
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                        }
                    });
                }
                else{
                    alert("아이디가 잘못되었습니다.");
                }


            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
</script>
<script type="text/javascript"> // 암호 체크 부분

@PostMapping("/pwLoad") // 암호변경 체크 부분
@ResponseBody
public String pwCheck(@RequestParam("id") String id){
	String result = *Service.pwCheck(id);
	return result;
}
@PostMapping("/info") // 개인정보 컨트롤러 부분
public String info(*DTO dto,HttpSession session){
	if (session.getAttribute("name") != null || session.getAttribute("id") != null) {
		System.out.println(dto.getUser_pw1());
		*Service.info(dto);
		session.setAttribute("name", dto.getNick_name());
	}
	return "redirect:/";
}
    function check(){
        $.ajax({
            url: "./pwLoad",
            type: "post",
            data: {"id" :$("#del_id").val() },
            dataType: 'html',
            success: function (result){
                var pw = document.getElementById("pw");
                var pw1 = document.getElementById("user_pw1");
                var pw2 = document.getElementById("user_pw2");
                if(pw1.value != pw2.value){
                    alert("변경하신 비밀번호가 일치하지 않습니다.");
                    pw1.value = "";
                    pw2.value = "";
                }
                else if(pw.value != result){
                    alert("기존 비밀번호와 일치하지 않습니다.");
                    pw.value="";
                }
                else if(pw.value == pw1.value){
                    alert("기존 비밀번호와 일치합니다. 다른 비밀번호를 골라주세요");
                }
                else if(pw1.value==pw2.value && pw.value == result){
                    document.Frm_2.action = "./info";
                    document.Frm_2.submit();

                }

            }
        })


    }
</script>
<script type="text/javascript"> // 아이디 삭제시 비밀번호 체크
    function delcheck(){

        $.ajax({
            url: "./pwLoad",
            type: "post",
            data: {"id": $("#userid").val()},
            dataType: 'html',
            success: function (result) {
                var pw = document.getElementById("del_pw");
                if (pw.value != result) {
                    alert("비밀번호가 틀렸습니다.");
                }
                else {
                    document.Frm_3.action = "./deleteUser";
                    document.Frm_3.submit();
                }

            }
        });

    }
</script>
<script type="text/javascript"> // 개인정보 접속시 암호확인
    function pwReturn(){
        $.ajax({
            url: "./pwLoad",
            type: "post",
            data: {"id": $("#show_id").val()},
            dataType: 'html',
            success: function (result) {
                $('input[name=inputValue]').attr('value',result);
            }
        });

    }
</script>
</head>
<body>
	<div class="collapse navbar-collapse d-flex justify-content-around" id="collapsibleNavbar">

		<ul class="navbar-nav">
			<c:choose>
				<c:when test="${sessionScope.id eq null }">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">로그인/가입</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</a></li>
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal2">회원가입</a></li>
						</ul></li>
				</c:when>
				<c:when test="${sessionScope.id ne null }">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">${name}님/정보</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="./logout">로그아웃</a></li>
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal5" onclick="return pwReturn()">개인정보</a></li>
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal4">회원탈퇴</a></li>


							<c:if test="${sessionScope.adminRole eq 'admin' }">
								<li><a class="dropdown-item" href="./admin">관리자페이지</a></li>
							</c:if>

						</ul></li>
				</c:when>
			</c:choose>
		</ul>
	</div>
	<!-- 로그인 모달부분 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form name="Frm" method="post" onsubmit="return false;">
					<div class="modal-body">
						<div class="item">
							<input type="text" placeholder="Your ID" name="user_id" id="loginid" required> <i class="fa fa-user"></i>
						</div>
						<div class="item">
							<input type="password" placeholder="Password" name="user_pw" id="loginpw" required> <i class="fa fa-lock"></i>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button class="btn btn-primary" onclick="return login_check()">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 로그인 모달 끝 -->


	<!-- 회원가입 모달부분 -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form action="./createUser" method="post">
					<div class="modal-body">
						<!-- 폼부분 -->
						<div class="item">
							<input type="text" name="user_id" id="user_id" placeholder="가입하실 ID를 입력해주세요" required> <i class="fa fa-user"></i>
						</div>
						<div class="item">
							<input type="password" name="user_pw" id="user_pw" placeholder="가입하실 Password를 입력해주세요" required> <i class="fa fa-lock"></i>
						</div>
						<div class="item">
							<input type="text" name="nick_name" id="nick_name" placeholder="사용하실 닉네임을 입력해주세요" required> <i class="fa fa-users"></i>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button class="btn btn-primary" type="submit">가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 회원가입 모달 끝 -->

	<!-- 회원정보 모달 -->
	<div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원정보</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="item">
						<input type="text" id="show_id" value="${id}" readonly> <i class="fa fa-user"></i>
					</div>
					<div class="item">
						<input type="password" value="" name="inputValue" readonly> <i class="fa fa-lock"></i>
					</div>
					<div class="item">
						<input type="text" value="${name}" readonly> <i class="fa fa-users"></i>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3">회원정보수정하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원정보 모달 -->
	<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원정보수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form name="Frm_2" method="post" onsubmit="return false;">
					<div class="modal-body">
						<!-- 폼부분 -->
						<div class="item">
							<input type="hidden" name="user_id" id="userid" value="${id}" required>
						</div>
						<div class="item">
							<input type="password" name="user_pw" id="pw" placeholder="기존 Password를 입력해주세요" required> <i class="fa fa-lock"></i>
						</div>
						<div class="item">
							<input type="password" name="user_pw1" id="user_pw1" placeholder="변경하실 Password를 입력해주세요" required> <i class="fa fa-lock"></i>
						</div>
						<div class="item">
							<input type="password" name="user_pw2" id="user_pw2" placeholder="변경하실 Password를 다시 입력해주세요" required> <i class="fa fa-lock"></i>
						</div>
						<div class="item">
							<input type="text" name="nick_name" id="nick_name" placeholder="변경하실 닉네임을 입력해주세요" value="${name}" required> <i class="fa fa-users"></i>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button class="btn btn-primary" onclick="return check()">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 회원정보 모달 끝-->

	<!-- 회원탈퇴 모달 -->
	<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- 폼부분 -->
					<form name="Frm_3" method="post" onsubmit="return false">
						<div class="item">
							<input type="hidden" name="user_id" id="del_id" value="${id}" required>
						</div>
						<div class="item">
							<input type="password" name="user_pw" id="del_pw" placeholder="계정을 삭제하시려면 비밀번호를 입력해주세요" required> <i class="fa fa-lock"></i>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button class="btn btn-primary" onclick="return delcheck()">수정하기</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 회원탈퇴 모달 끝-->
</body>
</html>