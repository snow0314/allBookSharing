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
  
  
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
 
<style>

.table_box {
	padding: 10px;
	margin: 10px;
	width: 100px;
}

#myProfile {
	float: left;
	margin-right: 250px;
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
color: #007bff;
}

#readingRoom{
all:unset;
font-weight: bold;
color: #007bff;
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
						<img src="/img/profile/${mb.us_image}" width="150" height="220" alt="프로필 사진" />						
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
					<tr>
						<td>포인트 : </td>
						<td><a href=pointlist>${mb.us_point} point</a></td>
						<td><a href=./insertpoint >포인트 충전 바로가기</a></td>
					</tr>
					
					
					
				</table>
				<input id='btn' type="submit" value="개인정보 변경"/>
				<input id='btn' type="submit" value="회원탈퇴" formaction="./memberdrop?${_csrf.parameterName}=${_csrf.token}"/>
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
			</form>
			</div>

			<div id="myProfile_rest">
				<table id="table_rest" class="table table-striped" style="width:435px;">
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
				
        
                <div class="card">
                
                    <canvas id="myChart1"></canvas> 
                    
                    <div class="card-footer text-center text-dark">
                        <h3>대출차트</h3>
                    </div>
                </div>
           
    
			</div>
		</div>
  <!-- 부트스트랩 -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> <!-- 차트 -->

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

//대출차트
$.ajax({
	type : 'get',
	url :"borrowchart",
	success : function(data) {
       // $('#borrowCnt').html(data).css('color', 'black').css('font-weight','bold');
       console.log("데이타는?",data);
       console.log("데이타는?",data[2]);

     },
	error : function(xhr, status) {
     }
	
}); //end ajax 

data = {
        datasets: [{
            backgroundColor: [
                'rgba(255,99,13,0.5)',
                'rgba(54,162,235,0.5)',
                'rgba(255,206,86,0.5)',
                'rgba(75,192,192,0.5)',
                'rgba(153,102,255,0.5)',
                'rgba(255,159,64,0.5)',
                'rgba(105,159,13,0.5)',
                'rgba(30,199,13,0.5)',
            ],
            data: [1,5 , 3,2,4,6,8,2]
        }], 
    labels: ['대분류1','대분류2','대분류3','대분류4','대분류5','대분류6','대분류7','대분류8'] //이름
    }; 




// 가운데 구멍이 없는 파이형 차트 
var ctx1 = document.getElementById("myChart1"); var myPieChart = new Chart(ctx1, { type: 'pie', data: data, options: {
    title:{
    display:true,
    text:'월별 대출 추이'   //차트 제목
}
    
} });


	
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