<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" http-equiv="Content-Type">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" href="${path}/">메인</a></li>
			<li class="nav-item"><a class="nav-link" href="${path}/productlist">상품목록</a></li>
			<li class="nav-item"><a class="nav-link" href="${path}/boardlist">게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="${path}/mailboxReceive">쪽지</a></li>


			<c:choose>
				<c:when test="${sessionScope.uid eq null }">
					<li class="nav-item"><a class="nav-link" href="${path}/users/login">로그인</a></li>
				</c:when>

				<c:otherwise>
					<label>${sessionScope.unick}회원님이로그인중입니다.</label>
					<li class="nav-item"><a class="nav-link" href="${path}/logout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</body>
</html>