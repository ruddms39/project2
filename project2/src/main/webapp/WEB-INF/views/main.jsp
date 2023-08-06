<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">	
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>	
  
  <title>Project</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/assets/img/easteregg.png" rel="icon">
  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Kelly - v4.9.1
  * Template URL: https://bootstrapmade.com/kelly-free-bootstrap-cv-resume-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body> 

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
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
  
  
     <main id="main">
	
		  <div id="demo" class="carousel slide" data-bs-ride="carousel">
		  <!-- 인디케이터/도트 -->
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active" style="background-color: #34b7a7;"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="1" style="background-color: #34b7a7;"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="2" style="background-color: #34b7a7;"></button>
		  </div>
		
		  <!-- 슬라이드쇼/카루셀 -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <div class="d-flex justify-content-center align-items-center">
		        <img src="resources/assets/img/w1.jpg" class="d-block h-100" style="flex: 1;">
		      </div>
		    </div>
		    <div class="carousel-item">
		      <div class="d-flex justify-content-center align-items-center">
		        <img src="resources/assets/img/w2.jpg" class="d-block h-100" style="flex: 1;">
		      </div>
		    </div>
		    <div class="carousel-item">
		      <div class="d-flex justify-content-center align-items-center">
		        <img src="resources/assets/img/w3.jpg" class="d-block h-100" style="flex: 1;">
		      </div>
		    </div>
		  </div>
		
	  <!-- 좌우 컨트롤/아이콘 #e9e8e6(베이지색) #6f6f6f(연한검정)-->
	  <button class="prev-button" type="button" data-bs-target="#demo" data-bs-slide="prev" 
	  style="position: absolute; top: 50%; left: 10px; transform: translateY(-50%); padding: 10px 20px; background-color: #34b7a7; color: #fff; border: none; border-radius: 20px; cursor: pointer;">이전</button>
	  <button class="next-button" type="button" data-bs-target="#demo" data-bs-slide="next"
	  style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); padding: 10px 20px; background-color: #34b7a7; color: #fff; border: none; border-radius: 20px; cursor: pointer;">다음</button>
	  </div>

		<!-- ======= 기타제품 ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container" data-aos="fade-up">
				<div class="section-title">
					<h2>기타 상품</h2>
					<p>이런 상품과 함께하면 더욱 좋아요!</p>
				</div>

				<div class="row" data-aos="fade-up" data-aos-delay="100">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="portfolio-flters">
							<li data-filter="*" class="filter-active">모두</li>
							<li data-filter=".filter-app">오일</li>
							<li data-filter=".filter-card">크림</li>
							<li data-filter=".filter-web">천연비누</li>
						</ul>
					</div>
				</div>

				<div class="row portfolio-container" data-aos="fade-up"
					data-aos-delay="200">

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-1.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>쿠롤로지 유기농 호호바 오일</h4>
								<p>저자극,피부보호,피부유연</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-1.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="resources/portfolio-details.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-2.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>프랑스산 랑팔 마르세유</h4>
								<p>피부탄력,모공케어,각질케어,노폐물제거</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-2.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="resources/portfolio-details2.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-3.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>더 레티놀 티트리 오일 10ml</h4>
								<p>피부진정 및 여드름 전용 & 트러블 개선</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-3.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="portfolio-details.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-4.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>센텔리안 더 레인보우 크림</h4>
								<p>흡수력,화이트닝,모공케어,영양공급</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-4.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="portfolio-details.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-5.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>까멜리아 약알칼리성 비누</h4>
								<p>모든 피부용,복합,민감성</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-5.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="portfolio-details.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-6.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>하붑 밍크오일</h4>
								<p>촉촉함(수분공급)트러블케어,흡수력</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-6.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="portfolio-details.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-7.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>설화수 탄력 크림</h4>
								<p>모든피부용,주름개선</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-7.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="portfolio-details.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-8.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>아카시아 액티브 크림</h4>
								<p>흡수력,피부탄력,윤기부여,주름케어</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-8.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="portfolio-details.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="resources/assets/img/portfolio/portfolio-9.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>로하벨라 컬러비누</h4>
								<p>트러블케어,모공케어,각질케어,노폐물제거</p>
								<div class="portfolio-links">
									<a href="resources/assets/img/portfolio/portfolio-9.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										><i class="bx bx-plus"></i></a> <a
										href="portfolio-details.html"
										class="portfolio-details-lightbox"
										data-glightbox="type: external" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Portfolio Section -->
		
	<!-- ======= 파트너스 ======= -->
    <section id="facts" class="facts">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>함께하는 분들</h2>
          <p>세상의 변화를 이끌어가는 파트너스와 함께 합니다.</p>
        </div>

        <div class="row counters">

          <div class="col-lg-3 col-6 text-center">
            <span data-purecounter-start="0" data-purecounter-end="1580" data-purecounter-duration="1" class="purecounter"></span>
            <p>한국 회원</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-purecounter-start="0" data-purecounter-end="22150850" data-purecounter-duration="1" class="purecounter"></span>
            <p>글로벌 고객</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-purecounter-start="0" data-purecounter-end="68542" data-purecounter-duration="1" class="purecounter"></span>
            <p>유튜브 공식 계정 구독자</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-purecounter-start="0" data-purecounter-end="252" data-purecounter-duration="1" class="purecounter"></span>
            <p>협력기관</p>
          </div>

        </div>

      </div>
    </section><!-- End Facts Section -->
		
		<!-- ======= 고객리뷰 ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>고객님들의 리뷰</h2>
          <p>실제 고객님들이 남겨주신 생생한 이야기를 들어보세요.</p>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="resources/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                <h3>Saul Goodman</h3>
                <h4>Ceo &amp; Business Investor</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  정말 애용하고 있습니다. 날로 건강해지는 걸 체감하고 있어요!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="resources/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                <h3>김선영</h3>
                <h4>Designer</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  너무 좋은 제품들과 친절한 직원분들 때문에 자주 애용하는데 한국에서는 아직 인지도가 없는게 아쉬워요ㅠㅠ 나름 청담에 지점까지 두고 있는데 앞으로 이런 기업들이 한국에도 많아졌으면 좋겠네요.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="resources/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                <h3>Jena Karlis</h3>
                <h4>Store Owner</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  고급스러운 디자인과 뛰어난 효과가 장점인 제품이 많아 매출이 날로 증가하고 있어요.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="resources/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                <h3>Matt Brandon</h3>
                <h4>Freelancer</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  케어에 별다른 신경을 쓰지 않는데 이 제품은 항상 애용하고 있습니다.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="resources/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                <h3>John Larson</h3>
                <h4>Entrepreneur</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  딸에게 선물해주었는데 매우 좋아하네요!
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->	
    
    <!-- ======= 연혁 ======= -->
    <section id="resume" class="resume">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>연혁</h2>
          <p>1985년 분주한 도시 메디카에서 아멜리아 에버그린 박사라는 비전가가 의료 서비스를 혁신하기 위한 임무에 착수해 1990년 전세계 사람들의 웰빙과 장수를 개선하는 데 전념하는 회사인 VitalHealth를 처음 설립하였고
예방 의학 및 첨단 기술에 대한 특별한 여정으로 이끌었습니다. 그녀의 비전을 공유하는 뛰어난 과학자, 엔지니어 및 의료 전문가 팀을 구성하면서 회사의 초창기는 지칠 줄 모르는 연구 개발로 특징지어졌습니다. 
그렇게 2008년에 그들은 의료 혁신을 발전시키는 데 전념하는 최첨단 시설인 건강 혁신 센터를 설립하였고 이 센터는 선도적인 학술 기관 및 연구자와의 협력을 촉진하여 획기적인 치료법 및 치료법 개발을 가속화하고 있습니다.</p>
        </div>

        <div class="row">
          <div class="col-lg-6">
            <h3 class="resume-title">설립</h3>
            <div class="resume-item pb-0">
              <h4>Dr. Evergreen</h4>
              <p><em>1990년 건강을 최우선으로 하는 회사로 창립하여 영양제와 건강용품 분야에서 시작하였으며, 지속적인 연구와 소비자들의 건강을 최우선으로 생각하며 다양한 제품들을 구상합니다.</em></p>
              <p>
              <ul>
                <li>Portland par 127,Orlando, FL</li>
                <li>(123) 456-7891</li>
                <li>alice.barkley@example.com</li>
              </ul>
              </p>
            </div>

            <h3 class="resume-title"></h3>
            <div class="resume-item">
              <h4>주력제품 &amp; 서비스</h4>
              <h5>2015 - 2016</h5>
              <p><em>Rochester Institute of Technology, Rochester, NY</em></p>
              <p>고급 센서를 활용하여 생체 신호, 신체 활동 및 수면 패턴에 대한 실시간 데이터를 수집하는 웨어러블 건강 모니터인 주력 제품인 LifeTrack을 출시</p>
            </div>
            <div class="resume-item">
              <h4>주력제품 &amp; 서비스</h4>
              <h5>2016 - 2018</h5>
              <p><em>Rochester Institute of Technology, Rochester, NY</em></p>
              <p> 환자와 의사를 원격으로 연결하는 획기적인 원격 의료 플랫폼인 MedConnect를 출시</p>
            </div>
          </div>
          <div class="col-lg-6">
            <h3 class="resume-title">수상내역</h3>
            <div class="resume-item">
              <h4>연도별 수상내역</h4>
              <h5>2012 - Present</h5>
              <p><em>Experion, New York, NY </em></p>
              <p>
              <ul>
                <li>Balzan Prize for Preventive Medicine</li>
                <li>The Gates Vaccine Innovation Award: Bill & Melinda Gates Foundation</li>
                <li>The Prix Galien</li>
             </p>
              </ul>
              </p>
            </div>
            <div class="resume-item">
              <h4>서울 강남구 청담동 지점</h4>
              <h5>2016 - Present</h5>
              <p><em>대한민국 서울</em></p>
              <p>
              <ul>
                <li>세계 건강혁신대회 수상(2016)</li>
                <li>건강산업 공로상(2017)</li>
                <li>올해의 혁신상(2017)</li>
                <li>글로벌 헬스케어 우수상(2019)</li>
              </ul>
              </p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Resume Section -->	

</main><!-- End #main -->  
  
  
  
  <!-- 푸터 -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; 주식회사 <strong><span>THE JARAM</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/kelly-free-bootstrap-cv-resume-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End  Footer -->	

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