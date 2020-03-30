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
#br_sms1{
margin:5px;
}
#br_sms2{
margin:5px;
}

</style>
</head>
<body>
<%-- <jsp:include page="header.jsp" /> --%>
<div class="container p-3 my-3 border">
	<form class="well form-horizontal" action="bookrequestapply" method="post" id="contact_form">
		
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
					<select name="br_lcode" id="lb_name" style="width:170px;" class="custom-select">
						<option selected>선택</option>
					</select>
					</div>
				</td>
			</tr>
			
			
			
			<tr>
				<th scope="row"><label for="title">도서명<span class="w_star">*</span></label></th>
				<td>
					<div class="input-group mt-3 mb-3">
					<input type="hidden" name="br_image" id="bk_image" value="">
					<input id="bk_name" name="br_name" type="text" class="form-control" required>
					&nbsp;
					<button class="btn btn-success" type="button" data-toggle="modal" data-target="#modalCart">
					검색 
					</button>
					</div></td>
			</tr>
			
			<tr>
				<th scope="row"><label for="isbn">isbn <span class="w_star">*</span><!-- 필수입력시 --></label></th>
				<td>
					<div class="input-group mt-3 mb-3">
					<input type="text" id="bk_code" class="form-control" name="br_bcode" required/>
					</div></td>
			</tr>
			
			<tr>
				<th scope="row"><label for="author">저자명</label></th>
				<td>
				<div class="input-group mt-3 mb-3">
				<input type="text" id="bk_writer" name="br_writer" class="form-control" required/>
				</div></td>
			</tr>
			
			<tr>
				<th scope="row"><label for="author">신청 제목 </label></th>
				<td>
				<div class="input-group mt-3 mb-3">
				<input type="text" id="br_titile" name="br_titile" class="form-control" placeholder="희망도서를 신청합니다." required/>
				</div></td>
			</tr>
			
			<tr>
				<th scope="row"><label for="recom_opinion">신청 이유</label></th>
				<td>
				<div class="input-group mt-3 mb-3">
				<input type="text" id="br_reason" name="br_reason" class="form-control" required/>
				</div></td>
			</tr>
			
			<!-- <tr>
				<th scope="row">SMS 수신여부<span class="w_star">*</span></th>
				<td>
				<div class="input-group mt-2 mb-2">
				<input type="radio" id="br_sms1" name="br_sms" value="0" checked="checked" />수신  
				<input type="radio" id="br_sms2" name="br_sms" value="1"/>미수신 
				&nbsp; &nbsp; &nbsp;<font color="red">*  SMS 미 수신시 희망도서 비치 알림 서비스가 제공되지 않습니다.</font>
				</div></td> 
			</tr> -->
			
			<tr>
				<td colspan="2" style="text-align: right">
				<input type="submit" id="insertBtn"
				class="btn btn-success btn-lg" value="등록">
				<input type="hidden" name="_csrf" value="${_csrf.token}">	
				<input type="submit" id=""
				class="btn btn-success btn-lg" value="취소">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
 <!-- Modal: modalCart -->
    <div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
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
                    <div id="contents">
						                    
                    
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
<script type="text/javascript" src="js/bookInsert.js">

</script>
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

//등록 버튼 확인창
$("#insertBtn").on("click",function(){
	
	confirm("등록 하시겠습니까?");
	
});

/* function check(){
	if($("#br_title").val() ==""){
		alert("제목을 입력해주세요.");
		return false;
	}
} */

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


</script>
</html>