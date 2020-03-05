<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
</style>
</head>

<body>





	<div class="container p-3 my-3 border">

		<form class="well form-horizontal" action=" " method="post"
			id="contact_form">
			<fieldset>

				<!-- Form Name -->
				<legend>도서 등록</legend>

				<table>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">소속도서관</span>
								</div>
								<input id="lb_name" name="lb_name" type="text"
									class="form-control"> <input type="hidden"
									id="bk_lcode" name="bk_lcode" value="">
							</div>
						</td>
						<td></td>
						<td rowspan="4" colspan="2"
							style="padding-left: 50px; border: 1px;"><img id="bk_image"
							name="bk_image"
							src="https://lh3.googleusercontent.com/proxy/zCSyUHCeyLMi9OFz744Uq1FKPHr9FAHXOno8XSYA06OK1BVmni_mapX3uImFwhJ1Kknvtk55I6RXQfIDqPTDxl4X9RE1SdKnjs5fqS34MZ1mGbaSUih_WnU"
							class="rounded" alt="Cinque Terre"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">ISBN 코드</span>
								</div>
								<input id="bk_code" name="bk_code" type="text"
									class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">도서명</span>
								</div>
								<input id="bk_name" name="bk_name" type="text"
									class="form-control">
								<div class="input-group-append">
									<button class="btn btn-success" type="button">검색</button>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">저자</span>
								</div>
								<input id="bk_writer" name="bk_writer" type="text"
									class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">출판일</span>
								</div>
								<input id="bk_publicday" name="bk_publicday" type="text"
									class="form-control">

							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">출판사</span>
								</div>
								<input id="bk_publisher" name="bk_publisher" type="text"
									class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">권수</span>
								</div>
								<input id="bk_Quantity" name="bk_Quantity" type="text"
									class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="input-group mt-3 mb-3">
								<select name="bk_bg_num" id="bk_bg_num" class="custom-select" onchange="getSmallGroup()">
									<option selected>대분류</option>
								</select>
							</div>
						</td>
						<td>
							<div class="input-group mt-3 mb-3">
								<select name="bk_sg_num" id="bk_sg_num" class="custom-select" >
									<option selected>소분류</option>
								</select>
							</div>

						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right">
							<button id="insertBtn" type="button"
								class="btn btn-primary btn-lg" onclick="bookInsert()">등록</button>
						</td>
					</tr>

				</table>

			</fieldset>
		</form>
	</div>

	<!-- /.container -->


</body>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "getbiggroup",
			type : "get",
			dataType:'json'
			
	}).done((result) => {
		console.log("result=",result);
		var bigGroup=result;
		for(var i=0;i<bigGroup.length;i++){
			$("<option>").text(bigGroup[i].bigNum+":"+bigGroup[i].category).appendTo($("#bk_bg_num"));
		} 
		
	}).fail((xhr) => {
		console.log("xhr=",xhr);
	});
	});

	function getSmallGroup() {
		var a=$("#bk_bg_num").val();
		console.log(a.charAt(0));
		$.ajax({
			url : "getsmallgroup",
			type : "get",
			dataType:'json'
			
	}).done((result) => {
		console.log("result=",result);
		var smallGroup=result;
		
		for(var i=0;i<bigGroup.length;i++){
			$("<option>").text(bigGroup[i].bigNum+":"+bigGroup[i].category).appendTo($("#bk_bg_num"));
		} 
		
	}).fail((xhr) => {
		console.log("xhr=",xhr);
	});
	}
	
		
	function test() { //도서 검색하는 메소드
		var key = "d5575428c9cfb5d81f026c00efa52fb4";
		$.ajax({
			url : "https://dapi.kakao.com/v3/search/book",
			headers : {
				'Authorization' : 'KakaoAK ' + key
			},
			type : "get",
			data : {
				query : "연금술사",
				target : 'title'
			},
			success : function(result) {
				let data = result.documents[0];
				$("#title").val(data.title);
				$("#thumbnail").attr("src", data.thumbnail);

				/*    $('#author').val(data.authors);
				      $('#pub').val(data.publisher);
				      $('#price').val(data.price);
				      $('#info').val(data.contents+"...");
				      let date = data.datetime.split('T')[0];
				      $('#date').val(date);
				      $('#translator').val(data.translators);  */
				console.log(result);
			}
		});
	}

	function bookInsert() { //도서 등록하는 메소드

	}
</script>
</html>