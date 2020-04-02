<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
table, th, td {
	border: 1px solid #bcbcbc;
	font-size: 20px;
}

table {
	width: 200px;
	height: 150px;
}

#Reservation {
	margin-left: 950px;
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
</style>
</head>
<body>


	<main id="totalsearchlist">
		<section>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th>배송서비스 안내</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>
						 <br>※서비스 내용<br>
						 <br>-대여하신 도서는 등록된 주소로 배송해 드립니다.
						 <br>주소가 변경되신 분은 변경 부탁드립니다▶<a href="modifyprofile"><button>개인정보 변경</button></a><br>
						 <br>-대여하신 도서가 도착시에는 문자연락 드립니다.<br> 
						 <br>-도서 반납은 홈페이지 반납신청 페이지에서 요청하시면 배송기사님께서 수거해가십니다. <br> 
						 <br>
						 <br>※요금<br>
						 <br>-도서 배송비는 왕복을 포함하여 5000포인트가 소모됩니다.<br>
						 <br>
						 <br>※주의사항<br>
						 <br>-도서 배달은 09시 부터 20시까지 진행 되며 이후 배송은 진행되지 않습니다.<br>
						 (예약은 상시 가능합니다.)<br>
						 <br>-도서 반납은 09시 부터 20시까지 진행 되며 개인 사정으로 인한  반납이 어려우실 경우 특정 장소에 맡겨주시면 감사하겠습니다.<br>
						 (ex.편의점,경비실)<br>
						 <br>-배달기사님도 누군가에 가족입니다. 함부로 대하시면 블랙리스트에 추가합니다.<br>
						 <br>
						
						</th>
					</tr>
				</tbody>
			</table>
			 <a href="#"><input type="submit" id="delivery" value="배송신청목록 바로가기" style="margin-left: 400px;" /></a>
		</section>
	</main>
	


</body>
</html>