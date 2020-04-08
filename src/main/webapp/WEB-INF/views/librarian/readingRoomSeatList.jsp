<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 페이징 처리 플러그인 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<!-- 페이징 처리 플러그인 CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

<!-- 폰트 어썸 -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- toastr CDN -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>	
	
	
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
#pagination {
	text-align: center;
}
body{font-family: 'Jeju Gothic', sans-serif;}
</style>

</head>
<body>
	<div class="container-fluid" style="text-align: center; margin-top: 60px; margin-bottom: 30px; font-size: 50px;">
		<span>${LB_NAME}</span>
	</div>
	<div class="container-fluid" style="text-align: center;">

		<table id="contents" class="table table-bordered table-hover" style="font-size: 25px">
			<colgroup>
				<col width="10%">
				<col width="50%">
				<col width="10%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>열람실 이름</th>
				<th>전체좌석</th>
				<th>사용중인 좌석</th>
				<th>잔여 좌석</th>
			</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
		<div id="pagination" style="margin-left: 45%"></div>
	</div>
</body>
<script type="text/javascript">

$(document).ready( function () {
	$.ajax({
		url : "readingroomseatlist",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("좌석관리목록=",result);
	
	
	 let container = $('#pagination');
	container.pagination({
		
	    dataSource: result, //받아온 데이터
	    pageSize: 5,
	    callback: function (data, pagination) { //데이터 찍어주는 부분
	    	$("tbody").empty(); 
	    	for(let i=0;i<data.length;i++){
	    		$tr=$("<tr>").appendTo($("tbody"));
	    		$("<td>").text(i+1).appendTo($tr);
	    		$("<a>").text(data[i].rm_name).attr("href","readingroomseatmanagement?rm_code="+data[i].rm_code).appendTo($("<td>").appendTo($tr));
	    		$("<td>").text(data[i].totalSeat).appendTo($tr);
	    		$("<td>").text(data[i].numberOfSeatsInUse).appendTo($tr);
	    		$("<td>").text(data[i].numberOfSeatsAvailable).appendTo($tr);
	    	}
	    }
	}); 
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
	
	
});	


function readingRoomDelete(rm_code){
	
	$.ajax({
		url : "readingroomdelete",
		type : "get",
		data : {"rm_code" : rm_code},
		dataType:'text'
		
}).done((result) => {
	console.log("result=",result);
	
	if(result=="성공"){
		toastr.success('성공', '열람실 삭제에 성공하셨습니다.');
	}else{
		toastr.error("실패", "열람실 삭제에 실패하셨습니다.");
	}
	
	location.reload(true);
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
	
}



</script>

</html>