<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--공통적은 파일을 include 폴더에 넣어 두고 필요할 때마다 include로 연결해서 사용 -->
<%@ include file="./include/header.jsp" %> <!-- 해당파일을 연결 -->
</head>
<body>
<!-- 처음 실행되는 화면  -->
<!-- JSTL-if, foreach 등 자바명령어를 태그화 시켜놓은 형식 -->
<!-- EL-전달받은 변수(값)을 쉽게 처리하는 형식 $ 대괄호안에 변수명을 기재 %=변수 대신-->
<%@ include file="./include/menu.jsp" %> <!-- 해당파일을 연결 -->

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Online Counseling</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
/* Global styles */
body {
	font-family: 'Open Sans', sans-serif;
}

/* Navbar */
.navbar {
	background-color: #fff !important;
}

bar-brand {
	color: #8f8f8f !important;
}

.navbar-nav .nav-link {
	color: #8f8f8f !important;
	font-weight: bold !important;
}

/* Hero section */
.hero-section {
	background-image:
		url('https://via.placeholder.com/1200x500.png?text=Hero+Image');
	background-position: center;
	background-size: cover;
	height: 500px;
	display: flex;
	align-items: center;
}

.hero-inner h1 {
	font-size: 48px;
	margin-bottom: 20px;
}

/* Explore counselors section */
.explore-counselors-section {
	padding: 80px 0;
}

.card {
	margin-bottom: 30px;
	box-shadow: 0 0.5rem 1rem rgba0, 0, 0, 0.15) !important;
}

.card-title {
	font-size: 20px;
	font-weight: 700;
	margin-bottom: 5px;
}

.card-text {
	color: #8f8f8f;
}

/* Request counseling section */
.request-counseling-section {
	padding: 80px 0;
}

.form-control {
	padding: 25px;
}

label {
	font-weight: bold;
	margin-bottom: 10px;
}

/* Footer */
footer {
	padding: 30px 0;
	color: #8f8f8f;
}
</style>
</head>
<h2> ${msg }</h2> <!-- Controller에서 전달받은 msg변수값을 출력 -->
<body font-family: 'OpenSans', sans-serif;>
	<!-- Navbar-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		background-color:#fff !important;>
		<a class="navbar-brand" href="#" color:#8f8f8f !important;></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">홈<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#">상담사</a></li>
				<li class="nav-item"><a class="nav-link" href="#">내 쪽지함</a></li>
			</ul>
		</div>
	</nav>

	<!-- 메인 상단-->
	<section class="hero-section text-white" style="background-image: url('https://cdn.pixabay.com/photo/2021/11/21/04/54/skills-6813167_1280.jpg'); background-size: cover; background-position: center;">
		<div class="hero-inner">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h1>온라인 상담 서비스에 오신걸 환영합니다</h1>
						<p class="lead">전문가와 상담해보세요!</p>
						<a href="#" class="btn btn-primary">더보기</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 상담사 메뉴-->
	<section class="explore-counselors-section">
		<div class="container">
			<h2 class="text-center">상담사 찾아보기</h2>
			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top"
							img src="https://cdn.pixabay.com/photo/2018/01/27/10/35/folk-3110862_1280.jpg"
							src="https://via.placeholder.com/400x300.png?text=Profile+Image"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">무함마드 크리링</h5>
							<p class="card-text">한평생을 고쳤습니다.</p>
							<a href="#" class="btn btn-primary">프로필 보기</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top"
							src="https://via.placeholder.com/400x300.png?text=Profile+Image"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">Counselor Name</h5>
							<p class="card-text">Description of the counselor.</p>
							<a href="#" class="btn btn-primary">프로필 보기</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top"
							src="https://via.placeholder.com/400x300.png?text=Profile+Image"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">Counselor Name</h5>
							<p class="card-text">Description of the counselor.</p>
							<a href="#" class="btn btn-primary">프로필 보기</a>
						</div>
					</div>
				</div>
				<!-- 필요하면 더 추가하기-->
			</div>
		</div>
	</section>



	<!-- 쪽지 보내기 -->
      <div class="container mt-5">
        
       <h3 class="heading">님 쪽지보내기</h3><br>
		      <div >
		        <form action="./mailbox" method="post" >
		        <div  class="mb-3">
				    <i class="fa fa-comment"></i>
				    <label for="title" class="form-label">제목</label>
				    <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title" required="required">
				  </div>
				  <div class="mb-3">
				  	<i class="fa fa-user"></i>
				    <label for="send" class="form-label">보내는 사람</label>
				    <input type="text" class="form-control" id="send" placeholder="보내는 사람 아이디를 입력하세요" name="send"  >
				  </div>
				  <div class="mb-3">
				   	<i class="fa fa-user"></i>
				    <label for="receive" class="form-label">받는 사람</label>
				    <input type="text" class="form-control" id="receive" placeholder="받는 사람 아이디를 입력하세요" name="receive" required="required">
				  </div>
				  <label for="content">내용</label>
					<textarea class="form-control" rows="5" id="content" name="content" required="required"></textarea>
					<br>
				  <button type="submit" class="btn btn-primary">쪽지보내기</button>
				  <button type="reset" class="btn btn-danger">취소</button>
		        </form>
			</div>
      
		</div>

	<!-- Footer-->
	<footer class="bg-light">
		<div class="container">
			<div class="row">
				<p class="col-lg-12 text-center">&copy; 2021 Online Counseling</p>
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>



</body>
</html>