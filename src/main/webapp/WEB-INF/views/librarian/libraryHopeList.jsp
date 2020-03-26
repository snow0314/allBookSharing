<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- date table  -->
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<script>
	jQuery(function($) {
		$("#foo-table").DataTable({
			"info" : true,
			"order": [[0, 'desc']], // asc 또는 desc
			"dom" : '<"top"il>t<"bottom"prf><"clear">',
			"language" : {
				"emptyTable" : "데이터가 없어요.",
				"info" : "현재 _START_ - _END_ / _TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			},
			"columnDefs": [
				{ "width": "3%", "targets": 0 },
				{ "width": "8%", "targets": 1 },
				{ "width": "30%", "targets": 2 },
				{ "width": "8%", "targets": 3 },
				{ "width": "12%", "targets": 4 },
				{ "width": "10%", "targets": 5 }
				
			  ]
			
		});
	});
</script>

<!--모달 창 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
#foo-table_paginate{
text-align: center;
}
</style>

</head>
<body>

<div style="width:80%;margin:0 10%; ">
<table id="foo-table" class="table table-bordered" >
      <thead>
         <tr>
         <th>No</th>
         <th>도서관</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
         <th>상태</th>
         </tr>
      </thead>
      <tbody id='tb'>
      </tbody>
    </table>
      </div>


<script>

let list=${list};
console.log(list);

for(let i=0;i<list.length;i++){
   var $tr= $("<tr>").appendTo($("#tb"));
   $tr.append("<td>"+list[i].br_num+"</td>");
   $tr.append("<td>"+list[i].lb_name+"</td>");	
   $tr.append("<td><a id='modal_detail' data-toggle='modal' data-target='#myModal' data-number='"+list[i].br_num+"'>"+list[i].br_titile+"</td>");
   $tr.append("<td>"+list[i].br_id+"</td>");
   $tr.append("<td>"+list[i].br_date+"</td>");
   if(list[i].br_situation==0)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>대기중</span></td>");
   if(list[i].br_situation==1)
	   $tr.append("<td><span style='color:orenge; font-weight:bold;'>반려</span></td>");
   if(list[i].br_situation==2)
	   $tr.append("<td><span style='color:blue; font-weight:bold;'>처리완료</span></td>");
}

</script>
 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div id='modal-header' class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div id='modal-body' class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 
 <script>
 
 $("#modal_detail").on("click",function(e){
	 var params = e.target.dataset.number; 
	 
	 console.log("게시글",params);
	 
	 $.ajaxSetup({         
         beforeSend : function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
         });//먼저 보냄
	  
         $.ajax({
             url : "lbhopedetail",
             type : "get",
             data : {"br_num":params}, 
             success : function(response) {
            	 $("#modal-header").empty();
                 $("#modal-body").empty();
                 console.log(response);
                 console.log(response.br_titile);
                 $("#modal-header").text(response.br_titile);
            	 
             }
 
         });		//ajax end
         
 });		//modal end
 
 </script> 
 
</body>

</html>