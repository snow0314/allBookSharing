<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>
 
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
h4{
font-family: 'Jeju Gothic', sans-serif;

}
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
.img{
	width:100%;
	height:175px;
}
.popimgdiv{
	background-color:grey;
	padding:7px;
	width:160px;
}
.popimgtd{
width:50px;
}
.prighttd{
padding-left:20px;
line-height: 26px;
}

</style>
<body>
<h1 id="d">인기도서</h1>

<table id="popularlist">
<c:forEach var="loan" items="${topList}">
	<tr>
		<td><h4>위</h4></td>
		<td class="popimgtd"><div class="popimgdiv"><img src="${loan.bk_image }" class="img"></div></td>
		<td class="prighttd"><a href="topdetailpage?bk_code=${loan.bk_code}" id="bkname">${loan.bk_name }</a><br>${loan.bk_writer }
  			 <br>${loan.bk_publisher }<br>${loan.bk_publicday }<br>대출권수<span class="badge badge-success">${loan.bd_count }</span></td>
  			 
	</tr>
</c:forEach>
</table>
</body>
</html>