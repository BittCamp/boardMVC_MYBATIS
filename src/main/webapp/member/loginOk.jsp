<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>
	<%-- ${ sessionScope.memName } --%> ${ memName }님 로그인
</h3>

<input type="button" value="로그아웃" onclick="location.href='/boardMVC/member/logout.do'"> 
<input type="button" value="글쓰기" onclick="location.href='/boardMVC/board/boardWriteForm.do'">
</body>
</html>











