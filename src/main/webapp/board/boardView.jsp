<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>

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
</style>
</head>
<body>
	<c:if test="${boardDTO != null}">
		<table border="1" frame="hsides" rules="rows">
			<tr>
				<td colspan="3"><h2>${boardDTO.getSubject()}</h2></td>
			</tr>
			
			<tr>
				<td width="150" align="center">글번호 : ${ boardDTO.getSeq()} </td>
				<td width="150" align="center">작성자 : ${boardDTO.getId()} </td>
				<td width="150" align="center">조회수 : ${boardDTO.getHit()}</td>
			</tr>
			
			<tr>
				<td colspan="3" height="250" valign="top"><pre>${boardDTO.getContent()}</pre></td>
			</tr>
		</table>
	</c:if>
	<input type="button" value="목록" onclick="location.href='boardList.do?pg=${pg}'">
</body>
</html>

