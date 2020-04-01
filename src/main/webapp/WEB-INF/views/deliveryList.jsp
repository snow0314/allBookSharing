<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    
    
    <script>
        jQuery(function($){
            $("#foo-table").DataTable({
            	info: true,
             "dom": '<<"top"il>t<"bottom"prf>><"clear">',
             "language":{
              "emptyTable": "데이터가 없어요.",
              "info": "현재 _START_ - _END_ / _TOTAL_건",
              "infoEmpty": "데이터 없음",
              "paginate": {
                     "next": "다음",
                     "previous": "이전"
                 }
             }
            });
        });
    </script>
    <title>배송목록</title>
    
    
    <script>
    var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
    $.fn.bootstrapBtn = bootstrapButton            // give $().bootstrapBtn the Bootstrap functionality
    </script>
    
    
    <style>
    #foo-table_paginate{
text-align: center;
}
    #submenu {
  		float: left;
  		width: 15%;
  		height: 100%;  
  	  margin-left: 8%;
  	  margin-top:2%;
}
    .subtopbtn{
width:100%;
font-family: 'Hanna', sans-serif;
height:98px;
background-color:#223A5E;
color:white;
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
	
    </style>
    
</head>
<body>
<jsp:include page="header2.jsp" />


<nav id="submenu">
	<button class="subtopbtn" disabled><h2>나의 도서관</h2></button><br>
    <button class="subbtn" onclick="location.href = 'movemypage' " >마이 페이지</button><br>
    <button class="subbtn" onclick="location.href = 'movedeliverylist' " >배송 목록</button><br>
    <button class="subbtn" onclick="location.href = 'moveloanlist'">대출 목록</button><br>
    <button class="subbtn" onclick="location.href = 'movehopelist'">희망 도서 신청 목록</button>
</nav>
<main id="totalsearchlist">

		<div>
<h1 style="margin-bottom:80px;">배송 목록</h1>
<hr />
<table id="foo-table" class="table table-bordered" >
		<thead>
			<tr>
			<th>No</th>
			<th>대출번호</th>
			<th>도서관</th>
			<th>도서명</th>
			<th>대출일</th>
			<th>반납예정날짜</th>
			<th>반납일</th>
			</tr>
		</thead>
		<tbody id='tb'>
		</tbody>
    </table>

		</div>

</main>


<script>
let list=${list};
console.log(list);

for(let i=0;i<list.length;i++){
	var $tr= $("<tr>").appendTo($("#tb"));
	$tr.append("<td>"+(i+1)+"</td>");
	$tr.append("<td>"+list[i].bo_num+"</td>");
	$tr.append("<td>"+list[i].lb_name+"</td>");
	$tr.append("<td>"+list[i].bk_name+"</td>");
	$tr.append("<td>"+list[i].bd_date+"</td>");
	$tr.append("<td>"+list[i].bd_return_date+"</td>");
	$tr.append("<td>"+list[i].bd_real_return_date+"</td>");
	
}
</script>

</body>
</html>