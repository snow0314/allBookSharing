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
<!-- 폰트 어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<!-- toastr CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />


<!-- 페이징 처리 플러그인 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<!-- 페이징 처리 플러그인 CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body{font-family: 'Jeju Gothic', sans-serif;}

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

.container p-3 my-3 border:hover {
	background-color: blue;
}
body{font-family: 'Jeju Gothic', sans-serif;}
</style>
</head>

<body>





	<div class="container p-3 my-3 border">

		<form class="well form-horizontal" action="recommendinsert"
			method="post" id="contact_form">
			<fieldset>

				<!-- Form Name -->
				<legend>추천 도서 등록</legend>

				<table>
					<tr>
						<td colspan="2"></td>
						
						<td rowspan="8" colspan="2"
							style="padding-left: 50px; border: 1px;"><img id="bk_image2"
							src="images/default.jpg" class="rounded" alt="Cinque Terre">
							<input type="hidden" name="re_image" id="bk_image" value="">
							
							<div class="form-group purple-border">
								<textarea class="form-control" id="bk_introduction"
									name="re_introduction" rows="7" placeholder="소개글" readonly="readonly"></textarea>
							</div>
						</td>

					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">ISBN 코드</span>
								</div>
								<input id="bk_code" name="re_bcode" type="text"
									class="form-control" required>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">도서명</span>
								</div>
								<input id="bk_name" name="re_bname" type="text"
									class="form-control" required>
								<div class="input-group-append">
									<button class="btn btn-outline-success" type="button"
										data-toggle="modal" data-target="#modalCart">검색</button>
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
								<input id="bk_writer" name="re_bwriter" type="text"
									class="form-control" required>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">출판일</span>
								</div>
								<input id="bk_publicday" name="re_publicday" type="text"
									class="form-control" required>

							</div>
						</td>
						<td rowspan="3" colspan="2">
							
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">출판사</span>
								</div>
								<input id="bk_publisher" name="re_publisher" type="text"
									class="form-control" required>
							</div>
						</td>
					</tr>

					<tr>
						<td style="width: 50%">
							<div class="input-group mt-3 mb-3">
								<select name="re_bg_num" id="bk_bg_num" class="custom-select"
									onchange="getSmallGroup()" required="required">
									<option selected>대분류</option>
								</select>
							</div>
						</td>
						<td style="width: 50%">
							<div class="input-group mt-3 mb-3">
								<select name="re_sg_num" id="bk_sg_num" class="custom-select" required="required">
									<option selected>소분류</option>
								</select>
							</div>

						</td>
					</tr>
					<tr>
						<td colspan="2" rowspan="2">
							<div class="md-form">
								<i class="fas fa-pencil-alt prefix"></i>
								<label for="form10" style="font-size: 25px;">추천글</label>
								<textarea id="form10" name="re_contents" class="md-textarea form-control" rows="5" placeholder="이 책을 추천하는 이유를 써주세요" required="required"></textarea>
								
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: right; padding-top: 100px;"><input
							type="submit" id="insertBtn" class="btn btn-outline-success btn-lg"
							value="등록"> <input type="hidden" name="_csrf"
							value="${_csrf.token}"></td>

					</tr>

				</table>

			</fieldset>
		</form>
	</div>

	<!-- /.container -->

	<!-- Modal: modalCart -->
	<div class="modal fade" id="modalCart" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">도서 검색</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<!--Body-->
				<div class="modal-body">
					<div class="input-group mb-3">
						<input id="bookName" type="text" class="form-control"
							placeholder="Search">
						<div class="input-group-append">
							<button class="btn btn-success" type="button"
								onclick="bookSearch()">Go</button>
						</div>
					</div>
					<div id="contents"></div>
					<div id="pagination"></div>
				</div>
				<!--Footer-->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary"
						data-dismiss="modal">Close</button>
					<button class="btn btn-primary">Checkout</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal: modalCart -->



</body>
<script type="text/javascript" src="js/bookInsert.js?ver2"></script>
<script type="text/javascript">

$(document).ready( function () { //도서관 코드,이름 가져오는 메소드
	$.ajax({ 
		url : "getlibraycode",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
	$("#bk_lname").attr("value",result.LB_NAME);
	$("#bk_lcode").attr("value",result.LB_CODE);
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); 
	
	
});

	var temp;
	
	if(location.search.substr(15)=="true"){
		toastr.success('성공', '도서 등록에 성공하셨습니다.');
	}else if(location.search.substr(15)=="false"){
		toastr.error("실패", "도서 등록에 실패하셨습니다.");
	}

	$(function() {
		$.ajax({ //대분류 가져오는 메소드
			url : "getbiggroup",
			type : "get",
			dataType:'json'
			
	}).done((result) => {
		console.log("result=",result);
		var bigGroup=result;
		for(var i=0;i<bigGroup.length;i++){
			$("<option>").text(bigGroup[i].bigNum+":"+bigGroup[i].category).attr("value",bigGroup[i].bigNum).appendTo($("#bk_bg_num"));
		} 
		
	}).fail((xhr) => {
		console.log("xhr=",xhr);
	}); //대분류 ajax End
		
		
		
		
	});

	
	function getSmallGroup() { //소분류 가져오는 메소드
		var bigNum=$("#bk_bg_num").val();
		console.log(bigNum.charAt(0))
		$.ajax({
			url : "getsmallgroup",
			type : "get",
			data : "bigNum="+bigNum.charAt(0),
			dataType:'json'
			
	}).done((result) => {
		console.log("result=",result);
		var smallGroup=result;
		$("#bk_sg_num").empty();
		for(var i=0;i<smallGroup.length;i++){
			$("<option>").text(smallGroup[i].bigNum+":"+smallGroup[i].category).attr("value",smallGroup[i].bigNum).appendTo($("#bk_sg_num"));
		} 
		
		
	}).fail((xhr) => {
		console.log("xhr=",xhr);
	});
	}
	
		
	function bookSearch() { //도서 검색하는 메소드
		var key = "d5575428c9cfb5d81f026c00efa52fb4";
		var bookName=$("#bookName").val();
		$.ajax({
			url : "https://dapi.kakao.com/v3/search/book",
			headers : {
				'Authorization' : 'KakaoAK ' + key
			},
			type : "get",
			data: {"query" : bookName, 
				   "size" : 50 },
			success : function(result) {
				console.log("페이징 데이터: ",result);
				var data = result;
				      
				let container = $('#pagination');
		        container.pagination({
		        	
		            dataSource: data.documents, //받아온 데이터
		            pageSize: 3,
		            callback: function (data, pagination) { //데이터 찍어주는 부분
		            	console.log("data=",data);
		            	temp=data;
		            	listShow(data);
		            	
		            }
		        })	      
				
			}
		});
	}

	
	$("#bookName").keyup(function(e){
		   if(e.keyCode == 13) 
			   bookSearch();
		   });
	
	
</script>
</html>