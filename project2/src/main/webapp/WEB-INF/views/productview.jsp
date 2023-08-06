<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>리스트</title>

<%@ include file="./include/header.jsp"%>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
#main {
	margin: 0 auto;
	width: 95%;
	margin-top: 60px;
	color: black;
}

#commentInsertForm {
	width: 100%;
	height: 150px;
	padding: 5px;
	margin: 5px;
	box-sizing: border-box;
}

#commentInsertForm textarea {
	height: 80px;
	width: calc(100% - 100px);
	margin: 0px;
	margin-right: -4px;
	vertical-align: middle;
}

#commentInsertForm button {
	height: 40px;
	width: 90px;
	margin: 0px;
	vertical-align: middle;
	border: 0px;
}

#comments {
	width: 100%;
	height: auto;
	margin: 5px 0px;
}

#comment {
	width: 100%;
	min-height: 65px;
	margin-bottom: 5px;
}

#commentHead {
	width: 100%;
	height: 32px;
	line-height: 32px;
	background-color: #f1f1f1;
}

#cname {
	width: 45%;
	height: 100%;
	float: left;
	padding-left: 5px;
}

#cdate {
	width: 45%;
	height: 100%;
	float: right;
	text-align: right;
	margin-right: 10px;
}

#cid {
	height: 0px;
	visibility: hidden;
}

#commentBody {
	width: 100%;
	min-height: 35px;
	height: auto;
	padding-left: 5px;
}
</style>
<script>
	$(function() {
		$(".delComment").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				var p = $(this).parents("#comment");
				var cno = $(this).siblings("#cid").text();
				$.post("./commentproductD", {
					pno : "${vo.pno}",
					cno : cno
				}, function(data, status) {
					if (data == 1) {
						p.remove();
						location.reload();
					} else if (data == 9) {
						alert("로그인하세요");
						location.href = "./";
					} else {
						alert("에러가 발생했습니다.\n다시 시도하세요.");
					}
				});//post
			}//end if
		});//del comment 

		$(".comment2")
				.click(
						function() {
							var cno = $(this).siblings("#cid").text();
							//$(this).text('닫기');
							var form = '<div id="commentInsertForm">';
							form += '<form action="${path }/commentInsertP" method="post">';
							form += '<textarea class="form-control" rows="3" name="cconte"></textarea><br>';
							form += '<input type="hidden" name="cno" value="'+cno+'">';
							form += '<input type="hidden" name="pno" value="${vo.pno}">';
							form += '<input type="hidden" name="cname" value="${sessionScope.unick }">';
							form += '<input type="hidden" name="uid" value="${sessionScope.uid }">';
							form += '<button type="submit" class="btn btn-success">답글달기</button></form></div><br>';
							var commentDIV = $(this).parents("#comment");
							commentDIV.append(form);
							$(".comment2").remove();
							$(".repairComment").remove();
						});
		
		
		$(".repairComment")
		.click(
				function() {
					var cno = $(this).siblings("#cid").text();
					//$(this).text('닫기');
					var form = '<div id="commentInsertForm">';
					form += '<form action="${path }/repaircommentP" method="post">';
					form += '<textarea class="form-control" rows="2" name="cconte"></textarea><br>';
					form += '<input type="hidden" name="pno" value="${vo.pno}">';
					form += '<input type="hidden" name="cno" value="'+cno+'">';
					form += '<button type="submit" class="btn btn-danger">수정하기</button></form></div><br>';
					var commentDIV = $(this).parents("#comment");
					commentDIV.append(form);
					$(".repairComment").remove();
					$(".comment2").remove();
				});
		
	});

	
</script>
<script>
	function like(){
		location.href="${path}/productlike?pno=${vo.pno}";
	}			
</script>
</head>
<body>
	<%@ include file="./include/menu.jsp"%>
	<section id="services" class="services">
		<div class="container" data-aos="fade-up">

			<div class="container mt-3 mb-3">
				<img alt="" src="resources/assets/img/${vo.pimg }" />
			</div>
			<div class="d d-flex justify-content-start">
				<button class="btn btn-warning xi-heart" onclick="like()">좋아요 ${vo.plike }</button>
			</div>
			<div>
				<h2>
					Information <span style="font-size: 14px; color: gray;"> 상품정보</span>
				</h2>
				<br>
				<h4>${vo.ptitle }</h4>
				<br>
				<p style="font-size: 20px;">상품설명 : ${vo.pdetail }</p>
				<p style="font-size: 18px; color: red;">판매가 : ${vo.sellprice }원</p>
			</div>
		</div>
		<div class="container">
			<div id="comments">
				<!-- 댓글을 전체 감싸고 있는 외부 -->
				<c:forEach items="${Lastcomment}" var="cm">
					<c:if test="${cm.cgroup gt 0}">
						<div style="width: 30px; height: 65px; float: left; background-color: white; text-align: center;">
							<i class="xi-subdirectory-arrow xi-2x"></i>

						</div>
					</c:if>
					<div id="comment">
						<!-- 댓글 하나 내역 -->
						<div id="commentHead">
							<!-- 댓글 머리부분 : 글쓴이, 날짜 등등 -->
							<div id="cname">${cm.cname }
								<c:if test="${cm.uid eq sessionScope.uid}">
									<span class="delComment" style="color: red;">[삭제]</span>
									<span class="repairComment" style="color: red;">[수정]</span>
									<div id="cid">${cm.cno }</div>

								</c:if>
							</div>
							<div id="cdate">
								<c:if test="${sessionScope.uid ne null && cm.cgroup eq 0}">
									<span style="color: white; height: 32px; vertical-align: top; line-height: 16px;" class="btn btn-secondary comment2">답글 달기</span>
									<span id="cid">${cm.cno }</span>
								</c:if>
								${cm.crdate }
							</div>

							<!-- 댓글 번호 -->
						</div>
						<div id="commentBody">${cm.cconte }</div>
						<!-- 댓글 내용 -->
					</div>
				</c:forEach>
			</div>
		</div>


		<div>
			<c:if test="${sessionScope.uid ne null }">
				<div class="container">
					<form action="${path }/commentproductW" method="post">
						<div class="mb-3">
							<h5>댓글:</h5>
							<input type="hidden" name="pno" value="${param.pno }">
							<textarea class="form-control" rows="3" id="comment" name="cconte"></textarea>
							<input type="hidden" name="cname" value="${sessionScope.unick }"> <input type="hidden" name="uid" value="${sessionScope.uid }">
						</div>
						<button type="submit" class="btn btn-success">작성하기</button>
					</form>
				</div>
			</c:if>
		</div>
		<br> <br>
		<!-- 댓글 끝 -->
	</section>

	<%@ include file="./include/footer.jsp"%>

</body>
</html>