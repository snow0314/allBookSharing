
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
            	 "dom": '<"top"il>t<"bottom"prf><"clear">',
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

<title>희망도서 신청 게시판</title>
<script>
    var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
    $.fn.bootstrapBtn = bootstrapButton            // give $().bootstrapBtn the Bootstrap functionality
    </script>
</head>
<body>
<jsp:include page="header2.jsp" />
		<div>
<table id="foo-table" class="table table-bordered">
		<thead>
			<tr>
			<th>요청번호</th>
			<th>제목</th>
			<th>도서관</th>
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
	$tr.append("<td>"+(i+1)+"</td>");
	$tr.append("<td>"+list[i].br_num+"</td>");
	$tr.append("<td>"+list[i].br_titile+"</td>");
	$tr.append("<td>"+list[i].br_bname+"</td>");
	$tr.append("<td>"+list[i].br_id+"</td>");
	$tr.append("<td>"+list[i].br_date+"</td>");
	$tr.append("<td>"+list[i].br_situation+"</td>");
	
}
</script>

</body>
</html>