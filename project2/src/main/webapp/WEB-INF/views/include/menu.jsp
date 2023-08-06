<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

<head>
 
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" >
    <div class="container-fluid d-flex justify-content-between align-items-center">

      <h1 class="logo me-auto me-lg-0"><a href="${path}/">THE JARAM</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a href="${path}/">메인</a></li>
          <li><a href="${path}/productlist">상품목록</a></li>
          <li><a href="${path}/boardlist">게시판</a></li>
		<c:choose>
			<c:when test="${sessionScope.role eq 'admin'}">
				<li><a href="${path}/mailboxReceive">쪽지함</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">관리자페이지</a>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${path}/adminUsersList">회원관리</a></li>
						<li><a class="dropdown-item" href="${path}/adminProductList">상품관리</a></li>
						<li><a class="dropdown-item" href="${path}/adminBoardList">게시판관리</a></li>
					</ul></li>
			</c:when>
			<c:when test="${sessionScope.role eq 'user'}">
				<li><a href="${path}/mailboxReceive">쪽지함</a></li>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>          
          
          <c:choose>
				<c:when test="${sessionScope.uid eq null}">
					<li><a href="${path}/userslogin">로그인</a></li>
				</c:when>

				<c:otherwise>
					<li></li>
					<label>${sessionScope.unick}회원님이 로그인 중입니다.</label>
					<li><a href="${path}/logout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
			<li></li>
          <li></li>
          <li></li>
          <li></li>
          
         <!--<li><a href="resources/about.html">About</a></li>
          <li><a href="resources/resume.html">Resume</a></li>
          <li><a href="resources/services.html">Services</a></li>
          <li><a href="resources/portfolio.html">Portfolio</a></li>
          <li><a href="resources/contact.html">Contact</a></li>  --> 
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <div class="header-social-links" align="right">
        <a href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoia28ifQ%3D%3D%22%7D" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="https://ko-kr.facebook.com/" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="https://www.instagram.com/accounts/login/" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="https://www.linkedin.com/login/ko" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
      </div>

    </div>

  </header><!-- End Header -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="resources/assets/vendor/aos/aos.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>

</body>

</html>