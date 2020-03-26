<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
body{
	counter-reset:section;
	}
h4::before {
	counter-increment:section;
	content:counter(section) ;
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);


#d{
	font-family: 'Hanna', sans-serif;
	margin-bottom:30px;
	margin-left:10%
	}

}
</style>
<body>
<h1 id="d">인기도서</h1>
<table id="popularlist">
<c:forEach var="loan" items="${topList}">
	<tr>
		<td><h4>위</h4></td>
		<td><img src="${loan.bk_image }" class="img"></td>
		<td class="prighttd"><a href="topdetailpage?bk_code=${loan.bk_code}" id="bkname">${loan.bk_name }</a><br>${loan.bk_writer }
  			 <br>${loan.bk_publisher }<br>${loan.bk_publicday }<br>대출권수:${loan.bd_count }</td>
  			 
	</tr>
</c:forEach>
</table>
</body>
</html>