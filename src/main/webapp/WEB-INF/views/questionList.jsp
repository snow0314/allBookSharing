<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- date table  -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>


<!-- 폰트어썸 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <!-- ... -->


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
#btn{
margin: 0 43%;
}
#foo-table_paginate{
text-align: center;
}
</style>

</head>
<body>

	<jsp:include page="header2.jsp" />
   <div style="width:80%;margin:0 10%; ">
	<h3 style="margin-bottom: 50px;">건의사항</h3>
<table id="foo-table" class="table table-bordered" >
      <thead>
         <tr>
         <th>글번호</th>
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

	<form action="movequestionwrite?${_csrf.parameterName}=${_csrf.token}" method="post">
<input type="submit" value="글쓰기" id="btn">
	</form>
      </div>

<script>
let list=${qList};
console.log(list);

for(let i=0;i<list.length;i++){
   var $tr= $("<tr>").appendTo($("#tb"));
   $tr.append("<td>"+list[i].qs_num+"</td>");
   $tr.append("<td>"+list[i].lb_name+"</td>");
	if(list[i].qs_show==0){		
   $tr.append("<td><a href='qsdetail?&qs_num="+list[i].qs_num+"&qs_show="+list[i].qs_show+"'>"+list[i].qs_title+" &nbsp;&nbsp;</a></td>");
	}
	if(list[i].qs_show==1){		
   $tr.append("<td style='display:flex;'><form method='post'><a onclick='show("+list[i].qs_num+")' href='javascript:'>"+list[i].qs_title+" &nbsp;&nbsp;</a><i class='fas fa-lock'></i>&nbsp;&nbsp;"+
   "<input type='hidden' id='pw"+list[i].qs_num+"' name='qs_pw' style='width:150px; height:30px;'/>&nbsp;"+
   "<input type='hidden' id='sub"+list[i].qs_num+"' value='입력' formaction='qspwdetail?${_csrf.parameterName}=${_csrf.token}&qs_num="+list[i].qs_num+"&qs_show="+list[i].qs_show+"' style='all:unset; width:60px; height:30px; text-align:center; color: white; background-color:#3AC984; cursor:pointer;'/></form></td>");
	}	
   $tr.append("<td>"+list[i].qs_id+"</td>");
   $tr.append("<td>"+list[i].qs_date+"</td>");
   if(list[i].qs_state=="대기중")
   $tr.append("<td><span style='color:red; font-weight:bold;'>"+list[i].qs_state+"</span></td>");
   if(list[i].qs_state=="답변완료")
   $tr.append("<td><span style='color:blue; font-weight:bold;'>"+list[i].qs_state+"</span></td>");
}
</script>

<script>
function show(qs_num){
	$("#pw"+qs_num+"").attr("type","text");	
	$("#sub"+qs_num+"").attr("type","submit");	
}



</script>


</body>
</html>