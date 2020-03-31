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
 
 
 <!-- 폰트어썸 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <!-- ... -->
 
<style>

.table_box {
	padding: 10px;
	margin: 10px;
	width: 100px;
}

#myProfile {
	float: left;
	margin-right: 150px;
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
#btn2{
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


 #submenu {
  		float: left;
  		width: 15%;
  		height: 100%;  
  	  margin-left: 8%;
  	  margin-top:2%;
}
    .subtopbtn{
width:100%;
font-family: 'Hanna', sans-serif;
height:98px;
background-color:#223A5E;
color:white;
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
 #totalsearchlist{
		float:right;
		background-color:white;
		width:65%;
		height:auto;
		margin-right: 8%;
        margin-top:2%;
        margin-bottom: 5%;
        padding:0px;
	}
</style>



</head>


<body>
 <jsp:include page="header.jsp" />

<nav id="submenu">
	<button class="subtopbtn" disabled><h2>나의 도서관</h2></button><br>
    <button class="subbtn" onclick="location.href = 'movemypage' " >마이 페이지</button><br>
    <button class="subbtn" onclick="location.href = 'movedeliverylist' " >배송 목록</button><br>
    <button class="subbtn" onclick="location.href = 'moveloanlist'">대출 목록</button><br>
    <button class="subbtn" onclick="location.href = 'movehopelist'">희망 도서 신청 목록</button>
</nav>



<main id="totalsearchlist">
	<div class="container">
		<div id='topDiv'>

			<div id="myProfile" >
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
				<input id='btn' type="submit"  value="개인정보 변경"/>
				<input id='btn2' type="submit" value="회원탈퇴" formaction="./memberdrop?${_csrf.parameterName}=${_csrf.token}"/>
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
			</form>
			</div>
			
<script>

$("#btn2").click(function(){
	
	return confirm("회원 탈퇴 하시겠습니까?");
});

</script>
			<div id="myProfile_rest" style="height:280px;">
				<table id="table_rest" class="table table-striped" style="width:478px;">
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
				
        
                <div class="card" style="width:480px;">
                
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
		
		<div style="display: flex;">
			<h3>대출현황</h3><button id="loan_btn" style="height:"><i class="fas fa-angle-up"></i></button>
		</div>
		
			<div id="loanList">
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 80px; text-align: center;">순번</td>
					<td style="width: 400px;">자료명</td>
					<td style="width: 160px;">대출일</td>
					<td style="width: 160px;">반납예정일</td>
					<td style="width: 50px;">연장</td>
				</tr>
				</thead>
				
				<tbody id="borrow">
				</tbody>
			</table>
			</div>
		</div>
		
		<div class="container">
			
<div style="display: flex;">
			<h3>연체목록</h3><button id="arrears_btn" style="height:"><i class="fas fa-angle-up"></i></button>
		</div>
		<div id="arrearsList">
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 80px; text-align: center;">순번</td>
					<td style="width: 400px;">자료명</td>
					<td style="width: 200px;">대출일</td>
					<td style="width: 160px;">반납예정일</td>
					<td style="width: 160px;">반납일</td>
					<td style="width: 120px;">연체일수</td>
				</tr>
				</thead>
				
				<tbody id='arrears'>
				
				</tbody>
			</table>
		</div>
		</div>
		
		<div class="container">
			
<div style="display: flex;">
			<h3>현재 예약 목록</h3><button id="res_btn" style="height:"><i class="fas fa-angle-up"></i></button>
		</div>
		
			<div id="resList">
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 80px; text-align: center;">예약번호</td>
					<td style="width: 120px;">도서관 이름</td>
					<td style="width: 210px;">자료명</td>
					<td style="width: 150px;">예약일자</td>
					<td style="width: 100px;">상태</td>
					<td style="width: 80px;">장바구니</td>
					<td style="width: 50px;">순위</td>
					<td style="width: 50px;">취소</td>
				</tr>
				</thead>
				
				<tbody id="reservation">
				</tbody>
			</table>
			</div>
		</div>
	</div>
	
	</main>

<script>


//대출현황 버튼
$("#loan_btn").click(function(){
	if($("#loan_btn").html()=='<i class="fas fa-angle-down"></i>'){
	$("#loanList").css("display","block");
	$("#loan_btn").html("<i class='fas fa-angle-up'></i>");
	return;
	}
	
	if($("#loan_btn").html()=='<i class="fas fa-angle-up"></i>'){		
	$("#loanList").css("display","none");
	$("#loan_btn").html("<i class='fas fa-angle-down'></i>");
	return;
	}
	
});


//연체목록 버튼
$("#arrears_btn").click(function(){
	if($("#arrears_btn").html()=='<i class="fas fa-angle-down"></i>'){
	$("#arrearsList").css("display","block");
	$("#arrears_btn").html("<i class='fas fa-angle-up'></i>");
	return;
	}
	
	if($("#arrears_btn").html()=='<i class="fas fa-angle-up"></i>'){		
	$("#arrearsList").css("display","none");
	$("#arrears_btn").html("<i class='fas fa-angle-down'></i>");
	return;
	}
	
});


//현재 예약 목록 버튼 
$("#res_btn").click(function(){
	if($("#res_btn").html()=='<i class="fas fa-angle-down"></i>'){
	$("#resList").css("display","block");
	$("#res_btn").html("<i class='fas fa-angle-up'></i>");
	return;
	}
	
	if($("#res_btn").html()=='<i class="fas fa-angle-up"></i>'){		
	$("#resList").css("display","none");
	$("#res_btn").html("<i class='fas fa-angle-down'></i>");
	return;
	}
	
});

//회원탈퇴 버튼 클릭시 컨펌창
$("#btn2").on("click",function(){
	
	confirm("정말 회원 탈퇴를 하시겠습니까?");
	
});

//대출차트
var dataCnt=new Array();
var dataName=new Array();
$.ajax({
	type : 'get',
	url :"borrowchart",
	async: false,	//true:동기, false:비동기 
	success : function(result) {
       // $('#borrowCnt').html(data).css('color', 'black').css('font-weight','bold');
       console.log("데이타는?",result);
       console.log("데이타는?",result[0].bg_cate);
       for(var i=0;i<result.length;i++){
       console.log("데이타는i?",result[i].cnt);
       dataName[i]=result[i].bg_cate;
       dataCnt[i]=result[i].cnt;
       }
       console.log(dataCnt);
       console.log(dataName);

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
                'rgba(30,199,123,0.5)',
                'rgba(40,139,50,0.5)',
            ],
            data: dataCnt
        }], 
    labels: dataName //이름
    }; 




// 가운데 구멍이 없는 파이형 차트 
var ctx1 = document.getElementById("myChart1"); var myPieChart = new Chart(ctx1, { type: 'pie', data: data, options: {
    title:{
    display:true,
    text:'장르별 대출 추이'   //차트 제목
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
        $('#arrearsCnt').html(data).css('color', 'red').css('font-weight','bold');

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
0
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
        for(var i=0;i<data.length;i++){   
        	console.log(data[i].bo_num);
        var $tr= $("<tr>").appendTo($("#arrears"));
        $tr.append("<td style='text-align: center;'>"+(i+1)+"</td>");
        $tr.append("<td>"+data[i].bk_name+"</td>");
        $tr.append("<td>"+data[i].bd_date+"</td>");
        $tr.append("<td>"+data[i].bd_return_date+"</td>");
        $tr.append("<td>"+data[i].bd_real_return_date+"</td>");
        $tr.append("<td>"+data[i].arrearsday+"</td>");
        }
        
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
}); //end ajax


//현재 예약 목록
var rv_code;
var spl;
var rank;
$.ajax({
	type : 'get',
	url :"reservationlist",
	dataType:'json',
	success : function(data) {
        console.log("현재 예약 목록=",data);
        for(var i=0;i<data.length;i++){   
        	//console.log(data[i].bo_num);
        var $tr= $("<tr>").appendTo($("#reservation"));
        $tr.append("<td style='text-align: center;'>"+data[i].rv_num+"</td>");
        $tr.append("<td>"+data[i].lb_name+"</td>");
        $tr.append("<td>"+data[i].bk_name+"</td>");
        $tr.append("<td>"+data[i].rv_date+"</td>");
        if(data[i].bk_state==0)
        $tr.append("<td id='state'>대출불가</td>");
        if(data[i].bk_state==1)
        $tr.append("<td id='state'>대출가능</td>");
        $tr.append("<td><button id='cart_btn'>담기</button></td>");
        spl=data[i].rv_code;//???
        rv_code=spl.split(" ");	
        rv_code=rv_code[0]+" "+rv_code[1];
        console.log("rv_code=",rv_code);
        rank=getRank(rv_code,data[i].rv_lcode);
        console.log("rank=",rank);
        $tr.append("<td style='text-align:center;' ><span id='rank' style='font-weight:bold;'>"+rank+"</span></td>");
        
        $tr.append("<td><button onclick='reservationCancel("+data[i].rv_num+") '>취소</button></td>");
        }
        
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
});  //end ajax


//예약 순위
function getRank(rv_code,rv_lcode){
	
	console.log("rv_code",rv_code);
	console.log("rv_lcode",rv_lcode);
	
	 $.ajax({
		 
		type : 'get',
		url :"reservationrank",
		data:{"rv_code":rv_code,"rv_lcode":rv_lcode},
		success : function(data) {
			console.log("예약 순위ajax=",data);
			$("#rank").html(data);
		},
		error : function(xhr, status) {
       console.log("예약순위 에러");
    }
		
	});	 //ajax End
	
	
	
};


/* //카트 담기
$("#cart_btn").on("click",function(){
        if($("#state").html()=="대출불가"){
        	alert("대출 불가 상품입니다.");
        	return;
        }
        else if($("#state").html()=="대출가능"){
        	
        }
}); */

//예약 취소하기
function reservationCancel(rv_num){
	
	console.log("rv_num",rv_num);
 	 $.ajax({
		type : 'get',
		url :"reservationcancell",
		data:{rv_num:rv_num},
		success : function(data) {
			console.log("예약취소ajax=",data);
				location.reload();
		},
		error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
		
	});	 //ajax End
	
}; //reservationCancel end



//대출현황
$.ajax({
	type : 'get',
	url :"loanlist",
	dataType:'json',
	success : function(data) {
        console.log("data2=",data);
	for(var i=0;i<data.length;i++){   
    	console.log(data[i].bo_num);
    var $tr= $("<tr>").appendTo($("#borrow"));
    $tr.append("<td style='text-align: center;'>"+(i+1)+"</td>");
    $tr.append("<td>"+data[i].bk_name+"</td>");
    $tr.append("<td>"+data[i].bd_date+"</td>");
    $tr.append("<td>"+data[i].bd_return_date+"</td>");
    if(data[i].bd_return_extension==0)
    $tr.append("<td><button onclick='extend("+data[i].bo_num+")'>연장하기</button></td>");
    if(data[i].bd_return_extension==1)
    $tr.append("<td><button onclick='extend("+data[i].bo_num+")' disabled >연장하기</button></td>");
    }
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
}); //end ajax



//반납일 연장하기
function extend(bd_bo_num){
	console.log(bd_bo_num);

	$.ajax({
		type : 'get',
		url :"loanextend",
		data:{bd_bo_num:bd_bo_num},
		async: false,
		success : function(data) {
				location.reload();
			console.log("반납연장ajax=",data);
			
			
		},
		error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
		
	}); 	//ajax End
}	//fct End


</script>



</body>
</html>