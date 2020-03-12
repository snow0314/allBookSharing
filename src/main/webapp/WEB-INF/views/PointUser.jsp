<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
#point {
	align-content: center;
}
</style>
<body>
		<jsp:include page="header.jsp" />
	<form method="POST">
		<div class="container">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th>선택</th>
						<th>충전금액</th>
						<th>충전포인트</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="5000"></label></td>
						<td>5000원</td>
						<td>5000point</td>
					</tr>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="10000"></label></td>
						<td>10,000원</td>
						<td>10000point</td>
					</tr>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="20000"></label></td>
						<td>20,000원</td>
						<td>20000point</td>
					</tr>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="35000"></label></td>
						<td>30,000원</td>
						<td><label for="point">30000point + 5000point</label></td>
					</tr>
					<tr>
						<td><input id="point" type="radio" name='us_point' value="70000"></label></td>
						<td>50,000원</td>
						<td>50000point + 20000point</td>
					</tr>
					<tr>
					<td><p><button type="submit" class="btn btn-secondary btn-lg" formaction="movemypage">뒤로가기</button></p></td>
					<td><p><button type="submit" class="btn btn-secondary btn-lg" formaction="okpoint">결제하기</button></p></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
			
		
		</div>
	</form>
</body>
</html>