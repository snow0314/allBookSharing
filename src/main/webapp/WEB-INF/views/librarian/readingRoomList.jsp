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
#pagination {
	text-align: center;
}
</style>

</head>
<body>
	<div class="container p-3 my-3 border" style="text-align: center">
		<h3>도서관 이름</h3>
	</div>
	<div class="container p-3 my-3 border">

		<table id="contents" class="table table-bordered table-hover">

			<tr>
				<th>번호</th>
				<th>열람실 이름</th>
				<th>전체좌석</th>
				<th>삭제</th>
			</tr>
		</table>
		<div id="pagination"></div>
	</div>
</body>
<script type="text/javascript">

$(document).ready( function () {
	$.ajax({
		url : "readingroomlist",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
	
	
	 let container = $('#pagination');
	container.pagination({
		
	    dataSource: result, //받아온 데이터
	    pageSize: 5,
	    callback: function (data, pagination) { //데이터 찍어주는 부분
	    	$("#contents").empty(); 
	    	for(let i=0;i<data.length;i++){
	    	$tr=$("<tr>").appendTo($("#contents"));
	    	$("<td>").text(i+1).appendTo($tr);
	    	$("<td>").text(data[i].rm_name).appendTo($tr);
	    	$("<td>").text(data[i].totalSeat).appendTo($tr);
	    	$("<td>").append($("<button>").text("삭제").addClass("btn btn-outline-success")
	    			                      .attr("onclick","readingRoomDelete("+data[i].rm_code+")"))
	    	.appendTo($tr);
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