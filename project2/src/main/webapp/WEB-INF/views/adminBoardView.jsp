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
					form += '<textarea class="form-control" rows="3" name="cconte"></textarea><br>';
					form += '<input type="hidden" name="cno" value="'+cno+'">';
					form += '<input type="hidden" name="bno" value="${dto.bno}">';
					form += '<input type="hidden" name="cname" value="${sessionScope.unick }">';
					form += '<input type="hidden" name="uid" value="${sessionScope.uid }">';
					var commentDIV = $(this).parents("#comment");
					commentDIV.append(form);
					$(".comment2").remove();
				});
</script>
<script>
	$(document).ready(function() {
		// 게시글 삭제 버튼 클릭 이벤트
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/boarddelete";
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
				<form name="form1" method="post" action="${path}/adminBoardupdate">
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
						<textarea class="form-control" cols="3" rows="20" name="bcontent" id="content" readonly="readonly">${dto.bcontent }</textarea>
					</div>
					<div class="mb-3">
						<label for="bdel" class="form-label">게시물상태</label> <select name="bdel" id="bdel">

							<option value="${dto.bdel}">
								<c:if test="${dto.bdel eq '0'}">
									<td>게시중</td>
								</c:if>
								<c:if test="${dto.bdel ne '0'}">
									<td>차단중</td>
								</c:if>

							</option>
							<option value="0">게시중</option>
							<option value="1">차단중</option>
						</select>
					</div>

					<div class="mt-3">

						<!-- 작성자일 경우에만 수정, 삭제 버튼이 보이도록 적용 -->
						<c:if test="${sessionScope.role eq 'admin'}">
							<button class="btn btn-secondary" type="submit">수정</button>
						</c:if>

					</div>
				</form>
				<form method="post" action="${path }/adminBoardList">
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
										<c:if test="${sessionScope.role eq 'admin'}">
											<span class="delComment" style="color: red;">[삭제]</span>
											<div id="cid">${cm.cno }</div>
										</c:if>

									</div>
									<!-- 댓글 번호 -->
								</div>
								<div id="commentBody">${cm.cconte }</div>
								<!-- 댓글 내용 -->
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
		</div>
	</section>

	<%@ include file="./include/footer.jsp"%>

</body>
</html>
