<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#all{
	margin-left: 200px;
}
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
}

#myProfile {
	float: left;
	margin-right: 500px;
}

#myProfile_rest {
	/* float: left; */
	
}

#topDiv {
	margin-bottom: 100px;
}

.loans{
border: 1px solid black;
border-collapse: collapse;
text-align: center;
padding: 5px 10px;
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
</style>
</head>


<body>
	<div id="all">
		<div id='topDiv'>

			<div id="myProfile">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="myinfo" readOnly /></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="myinfo" readOnly /></td>
					</tr>
					<tr>
						<td>핸드폰</td>
						<td><input type="text" class="myinfo" readOnly /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" class="myinfo" readOnly /></td>
					</tr>
					<tr>
						<td>내지역</td>
						<td><input type="text" class="myinfo" readOnly /></td>
					</tr>
					<tr>
						<td>내등급</td>
						<td><input type="text" class="myinfo" readOnly /></td>
					</tr>
				</table>
				<input type="button" value="개인정보 변경" style="margin-top: 10px;" />
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
						<td class="table_box" style="cursor: pointer;"><a id="wishList" href="show/wishlist">찜목록</a></td>
						<td class="table_box" style="cursor: pointer;"><a id="readingRoom" href="">열람실 예약좌석보기</a></td>
					</tr>
				</table>
			</div>
		</div>


		<div>
			<h3>대출현황</h3>
			<table class="loans">
				<tr class="loans">
					<td class="loans" style="width: 50px;">순번</td>
					<td class="loans" style="width: 400px;">자료명</td>
					<td class="loans" style="width: 200px;">대출일</td>
					<td class="loans" style="width: 200px;">반납일</td>
					<td class="loans" style="width: 50px;">연장</td>
				</tr>
			</table>
		</div>
		
		<div>
			<h3>연체목록</h3>
			<table class="loans">
				<tr class="loans">
					<td class="loans" style="width: 50px;">순번</td>
					<td class="loans" style="width: 400px;">자료명</td>
					<td class="loans" style="width: 200px;">대출일</td>
					<td class="loans" style="width: 200px;">반납일</td>
					<td class="loans" style="width: 50px;">대출가능날짜</td>
				</tr>
			</table>
		</div>
		
		<div>
			<h3>현재 예약 목록</h3>
			<table class="loans">
				<tr class="loans">
					<td class="loans" style="width: 50px;">순번</td>
					<td class="loans" style="width: 400px;">자료명</td>
					<td class="loans" style="width: 200px;">예약일자</td>
					<td class="loans" style="width: 200px;">상태</td>
					<td class="loans" style="width: 50px;">찜목록 추가</td>
					<td class="loans" style="width: 50px;">순위</td>
					<td class="loans" style="width: 50px;">취소</td>
				</tr>
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