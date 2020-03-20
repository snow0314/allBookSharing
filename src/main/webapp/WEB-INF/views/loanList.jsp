
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
            	
            });
        });
    </script>

<title>대출목록</title>

</head>
<body>

		<div>
<table id="foo-table" class="table table-bordered">
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