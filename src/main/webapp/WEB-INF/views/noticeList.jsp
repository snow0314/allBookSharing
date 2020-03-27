<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- date table  -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>


<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- ... -->
<script>
jQuery(function($) {
	$("#foo-table").DataTable({
		"info" : true,
		"order" : [ [ 0, 'desc' ] ], // asc 또는 desc
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
		"columnDefs" : [ {
			"width" : "5%",
			"targets" : 0
		}, {
			"width" : "30%",
			"targets" : 1
		}, {
			"width" : "10%",
			"targets" : 2
		}, {
			"width" : "10%",
			"targets" : 3
		}

		]

	});
});
</script>

<style>
#btn {
	margin: 0 43%;
}

#foo-table_paginate {
	text-align: center;
}
</style>

</head>
<body>

	<jsp:include page="header2.jsp" />
	<div style="width: 80%; margin: 0 10%;">
		
			<h3 style="margin-bottom: 50px;">공지사항</h3>
			<table id="foo-table" class="table table-bordered">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						
					</tr>
				</thead>
				<tbody id='tb'>
				</tbody>
			</table>

	</div>
<script>
		let list = ${nList};
		console.log(list);

		for (let i = 0; i < list.length; i++) {
			var $tr = $("<tr>").appendTo($("#tb"));
			$tr.append("<td>" + list[i].no_num + "</td>");
			$tr.append("<td><a href='noticedetail?no_num="+list[i].no_num+"'>" + list[i].no_title + "</a></td>");
			$tr.append("<td>" + list[i].no_id + "</td>");
			$tr.append("<td>" + list[i].no_date + "</td>");
		
	}
		
		
	</script>

</body>
</html>