<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
 
<style>

.myinfo {
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: 1px solid black;
}

.table_box {
	border: 1px solid black;
	padding: 10px;
	margin: 10px;
	width: 100px;
}

#myProfile {
	float: left;
	margin-right: 100px;
}

#myProfile_rest {
	/*  float: left; */
	
}

#topDiv {

	margin-bottom: 100px;
}

#wishList{
all:unset;
font-weight: bold;
color: blue;
}

#readingRoom{
all:unset;
font-weight: bold;
color: blue;
}
#btn{
 padding-bottom: 5px;
 padding-top: 5px;
 font-size: 16px;
}
</style>




</head>


<body>
<jsp:include page="header.jsp" />

	<div class="container">
		<div id='topDiv'>

			<div id="myProfile">
			<form action="modifyprofile" method="get">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="myinfo" readOnly value="${mb.mb_id}" /></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="myinfo" readOnly value="${mb.mb_name }"/></td>
					</tr>
					<tr>
						<td>핸드폰</td>
						<td><input type="text" class="myinfo" readOnly value="${mb.us_phone }"/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" class="myinfo" readOnly value="${mb.us_email }"/></td>
					</tr>
					<tr>
						<td>내지역</td>
						<td><input type="text" class="myinfo" readOnly value="${mb.mb_area }" /></td>
					</tr>
					<tr>
						<td>내등급</td>
						<td><input type="text" class="myinfo" readOnly value="${mb.us_grade }"/></td>
					</tr>
				</table>
				<input id='btn' type="submit" value="개인정보 변경"/>
			</form>
			</div>

			<div id="myProfile_rest">
				<table>
					<tr>
						<td class="table_box">대출건수</td>
						<td class="table_box">연체건수</td>
					</tr>
					<tr>
						<td class="table_box">독서횟수</td>
						<td class="table_box">누적연체일수</td>
					</tr>
					<tr>
						<td class="table_box" style="cursor: pointer;"><a id="wishList" href="showwishlist">찜목록</a></td>
						<td class="table_box" style="cursor: pointer;"><a id="readingRoom" href="">열람실 예약좌석보기</a></td>
					</tr>
				</table>
			</div>
		</div>


		<div class="container">
			<h3>대출현황</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 50px;">순번</td>
					<td style="width: 400px;">자료명</td>
					<td style="width: 200px;">대출일</td>
					<td style="width: 200px;">반납일</td>
					<td style="width: 50px;">연장</td>
				</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		
		<div class="container">
			<h3>연체목록</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 50px;">순번</td>
					<td style="width: 400px;">자료명</td>
					<td style="width: 200px;">대출일</td>
					<td style="width: 200px;">반납일</td>
					<td style="width: 50px;">대출가능날짜</td>
				</tr>
				</thead>
				
				<tbody>
				<tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
        <td>mary@example.com</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
        <td>july@example.com</td>
        <td>july@example.com</td>
      </tr>
				</tbody>
			</table>
		</div>
		
		<div class="container">
			<h3>현재 예약 목록</h3>
			<table class="table table-striped">
			<thead>
				<tr>
					<td style="width: 50px;">순번</td>
					<td style="width: 300px;">자료명</td>
					<td style="width: 200px;">예약일자</td>
					<td style="width: 200px;">상태</td>
					<td style="width: 50px;">찜</td>
					<td style="width: 50px;">순위</td>
					<td style="width: 50px;">취소</td>
				</tr>
				</thead>
				
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

<script>
/* 
 $.ajax({
   crossOrigin:true, 
   url:"http://192.168.0.99/cha_board/api/users" ,
   method:"post",
   dataType:json,
 }).done((result)=>toastr.success(result,"서버 메시지"))
   .fail((xhr)=>printError(xhr,"대출현황불러오기 실패")); 
*/

</script>



</body>
</html>