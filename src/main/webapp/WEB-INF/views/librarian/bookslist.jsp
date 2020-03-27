<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>

<!-- 데이터 테이블 체크박스 -->
<link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
<script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

<!-- 데이터 테이블 select -->
<link type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet" />
<link type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" rel="stylesheet" />
<script
	src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
<style type="text/css">
	img{
		width: 250px;
		height: 250px;
	}
	textarea {
		width: 250px;
		height: 250px;
		padding-left: 100px;
}
.input-group-lg > .input-group-prepend > .input-group-text {
    font-size: 1rem;
    line-height: 1.5;
    padding: 0.5rem 1rem;
    border-radius: 0.3rem;
    width: 100px;
    text-align: center;
}
</style>	
</head>
<body>
<div class="container p-3 my-3 border" style="width: 80%; height: 80%">
	<table id="example" class="display" style="width:100%">
	<thead>
		<tr>
					<th></th>
					<th>대분류</th>
					<th>소분류</th>
					<th>ISBN 코드</th>
					<th>책 제목</th>
					<th>저자</th>
					<th>소유 권수</th>
					<th>대출 권수</th>

		</tr>
	</thead>
	
</table>
</div>

<!-- Modal: modalCart -->
    <div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                 
                </div>
                <!--Body-->
                <div class="modal-body">
                    <div class="container p-3 my-3 border">

		<form class="well form-horizontal" action="libraybookmodify" method="post"
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
								<input id="bk_lname" name="bk_lname" type="text"
									class="form-control" readonly="readonly"> 
									<!-- 도서관 이름 및 도서관 코드 가져오기 -->
									<input type="hidden" id="bk_lcode" name="bk_lcode" value="1" >
							</div>
						</td>
						<td></td>
						<td rowspan="4" colspan="2"
							style="padding-left: 50px; border: 1px;"><img id="bk_image2"
							src="images/default.jpg"
							class="rounded" alt="Cinque Terre">
							<input type="hidden" name="bk_image" id="bk_image" value="">
							</td>
							
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">ISBN 코드</span>
								</div>
								<input id="bk_code" name="bk_code" type="text"
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
								<input id="bk_name" name="bk_name" type="text"
									class="form-control" required>
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
								<input id="bk_publicday" name="bk_publicday" type="text"
									class="form-control" required>

							</div>
						</td>
						<td rowspan="3" colspan="2">
							<div class="form-group purple-border">
  							<textarea class="form-control" id="bk_introduction" name="bk_introduction" rows="7"></textarea>
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
									class="form-control" required>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3 input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text">권수</span>
								</div>
								<input id="bk_Quantity" name="bk_Quantity" type="number"
									class="form-control" value="1 required" required="required">
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 50%">
							<div class="input-group mt-3 mb-3">
								<select name="bk_bg_num" id="bk_bg_num" class="custom-select" onchange="getSmallGroup()" required="required">
									<option selected>대분류</option>
								</select>
							</div>
						</td>
						<td style="width: 50%">
							<div class="input-group mt-3 mb-3">
								<select name="bk_sg_num" id="bk_sg_num" class="custom-select" required="required">
									<option selected>소분류</option>
								</select>
							</div>

						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right">
							<input type="submit" id="insertBtn"
								class="btn btn-success btn-lg" value="수정">
							<input type="hidden" name="_csrf" value="${_csrf.token}">	
						</td>
						
					</tr>

				</table>

			</fieldset>
		</form>
	</div>
                    
                </div>
                <!--Footer-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Modal: modalCart -->

<script type="text/javascript" src="js/ajaxCsrf.js"></script>
<script type="text/javascript">
	

	// select style 종류: `none`, `single`, `multi` or `os`
	var example_tbl = null
	$(function() {
		example_tbl = $('#example').DataTable({
			"language": {
		        "emptyTable": "데이터가 없어요.",
		        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
		        "info": "현재 _START_ - _END_ / _TOTAL_건",
		        "infoEmpty": "데이터 없음",
		        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",	       
		        "zeroRecords": "일치하는 데이터가 없어요.",
		        "loadingRecords": "로딩중...",
		        "processing":     "잠시만 기다려 주세요...",
		        "paginate": {
		            "next": "다음",
		            "previous": "이전"
		        }
		    },
			ajax: {
				url: "libraybooklist",
				dataSrc: ""
			},
			'columnDefs': [
		        {
		        	orderable: false,
		           'targets': 0,
		            className: 'select-checkbox',
		            "defaultContent": ""
		        	
		        },
		        { 'data': 'bk_bg_num' , 'targets': 1}, //대분류
		        { 'data': 'bk_sg_num', 'targets': 2}, //소분류
		        { 'data': 'bk_code', 'targets': 3  }, // ISBN 코드
		        { 'data': 'bk_name', 'targets': 4 , 
		          "render": function ( data, type, row, meta ) {
		        	  		
		        	      return "<a href='javascript:bookModify(\""+row.bk_code+"\");'>"+data+"</a>";
		        	    }
		        }, //책 제목 
		        { 'data': 'bk_writer', 'targets': 5}, //저자
		        { 'data': 'bk_Quantity', 'targets': 6}, //소유 권수
		        { 'data': 'bk_booklend', 'targets': 7} //대출중인 권수
		     ],
		     'select': {
		        'style': 'multi'
		     },
		     'order': [[1, 'asc']],
		     dom: 'Bfrtip',

		     buttons: [
		         {
		             text: '삭제',
		             action: function ( e, dt, node, config ) {
		            	 
		            	 var conf=confirm("삭제 하시겠습니까?");
		            	 if(conf){
		            		 
		            	 
		            	 var rowData=$('#example').DataTable().rows('.selected').data();
		            	 var bookList=new Array;
		            	 
		            	 
		            	 for(var i=0;i<rowData.length;i++){
		            		 let books={};
		            		 books.bk_code=rowData[i].bk_code;
		            		 books.bk_lcode=rowData[i].bk_lcode;
		            		 bookList.push(books);
		            	 }
		            	 var json=JSON.stringify(bookList); //선택한 책의 ISBN 코드와 도서관 코드 JSON화
		            			            	 
		            	  $.ajax({ 
		            			url : "libraybookdelete",
		            			type : "post",
		            			contentType: 'application/json',
		            			data : json,
		            			dataType:'text',
		            	}).done((result) => {
		            		console.log("result=",result);
		            		location.reload();
		            	}).fail((xhr) => {
		            		console.log("xhr=",xhr);
		            	}); //ajax End  
		            	
		            	 }// confirm End
		            
		             }
		         }
		     ],

		}); //데이터 테이블 End

		$.ajax({  //도서관 코드 가져오는 메소드
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
			async: false,
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

function bookModify(bk_code){
	//var rowData=$('#example').DataTable().rows('.selected').data();
	//console.log(rowData[0].bk_code);
	console.log(bk_code);
    $("#modalCart").modal();
    console.log($("#bk_lcode").val());
    
    $.ajax({
		url : "getlibraybookinfo",
		type : "get",
		data : {"bk_code" : bk_code,
				"bk_lcode": $("#bk_lcode").val()},
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
	$("#bk_image").attr("value", result.bk_image);
	$("#bk_image2").attr("src", result.bk_image);
	$("#bk_code").attr("value", result.bk_code);
	$("#bk_name").attr("value", result.bk_name);
	$("#bk_writer").attr("value", result.bk_writer);
	$("#bk_publicday").attr("value", result.bk_publicday);
	$("#bk_publisher").attr("value", result.bk_publisher);
	$("#bk_introduction").text(result.bk_introduction);
	$("#bk_Quantity").val(result.bk_Quantity);
	$("#bk_bg_num").val(result.bk_bg_num);
	getSmallGroup();
	$("#bk_sg_num").val(result.bk_sg_num);
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
});
}


</script>
</body>

</html>