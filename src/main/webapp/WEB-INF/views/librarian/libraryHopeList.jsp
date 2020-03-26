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
   $tr.append("<td><a href='lbqsdetail?qs_num="+list[i].qs_num+"'>"+list[i].br_title+"</td>");
   $tr.append("<td>"+list[i].br_id+"</td>");
   $tr.append("<td>"+list[i].br_date+"</td>");
   if(list[i].br_stituatuin==0)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>대기중</span></td>");
   if(list[i].br_stituatuin==1)
	   $tr.append("<td><span style='color:orenge; font-weight:bold;'>반려</span></td>");
   if(list[i].br_stituatuin==2)
	   $tr.append("<td><span style='color:blue; font-weight:bold;'>처리완료</span></td>");
}
</script>

</body>

</html>