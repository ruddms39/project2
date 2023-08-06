<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>글 내용 보기</title>
<!-- 공통 파일을 include 폴더에 넣어두고 필요할 때마다 include로 연결해서 사용 -->
<%@ include file="./include/header.jsp"%>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

</head>
<body>
	<%@ include file="./include/menu.jsp"%>
	<!-- 해당 파일 연결 -->

	<section id="services" class="services">
		<div class="container" data-aos="fade-up">
			<h2>회원정보</h2>
			<div class="container m-3 ">
				<form name="form1" method="post" action="${path}/adminUsersUpdate">
					<div class="mb-3">
						<input type="hidden" class="form-control" id="uno" name="uno2" value="${vo.uno }">
					</div>
					<div class="mb-3">
						<label for="uid" class="form-label">회원ID</label> <input type="text" class="form-control" id="uid" name="uid2" value="${vo.uid }" readonly="readonly">
					</div>
					<div class="mb-3">
						<label for="role" class="form-label">회원권한</label> <select name="role2" id="role" value="${vo.role }">
							<option value="${vo.role }" selected>${vo.role }</option>
							<option value="user">user</option>
							<option value="admin">admin</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="unick" class="form-label">닉네임</label> <input type="text" class="form-control" id="unick" name="unick2" value="${vo.unick}" readonly="readonly">
					</div>
					<div class="mb-3">
						<label for="udel" class="form-label">회원상태</label> <select name="udel2" id="udel">

							<option value="${vo.udel}">
								<c:if test="${vo.udel eq '0'}">
									<td>가입회원</td>
								</c:if>
								<c:if test="${vo.udel ne '0'}">
									<td>차단회원</td>
								</c:if>

							</option>
							<option value="0">가입회원</option>
							<option value="1">차단회원</option>
						</select>
					</div>

					<div class="mt-3">
						<button id="btnUp" type="submit" class="btn btn-secondary">수정</button>
					</div>
				</form>
				<form method="post" action="${path }/adminUsersList">
					<div class="d-flex justify-content-end">
						<button class="btn btn-secondary " type="submit" id="btnlist">회원관리로 돌아가기</button>
					</div>
				</form>


				<!-- 댓글 끝 -->
			</div>
		</div>
	</section>

	<%@ include file="./include/footer.jsp"%>

</body>
</html>
