<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>글 내용 보기</title>
<!-- 공통 파일을 include 폴더에 넣어두고 필요할 때마다 include로 연결해서 사용 -->
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
				$.post("./commentboardD", {
					bno : "${dto.bno}",
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
							form += '<form action="${path }/commentInsertB" method="post">';
							form += '<textarea class="form-control" rows="3" name="cconte"></textarea><br>';
							form += '<input type="hidden" name="cno" value="'+cno+'">';
							form += '<input type="hidden" name="bno" value="${dto.bno}">';
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
							form += '<form action="${path }/repaircommentB" method="post">';
							form += '<textarea class="form-control" rows="2" name="cconte"></textarea><br>';
							form += '<input type="hidden" name="bno" value="${dto.bno}">';
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
	$(document).ready(function() {
		// 게시글 삭제 버튼 클릭 이벤트
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/boarddelete?bno=${dto.bno}";
				document.form1.submit();
			}
		});
	});

	function update() {
		location.href = "${path}/boardupdate?bno=${dto.bno}";
	};
</script>
</head>
<body>
	<%@ include file="./include/menu.jsp"%>
	<!-- 해당 파일 연결 -->

	<section id="services" class="services">
		<div class="container" data-aos="fade-up">
			<h2>글 내용 보기</h2>
			<div class="container m-3 ">

				<div>
					<label class="form-label">번호</label><input type="number" class="form-control" value="${dto.bno }" name="bno" id="bno" readonly="readonly">
				</div>
				<div>
					<label class="form-label">제목</label> <input type="text" class="form-control" value="${dto.btitle }" name="btitle" id="btitle" readonly="readonly">
				</div>
				<div>
					<label class="form-label">작성자</label> <input type="text" class="form-control" value="${sessionScope.unick }" name="bwriter" id="bwriter" readonly="readonly">
				</div>
				<div>
					<label class="form-label ">내용</label>
					<textarea class="form-control" cols="3" rows="20" name="content" id="content" readonly="readonly">${dto.bcontent }</textarea>
				</div>
				<div>
					<input type="hidden" class="form-control" value="${dto.bdel }" name="bdel" id="bdel" readonly="readonly">
				</div>

				<form name="form1" method="post" action="${path}/boarddelete">
					<div class="mt-3">

						<!-- 작성자일 경우에만 수정, 삭제 버튼이 보이도록 적용 -->
						<c:if test="${dto.bwriter == sessionScope.unick}">
							<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#myModal">수정</button>
							<button class="btn btn-danger" type="button" id="btnDelete">삭제</button>
						</c:if>

					</div>
				</form>
				<form method="post" action="${path }/boardlist">
					<div class="d-flex justify-content-end">
						<button class="btn btn-secondary " type="submit" id="btnlist">게시판으로 돌아가기</button>
					</div>
				</form>


				<div class="container mt-5">
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
							<form action="${path }/commentboardW" method="post">
								<div class="mb-3">
									<h5>댓글:</h5>
									<input type="hidden" name="bno" value="${param.bno }">
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
			</div>
		</div>
	</section>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">내용수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<form id="modal" name="modal" method="post" action="${path }/boardupdate">
					<div class="modal-body">
						<div class="container">
							<div class="container mt-3 mb-3 ">
								<input type="hidden" class="form-control" value="${dto.bno}" name="bno" id="bno" required="required">
							</div>

							<div class="container mt-3 mb-3 ">
								<label class="form-label">제목</label> <input type="text" class="form-control" value="${dto.btitle }" name="btitle" id="btitle" required="required">
							</div>
							<div class="container mt-3 mb-3">
								<label class="form-label">내용</label>
								<textarea class="form-control" rows="20" name="bcontent" id="bcontent" required="required">${dto.bcontent }</textarea>
							</div>
							<div class="container mt-3 mb-3">
								<label class="form-label">작성자</label><input type="text" class="form-control" value="${sessionScope.unick}" name="bwriter" id="bwriter" readonly="readonly">
							</div>
							<div>
								<input type="hidden" class="form-control" value="${dto.bdel }" name="bdel" id="bdel" readonly="readonly">
							</div>

						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button id="btnMem" class="btn btn-info mt-3" type="submit">수정</button>
						<button id="btnReset" class="btn btn-secondary mt-3" type="reset">초기화</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>

</body>
</html>
