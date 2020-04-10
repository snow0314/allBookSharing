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
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
#submenu {
  		float: left;
  		width: 15%;
  		height: 100%;  
  	  margin-left: 8%;
  	  margin-top:2%;
}
.subbtn{
	width:100%;
	background-color:white;
	height:55px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight:bold;
	font-size:20px;
	border:none;


}
.subbtn:hover{
	background-color:#F0EAD6;
}
.subtopbtn{
	width:100%;
	font-family: 'Hanna', sans-serif;
	height:98px;
	background-color:#223A5E;
	color:white;
}
#detailinfo{
		padding:7px;
		height:300px;
		flex:3;
		border-radius: 10px;
		margin-right:5%;	
		background-color:#e7eaed;
		margin-top:20px;
	}
#img{
	flex:1;
	border:1px solid #fde978;
	height:280px;
	margin-right:5%;
	margin-top:20px;
	
	}

td{

	}
.dd{
		font-weight:750;
		font-size:20px;
		padding-left:10px;
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
	margin-top:3%;
	font-size:45px;
	font-weight:560;
	margin-bottom:-5px;
	 
	}
h1{
	font-family: 'Hanna', sans-serif;
	}
	#bname{
		color:#00498c;
		font-size:27px;
		font-weight:850;
		padding-left:20px;
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
#sidebar{
	flex:1;
	float:left;
	background-color:#F0EAD6;
	border-radius: 20px;
	text-align:center;
    vertical-align:middle;
    height:50%;
    font-family: 'Jeju Gothic', sans-serif;
    font-size:23px;
   	padding:15px;
   	margin-top:20px;
	}
#topdetailmain{
	float:right;
	width:70%;
	margin-right:4%;
	margin-bottom:7%;
}
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<nav id="submenu">
	<button class="subtopbtn" disabled><h2>자료검색</h2></button><br>
    <button class="subbtn" onclick="location.href = 'totalsearch' " >통합검색</button><br>
    <button class="subbtn" onclick="location.href = 'totalsearch?kind=besttopten'">인기도서</button><br>
    <button class="subbtn" onclick="location.href = 'totalsearch?kind=recommend'">추천도서</button>
</nav>
<main id="topdetailmain">
<h2 id="title">상세보기</h2>



 
<div id="container">
    <img src="${books.bk_image}" id="img">
    

	<table id="detailinfo">
		<tr><td class="tt">자료유형</td><td class="dd">${books.bk_bg_cate}/${books.bk_sg_cate}</td></tr>
		<tr><td class="tt" >책제목</td><td  id="bname"> ${books.bk_name}</td></tr>
		<tr><td class="tt">저자</td><td class="dd">${books.bk_writer }</td><td>
		<tr><td class="tt">발행사항</td><td class="dd">${books.bk_publisher },${books.bk_publicday }</td></tr>
		<tr><td class="tt">ISBN코드</td><td class="dd">${books.bk_code }</td></tr>
	</table>
	
	<div id="sidebar">
	<span id="likecount"></span>명이 좋아합니다.<br>
		평균평점 = ${rvgrade.avg}<br>
	</div>
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
 
</main>
</body>
<script>
window.onload = function () {
	likeCount();
	
}

function likeCount(){
	$.ajax({
		type:'get',
    	url:'likecount',
    	data:{"lk_bcode":"${books.bk_code}"},  
    	dataType:"text",
    	success:function(result4){
    		console.log(result4);
    		$("#likecount").text(result4);
    	},
    	error:function(xhr,status){ 
	    	console.log("xhr1=", xhr);
			console.log("status=", status);
	 }
	});//ajax End
}
</script>
</html>