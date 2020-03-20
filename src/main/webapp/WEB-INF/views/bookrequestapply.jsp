<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 페이징 처리 플러그인 -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>	
<!-- 페이징 처리 플러그인 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>	
<style type="text/css">
img {
	width: 300px;
	height: 300px;
}

.input-group-text {
	width: 140px;
	text-align: center;
}

table {
	width: 100%;
	border-spacing: 50px;
}

.container p-3 my-3 border:hover{
	background-color: blue;
	
}

</style>
</head>
<body>
<div class="container p-3 my-3 border">
	<form class="well form-horizontal" action="" method="post" id="contact_form" onsubmit="return check()">
		<fieldset>
		
			<!-- Form Name -->
	
	<legend>도서 신청</legend>
	
	<p class="bbs_comment"><span class="w_star">*</span><font color="blue">도서관 선택 및 도서명을 입력 후 검색버튼을 눌러주세요.</font></p>
	
	<table>
		<colgroup>
		<col style="width:15%">
		<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"><label for="manaber_loc">도서관 지역 <span class="w_star">*</span></label></th>
				<td>
					<div class="input-group mt-3 mb-3">
					<select name="lb_loc" id="lb_loc" class="custom-select" onchange="getLocLibray()">
						<option selected>선택</option>
					</select>
					</div>
				</td>
			</tr>
		
			<tr>
				<th scope="row"><label for="manaber_code">도서관 <span class="w_star">*</span></label></th>
				<td>
					<div class="input-group mt-3 mb-3">
					<select name="lb_name" id="lb_name" style="width:170px;">
					
						<option value="">선택</option>
		
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="title">도서명<span class="w_star">*</span></label></th>
				<td>
					<input id="bk_name" name="bk_name" type="text" class="form-control" required>
					&nbsp;
					<button class="btn btn-success" type="button" data-toggle="modal" data-target="#modalCart">
					검색 </button></td>
			</tr>
			<tr>
				<th scope="row"><label for="isbn">isbn <span class="w_star">*</span><!-- 필수입력시 --></label>
					</th>
				<td><input type="text" id="isbn" class="input_text input_w170" name="isbn"/></td>
			</tr>
			<tr>
				<th scope="row"><label for="publish_year">발행년도 <span class="w_star">*</span></label></th>
				<td><input type="text" id="publish_year" name="publish_year" class="input_text input_w170" value=""/></td>
			</tr>
			<tr>
				<th scope="row"><label for="price">가격<span class="w_star">*</span></label></th>
				<td><input type="text" id="price" name="price" class="input_text input_w170" value=""/></td>
			</tr>
			<tr>
				<th scope="row"><label for="author">저자명</label></th>
				<td><input type="text" id="author" name="author" class="input_text input_w170" /></td>
			</tr>
			<tr>
				<th scope="row"><label for="publisher">발행자</label></th>
				<td><input type="text" id="publisher" name="publisher" class="input_text input_w170" /></td>
			</tr>
			<tr>
				<th scope="row"><label for="recom_opinion">추천의견</label></th>
				<td><input type="text" id="recom_opinion" name="recom_opinion" class="input_text input_wf" /></td>
			</tr>
			<tr>
				<th scope="row">SMS 수신여부<span class="w_star">*</span></th>
				<td><input type="radio" id="smsY" name="sms_receipt_yn" value="Y" checked="checked" />수신  <input type="radio" id="smsN" name="sms_receipt_yn" value="N"/>미수신 &nbsp; &nbsp; &nbsp;<font color="red">*  SMS 미 수신시 희망도서 비치 알림 서비스가 제공되지 않습니다.</font></td> 
			</tr>
		</tbody>
	</table>
	<p class="bbs_comment"><span class="w_star">*</span> 표시된 항목은 필수 입력 항목입니다</p>
	<p class="bbs_btnc"><a href="#" onclick="document.isbnse.submit(); return false"><img src="images/book/sub/btn_ok.png" alt="확인" /></a> <a href="/"><img src="images/book/sub/btn_cancle.png" alt="취소" /></a></p>
	
	</form>
</div>
</body>
<script>

$(function() {
	$.ajax({ //지역 정보 넣어주는 에이작스
		url : "getlocinfo",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
 	var info=result;
	for(var i=0;i<info.length;i++){
		$("<option>").text(info[i].lb_loc).attr("value",info[i].lb_loc).appendTo($("#lb_loc"));
	} 
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
});

function getLocLibray() {
	$.ajax({ //지역 정보에 해당하는 도서관 보여주는 에이작스
		url : "getloclibray",
		type : "get",
		data : {"loc" : $("#lb_loc").val()},
		dataType:'json'
		
}).done((result) => {
	console.log("result2=",result);
 	var info=result;
	for(var i=0;i<info.length;i++){
		$("<option>").text(info[i].lb_name).attr("value",info[i].lb_name).appendTo($("#lb_name"));
	} 
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); // ajax End
}


</script>
</html>