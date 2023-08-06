<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="./js/jquery-3.6.1.min.js"></script>
<title>리스트</title>
<%@ include file="./include/header.jsp"%>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

</head>
<body>
	<script type="text/javascript">
		function linkPage(pageNo) {
			location.href = "${path}productlist?pageNo=" + pageNo;
		}
	</script>
	<%@ include file="./include/menu.jsp"%>
	<main id="main">
		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>상품목록</h2>
					<p></p>
				</div>

				<div class="row">
					<c:forEach items="${list}" var="g">
						<div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
							<div class="icon-box iconbox-blue">
								<img src="resources/assets/thumbnail/${g.pthumb}">
								<h4>
									<a href="${path}/productview?pno=${g.pno}">${g.ptitle }</a>
								</h4>
								<h5>₩ ${g.sellprice }</h5>
								<h5 class="xi-thumbs-up mt-2"> ${g.plike }</h5>
							</div>
						</div>
					</c:forEach>
				</div>
				<form method="post" action="${path }/">
					<div class="d-flex justify-content-end mt-5">
						<button class="btn btn-secondary " type="submit" id="btnlist">메인으로 돌아가기</button>
					</div>
				</form>
			</div>
		</section>
		<!-- End Services Section -->

	</main>
	<!-- End #main -->





	<%@ include file="./include/footer.jsp"%>

</body>
</html>