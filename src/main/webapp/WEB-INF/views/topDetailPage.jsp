<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
	#detailinfo{
		border:3px solid #838487;
		padding:7px;
		height:300px;
		flex:3;
		border-radius: 10px;
		margin-right:5%;	
		margin-top:3%;
	}
	#img{
	flex:1;
	border:1px solid #fde978;
	height:300px;
	margin-right:5%;
	margin-top:3%;
	margin-left:10%;
	}
	h1{
	font-family: 'Hanna', sans-serif;
	}
	td{

	}
	.dd{
		font-weight:750;
		font-size:20px;
		padding-left:10px;
	}
	body{
		padding-left:10%;
		padding-right:10%;
	}
	.tt{
	text-align:right;
	font-size:18px;
	color:#383838;
	}
	
	#intro{
	width:77%;
	display:block;
	margin-top:15px;
	margin-left:12%
	}
	#have{
	border:1px solid #4a8af4;
	width:60%;
	}
	#review{
	
	width:77%;
	}
	#container{
	display:flex;
	margin-left:10%;
	margin-right:10%;
	}
	#state{
	color:red;
	
	}
	#reviewlist{
	width:100%;
	text-align:center;
	}
	#reviewlist th{
	background-color:#b7b8ba;
	height:30px;
	font-size:18px;
	}
	#review{
	margin-left:12%;
	margin-top:5%;
	width:77%;
	}
	#title{
	 margin-left:10%;
	 font-family: 'Hanna', sans-serif;
	 margin-top:2%;
	 font-size:45px;
	 font-weight:600;
	 margin-bottom:-5px;
	}
	#bname{
		color:#00498c;
		font-size:27px;
		font-weight:850;
		padding-left:10px;
	}
	#introcontents{
	font-family: 'Noto Sans KR', sans-serif;
	font-size:18px;
	line-height:25px;
	
	}
	hr{
	width:85%;
	margin-left:8%;
	margin-top:18px;
	margin-bottom:25px;
	}
</style>
<body>
<h1 id="title">상세보기</h1>



 
<div id="container">
    <img src="${books.bk_image}" id="img">

	<table id="detailinfo">
		<tr><td class="tt">자료유형</td><td class="dd">${books.bk_bg_cate}/${books.bk_sg_cate}</td></tr>
		<tr><td class="tt" >책제목</td><td  id="bname"> ${books.bk_name}</td></tr>
		<tr><td class="tt">저자</td><td class="dd">${books.bk_writer }</td><td>
		<tr><td class="tt">발행사항</td><td class="dd">${books.bk_publisher },${books.bk_publicday }</td></tr>
		<tr><td class="tt">ISBN코드</td><td class="dd">${books.bk_code }</td></tr>
	</table>
</div>
<hr>
<div id="intro"><h1>서평 <i class='far fa-file-alt' style='font-size:24px'></i></h1>
<div id="introcontents">${books.bk_introduction }</div>
  </div>


 
 <div id="review">
 <h1>한줄평<i class='fas fa-pencil-alt' style='font-size:24px'></i></h1>
	<table id="reviewlist">
	<tr>
	<th>아이디</th>
	<th>한줄평</th>
	<th>평점</th>
	</tr>
	<c:forEach var="review" items="${review}">
	 <tr>
	 	<td>${review.rv_id}</td>
	 	<td>${review.rv_contents}</td>
	 	<td>${review.rv_grade}</td>
	 </tr>
	 </c:forEach>
	</table>
 </div>
 

</body>
</html>