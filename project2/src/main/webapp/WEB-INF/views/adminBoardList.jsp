<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<%@ include file="./include/header.jsp"%>


<head>
<meta charset="UTF-8">
<title>게시판관리</title>
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
<meta charset="UTF-8">
<script>
	function dele(no) {
		if (confirm("차단하시겠습니까?")) {
			location.href = "./adminBoardD?bno="+ no;
		}
	}
	function redele(no) {
		if (confirm("복원하시겠습니까?")) {
			location.href = "./adminBoardRD?bno="+ no;
		}
	}
</script>
</head>
<body>
	<%@ include file="./include/menu.jsp"%>
	<div class="container" data-aos="fade-up">
		<h1 class="text-center mt-3">게시판</h1>
		<!-- 게시물 목록 -->
		<form name="form1" method="post" action="${path}/adminBoardList">
			<table class="table table-hover  mt-3">
				<thead class="table-secondary">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>수정날짜</th>
						<th>조회수</th>
						<th>상태</th>
						<th>차단</th>
						<th>복원</th>

					</tr>
				</thead>
				<!-- count : ${count} -->
				<tbody>

					<c:forEach var="row" varStatus="status" items="${blist}">
						<c:choose>
							<c:when test="${sessionScope.role eq 'admin'}">

								<tr>
									<td>${row.bno}</td>
									<td>${row.btitle}</td>
									<td>${row.bcontent}</td>
									<td>${row.bwriter}</td>
									<td>${row.regdate}</td>
									<td>${row.updatedate}</td>
									<td>${row.viewcnt}</td>
									<c:if test="${row.bdel eq '등록'}">
										<td>등록</td>
									</c:if>
									<c:if test="${row.bdel eq '차단'}">
										<td>차단</td>
									</c:if>
									<td><button class="btn btn-warning btn-sm" type="button" onclick="dele(${row.bno})">차단</button></td>
									<td><button class="btn btn-success btn-sm" type="button" onclick="redele(${row.bno})">복원</button></td>

								</tr>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<form action="${path}/adminBoardList" name="searchPageForm" method="get">

			<nav aria-label="Search results pages">
				<ul class="pagination justify-content-center text-secondary">
					<c:if test="${pager.curBlock > 1}">
						<li class="page-item"><a class="page-link" href="${path}adminBoardList?searchOption=all&keyword=${keyword}&curPage=1">처음</a></li>
					</c:if>
					<c:if test="${pager.curBlock > 1}">
						<li class="page-item"><a class="page-link" href="${path}adminBoardList?searchOption=all&keyword=${keyword}&curPage=${pager.prevPage}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="num" begin="${pager.blockBegin}" end="${pager.blockEnd}">
						<c:choose>
							<c:when test="${num eq pager.curPage}">
								<li class="page-item active"><a class="page-link" href="${path}adminBoardList?searchOption=all&keyword=${keyword}&curPage=${num}">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${path}adminBoardList?searchOption=all&keyword=${keyword}&curPage=${num}">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pager.curBlock <= pager.totBlock}">
						<li class="page-item"><a class="page-link" href="${path}adminBoardList?searchOption=all&keyword=${keyword}&curPage=${pager.nextPage}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<c:if test="${pager.curBlock <= pager.totBlock}">
						<li class="page-item"><a class="page-link" href="${path}adminBoardList?searchOption=all&keyword=${keyword}&curPage=${pager.totPage}">끝</a></li>
					</c:if>
				</ul>
			</nav>


			<div class="d-flex justify-content-center mb-5">
				<table>
					<tr>
						<td><select class="form-select" id="searchOption" name="searchOption">
								<option value="all" ${searchOption == 'all' ? 'selected' : ''}>모두검색</option>
								<option value="btitle" ${searchOption == 'btitle' ? 'selected' : ''}>제목</option>
								<option value="bwriter" ${searchOption == 'bwriter' ? 'selected' : ''}>작성자</option>
								<option value="bdel" ${searchOption == 'bdel' ? 'selected' : ''}>상태</option>
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