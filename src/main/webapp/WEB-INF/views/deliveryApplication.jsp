<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- toastr CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<link rel="stylesheet" href="css/deliveryCheckBox.css">
</head>

<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

h4 {
	font-family: 'Hanna', sans-serif;
}

h3 {
	font-family: 'Hanna', sans-serif;
}

#d {
	font-family: 'Hanna', sans-serif;
	margin-bottom: 30px;
	margin-left: 10%
}

.recontents {
	width: 370px;
	vertical-align: middle;
	background-color: #F6D155;
	border-radius: 20px;
	padding: 10px;
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
}

.recotd {
	vertical-align: middle;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 750;
	padding-left: 20px;
}

.deliveryimg {
	width: 100%;
	height: 175px;
	
}

.deliveryimgdiv {
	background-color: grey;
	padding: 10px;
	margin-left: 20px;
	width: 160px;
}

.bname {
	color: #00498c;
	font-size: x-large;
	font-weight: bold;
}

#recommendList {
	width: 80%;
	margin-left: 5%;
	border-collapse: separate;
	border-spacing: 0 20px;
}

#recommendList tr {
	margin-bottom: 40px;
}

.recointro {
	padding: 0 5%;
	border: 2px solid #6B5B95;
	border-radius: 20px;
	font-family: 'Noto Sans KR', sans-serif;
}

tr {
	height: 100px;
}
element.style {
    width: 100%;
    height: 170px;
}

/* 버튼 디자인 */
.myButton{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.myButton:hover{
  background:#fff;
  color:#1AAB8A;
}
.myButton:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.myButton:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.myButton:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
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
</style>

<body>

	
	
		<table id="delivery" class="table table-bordered">
			<colgroup>
				<col width="20%">
				<col width="15%">
				<col width="65%">
			</colgroup>


		</table>
	<div class="container p-3 my-3 border" style="width: 1107px">
		<div style="display: inline;">
			<span>총 배송비는 선택한 도서관 수 * 5000원 입니다.</span><br>
			배송비 :<span id="libCnt">도서관수</span> * 5000원= <span id="total">총배송비</span>
		</div>
		<div style="display: inline; margin-left: 580px;">
			<button id="apply" class='myButton' type="button">배송신청</button>
		</div>
	</div>


	
		
</body>
<script type="text/javascript" src="js/ajaxCsrf.js"></script>
<script>
$(document).ready( function () {
	pageShow();
	var grade;
	var borrowCnt;
	var point;
}); //ready End

function pageShow(){
	$.ajax({ 
		url : "getdeliverylist",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
	var str="";
	$("#delivery").empty();
	for(let i=0;i<result.length;i++){
		str+="<tr>";
		str+="<td style='text-align: center; vertical-align:middle;'>";
		str+="<div class='checkbox checkbox-inline checkbox-success checkbox-md'>";
		str+="<input type='checkbox' class='styled' id='"+i+"'  "
				+" data-decode='"+result[i].de_code+"' data-delcode='"+result[i].de_lcode+"' data-quantity='"+result[i].de_quantity+"' value='option3'>";
		str+="<label for='"+i+"'></label>";
		str+="</div>";
		str+="</td><td>";
		str+="<div class='deliveryimgdiv'><img src='"+result[i].bk_image+"' class='deliveryimg'></div>";
		str+="</td>";
		str+="<td class='recotd'>";
		str+="<span class='bname'>"+result[i].bk_name+"</span>";
		str+="<input type='hidden' name='de_code' value='"+result[i].de_code+"'";
		str+="<br>저자 : "+result[i].bk_writer+"";
		str+="<br>출판사 : "+result[i].bk_publisher+"";
		str+="<br>출판일 : "+result[i].bk_publicday+"";
		str+="<br>대분류/소분류 : "+result[i].bg_cate+"/"+result[i].sg_cate;
		str+="<br>도서관 : "+result[i].lb_name+"";
		str+="<input type='hidden' name='de_lcode' value='"+result[i].de_lcode+"'";
		str+="<br><br>권수 : "+result[i].de_quantity+"";
		str+="</td>";
		str+="<td style='text-align: center; vertical-align:middle;'>";
		str+="<button class='myButton' data-decode='"+result[i].de_code+"' data-delcode='"+result[i].de_lcode+"'>삭제</button>";
		str+="</td></tr>";
	}
	$(str).appendTo($("#delivery"));
   
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
}

$("div").on("change",".styled",function(){ //체크박스 클릭시 배송비 산정하는 메소드
	
	console.log("attr1",$(this).attr("checked"))
	
	if($(this).attr("checked")==undefined || $(this).attr("checked")==false){
		$(this).attr("checked",true);
	}else{
		$(this).attr("checked",false);
	}
	
	console.log("attr2",$(this).attr("checked"));
	console.log("de_code",$(this).data("decode"));
	console.log("de_lcode",$(this).data("delcode"));
	console.log("de_quantity",$(this).data("quantity"));
	let temp=0;
	let lib=new Array();;
	$('.styled:checked').each(function() {
		temp+=$(this).data("quantity");
		lib.push($(this).data("delcode"));
   });
	console.log("temp",temp);
	console.log("lib",lib);
	console.log("유니크",$.unique(lib).length);
	
	//$("#cnt").text(temp);
	$("#libCnt").text($.unique(lib).length);
	$("#total").text($.unique(lib).length*5000+"원");
	
});

$("#apply").on("click",function(){ //배송 신청 버튼 클릭시 작동하는 메소드
	let conf=confirm("배송 신청하시겠습니까?");
	if(conf){
	gradeCheck();
	borrowCntCheck();
	pointCheck();
	let temp=0;
	let lib=new Array();
	let allData = new Array();
	console.log("borrowCnt:",borrowCnt);
	$('.styled:checked').each(function() {
		let data ={};
		data.de_code = $(this).data("decode");
		data.de_lcode = $(this).data("delcode");
		data.de_quantity = $(this).data("quantity");
		allData.push(data);
		temp+=Number($(this).data("quantity")); //총 권수
		lib.push($(this).data("delcode")); //도서관 개수
   });
	console.log("alldata",allData);
	
	if($('.styled:checked').length==0){
		toastr.error('실패', '배송 신청할 책을 선택해 주세요');
		return false;
	}
	
	if(grade=="일반"){
		if(borrowCnt>3){
			toastr.error('실패', '일반 회원은 최대 3권까지 대여할 수 있습니다.');
			return false;
		}else if(borrowCnt+temp>3){
			toastr.error('실패', '일반 회원은 최대 3권까지 대여할 수 있습니다.');
			return false;
		}
		
		if(temp>3){
			toastr.error('실패', '일반 회원은 최대 3권까지 대여할 수 있습니다.');
			return false;
		}
	}else if(grade =="우수"){
		if(borrowCnt>5){
			toastr.error('실패', '우수 회원은 최대 5권까지 대여할 수 있습니다.');
			return false;
		}else if(borrowCnt+temp>5){
			console.log("신청버튼 누름, 권수:",borrowCnt+temp);
			console.log("temp",temp);
			toastr.error('실패', '우수 회원은 최대 5권까지 대여할 수 있습니다.');
			return false;
		}
		if(temp>5){
			toastr.error('실패', '우수 회원은 최대 5권까지 대여할 수 있습니다.');
			return false;
		}
	}
	
	if(point < $.unique(lib).length*3000){
		toastr.error('실패', '포인트가 부족합니다.');
		return false;
	}
	
	$.ajax({ //배송 신청하러 가는 에이작스
		url : "borrowlistinsert",
		type : "post",
		data : {"json" : JSON.stringify(allData), "pl_inout" : $.unique(lib).length*5000},
		dataType:'text'
		
}).done((result) => {
	console.log("result=",result);
	if(result == "성공"){
		toastr.success('성공', '성공적으로 배송신청 하셨습니다.');
		pageShow();
	}
	
}).fail((xhr) => {
	console.log("배송신청 xhr=",xhr);
}); //ajax End
	}else{
		return false;
	} //if(conf) End
	
	grade=0;
	borrowCnt=0;
	point=0;
});

function gradeCheck(){//사용자 등급 확인하러 가는 메소드
	
$.ajax({ 
		url : "usergradecheck",
		type : "get",
		async: false,
		dataType:'text'
		
}).done((result) => {
	console.log("result=",result);
	grade=result;
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
}

function borrowCntCheck(){//사용자가 현재 빌린 권수 확인하러 가는 메소드
	$.ajax({ 
		url : "borrowcntcheck",
		type : "get",
		async: false,
		dataType:'text'
		
}).done((result) => {
	console.log("권수=",result);
	borrowCnt=Number(result);
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
}

function pointCheck(){ //사용자 포인트 가져오는 메소드
	$.ajax({ 
		url : "pointcheck",
		type : "get",
		async: false,
		dataType:'text'
		
}).done((result) => {
	console.log("포인트=",result);
	point=result;
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
}

$(document).on("click",".btn",function(){//삭제 버튼 클릭시
	
	var data = {};
	data.de_code = $(this).data("decode");
	data.de_lcode = $(this).data("delcode");
	console.log("삭제데이터:",data);
	
	$.ajax({ 
		url : "deliverydelete",
		type : "post",
		async: false,
		data : {"json":JSON.stringify(data)},
		dataType:'text'
		
}).done((result) => {
	console.log("삭제=",result);
	toastr.success('성공', '해당 도서를 삭제했습니다.');
	pageShow();
	
}).fail((xhr) => {
	console.log("삭제 xhr=",xhr);
}); //ajax End
});

</script>
</html>
