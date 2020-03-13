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
</head>
<style>
	#detailinfo{

		background-color:#f1f1f1;
		height:300px;
		flex:3;
	
		margin-right:5%;
		
	}
	#img{
	flex:1;
	border:1px solid #fde978;
	height:300px;
	margin-right:5%
	}
	td{
	border-bottom: 1px solid #2f2f2f;
	}
	.dd{
	font-weight:700;
	}
	body{
		padding-left:10%;
		padding-right:10%;
	}
	.tt{
	text-align:right;
	font-size:small;
	color:#383838;
	}
	#sidebar{
	flex:1;
	float:left;
	border:2px solid #f1f1f1;
	height:300px;
	}
	#intro{

	width:77%;
	display:block;
	margin-top:5%;
	height:
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
	}
	#state{
	color:red;
	
	}
	#reviewlist{
	
	
	width:100%;
	}
	
	.btn_like {
	  position: relative;
	  margin-left: 72%;
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
</style>
<body>
<h1>상세보기</h1>
<button type="button" class="btn_like">
	<span class="img_emoti">좋아요</span>
	<span class="ani_heart_m"></span>
</button>
 
<div id="container">
    <img src="${books.bk_image}" id="img">

	<table id="detailinfo">
		<tr><td class="tt">자료유형</td><td class="dd">${books.bk_bg_cate}/${books.bk_sg_cate}</td></tr>
		<tr><td class="tt" >책제목</td><td style="color:#2870bf;font-size:large;font-weight:800;"> ${books.bk_name}</td></tr>
		<tr><td class="tt">저자</td><td class="dd">${books.bk_writer }</td><td>
		<tr><td class="tt">발행사항</td><td class="dd">${books.bk_publisher },${books.bk_publicday }</td></tr>
		<tr><td class="tt">ISBN코드</td><td class="dd">${books.bk_code }</td></tr>
		<tr><td class="tt">소장정보</td><td class="dd" id="dd">${books.bk_lname } &nbsp;&nbsp;&nbsp;<span id="state"></span>
		</td></tr>
		
	</table>

<div id="sidebar">
0명이 좋아합니다.<br>
평균평점 _____
</div>
</div>
<div id="intro"><h2>서평</h2>
  ${books.bk_introduction }</div>



 
 <div id="review">
 <h2>한줄평</h2>
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
 <sec:authorize method="isAuthenticated()">
 <input id="id" type="hidden" value="<sec:authentication property="principal.username"/>">
 </sec:authorize>
  

 
</body>
<script>
 //console.log("책정보",${books});
 console.log("책정보1",${books.bk_Quantity});
 console.log("책정보2",${books.bk_booklend});
 
	if(${books.bk_Quantity}>${books.bk_booklend})  
		$("#state").text("대출가능");
	else
		$("#state").text("대출불가");


 
 window.onload = function () {
	if($("#id").val()==""){
			$("#dd").append("<button style='float:right;margin-right:20px;' id='reserbtn'>예약</button>")
	}else{
		
		$.ajax({
			type:'get',
	    	url:'reservationconfirm',
	    	data:{"rv_code":"${books.bk_code}","rv_lcode":${books.bk_lcode}},
	    	dataType:"text",
	    	success:function(result){
	    		if(result=="성공"){
	    			$("#dd").append("<button style='float:right;margin-right:20px;' id='reserccbtn'>예약취소</button>")
	    		}else if(result=="실패"){
	    			$("#dd").append("<button style='float:right;margin-right:20px;' id='reserbtn'>예약</button>")
	    		}
	    	},
	    	error:function(xhr,status){ 
		    	console.log("xhr1=", xhr);
				console.log("status=", status);
		 }
		});//ajax End
		}
		console.log("${principal.username}");
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
			    		$("#reserbtn").replaceWith("<button style='float:right;margin-right:20px;' id='reserccbtn'>예약취소</button>");
			    		
			    		
			    	},
			    	error:function(xhr,status){ 
				    	console.log("xhr2=", xhr);
						console.log("status=", status);
				 }
				});//ajax End
			
			}else{
				alert("취소");
			}
	}
}
	
});




$("#dd").on("click","#reserccbtn",function(){
	if($("#state").text()=="대출가능"){
		$("#reserccbtn").replaceWith("<button style='float:right;margin-right:20px;' id='reserbtn'>예약</button>");
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
			    		$("#reserccbtn").replaceWith("<button style='float:right;margin-right:20px;' id='reserbtn'>예약</button>");
			    	},
			    	error:function(xhr,status){ 
				    	console.log("xhr3=", xhr);
						console.log("status3=", status);
				 }
				});//ajax End
			
			}else{
				alert("취소");
			}
	}
	
});
	
	


$('button').click(function(){
	if($("#id").val()==""){
		location.replace("loginfrm");
	}else{
	    if($(this).hasClass('btn_unlike')){//이히 하트가 눌려있는 상태
	    	$(this).removeClass('btn_unlike');
	   		$('.ani_heart_m').removeClass('hi');
	    	$('.ani_heart_m').addClass('bye');
	     } else{//하트해제되어있는 상태
		   $.ajax({
				type:'get',
		    	url:'likeinsert',
		    	data:{"rv_code":"${books.bk_code}","rv_lcode":${books.bk_lcode}},
		    	dataType:"text",
		    	success:function(result){
		    		alert("찜목록에 추가되었습니다.");
		    		$(this).addClass('btn_unlike');
				  	$('.ani_heart_m').addClass('hi');
			     	$('.ani_heart_m').removeClass('bye');
		    	},
		    	error:function(xhr,status){ 
			    	console.log("xhr2=", xhr);
					console.log("status=", status);
			 }
			});//ajax End
	  		
	  }
	}
	});
	 
 
	 
	 
 
</script>
</html>