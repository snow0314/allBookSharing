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
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
#d{
		font-family: 'Hanna', sans-serif;
		margin-bottom:10px;
		margin-left:7%
		}
.table_box {
	padding: 10px;
	margin: 10px;
	width: 100px;
	
}
#loanList{
margin-top:10px;
}
#myProfile {
	float: left;
	margin-right: 150px;
}

#myProfile_rest {
	font-family: 'Jeju Gothic', sans-serif;
	
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
 font-size: 17px;
 height:45px;
 font-family: 'Nanum Gothic Coding', monospace;
 margin-left:38px;
 border-radius:7px;
 border:2px solid #17a2b8;
 color:#17a2b8;
 background-color:white;
 
}
#btn2{
 padding-bottom: 5px;
 padding-top: 5px;
 font-size: 17px;
 height:45px;
 font-family: 'Nanum Gothic Coding', monospace;
 border-radius:7px;
 border:2px solid #17a2b8;
 color:#17a2b8;
 background-color:white;
 margin-left:10px;
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

	
	#modal_detail{
	cursor: pointer;
	color: #007bff;
	text-decoration: none;
	}
	#modal_detail:hover{
	text-decoration: underline;
	}

#myinfotable{
height:416px;
font-family: 'Jeju Gothic', sans-serif;
margin-left:15px;
}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}

</style>



</head>


<body>
 <jsp:include page="header.jsp" />

<nav id="submenu">
	<button class="subtopbtn" disabled><h2>나의 도서관</h2></button><br>
    <button class="subbtn" onclick="location.href = 'movemypage' " >마이 페이지</button><br>
    <button class="subbtn" onclick="location.href = 'deliveryapplicationmove' " >배송신청목록</button><br>
    <button class="subbtn" onclick="location.href = 'moveloanlist'">대출 목록</button><br>
    <button class="subbtn" onclick="location.href = 'movehopelist'">희망 도서 신청 목록</button>
</nav>


<main id="totalsearchlist">
<h1 id="d">마이페이지</h1>
	<div class="container">
		<div id='topDiv'>

			<div id="myProfile" >
			<form action="modifyprofile" method="post">
				<table class="table table-striped"  id="myinfotable">
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
						<td id='grade'>${mb.us_grade }</td>
					</tr>
					<tr>
						<td>포인트 : </td>
						<td><a href=pointlist>${mb.us_point} point</a></td>
						<td><a id='modal_detail' data-toggle='modal' data-target='#myModal'>포인트 충전 바로가기</a></td>
					</tr>
					
					
					
				</table>
				<input id='btn' type="submit"  value="개인정보 변경"/>
				<input id='btn2' type="submit" value="회원탈퇴" formaction="./memberdrop?${_csrf.parameterName}=${_csrf.token}"/>
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
			</form>
			</div>
			
<script>


</script>
			<div id="myProfile_rest" >
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
						<td class="table_box" style="cursor: pointer;"><a id="reservationCheck" href="#">열람실 예약좌석보기</a></td>
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

		<div class="container" >
		
		<div style="display: flex;">
			<h3 style="font-family: 'Jeju Gothic', sans-serif;">현재 대출현황</h3>&nbsp;&nbsp;<button id="loan_btn" style="margin-bottom:8px;"><i class="fas fa-angle-up"></i></button>
		</div>
		
			<div id="loanList">
			<table class="table table-striped" >
			<thead >
				<tr style="font-family:'Noto Sans KR', sans-serif;">
					<td style="width: 5%; text-align: center;">순번</td>
					<td style="width: 30%;">자료명</td>
					<td style="width: 9%;">대출일</td>
					<td style="width: 9%;">반납예정일</td>
					<td style="width: 8%;">상태</td>
					<td style="width: 10%; text-align: center;">반납</td>
					<td style="width: 10%; text-align: center;">연장</td>
					   
				</tr>
				</thead>
				
				<tbody id="borrow" >
				</tbody>
			</table>
			</div>
		</div>
		
		<div class="container">
			
<div style="display: flex;">
			<h3 style="font-family: 'Jeju Gothic', sans-serif;">연체목록</h3>&nbsp;&nbsp;<button id="arrears_btn" style="margin-bottom:8px;"><i class="fas fa-angle-up"></i></button>
		</div>
		<div id="arrearsList" style="margin-top:10px;">
			<table class="table table-striped" style="font-family: 'Nanum Gothic Coding', monospace;">
			<thead>
				<tr style="font-family:'Noto Sans KR', sans-serif;">
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
			<h3 style="font-family: 'Jeju Gothic', sans-serif;">현재 예약 목록</h3>&nbsp;&nbsp;<button id="res_btn" style="margin-bottom:8px;"><i class="fas fa-angle-up"></i></button>
		</div>
		
			<div id="resList" style="margin-top:10px;">
			<table class="table table-striped" style="font-family: 'Nanum Gothic Coding', monospace;">
			<thead>
				<tr style="font-family:'Noto Sans KR', sans-serif;">
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
				
				<tbody id="reservation" >
				</tbody>
			</table>
			</div>
		</div>
	</div>
	
	</main>




<!-- Modal -->
        <form method="POST">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div id='modal-header' class="modal-header">
        <h3>포인트 충전하기</h3>
          <button type='button' class='close' data-dismiss='modal'>&times;</button>
        </div>
        <div id='modal-body' class="modal-body">
		<div class="container" style="margin-top: 50px;">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th>선택</th>
						<th>충전금액</th>
						<th>충전포인트</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="5000"></label></td>
						<td>5000원</td>
						<td>5000point</td>
					</tr>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="10000"></label></td>
						<td>10,000원</td>
						<td>10000point</td>
					</tr>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="20000"></label></td>
						<td>20,000원</td>
						<td>20000point</td>
					</tr>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="35000"></label></td>
						<td>30,000원</td>
						<td><label for="point">30000point + 5000point</label></td>
					</tr>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="70000"></label></td>
						<td>50,000원</td>
						<td>50000point + 20000point</td>
					</tr>
					<tr>
					<td colspan="3" style='text-align: center;'>
					<button type="submit" class="btn btn-secondary btn-lg" formaction="okpoint">결제하기</button>
					</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
			
		
		</div>
        </div>
        <div id='modal-footer' class="modal-footer">
  		 <button type='button'class="btn btn-secondary btn-lg"  data-dismiss='modal'>Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 </form>



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
	
	return confirm("정말 회원 탈퇴를 하시겠습니까?");
	
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
		if(data>=5 && $("#grade").text()=='일반'){
			$.ajax({
				type:'get',
				url:"changegrade",
				success:function(result){
					console.log("등급변경",result);
					plusPoint();
				},
				error:function(xhr, status){
					console.log("xhr3=", xhr);
					console.log("status=", status);
				}
				
			})
			
		}
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
        spl=data[i].rv_code;//???
        rv_code=spl.split(" ");	
        rv_code=rv_code[0]+" "+rv_code[1];
        console.log("rv_code=",rv_code);
        rank=getRank(rv_code,data[i].rv_lcode);
        console.log("rank=",rank);
        
        var temp = data[i].bk_quantity-data[i].bk_booklend; //대여할 수 있는 권수
        if(temp >= rank){
        	$tr.append("<td id='state' style='color: red;'>대출가능</td>");
        	$tr.append("<td><button id='cart_btn' data-rv_code='"+data[i].rv_code+"' data-rv_lcode='"+data[i].rv_lcode+"' >담기</button></td>");
        }else{
        	$tr.append("<td id='state'>대출불가</td>");
        	$tr.append("<td><button id='cart_btn' disabled >담기</button></td>");
        }
        console.log("temp",temp);
        
        
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
	var rank;
	 $.ajax({
		 
		type : 'get',
		url :"reservationrank",
		data:{"rv_code":rv_code,"rv_lcode":rv_lcode},
		async: false,
		success : function(data) {
			console.log("예약 순위ajax=",data);
			rank = data;
			$("#rank").html(data);
		},
		error : function(xhr, status) {
       console.log("예약순위 에러");
    }
		
	});	 //ajax End
	
	return rank;
	
};


//카트 담기
$(document).on("click","#cart_btn",function(){
  
  $.ajax({
	type:'get',
  	url:'deliinsert',
  	data:{"de_code":$(this).data("rv_code"),
  		  "de_lcode":$(this).data("rv_lcode")},
  	success:function(result){
  		alert("배송신청목록에 추가되었습니다.");
  	},
  	error:function(xhr,status){ 
  		alert("이미 추가된 도서입니다.");
	    	console.log("xhr2=", xhr);
			console.log("status=", status);
	 }
	});//ajax End
});

//예약 취소하기
function reservationCancel(rv_num){
	
	console.log("rv_num",rv_num);
	
	return confirm("취소하시겠습니까?");
	
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
        console.log("대출 현황=",data);
	for(var i=0;i<data.length;i++){   
    	console.log(data[i].bo_num);
    var $tr= $("<tr>").appendTo($("#borrow"));
    $tr.append("<td style='text-align: center;'>"+(i+1)+"</td>");
    $tr.append("<td>"+data[i].bk_name+"</td>");
    $tr.append("<td>"+data[i].bd_date+"</td>");
    $tr.append("<td>"+data[i].bd_return_date+"</td>");
    if(data[i].bd_state_num==1)
    $tr.append("<td style='font-weight:bold;'>대출중</td>");
    if(data[i].bd_state_num==2)
    $tr.append("<td style='font-weight:bold;'>배송 신청</td>");
    if(data[i].bd_state_num==3)
    $tr.append("<td style='font-weight:bold;'>배송 취소</td>");
    if(data[i].bd_state_num==4)
    $tr.append("<td style='font-weight:bold;'>배송 완료</td>");
    if(data[i].bd_state_num==5)
    $tr.append("<td style='font-weight:bold;'>반납 신청</td>");
    if(data[i].bd_state_num==6)
    $tr.append("<td style='font-weight:bold;'>오프라인 반납완료</td>");
    if(data[i].bd_state_num==7)
    $tr.append("<td style='font-weight:bold;'>온라인 반납완료</td>");
    if(data[i].bd_state_num!=2){
    	
    //반납버튼
    if(data[i].bd_state_num==4 || data[i].bd_state_num==1 && data[i].bd_on_off==1)
    $tr.append("<td style='text-align:center;'><button onclick='returnBooks("+data[i].bd_num+")' class='btn btn-info' >반납신청</button></td>");
    else
     $tr.append("<td style='text-align:center;'><button onclick='returnBooks("+data[i].bd_num+")' class='btn btn-info' disabled >반납신청</button></td>");
    }
    else{
    	$tr.append("<td style='text-align:center;'> </td>");
    }
    //연장버튼
    if(data[i].bd_return_extension==0 && data[i].bd_state_num==4)
    $tr.append("<td style='text-align:center;'><button onclick='extend("+data[i].bd_num+")' class='btn btn-info' >연장하기</button></td>");
    
    else if(data[i].bd_return_extension==1)
    $tr.append("<td style='text-align:center;'><button onclick='extend("+data[i].bd_num+")' class='btn btn-info' disabled >연장하기</button></td>");
    
    else if(data[i].bd_state_num!=4)
    	$tr.append("<td style='text-align:center;'> </td>");
    	
    }
	
     },
	error : function(xhr, status) {
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
	
}); //end ajax

//반납 신청하기
function returnBooks(bd_num){
	console.log(bd_num);
	
	 $.ajaxSetup({         
         beforeSend : function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
         });//먼저 보냄
	
	
	$.ajax({
		type : 'post',
		url :"returnbooks",
		data:{bd_num:bd_num},
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
	
	
	
}

//반납일 연장하기
function extend(bd_num){
	console.log(bd_num);
	
	var res=confirm("연장하시겠습니까?"); 

	if(res){
		
	$.ajax({
		type : 'get',
		url :"loanextend",
		data:{bd_num:bd_num},
		async: false,
		success : function(data) {
				location.reload();
			console.log("반납연장ajax=",data);	
		},
		error : function(xhr, status) {
			alert("실패");
        console.log("xhr=", xhr);
        console.log("status=", status);
     }
		
	}); 	//ajax End
	}
}	//fct End


function plusPoint(){
	$.ajax({
		type:'get',
		url:"pluspoint",
		success:function(result){
			console.log("포인트플러스",result);
		},
		error:function(xhr, status){
			console.log("xhr3=", xhr);
			console.log("status=", status);
		}
	
})
} 

$("#reservationCheck").on("click",function(){ //열람실 예약 확인
	$.ajax({
		url : "reservationcheck",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("예약확인:",result);
	alert(result.lb_name+"\n"+result.rm_name+"의 "+result.se_seatnum+"번 자리에 예약하셨습니다.");
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
	alert("예약한 자리가 없습니다.")
}); //ajax End 

}); //click End

</script>



</body>
</html>