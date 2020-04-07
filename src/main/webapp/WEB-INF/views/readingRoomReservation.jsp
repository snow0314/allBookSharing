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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 폰트 어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- toastr CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<style>
.btn-group-toggle label {
	width: 70px;
	height: 70px;
}

#side {
	padding-left: 100px;
}

td a {
	font-size: 20px;
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
i{
float:right;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div style="text-align: center;">
		<h1>${libName}</h1>
	</div>
	<div class="row">

			<nav id="submenu">
				<button class="subtopbtn" disabled>
					<h2>열람실</h2>
				</button>
		
			</nav>
		
		<div class="col-9" style="padding-right: 50px;">
			<div class="p-3 my-3 border">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">열람실 이름</span>
					</div>
					<input id="rm_name" name="rm_name" type="text" class="form-control"
						readonly="readonly"> <input id="rm_code" name="rm_code"
						type="hidden">
				</div>
				<div class="row">
					<div class="col-4">
						<label for="total_seat" class="control-label mb-1">총 좌석수</label>
						<div class="input-group">
							<input id="total_seat" name="total_seat" type="tel"
								class="form-control cc-cvc" value="" readonly>
						</div>
					</div>
					<div class="col-4">
						<div class="form-group">
							<label for="numberOfSeatsInUse" class="control-label mb-1">사용
								좌석</label> <input id="numberOfSeatsInUse" name="numberOfSeatsInUse"
								type="number" class="form-control cc-exp" value=""
								readonly="readonly"> <span class="help-block"
								data-valmsg-for="cc-exp" data-valmsg-replace="true"></span>
						</div>
					</div>
					<div class="col-4">
						<label for="numberOfSeatsAvailable" class="control-label mb-1">잔여
							좌석</label>
						<div class="input-group">
							<input id="numberOfSeatsAvailable" name="numberOfSeatsAvailable"
								type="number" class="form-control cc-cvc" value=""
								readonly="readonly">
						</div>
					</div>

				</div>


				<div class="col-md-4 ml-auto" style="text-align: right">
					<button id="reservationCheck" type="button" class="btn btn-success">
						<i class="fas fa-pen"></i>&nbsp; 예약확인
					</button>
					<button id="reservationCancel" type="button"
						class="btn btn-success">
						<i class="fas fa-pen"></i>&nbsp; 예약취소
					</button>
				</div>

			</div>
			<div class="p-3 my-3 border" style="text-align: center">
				<div id="seats" class="btn-group-toggle" data-toggle="buttons">

				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="js/ajaxCsrf.js"></script>
<script type="text/javascript">
	
window.onload = function (){
		
	
		//사이드에 열람실 목록 보여주는 부분
		let info=${readingRoomList};
		sideMenu(info);
			
		var readingRoom=${readingRoom};
		$("#rm_name").val(readingRoom.rm_name);
		$("#rm_code").val(readingRoom.rm_code);
		numberOfSeatsInUse(readingRoom.rm_code); //사용중인 좌석, 잔여 좌석 구하기 및 그리기
		$("#total_seat").val(readingRoom.totalSeat);
		
		var seats=readingRoom.seats;
		let col=readingRoom.rm_col;
		let low=readingRoom.rm_low;
				//좌석성보, 행,  열
		showSeats(seats, low, col); // 좌석 그려주는 메소드
		
	} //ready End
			
function numberOfSeatsInUse(rm_code){ //사용중인 좌석 수 구하는 메소드
	$.ajax({
		url : "numberofseatsinuse",
		type : "get",
		data : {"rm_code" : rm_code},
		dataType:'json'
		
}).done((result) => {
	console.log("사용중인 좌석수:",result);
 	$("#numberOfSeatsAvailable").val(result.numberOfSeatsAvailable);
 	$("#numberOfSeatsInUse").val(result.numberOfSeatsInUse);
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End

}//function End


$("#seats").on("click","input",function(event){ //예약하는 메소드
	event.preventDefault(); //버블링 막기
	
	let result = window.confirm("예약하시겠습니까?");
	
	if(result){
		let data = {"se_code" : $("#rm_code").val(),
					"se_low" : $(this).data("row"),
					"se_col" : $(this).data("col"),
					"se_seatnum" : $(this).data("num")};
		
		  $.ajax({
			url : "readingroomreservation",
			type : "post",
			data : {"json" : JSON.stringify(data)},
			dataType:'text'
			
	}).done((result) => {
		console.log("예약:",result);
		alert(result);
		location.reload();
		
	}).fail((xhr) => {
		console.log("xhr=",xhr);
	}); //ajax End 
		
	}else{
		return false;
	}
	
});


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

$("#reservationCancel").on("click", function(){ //열람실 예약 취소
	let confirm = window.confirm("예약을 취소 하시겠습니까?");
	
	if(confirm){
		$.ajax({
			url : "userreadingroomreservationcancel",
			type : "get",
			dataType:'text'
			
	}).done((result) => {
		if(result == "실패"){
			alert("예약한 자리가 없습니다.");
		}else{
			alert(result);
			location.reload();
		}
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End 

	}else{
		return false;
	}
});

function sideMenu(info){ //옆에 열람실 목록 보여주는 메소드
	for(var i=0;i<info.length;i++){
		$("<button>").addClass("subbtn")
					.text(info[i].rm_name)
					.attr("onclick","location.href='readingroomreservationmove?rm_code="+info[i].rm_code+"&rm_lcode="+info[i].rm_lcode+"'") 
					.appendTo($("#submenu"));
		$("<br>").appendTo($("#submenu"));
	} 
}

function showSeats(seats, low, col){
	var cnt=1; //좌석 번호 
	for (let j = 1; j <= col; j++) {

        for (let i = 1; i <= low; i++) {
            
        	for(let k=0;k < seats.length; k++){
        		if(seats[k].se_low == i && seats[k].se_col == j){
        			
        			if(seats[k].se_place == 0){ 
        				let $label=$("<label>").addClass("btn")
						   .appendTo($("#seats"));
 
 						$("<input>").attr("name","seat")
 									.attr("type","checkbox")
 									.attr("data-col",j)
 									.attr("data-row",i)
 									.attr("disabled","disabled")
 									.appendTo($label);
        				
        			}else if(seats[k].se_place == 1){ //예약가능 좌석
        				let $label=$("<label>").addClass("btn btn-outline-success")
						   .text(cnt).appendTo($("#seats"));
 
 						$("<input>").attr("name","seat")
 									.attr("type","checkbox")
 									.attr("data-col",j)
 									.attr("data-row",i)
 									.attr("data-num",cnt)
 									.appendTo($label);
 						cnt++;
        			}else{ //예약된 좌석
        				let $label=$("<label>").addClass("btn btn-outline-danger active")
						   .text(cnt).appendTo($("#seats"));
 
 						$("<input>").attr("name","seat")
 									.attr("type","checkbox")
 									.attr("data-col",j)
 									.attr("data-row",i)
 									.attr("data-num",cnt)
 									.attr("disabled","disabled")
 									.appendTo($label);
 						cnt++;
        			} //else End
        			
        			break;
        		} //if End
        		
        	} //for k End
            
        } //for i End
       $("<br>").appendTo($("#seats"));
        
    } // for j End
}
</script>
</html>