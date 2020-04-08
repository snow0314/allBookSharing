<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	font-family: 'Jeju Gothic', sans-serif;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
</style>

</head>
<body>
	<div class="container p-3 my-3 border">
		<div class="input-group mb-3 input-group-lg">
			<div class="input-group-prepend">
				<span class="input-group-text" >작성자</span>
			</div>
			<input type="text" class="form-control" value="${notice.no_id}" readonly="readonly">
		</div>

		<div class="input-group mb-3 input-group-lg">
			<div class="input-group-prepend">
				<span class="input-group-text" style="width: 90px;">날짜</span>
			</div>
			<input type="text" class="form-control" value="${notice.no_date}" readonly="readonly">
		</div>

		<div class="input-group mb-3 input-group-lg">
			<div class="input-group-prepend">
				<span class="input-group-text" style="width: 90px;">제목</span>
			</div>
			<input type="text" class="form-control" value="${notice.no_title}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<textarea class="form-control rounded-0"
				id="exampleFormControlTextarea1" rows="10" readonly="readonly">${notice.no_content}</textarea>
		</div>
		<div id="del" style="text-align: right;">
			<form action="deletenotice?${_csrf.parameterName}=${_csrf.token}"
				method="post">
				<input type="hidden" name="no_num" value="${notice.no_num}" /> <input
					type="submit" class="btn btn-outline-danger" id="del_btn"
					value="삭제" class="btn" />
			</form>
		</div>
	</div>

</body>
</html>