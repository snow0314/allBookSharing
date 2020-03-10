<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
 
<style>

.table_box {
	padding: 10px;
	margin: 10px;
	width: 100px;
}

#myProfile {
	float: left;
	margin-right: 270px;
}

#myProfile_rest {
	margin-bottom: 300px;
	
}

#topDiv {

	margin-bottom: 100px;
}

#wishList{
all:unset;
font-weight: bold;
color: blue;
}

#readingRoom{
all:unset;
font-weight: bold;
color: blue;
}
#btn{
 padding-bottom: 5px;
 padding-top: 5px;
 font-size: 16px;
}
#table_rest{
width: 400px;
}
.container{
	margin-top: 50px;
}
</style>




</head>


<body>
 <jsp:include page="header.jsp" />

	<div class="container">
		<div id='topDiv'>

			<div id="myProfile">
			<form action="modifyprofile" method="post">
				<table class="table table-striped" >
					<tr>
						<td>아이디 : </td>
						<td>${mb.mb_id}</td>
						<td rowspan="6">
						<img src="profile/${mb.us_image }" width="150" height="220" alt="프로필 사진" />						
						</td>
					</tr>
					<tr>
						<td>이름 : </td>
						<td>${mb.mb_name }</td>
					</tr>
					<tr>
						<td>핸드폰 : </td>
						<td>${mb.us_phone }</td>
					</tr>
					<tr>
						<td>이메일 : </td>
						<td>${mb.us_email }</td>
					</tr>
					<tr>
						<td>내지역 : </td>
						<td>${mb.mb_area }</td>
					</tr>
					<tr>
						<td>내등급 : </td>
						<td>${mb.us_grade }</td>
					</tr>
				</table>
				<input id='btn' type="submit" value="개인정보 변경"/>
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
			</form>
			</div>

			<div id="myProfile_rest">
				<table id="table_rest" class="table table-striped">
					<tr>
						<td class="table_box">대출건수 <span id="borrowCnt"></span>회</td>
						<td class="table_box">연체건수 <span id="arrearsCnt"></span>회</td>
					</tr>
					<tr>
						<td class="table_box">독서횟수 <span id="reviewCnt"></span>회</td>
						<td class="table_box">누적연체일수 <span id="arrearsDay"></span>일</td>
					</tr>
					<tr>
						<td class="table_box" style="cursor: pointer;"><a id="wishList" href="showwishlist">찜목록</a></td>
						<td class="table_box" style="cursor: pointer;"><a id="readingRoom" href="">열람실 예약좌석보기</a></td>
					</tr>
				</table>
			</div>
		</div>


		<div class="container">
			<h3>대출현황</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 50px;">순번</td>
					<td style="width: 400px;">자료명</td>
					<td style="width: 200px;">대출일</td>
					<td style="width: 200px;">반납일</td>
					<td style="width: 50px;">연장</td>
				</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		
		<div class="container">
			<h3>연체목록</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 50px;">순번</td>
					<td style="width: 400px;">자료명</td>
					<td style="width: 200px;">대출일</td>
					<td style="width: 200px;">반납일</td>
					<td style="width: 50px;">연체일수</td>
				</tr>
				</thead>
				
				<tbody>
				<tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
        <td>mary@example.com</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
        <td>july@example.com</td>
        <td>july@example.com</td>
      </tr>
				</tbody>
			</table>
		</div>
		
		<div class="container">
			<h3>현재 예약 목록</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 50px;">순번</td>
					<td style="width: 300px;">자료명</td>
					<td style="width: 200px;">예약일자</td>
					<td style="width: 200px;">상태</td>
					<td style="width: 50px;">찜</td>
					<td style="width: 50px;">순위</td>
					<td style="width: 50px;">취소</td>
				</tr>
				</thead>
				
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

<script>

	
//대출건수 조회
$.ajax({
	type : 'get',
	url :"borrowcnt",
	success : function(data) {
        $('#borrowCnt').html(data).css('color', 'black').css('font-weight','bold');

     },
	error : function(xhr, status) {
     }
	
}); //end ajax 



//연체건수 조회
$.ajax({
	type : 'get',
	url :"arrearscnt",
	success : function(data) {
        $('#arrearsCnt').html(data).css('color', 'black').css('font-weight','bold');

     },
	error : function(xhr, status) {
     }
	
}); //end ajax  



//독서횟수(리뷰 쓴 횟수) 조회
$.ajax({
	type : 'get',
	url :"reviewcnt",
	success : function(data) {
        $('#reviewCnt').html(data).css('color', 'black').css('font-weight','bold');

     },
	error : function(xhr, status) {
     }
	
}); //end ajax  

//누적 연체일수 조회
$.ajax({
	type : 'get',
	url :"arrearsday",
	success : function(data) {
        $('#arrearsDay').html(data).css('color', 'red').css('font-weight','bold');
     },
	error : function(xhr, status) {
     }
	
}); //end ajax  

//연체목록
$.ajax({
	type : 'get',
	url :"arrearslist",
	dataType:'json',
	success : function(data) {
       
        console.log("data=",data);
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
}); //end ajax



//대출현황
$.ajax({
	type : 'get',
	url :"loanlist",
	dataType:'json',
	success : function(data) {
       
        console.log("data2=",data);
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
}); //end ajax  
</script>



</body>
</html>