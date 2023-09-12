<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!--  [ 김찬영  2023-09-8 오후 04:37:20 ]-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>MVC기반의 게시판</h1>
<c:if test="${ sessionScope.memId==null}">
	<h3><a href="/boardMVC/member/loginForm.do">로그인</a></h3>
</c:if>
<c:if test="${ sessionScope.memId!=null}">
	<h3><a href="/boardMVC/member/logout.do">로그아웃</a></h3>
	<h3><a href="/boardMVC/board/boardWriteForm.do">글쓰기</a></h3>
</c:if>

<h3><a href="/boardMVC/board/boardList.do?pg=1">목록</a></h3>
</body>
</html>