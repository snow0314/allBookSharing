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
<!-- 페이징 처리 플러그인 -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>	
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

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
							src="images/default.jpg"
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
									<button class="btn btn-success" type="button" onclick="bookSearch()">검색</button>
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
						<td style="width: 50%">
							<div class="input-group mt-3 mb-3">
								<select name="bk_bg_num" id="bk_bg_num" class="custom-select" onchange="getSmallGroup()">
									<option selected>대분류</option>
								</select>
							</div>
						</td>
						<td style="width: 50%">
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


<!-- Button trigger modal-->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCart">Launch modal</button>

    <!-- Modal: modalCart -->
    <div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">도서 검색</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <!--Body-->
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <input id="bookName" type="text" class="form-control" placeholder="Search">
                        <div class="input-group-append">
                            <button class="btn btn-success" type="button" onclick="bookSearch()">Go</button>
                        </div>
                    </div>
                    
                  <div id="pagination"></div>
                </div>
                <!--Footer-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary">Checkout</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal: modalCart -->



</body>
<script type="text/javascript" src="js/bookInsert.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({ //대분류 가져오는 메소드
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
			$("<option>").text(smallGroup[i].bigNum+":"+smallGroup[i].category).appendTo($("#bk_sg_num"));
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
			data: "query="+bookName ,
			success : function(result) {
				console.log(result);
				var data = result;
		
			/* 	$("#title").val(data.title);
				$("#thumbnail").attr("src", data.thumbnail);  */

				/*    $('#author').val(data.authors);
				      $('#pub').val(data.publisher);
				      $('#price').val(data.price);
				      $('#info').val(data.contents+"...");
				      let date = data.datetime.split('T')[0];
				      $('#date').val(date);
				      $('#translator').val(data.translators);  */
				      
				let container = $('#pagination');
		        container.pagination({
		        	locator: 'data',
		            dataSource: data.documents, //받아온 데이터
		            pageSize: 3,
		            callback: function (data, pagination) { //데이터 찍어주는 부분
		            	console.log("data=",data);
		            	
		            	
		            	list(data);
		                
		            }
		        })	      
				
			}
		});
	}

	function bookInsert() { //도서 등록하는 메소드

	}
	
	
	
</script>
</html>