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
	.reservation{
	width:95px;
	height:38px;
	border:1px solid #00539C;
	font-size:15px;
	color:#00539C;
	font-weight:800;
	background-color:white;
	}
	.reservation:hover{
	background-color:#00539C;
	color:white;
	
	}
	#deliveryreq{
	width:95px;
	height:38px;
	border:1px solid #00539C;
	font-size:15px;
	color:#00539C;
	font-weight:800;
	background-color:white;

	}
	#deliveryreq:hover{
	background-color:#00539C;
	color:white;
	cursor:pointer;
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
	#detailinfo{
		
		padding:7px;
		height:300px;
		flex:3;
		border-radius: 10px;
		margin-right:5%;	
		background-color:#e7eaed;
	}
	#img{
	flex:1;
	border:1px solid #fde978;
	height:300px;
	margin-right:5%;

	}
	
	#bname{
		color:#00498c;
		font-size:27px;
		font-weight:850;
		padding-left:10px;
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
	
	#container{
	display:flex;
	margin-left:10%;
	margin-right:10%;
	}
	#state{
	color:red;
	
	}
	
	
	.btn_like {
	  position: relative;
	  margin-left: 65%;
	  margin-bottom:7px;
	  display: block;
	  width: 46px;
	  height: 46px;
	  border: 1px solid #e8e8e8;
	  border-radius: 44px;
	  font-family: notokr-bold,sans-serif;
	  font-size: 14px;
	  line-height: 16px;
	  background-color: #fff;
	  color: #DD5D54;
	  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
	  transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
	  cursor: pointer;
	}
	
	.btn_like:hover {
	  border: 1px solid rgba(228,89,89,0.3);
	  background-color: rgba(228,89,89,0.02);
	  box-shadow: 0 2px 4px 0 #dc4d41;
	}

	.btn_unlike .img_emoti {
    	background-position: -30px -120px;
	}

	.img_emoti {
	    display: inline-block;
	    overflow: hidden;
	    font-size: 0;
	    line-height: 0;
	    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
	    text-indent: -9999px;
	    vertical-align: top;
	    width: 20px;
	    height: 17px;
	    margin-top: 1px;
	    background-position: 0px -120px;
	    text-indent: 0;
	}

	.btn_like .ani_heart_m {
  	  margin: -63px 0 0 -63px;
	}

	.ani_heart_m {
	    display: block;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 125px;
	    height: 125px;
	    margin: -63px 0 0 -63px;
	    pointer-events: none;
	}

	.ani_heart_m.hi {
	    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_on_m.png);
	    -webkit-background-size: 9000px 125px;
	    background-size: 9000px 125px;
	    animation: on_m 1.06s steps(72);
	}

	.ani_heart_m.bye {
	    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_off_m.png);
	    -webkit-background-size: 8250px 125px;
	    background-size: 8250px 125px;
	    animation: off_m 1.06s steps(66);
	}

	@keyframes on_m {
	  from { background-position: 0 }
	  to { background-position: -9000px }
	}

	@keyframes off_m {
		from { background-position: 0 }
  		to { background-position: -8250px }
	}
	hr{
	width:85%;
	margin-left:8%;
	margin-top:-18px;
	margin-bottom:25px;
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
	#introcontents{
	font-family: 'Noto Sans KR', sans-serif;
	font-size:18px;
	line-height:25px;
	
	}
	
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
#detailmain{
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

<main id="detailmain">
<h2 id="title">상세보기</h2>


<button type="button" class="btn_like" id="heart">
	<span class="img_emoti">좋아요</span>
	<span class="ani_heart_m"></span>
</button>

 
<div id="container">
    <img src="${books.bk_image}" id="img">

	<table id="detailinfo">
		<tr><td class="tt">자료유형</td><td class="dd">${books.bk_bg_cate}/${books.bk_sg_cate}</td></tr>
		<tr><td class="tt" >책제목</td><td  id="bname"> ${books.bk_name}</td></tr>
		<tr><td class="tt">저자</td><td class="dd">${books.bk_writer }</td><td>
		<tr><td class="tt">발행사항</td><td class="dd">${books.bk_publisher },${books.bk_publicday }</td></tr>
		<tr><td class="tt">ISBN코드</td><td class="dd">${books.bk_code }</td></tr>
		<tr><td class="tt">소장정보</td><td class="dd" id="dd">${books.bk_lname } &nbsp;&nbsp;&nbsp;<span id="state"></span>
		<button style="float:right;" id="deliveryreq">배송신청</button></td></tr>
		
	</table>

<div id="sidebar">
<span id="likecount"></span>명이 좋아합니다.<br>
평균평점 = ${rvgrade.avg}<br>
총 예약자 수 = <span id="reservcount"></span>
</div>
</div>

<br><br>
<hr>

<div id="intro">
<h1>서평 <i class='far fa-file-alt' style='font-size:24px'></i></h1>
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
 
 <sec:authorize access="isAuthenticated()">
 <input id="id" type="hidden" value="<sec:authentication property="principal.username"/>">
 </sec:authorize>
  <sec:authorize access="isAnonymous()"> 
<input id="id" type="hidden" value=""/>
</sec:authorize>
</main>
</body>
<script>
var dc=0;
if(${books.bk_state}==0)
	$("#state").text("대출불가");
else if(${books.bk_state}==1)
		$("#state").text("대출가능");
	


 
 window.onload = function () {
	 
	
	if($("#id").val()==""){
		$("#dd").append("<button style='float:right;margin-right:20px;'  class='reservation' id='reserbtn'>예약</button>");
		likeCount();
		reservCount();
	}else{
		
		$.ajax({
			type:'get',
	    	url:'reservationconfirm',
	    	data:{"rv_code":"${books.bk_code}","rv_lcode":${books.bk_lcode}},
	    	dataType:"text",
	    	success:function(result1){
	    		console.log("예약확인",result1);
	    		if(result1=="성공"){
	    			$("#dd").append("<button style='float:right;margin-right:20px;' class='reservation' id='reserccbtn'>예약취소</button>")
	    		}else if(result1=="실패"){
	    			$("#dd").append("<button style='float:right;margin-right:20px;' class='reservation' id='reserbtn'>예약</button>")
	    		}
	    	},
	    	error:function(xhr,status){ 
		    	console.log("xhr1=", xhr);
				console.log("status=", status);
		 }
		});//ajax End
		reservCount()
		
		$.ajax({
			type:'get',
	    	url:'likedconfirm',
	    	data:{"lk_bcode":"${books.bk_code}","lk_lcode":${books.bk_lcode}},  
	    	dataType:"text",
	    	success:function(result2){
	    		if(result2=="성공"){
	    			 	$('#heart').addClass('btn_unlike');
	    			 	$('.ani_heart_m').addClass('hi');
				     	$('.ani_heart_m').removeClass('bye');
	    		}else if(result2=="실패"){
	    			$('#heart').removeClass('btn_unlike');
			   		$('.ani_heart_m').removeClass('hi');
			    	$('.ani_heart_m').addClass('bye');
	    		}
	    	},
	    	error:function(xhr,status){ 
		    	console.log("xhr1=", xhr);
				console.log("status=", status);
		 }
		});//ajax End
		
		likeCount();
		
		
		
		}
		
	}



$("#dd").on("click","#reserbtn",function(){
if($("#id").val()==""){
	
	location.replace("loginfrm");
	
}else{
	if($("#state").text()=="대출가능"){
		alert("예약 불가능 합니다.")
	} else if($("#state").text()=="대출불가"){
	
			var result1=confirm("예약하시겠습니까?");
		
			if(result1){
				
				$.ajax({
					type:'get',
			    	url:'reservation',
			    	data:{"rv_code":"${books.bk_code}","rv_lcode":${books.bk_lcode}},
			    	dataType:"text",
			    	success:function(result){
			    		console.log("result="+result);
			    		alert("예약되었습니다.");
			    		$("#reserbtn").replaceWith("<button style='float:right;margin-right:20px;'  class='reservation' id='reserccbtn'>예약취소</button>");
			    		
			    		
			    	},
			    	error:function(xhr,status){ 
				    	console.log("xhr2=", xhr);
						console.log("status=", status);
				 }
				});//ajax End
				reservCount()
			
			}else{
				alert("취소");
			}
	}
}
	
});
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

function deliveryCount(){
	
	$.ajax({
		type:'get',
		url:'delicount',
		data:{"de_code":"${books.bk_code}","de_lcode":${books.bk_lcode}},
		dataType:"text",
		async: false,
		success:function(result){
			dc=result;
			console.log("배송카운트=",dc);
		},
		error:function(xhr,status){
			console.log("xhr1=", xhr);
			console.log("status=", status);
		}
	})
		return dc;
	
}

function reservCount(){
	$.ajax({
		type:'get',
		url:'reservcount',
		data:{"rv_code":"${books.bk_code}","rv_lcode":${books.bk_lcode}},
		dataType:"text",
		async: false,
		success:function(result3){
			console.log("예약카운트=",result3);
			$("#reservcount").text(result3);
		},
		error:function(xhr,status){
			console.log("xhr1=", xhr);
			console.log("status=", status);
		}
	})

}



$("#dd").on("click","#reserccbtn",function(){
	if($("#state").text()=="대출가능"){
		$("#reserccbtn").replaceWith("<button style='float:right;margin-right:20px;' class='reservation' id='reserbtn'>예약</button>");
	} else if($("#state").text()=="대출불가"){
			var result2=confirm("예약취소하시겠습니까?");
		
			if(result2){
				$.ajax({
					type:'get',
			    	url:'reservationcancel',
			    	data:{"rv_code":"${books.bk_code}","rv_lcode":${books.bk_lcode}},
			    	success:function(result){
			    		console.log("result="+result);
			    		console.log("test");
			    		alert("취소되었습니다.");
			    		$("#reserccbtn").replaceWith("<button style='float:right;margin-right:20px;' class='reservation' id='reserbtn'>예약</button>");
			    	},
			    	error:function(xhr,status){ 
				    	console.log("xhr3=", xhr);
						console.log("status3=", status);
				 }
				});//ajax End
				reservCount();
			}else{
				alert("취소");
			}
	}
	
});
	
	


$('#heart').click(function(){
	  if($('#heart').hasClass('btn_unlike')){//이히 하트가 눌려있는 상태
		  $.ajax({
				type:'get',
		    	url:'likecancel',
		    	data:{"lk_bcode":"${books.bk_code}","lk_lcode":${books.bk_lcode}},
		    	success:function(result){
		    		$('#heart').removeClass('btn_unlike');
		    		$('.ani_heart_m').removeClass('hi');
		    		$('.ani_heart_m').addClass('bye');
			   
		    	},
		    	error:function(xhr,status){ 
			    	console.log("xhr3=", xhr);
					console.log("status3=", status); 
			 }
			});//ajax End
		  likeCount();
	  }
	  else{//하트해제되어있는 상태
		 if($("#id").val()==""){
				location.replace("loginfrm");
			}else{
				$.ajax({
					type:'get',
			    	url:'likeinsert',
			    	data:{"lk_bcode":"${books.bk_code}","lk_lcode":${books.bk_lcode}},
			    	success:function(result){
			    		$('#heart').addClass('btn_unlike');
					  	$('.ani_heart_m').addClass('hi');
				     	$('.ani_heart_m').removeClass('bye');
			    	},
			    	error:function(xhr,status){ 
				    	console.log("xhr2=", xhr);
						console.log("status=", status);
				 }
				});//ajax End
				likeCount();
			}
	  }
	});
	
$("#dd").on("click","#deliveryreq",function(){
	console.log(dc); 
	dc=deliveryCount();
	console.log(dc); 
	
	 if($("#id").val()==""){
		location.replace("loginfrm");
		}else{
			  if($("#state").text()=="대출가능"){
			  	if(dc=="1"){alert("이미 배송신청 하셨습니다.");
			 	 }else if(deliveryCount()=="0"){
				  $.ajax({
						type:'get',
				    	url:'deliinsert',
				    	data:{"de_code":"${books.bk_code}","de_lcode":${books.bk_lcode}},
				    	success:function(result){
				    		alert("배송신청목록에 추가되었습니다.");
				    	},
				    	error:function(xhr,status){ 
					    	console.log("xhr2=", xhr);
							console.log("status=", status);
					 }
					});//ajax End
			  }
			
			} else if($("#state").text()=="대출불가"){
				alert("대출불가 해서 신청불가능 ");
			
		}
	
}
});	 
</script>
</html>