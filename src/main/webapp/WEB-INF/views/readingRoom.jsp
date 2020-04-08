<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
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

	
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);


.table {
	border: 2px solid #223A5E;
	font-size: 20px;
	text-align: center;
	width: 100%;
}
	
	

	a{
		cursor: pointer;
		color: black;
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

#totalsearchlist{
		float:right;
		background-color:white;
		width:65%;
		margin-right: 8%;
        margin-top:2%;
        margin-bottom: 10%;
        padding:0px;
	}
#libraryList {
font-family: 'Jeju Gothic', sans-serif;
border:none;
font-size: 20px;
text-align: center;
width:95%;
margin-left:2%;

}
#libraryList td{
border:2px solid #223A5E;
height:50px;
padding:15px 0;
}
#libraryList td a{
 text-decoration: none;
 color:black;
}
#libraryList td a:hover{
 text-decoration: none;
 color:red;
}

#libraryList td a.active{
color:blue;
}

#readingRoomList tr td {
border:1px solid black;}
hr{
border:1px solid black;
}
	
	
#readingRoomList {
font-family: 'Jeju Gothic', sans-serif;
border:none;
font-size: 20px;
text-align: center;
width:95%;
margin-left:2%;

}
#readingRoomList td{
border:2px solid #223A5E;
height:50px;
padding:15px 0;
}

#readingRoomList td a{
 text-decoration: none;
 color:black;
}
#readingRoomList td a:hover{
 text-decoration: none;
 color:red;
}

#readingRoomList td a.active{
color:blue;
}
</style>
	
</head>

<body>
 	<jsp:include page="header.jsp" />
 	
 	<aside id="submenu">

		<button class="subtopbtn" disabled>
			<h2>도서관 서비스</h2>
		</button>
		<br>
		<button class="subbtn"
			onclick="location.href = 'readingroommove' ">열람실 예약</button>
		<br>
		<button class="subbtn" onclick="location.href = 'questionmove' ">건의 사항</button>
		<br>
		<button class="subbtn" onclick="location.href = 'noticemove' ">공지 사항</button>
		<br>
		<button class="subbtn" onclick="location.href = 'hopebookmove' ">희망도서 신청</button>

	</aside>
 	
 	<main id="totalsearchlist">
 	
 	<section>
 	<h1 style="font-family: 'Hanna', sans-serif;margin-bottom:3%;margin-top:5px;">열람실 예약</h1>
	<table class="table" style="margin-top:10px;">
				<thead class="thead-dark">
					<tr>
						<th>열람실 예약안내</th>
					</tr>
				</thead>
				<tbody>
					<tr style="text-align: center;">
						<th style="font-family: 'Jeju Gothic', sans-serif;padding-top:30px;font-size:20px;">
						 <p>
						 1.거주 지역을 선택하세요. ▶  &nbsp;
						 2.도서관을 선택하세요. ▶&nbsp;
						 3.이용하실 열람실을 선택하세요. ▶&nbsp;
						 4.원하시는 좌석을 선택하세요.</p>
						</th>
					</tr>
				</tbody>
			</table>

	
					<select class="custom-select" id="lb_loc" name="lb_loc" style="border:5; color: black; width: 320px; margin-top: 20px;margin-left:2%;">
						
						<option selected>거주 지역을 선택해 주세요.</option>
						
					</select>
					<br><br>
			
					<table id="libraryList"  >
					
					</table>
					
		        	<div id="fdkfk"></div>
			    
			
					<table id="readingRoomList">
					
					</table>
		
	
	</section>
 	</main>
</body>
<script type="text/javascript">
window.onload = function(){
	
	$.ajax({ //지역 정보 가져오는 메소드
		url : "getzoneinfo",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	
 	var info=result;
 	
	for(var i=0;i<info.length;i++){
		$("<option>").text(info[i].lb_loc).attr("value",info[i].lb_loc).appendTo($("#lb_loc"));
	}  
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //도서관 이름 ajax End
}




$("#lb_loc").on("change", function(){ //지역 선택시 도서관 목록 보여주는 메소드
	console.log("선택한 지역:",$(this).val());
	
	$.ajax({ //지역 정보에 해당하는 도서관 보여주는 에이작스
		url : "getloclibray",
		type : "get",
		data : {"loc" : $("#lb_loc").val()},
		dataType:'json'
		
}).done((result) => {
	
	console.log("result2=",result);
 	var info=result;
 	$("#libraryList").empty();
 	
 	let $tr;
	for(var i=0;i<info.length;i++){
		$("#fdkfk").empty();
		 $("#fdkfk").append("<hr style='border:1px solid black;width:95%;margin-left:2%;margin-bottom:30px;'>");
		if(i%3 == 0){
			$tr = $("<tr>").appendTo($("#libraryList"));
			
		}
		
		let $td = $("<td>").appendTo($tr);
		$("<a class='atag' href='javascript:readingRoomList("+info[i].lb_code+");'>").html(info[i].lb_name).appendTo($td);
		
	} 

}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
	
}); //change End


$("#libraryList").on("click",".atag",function(){
	$(".atag").removeClass("active");
	$(this).addClass('active');
});	

function readingRoomList(lb_code){ //도서관 클릭시 해당 도서관의 열람실 리스트 보여주는 메소드
	console.log("lb_code=",lb_code)
	$.ajax({
		url : "getreadingroominfo",
		type : "get",
		data : {"lb_code" : lb_code},
		dataType:'json'
		
}).done((result) => {
	console.log("열람실:",result);
 	var info=result;
 	
 	$("#readingRoomList").empty();
 	
 	
 	let $tr;
 	for(var i=0;i<info.length;i++){
		if(i%3 == 0){
			$tr = $("<tr>").appendTo($("#readingRoomList"));
		}
		
		let $td = $("<td>").appendTo($tr);
		$("<a>").html(info[i].rm_name).attr("href","readingroomreservationmove?rm_code="+info[i].rm_code+"&rm_lcode="+info[i].rm_lcode).appendTo($td);
		
	}   
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
}



</script>
</html>