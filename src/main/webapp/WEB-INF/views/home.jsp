<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<a href="loginfrm">로그인 </a>
<form action="logout" method="post">
<input type="hidden" name="_csrf" value="${_csrf.token}"><br>
<input type="submit" value="로그아웃">
</form>

</body>
</html>
