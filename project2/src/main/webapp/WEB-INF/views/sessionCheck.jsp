<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 명령어 대체 -->


<!-- 한개의 조건만 처리할 때 -->
<c:if test="${sessionScope.uid == null }">
	<script>
		alert("로그인 하신 후 사용해 주세요."); //알림창->확인버튼을 클릭 후
		location.href="${path}/login";  //로그인 페이지로 이동
	</script>
</c:if>