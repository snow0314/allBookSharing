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

body{font-family: 'Jeju Gothic', sans-serif;}

#pagination {
	text-align: center;
}

body{font-family: 'Jeju Gothic', sans-serif;}
</style>
</head>
<body>
	<div class="container p-3 my-3 border" style="text-align: center">
		<h3>사서 목록</h3>
	</div>
	<div class="container p-3 my-3 border">

		<table  class="table table-bordered table-hover" style="text-align: center;">
		<colgroup>
			<col width="5%">
			<col width="20%">
			<col width="10%">
			<col width="10%">
			<col width="5%">
		</colgroup>
		<thead>
			<tr>
				<th>도서관 코드</th>
				<th>도서관 이름</th>
				<th>도서관 지역</th>
				<th>사서 아이디</th>
				<th>삭 제</th>
			</tr>
		</thead>
		<tbody id="contents">
		
		</tbody>	
		</table>
		<div id="pagination" style="margin-left:35%";></div>
	</div>
</body>
<script type="text/javascript">
var data;
$(document).ready( function () {
	$.ajax({
		url : "getinfo",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
	data=result;
	var info=result;
	let container = $('#pagination');
	container.pagination({
		
	    dataSource: result, //받아온 데이터
	    pageSize: 5,
	    callback: function (data, pagination) { //데이터 찍어주는 부분
	    	$("#contents").empty();
	    	for(let i=0;i<data.length;i++){
	    	$tr=$("<tr>").appendTo($("#contents"));
	    	$("<td>").text(data[i].lb_code).appendTo($tr);
	    	$("<td>").text(data[i].lb_name).appendTo($tr);
	    	$("<td>").text(data[i].lb_loc).appendTo($tr);
	    	$("<td>").text(data[i].la_id).appendTo($tr);
	    	$("<td>").append($("<button>").text("삭제").addClass("btn btn-outline-danger")
	    			                      .attr("onclick","librarianDelete('"+data[i].la_id+"')"))
	    	.appendTo($tr);
	    	}
	    }
	}); 
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
	

});	

function librarianDelete(la_id){
	
	$.ajax({
		url : "librariandelete",
		type : "get",
		data : {"la_id" : la_id},
		dataType:'text'
		
}).done((result) => {
	console.log("result=",result);
	
	if(result=="성공"){
		toastr.success('성공', '삭제에 성공하셨습니다.');
	}else{
		toastr.error("실패", "삭제에 실패하셨습니다.");
	}
	
	location.reload(true);
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
	
}



</script>

</html>