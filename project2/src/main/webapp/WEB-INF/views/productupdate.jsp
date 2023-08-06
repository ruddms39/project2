<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>리스트</title>
<%@ include file="./include/header.jsp"%>
<script>
	$("document").ready(function() {
		$("#btnUpdate").click(function() {

			if (confirm("수정하시겠습니까?")) {
				document.form1.action = "${path}/product/update";
				document.form1.submit();
			}
		});

	});
</script>
</head>
<body>
	<%@ include file="./include/menu.jsp"%>
	<div class="container">
		<form id="form1" name="form1" method="post" action="${path}/product/update">
			<div class="container mt-3 mb-3 col-3">
				<input type="number" class="form-control" value="${vo.pno }" name="pno" id="pno" readonly="readonly">
			</div>
			<div class="container mt-3 mb-3 col-3">
				<input type="text" class="form-control mt-3" value="${vo.ptitle }" name="ptitle" required>
			</div>
			<div class="container mt-3 mb-3 col-3">
				<input type="text" class="form-control mt-3" value="${vo.pdetail }" name="pdetail" required>
			</div>
			<div class="container mt-3 mb-3 col-3">
				<input type="number" class="form-control" value="${vo.sellprice }" style="width: 300px;" name="sellprice" required> <br>
				<button class="btn btn-warning mt-3" id="btnUpdate" type="submit">상품수정</button>
			</div>
		</form>
	</div>
	<%@ include file="./include/footer.jsp"%>

</body>
</html>