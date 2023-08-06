<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="./include/header.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path}/resources/css/mailbox.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

// 체크박스 전체 선택 기능
function chkAll() {
  var checkAll = document.getElementById("checkAll");
  var checkboxes = document.getElementsByName("msgNoList");

  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = checkAll.checked;
  }
}

// 선택된 쪽지 삭제
function deleteSelected() {
  var checkboxes = document.getElementsByName("msgNoList");
  var selectedIds = [];

  for (var i = 0; i < checkboxes.length; i++) {
    if (checkboxes[i].checked) {
      selectedIds.push(checkboxes[i].value);
    }
  }

  if (selectedIds.length > 0) {
    if (confirm("선택한 쪽지를 삭제하시겠습니까?")) {
      var form = document.createElement("form");
      form.setAttribute("method", "post");
      form.setAttribute("action", "${path}/checkDelete");

      for (var i = 0; i < selectedIds.length; i++) {
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", "msgNoList");
        input.setAttribute("value", selectedIds[i]);
        form.appendChild(input);
      }

      document.body.appendChild(form);
      form.submit();
    }
  } else {
    alert("선택된 쪽지가 없습니다.");
  }
}

    // 페이지
    function linkPage(pageNo){
		location.href = "./mailboxReceive?msgNo1="+msgNo1;
	}	
</script>   
</head>

<body>    
<%@ include file="./include/menu.jsp" %>
	<!-- 왼쪽 메뉴 부분 -->
	<div data-aos="fade-up">
	<div class="index_section" style="background-color:#E8F5FF;">     
        <li style="list-style:none;"><h1>쪽지</h1>
            <div class="line"></div>
            <ul class="msgComponent">
            <li style="list-style:none;"><a href="${path}/mailbox" style="text-decoration: none;"><button type="button" onclick="writeMsg();" class="msg_write_btn">쪽지쓰기</button></a></li>
            <li style="list-style:none;"><a href="${path}/mailboxReceive"  style="text-decoration: none;">받은쪽지함</a></li>
            <li style="list-style:none;"><a href="${path}/mailboxSend"  style="text-decoration: none;">보낸쪽지함</a></li>
            <!--<li style="list-style:none;"><a href="${path}/mailboxDelete"  style="text-decoration: none;">휴지통</a></li>  -->
           
            </ul>        
        </li>      
      <div class="line"></div>
    </div>
    
    <!-- 상단 메뉴부분 -->
    
    <div class="messageList">
        <h2 class="msg_title" style="margin:0; text-align:left; font-family: RIDIBatang;">받은쪽지함</h2>       
          <!-- 쪽지 검색 -->
          <div class="megSearchBox">
            <form action="${path}/searchMessageList" method="get">
              <select class="msgSearchList" name="msgSearchList">
                <option value="title">제목</option>
                <option value="send">이름</option>                              
              </select>
              <input type="search" placeholder="원하는 검색어를 입력하세요" name="msgSearchText">
              <button type="submit" class="msg_btn_search">검색</button>
            </form>
     	  </div>
    
          
		  <!--★ 쪽지 삭제 ★-->
          <div class="msgComponent"> 	
            <button type="button" id="btn_delete" class="msg_btn" onclick="deleteSelected();">삭제</button>
            <!--<button type="button" class="msg_btn" onclick="saveSelected();">보관</button>  -->
          </div>
            <table class="message_table" style="table-layout: fixed">
            <colgroup>
                <col style="width:5%"/>
                <col style="width:12%"/>
                <col style="width:65%"/>
                <col style="width:18%"/>
            </colgroup>
              <!-- 메세지 리스트 상단 -->
              <tr>
                <th><input type="checkbox" id="checkAll" onclick="chkAll();"></th>
                <th>보낸사람</th>
                <th colspan="">제목</th>
                <th>날짜</th>
              </tr>          
              
              <c:if test="${list == null || list.size() == 0 }">
            	<tr>
            		<td colspan="4">
            			받은쪽지함이 비어있습니다.
            		</td>
            	</tr>
              </c:if>
              <c:if test="${list != null}">
				<!-- 메세지 리스트 -->
			<c:forEach var="receive" items="${list}">
			<tr id="msgListTable()">
			<td style="width:50px"><input type="checkbox" id="checkAll" name="msgNoList" value="${receive.msgNo1}"></td>			
                
                <td><span class="senderName" id="send">${receive.send}</span></td>
                <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
                	<a href="/mailboxDetail?msgNo1=${receive.msgNo1}" id="detail">${receive.title}</a></td>
                <td style="width:20%"><fmt:formatDate value="${receive.regdate}" pattern="yyyy년 MM월 dd일 a hh:mm:ss" timeZone="Asia/Seoul" /></td>                       
            </tr></c:forEach>
            </c:if>    
            </table>                     
            <!-- 페이지네이션 -->
            <div id="paging" style="width: 100%; height: 30px; text-align: center;">
			<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="linkPage"/></div>
				
     </div>     
</body>
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
</html>