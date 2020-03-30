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
<!--카카오 지도 api-->

<!--카카오 우편번호 api-->
<script type="text/javascript"
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- toastr CDN -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
   
<style>
	
</style>
</head>
<body>
<form action="libraryDelete" method="post">

		<div class="container p-3 my-3 border" style="width:30%; float:left;">
			<table class="table table-borderless">
			<tr>
				<td>
					<div id="sidebar" class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">지역</span>
						</div>
					<select name="lb_loc" id="lb_loc" onchange="getLocLibray()">
						<option selected>선택</option>
					</select>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
					<div id="sidebar2" class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">도서관</span>
						</div>
					<select name="br_lcode" id="lb_name" onchange="libraryinfo()">
						<option selected>선택</option>
					</select>
					</div>
				</td>
			</tr>
			</table>
		</div>
		
		
		<div class="container p-3 my-3 border" style="width:63%; float:right;">
			<table class="table table-borderless">
			<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">도서관 코드</span>
							</div>
							<input type="text" class="form-control" id="lb_code"
								name="lb_code" readonly="readonly">
						</div>
					</td>
					<td rowspan="5"><span id="guide"
						style="color: #999; display: none"></span>
						<div id="map" style="width: 100%; height: 350px;"></div></td>
				</tr>
				
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">전화번호</span>
							</div>
							<input type="number" class="form-control" id="lb_phone"
								name="lb_phone">
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">이메일</span>
							</div>
							<input type="email" class="form-control" id="lb_email"
								name="lb_email">
						</div>
					</td>
				</tr>
				
				<tr>

					<td><label for="lb_address">주소</label> <input type="text"
						id="lb_postcode" name="lb_postcode" class="form-control"
						placeholder="우편번호">
					</td>
				</tr>
				
				<tr>
					<td><input type="text" id="lb_roadaddr" name="lb_roadaddr"
						class="form-control" placeholder="도로명주소" value="">
					<input type="text" id="lb_branchaddr" name="lb_branchaddr"
						class="form-control" placeholder="지번주소" value=""></td>
				</tr>
				<tr>
					<td><input type="text" id="lb_detailaddr" name="lb_detailaddr"
						class="form-control" placeholder="상세주소" value=""></td>
					<td><input type="text" id="lb_extraaddr" name="lb_extraaddr"
						class="form-control" placeholder="참고항목" value=""> <input
						type="hidden" id="lb_Latitude" name="lb_latitude" value="">
						<input type="hidden" id="lb_longitude" name="lb_longitude"
						value=""></td>
				</tr>

				<tr>
					<td><input type="hidden" name="_csrf" value="${_csrf.token}">

						<input type="submit" id="modify" class="btn btn-outline-success"
						value="수정하기"></td>
				</tr>
			</table>
		</div>
		
			
</form>
<script>
$(function() {
	var temp;
	
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
 	$("#lb_name").empty();
		$("<option>").text("선택").appendTo($("#lb_name"));
	for(var i=0;i<info.length;i++){
		$("<option>").text(info[i].lb_name).attr("value",info[i].lb_code).appendTo($("#lb_name"));
	} 
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); // ajax End
}
</script>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51d85dd9bcbc0b96d2984712a09ec4&libraries=services,clusterer,drawing"></script>
<script>
function libraryinfo() {
	console.log("#br_lcode",$("#lb_name").val());
	$.ajax({ //도서관 정보 가져오는 에이작스
		url : "libraryinfo",
		type : "get",
		data : {"lb_code":$("#lb_name").val()},
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
	$("#lb_code").val(result.lb_code);
	$("#lb_name").val(result.lb_name);
	$("#lb_phone").val(result.lb_phone);
	$("#lb_email").val(result.lb_email);
	$("#lb_loc").val(result.lb_loc);
	$("#lb_postcode").val(result.lb_postcode);
	$("#lb_roadaddr").val(result.lb_roadaddr);
	$("#lb_branchaddr").val(result.lb_branchaddr);
	$("#lb_detailaddr").val(result.lb_detailaddr);
	$("#lb_extraaddr").val(result.lb_extraaddr);
	$("#lb_longitude").val(result.lb_longitude); //경도
	$("#lb_Latitude").val(result.lb_latitude); //위도
	
	
	mapCreate(result.lb_longitude,result.lb_latitude,result.lb_roadaddr);
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
	
	
}
</script>
</html>