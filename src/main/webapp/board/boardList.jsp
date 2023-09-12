<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!--if문쓸려고  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <!-- 날짜형식지정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

#currentPaging {
	border: 1px solid #ccc;
	margin: 5px;
	padding: 5px 8px;
	color: red;
	cursor: pointer;
}
#paging {
	color: black;
	margin: 5px;
	padding: 5px;
	cursor: pointer;
}

.subjectA:link { color: black; text-decoration: none; }
.subjectA:visited { color: black; text-decoration: none; }
.subjectA:hover { color: green; text-decoration: underline; }
.subjectA:active { color: black; text-decoration: none; }
</style>
</head>
<body>
<c:if test="${requestScope.list != null }">
	<table border="1" frame="hsides" rules="rows">
		<tr>
			<th width="100">글번호</th>
			<th width="400">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>	
		<%-- 이부분영상보시오 --%>
		<c:forEach var="boardDTO" items="${list}"> <!--${requestScope.list}써도되고 자바아니라서 자료형필요없고 변수만 있으면됨.  -->
			<tr>
				<td align="center">${boardDTO.seq } </td> <%-- <%=boardDTO.getSeq() %> jstl은 객체를 변수명처럼사용된다. --%>
				<td>
					<a class="subjectA" href="javascript:void(0)" 
					   onclick="isLogin('${boardDTO.id }', ${boardDTO.seq } ,${pg})">${boardDTO.subject}</a>
				</td>
				<td align="center">${boardDTO.id }</td>
				<td align="center"> <fmt:formatDate value="${boardDTO.logtime }" pattern="yyyy.MM.dd" /></td><%--<%=new SimpleDateFormat("yyyy.MM.dd.").format(boardDTO.getLogtime()) %>  --%>
				<td align="center">${boardDTO.hit }</td>
			</tr>
		</c:forEach>
	</table>
	
	<img src="../image/망상토끼.gif" width="50" height="50" 
	     onclick="location.href='../index.jsp'" style="cursor: pointer;" alt="망상토끼">
	
	<div style="width: 900px; text-align: center;">
		${boardPaging.pagingHTML} <%--<%=boardPaging.getPagingHTML() --%>
	</div>   
</c:if>
	
<script type="text/javascript">
function boardPaging(pg){
	location.href = "/boardMVC/board/boardList.do?pg=" + pg;
}

function isLogin(id, seq, pg){
	if(id == 'null') alert("먼저 로그인하세요");
	else location.href = "/boardMVC/board/boardView.do?seq=" + seq + "&pg=" + pg;
}
</script>
</body>
</html>
