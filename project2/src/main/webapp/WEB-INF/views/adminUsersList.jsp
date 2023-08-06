<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<%@ include file="./include/header.jsp"%>
<style>
.page-link {
	color: #000;
	background-color: #fff;
	border: 1px solid #ccc;
}

.page-item.active .page-link {
	z-index: 1;
	color: #555;
	font-weight: bold;
	background-color: #f1f1f1;
	border-color: #ccc;
}

.page-link:focus, .page-link:hover {
	color: #000;
	background-color: #fafafa;
	border-color: #ccc;
}
</style>

<head>
<meta charset="UTF-8">
<title>회원관리</title>

</head>
<body>
	<%@ include file="./include/menu.jsp"%>
	<div class="container mt-5 mb-5" data-aos="fade-up">
		<h1 class="text-center mt-5">회원목록</h1>
		<!-- 게시물 목록 -->
		<table class="table table-hover  mt-5 mb-5">
			<thead class="table-secondary">
				<tr>
					<th>회원번호</th>
					<th>회원아이디</th>
					<th>회원권한</th>
					<th>닉네임</th>
					<th>연락처</th>
					<th>생일</th>
					<th>성별</th>
					<th>등록일</th>
					<th>회원상태</th>

				</tr>
			</thead>
			<!-- count : ${count} -->
			<tbody>
				<c:forEach var="row" varStatus="status" items="${user}">
					<c:choose>
						<c:when test="${sessionScope.role eq 'admin'}">
							<tr onclick="location.href='${path}/adminUser?uno=${row.uno}'" style="cursor: pointer;">
								<td>${row.uno}</td>
								<td>${row.uid}</td>
								<td>${row.role}</td>
								<td>${row.unick}</td>
								<td>${row.uphone}</td>
								<td>${row.ubday}</td>
								<td>${row.gender}</td>
								<td>${row.regdate}</td>
								<c:if test="${row.udel eq '0'}">
									<td>[가입회원]</td>
								</c:if>
								<c:if test="${row.udel ne '0'}">
									<td>[차단회원]</td>
								</c:if>
							</tr>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
		<form action="${path}/adminUsersList" name="searchPageForm" method="get">

			<nav aria-label="Search results pages">
				<ul class="pagination justify-content-center text-secondary">
					<c:if test="${pager.curBlock > 1}">
						<li class="page-item"><a class="page-link" href="${path}adminUsersList?searchOption=all&keyword=${keyword}&curPage=1">처음</a></li>
					</c:if>
					<c:if test="${pager.curBlock > 1}">
						<li class="page-item"><a class="page-link" href="${path}adminUsersList?searchOption=all&keyword=${keyword}&curPage=${pager.prevPage}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="num" begin="${pager.blockBegin}" end="${pager.blockEnd}">
						<c:choose>
							<c:when test="${num eq pager.curPage}">
								<li class="page-item active"><a class="page-link" href="${path}adminUsersList?searchOption=all&keyword=${keyword}&curPage=${num}">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${path}adminUsersList?searchOption=all&keyword=${keyword}&curPage=${num}">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pager.curBlock <= pager.totBlock}">
						<li class="page-item"><a class="page-link" href="${path}adminUsersList?searchOption=all&keyword=${keyword}&curPage=${pager.nextPage}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<c:if test="${pager.curBlock <= pager.totBlock}">
						<li class="page-item"><a class="page-link" href="${path}adminUsersList?searchOption=all&keyword=${keyword}&curPage=${pager.totPage}">끝</a></li>
					</c:if>
				</ul>
			</nav>


			<div class="d-flex justify-content-center mb-5">
				<table>
					<tr>
						<td><select class="form-select" id="searchOption" name="searchOption">
								<option value="all" ${searchOption == 'all' ? 'selected' : ''}>모두검색</option>
								<option value="uid">아이디</option>
								<option value="unick">닉네임</option>
						</select></td>
						<td><input class="form-control" name="keyword" id="keyword" /></td>
						<td>
							<button class="btn btn-outline-info " type="submit">검색</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<form method="post" action="${path }/">
			<div class="d-flex justify-content-end mt-3 mb-5">
				<button class="btn btn-secondary " type="submit" id="btnlist">메인으로 돌아가기</button>
			</div>
		</form>
	</div>
	<%@ include file="./include/footer.jsp"%>
</body>
</html>