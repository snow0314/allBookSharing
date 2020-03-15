<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<style>
	#tit{
	text-align: center;
	}
	</style>
</head>

<body>
	<jsp:include page="header.jsp" />

	<table id="userTable"
		class="table table-striped table-bordered table-hover">
		<thead>
			<tr id=tit>
				<th>이미지</th>
				<th>도서명</th>
				<th>저자</th>
				<th>권수</th>
				<th>대출중인 책</th>
				<th>보유 도서관</th>
			</tr>
		</thead>
		<!-- tbody 태그 필요 없다. -->
	</table>



</body>

</html>