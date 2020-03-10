<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>

<!-- 데이터 테이블 체크박스 -->
<link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
<script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>


</head>
<body>
	<div class="container p-3 my-3 border">

		<table id="foo-table" class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th>대분류</th>
					<th>소분류</th>
					<th>ISBN 코드</th>
					<th>책 제목</th>
					<th>저자</th>
					<th>소유 권수</th>
					<th>대출 권수</th>
					
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
	<script type="text/javascript">
$(document).ready( function () {
	
	$('#foo-table').DataTable({
		ajax: {
			url: "libraybooklist",
			dataSrc: ""
		},
		columns: [
			{
	            'data': '',
	            'checkboxes': {
	               'selectRow': true
	            }
	         },	
        { data: 'bk_bg_num' }, //대분류
        { data: 'bk_sg_num' }, //소분류
        { data: 'bk_code' }, // ISBN 코드
        { data: 'bk_name' }, //책 제목 
        { data: 'bk_writer' }, //저자
        { data: 'bk_Quantity' }, //소유 권수
        { data: 'bk_booklend' } //대출중인 권수
    ],
    dom: 'Bfrtip',
    buttons: [
        {
            text: 'My button',
            action: function ( e, dt, node, config ) {
                console.log("e:",e);
                console.log("dt:",dt);
                console.log("node:",node);
                console.log("config:",config);
            }
        }
    ],
    'columnDefs': [
        {
           'targets': 0,
           'checkboxes': {
              'selectRow': true
           }
        }
     ],
     'select': {
        'style': 'multi'
     },
     'order': [[1, 'asc']]
    
	
	}); //dataTable End
	
	

}); //ready End
</script>
</body>

</html>