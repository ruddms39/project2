<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<%@ include file="./include/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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

</head>
<body>
	<%@ include file="./include/menu.jsp"%>

	<div class="container" data-aos="fade-up">
		<h1 class="text-center mt-3" style="font-family: RIDIBatang;">게시판 ${sessionScope.role }</h1>
		<!-- 게시물 목록 -->
		<table class="table table-hover  mt-3">
			<thead class="table-secondary">
				<tr>
					<th style="background-color: #e9e8e6;">번호</th>
					<th class="col-2" style="background-color: #e9e8e6;">제목</th>
					<th class="col-5" style="background-color: #e9e8e6;">내용</th>
					<th style="background-color: #e9e8e6;">작성자</th>
					<th style="background-color: #e9e8e6;">작성날짜</th>
					<th style="background-color: #e9e8e6;">수정날짜</th>
					<th style="background-color: #e9e8e6;">조회수</th>
				</tr>
			</thead>
			<!-- count : ${count} -->
			<tbody>
				<c:forEach var="row" varStatus="status" items="${list}">
					<c:choose>
						<c:when test="${sessionScope.uid ne null}">
							<tr onclick="location.href='${path}/boardview?bno=${row.bno}'">
								<td>${row.bno}</td>
								<td>${row.btitle}</td>
								<td>${row.bcontent}</td>
								<td>${row.bwriter}</td>
								<td>${row.regdate}</td>
								<td>${row.updatedate}</td>
								<td>${row.viewcnt}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>${row.bno}</td>
								<td>${row.btitle}</td>
								<td>${row.bcontent}</td>
								<td>${row.bwriter}</td>
								<td>${row.regdate}</td>
								<td>${row.updatedate}</td>
								<td>${row.viewcnt}</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
		<form action="${path}/boardlist" name="searchPageForm" method="get">

					<nav aria-label="Search results pages">
						<ul class="pagination justify-content-center text-secondary">
							<c:if test="${pager.curBlock > 1}">
								<li class="page-item"><a class="page-link" href="${path}boardlist?searchOption=all&keyword=${keyword}&curPage=1">처음</a></li>
							</c:if>
							<c:if test="${pager.curBlock > 1}">
								<li class="page-item"><a class="page-link" href="${path}boardlist?searchOption=all&keyword=${keyword}&curPage=${pager.prevPage}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="num" begin="${pager.blockBegin}" end="${pager.blockEnd}">
								<c:choose>
									<c:when test="${num eq pager.curPage}">
										<li class="page-item active"><a class="page-link" href="${path}boardlist?searchOption=all&keyword=${keyword}&curPage=${num}">${num}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="${path}boardlist?searchOption=all&keyword=${keyword}&curPage=${num}">${num}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pager.curBlock <= pager.totBlock}">
								<li class="page-item"><a class="page-link" href="${path}boardlist?searchOption=all&keyword=${keyword}&curPage=${pager.nextPage}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
							<c:if test="${pager.curBlock <= pager.totBlock}">
								<li class="page-item"><a class="page-link" href="${path}boardlist?searchOption=all&keyword=${keyword}&curPage=${pager.totPage}">끝</a></li>
							</c:if>
						</ul>
					</nav>
		

			<div class="d-flex justify-content-center mb-5">
				<table>
					<tr>
						<td><select class="form-select" id="searchOption" name="searchOption">
								<option value="all" ${searchOption == 'all' ? 'selected' : ''}>모두검색</option>
								<option value="btitle">제목</option>
								<option value="bwriter">작성자</option>
						</select></td>
						<td><input class="form-control" name="keyword" id="keyword" /></td>
						<td>
							<button class="btn btn-outline-info " type="submit">검색</button>
						</td>
						<td>
							<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#myModal">글쓰기</button>
						</td>
					</tr>
				</table>
			</div>
		</form>

	</div>
	<%@ include file="./include/footer.jsp"%>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">내용입력</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<form id="modal" name="modal" method="post" action="${path }/boardwrite">
					<div class="modal-body">
						<div class="container">
							<div class="container mt-3 mb-3 ">
								<label class="form-label">제목</label> <input type="text" class="form-control" placeholder="제목을 입력하세요" name="btitle" id="btitle" required="required">
							</div>
							<div class="container mt-3 mb-3">
								<label class="form-label">내용</label>
								<textarea class="form-control" rows="20" placeholder="내용을 입력하세요" name="bcontent" id="bcontent" required="required"></textarea>
							</div>
							<div class="container mt-3 mb-3">
								<label class="form-label">작성자</label><input type="text" class="form-control" value="${sessionScope.unick}" name="bwriter" id="bwriter" readonly="readonly">
							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button id="btnMem" class="btn btn-primary mt-3" type="submit">등록</button>
						<button id="btnReset" class="btn btn-secondary mt-3" type="reset">초기화</button>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>
