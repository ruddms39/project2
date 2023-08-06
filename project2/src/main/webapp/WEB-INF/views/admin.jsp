<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<%@ include file="./include/header.jsp"%>

<head>
<meta charset="UTF-8">
<title>관리자페이지</title>

</head>
<body>
	<%@ include file="./include/menu.jsp"%>

	<c:choose>
		<c:when test="${sessionScope.role eq 'admin'}">
			<div class="container mt-5 mb-5">
				<h1 class="heading">${sessionScope.unick }님의 관리자페이지</h1>
				<br>
				<div class="main">
					<div class="article">
						<div class="boxs">
							<div class="box" style="background-color: #2dB400;" onclick="location.href='${path}/adminUsersList'">
								회원관리
								<div id="comment">회원을 관리합니다</div>
							</div>
							<div class="box" style="background-color: #DD3343;" onclick="location.href='${path}/adminProductList'">
								상품관리
								<div id="comment">상품을 관리합니다</div>
							</div>
							<div class="box" style="background-color: #FEBC00;" onclick="location.href='${path}/adminBoardList'">
								게시판관리
								<div id="comment">게사판을 관리합니다</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>





	<%@ include file="./include/footer.jsp"%>
</body>
</html>