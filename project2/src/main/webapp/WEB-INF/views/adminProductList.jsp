<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<%@ include file="./include/header.jsp"%>

<head>
<meta charset="UTF-8">
<title>상품관리</title>
<script>
	function dele(no) {
		if (confirm("차단하시겠습니까?")) {
			location.href = "./productdelete?pno=" + no;
		}
	}
	function redele(no) {
		if (confirm("복원하시겠습니까?")) {
			location.href = "./productredelete?pno=" + no;
		}
	}
	function delei(no) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "./productdeleteI?pno=" + no;
		}
	}
</script>

</head>
<body>
	<%@ include file="./include/menu.jsp"%>
	<div class="container mt-5 mb-5" data-aos="fade-up">
		<h1 class="text-center mt-3">상품관리</h1>
		<!-- 게시물 목록 -->
		<table class="table table-hover  mt-3">
			<thead class="table-secondary">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th class="col-3">내용</th>
					<th>등록날짜</th>
					<th>가격</th>
					<th>등록상태</th>
					<th>좋아요</th>
					<th>차단</th>
					<th>복원</th>
					<th>삭제</th>

				</tr>
			</thead>
			<!-- count : ${count} -->
			<tbody>
				<c:forEach var="row" varStatus="status" items="${plist}">
					<c:choose>
						<c:when test="${sessionScope.role eq 'admin'}">
							<tr>
								<td>${row.pno}</td>
								<td>${row.ptitle}</td>
								<td>${row.pdetail}</td>
								<td>${row.pdate}</td>
								<td>${row.sellprice}</td>
								<c:if test="${row.pdel eq '0'}">
									<td>등록</td>
								</c:if>
								<c:if test="${row.pdel ne '0'}">
									<td>차단</td>
								</c:if>
								<td>${row.plike}</td>
								<td><button class="btn btn-warning btn-sm" onclick="dele(${row.pno })">차단</button></td>
								<td><button class="btn btn-success btn-sm" onclick="redele(${row.pno })">복원</button></td>
								<td><button class="btn btn-danger btn-sm" onclick="delei(${row.pno })">삭제</button></td>
							</tr>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#productModal">상품등록</button>
		</div>
		<form method="post" action="${path }/">
			<div class="d-flex justify-content-end mt-3 mb-5">
				<button class="btn btn-secondary " type="submit" id="btnlist">메인으로 돌아가기</button>
			</div>
		</form>
	</div>


	<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상품 등록하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="${path }/productinsert" method="post" enctype="multipart/form-data">
						<div id="write-modal">
							<div class="container mt-3 mb-3 ">
								<input type="text" class="form-control mt-3" placeholder="상품명을 입력해주세요." style="width: 300px;" name="ptitle" required>
							</div>
							<div class="container mt-3 mb-3 ">
								<input type="text" class="form-control mt-3" placeholder="상세내역을 입력해주세요." style="width: 300px;" name="pdetail" required>
							</div>
							<div class="container mt-3 mb-3">
								<input type="file" name="file" accept=".png, .jpg, .gif, .jpeg, .bmp" required>
							</div>
							<div class="container mt-3 mb-3">
								<input type="number" class="form-control" placeholder="상품가격을 입력해주세요." style="width: 300px;" name="sellprice" required> <br>
							</div>
							<button class="btn btn-success" style="float: right; height: 50px; margin-left: 7px;">등록하기</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="float: right; height: 50px;">닫기</button>
						</div>

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>
<body>

</body>
</html>