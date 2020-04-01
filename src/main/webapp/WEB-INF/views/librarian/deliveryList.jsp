<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사서 배송관리 리스트</title>

<!-- date table  -->
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>



<!--모달 창 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
#foo-table_paginate{
text-align: center;
}
#modal_detail{
cursor: pointer;
}
</style>

</head>
<body>

<div style="width:80%;margin:0 10%; ">
<h1>희망도서</h1>
<table id="foo-table" class="table table-bordered" >
      <thead>
         <tr>
         <th>No</th>
         <th>도서명</th>
         <th>신청날짜</th>
         <th>신청인</th>
         <th>상태</th>
         </tr>
      </thead>

    </table>
      </div>

 <!-- Modal -->
 <form action="exchange" method="post">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div id='modal-header' class="modal-header">
          <button type='button' class='close' data-dismiss='modal'>&times;</button>
        </div>
        <div id='modal-body' class="modal-body">
        </div>
        <div id='modal-footer' class="modal-footer">
   
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 </form>
</body>
<script>
var example_tbl = null
$(function() {
	example_tbl = $('#foo-table').DataTable({
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
	        { 'data': 'bk_bg_num' , 'targets': 1}, //NO
	        { 'data': 'bk_sg_num', 'targets': 2}, //도서명
	        { 'data': 'bk_code', 'targets': 3  }, // 신청날짜
	        { 'data': 'bk_name', 'targets': 4 , 
	          "render": function ( data, type, row, meta ) {
	        	  		
	        	      return "<a href='javascript:bookModify(\""+row.bk_code+"\");'>"+data+"</a>";
	        	    }
	        }, //신청인
	        { 'data': 'bk_writer', 'targets': 5} //상태

	     ],
	     'order': [[1, 'asc']]

	}); //데이터 테이블 End
</script>
</html>