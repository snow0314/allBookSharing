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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

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
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
#foo-table_paginate{
text-align: center;
}
body{font-family: 'Jeju Gothic', sans-serif;}
</style>

</head>
<body>

<div style="width:80%;margin:0 10%; ">
<h1>건의사항</h1>
<table id="foo-table" class="table table-bordered" >
      <thead>
         <tr>
         <th>No</th>
         <th>도서관</th>
         <th>제목</th>
         <th>글쓴이</th>
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
   $tr.append("<td>"+list[i].qs_num+"</td>");
   $tr.append("<td>"+list[i].lb_name+"</td>");	
   $tr.append("<td><a href='lbqsdetail?qs_num="+list[i].qs_num+"'>"+list[i].qs_title+"</td>");
   $tr.append("<td>"+list[i].qs_id+"</td>");
   $tr.append("<td>"+moment(list[i].qs_date).format('YYYY년 MM월 DD일 HH시:mm분')+"</td>");
   
   if(list[i].qs_state=="대기중")
	   $tr.append("<td><span style='color:red; font-weight:bold;'>"+list[i].qs_state+"</span></td>");
   if(list[i].qs_state=="답변완료")
	   $tr.append("<td><span style='color:blue; font-weight:bold;'>"+list[i].qs_state+"</span></td>");
}
</script>

</body>

</html>