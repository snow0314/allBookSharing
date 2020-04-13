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

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

#btn {
	margin: 0 43%;
}

#foo-table_paginate {
	text-align: center;
}

#submenu {
  		float: left;
  		width: 15%;
  		height: 100%;  
  	  margin-left: 8%;
  	  margin-top:2%;
}
.subbtn{
width:100%;
background-color:white;
height:55px;
font-family: 'Nanum Gothic Coding', monospace;
font-weight:bold;
font-size:20px;
border:none;


}
.subbtn:hover{
background-color:#F0EAD6;
}
.subtopbtn{
width:100%;
font-family: 'Hanna', sans-serif;
height:98px;
background-color:#223A5E;
color:white;
}

#totalsearchlist{
		float:right;
		background-color:white;
		width:65%;
		height:auto;
		margin-right: 8%;
        margin-top:2%;
        margin-bottom: 5%;
        padding:0px;
	}
#foo-table_paginate{
	display:inline;
	margin-left:40%;
}
#foo-table_filter{
	display:inline;
	float:right;
}
</style>

</head>
<body>

	<jsp:include page="header2.jsp" />
	
	<aside id="submenu">

		<button class="subtopbtn" disabled>
			<h2>도서관 서비스</h2>
		</button>
		<br>
		<button class="subbtn"
			onclick="location.href = 'readingroommove' ">열람실 예약</button>
		<br>
		<button class="subbtn" onclick="location.href = 'questionmove' ">건의 사항</button>
		<br>
		<button class="subbtn" onclick="location.href = 'noticemove' ">공지 사항</button>
		<br>
		<button class="subbtn" onclick="location.href = 'hopebookmove' ">희망도서 신청</button>

	</aside>
	
	<main id="totalsearchlist">
		<section>
	<div style="width: 95%; margin-left:2%;">
		
			<h1 style="font-family: 'Hanna', sans-serif;">공지사항</h1>
			<table id="foo-table" class="table table-bordered">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						
					</tr>
				</thead>
				<tbody id='tb' style="font-size:20px;font-weight:bold;">
				</tbody>
			</table>

	</div>
	</section>
	</main>
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