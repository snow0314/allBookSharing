<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>비밀번호 찾기</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
</style>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div id="jin">
				<p>
					<label>아이디</label> <input class="w3-input" type="text"
						id="mb_id" name="mb_id" required> 
				</p>
				<p>
					<label>이메일</label> <input class="w3-input" type="email"
						id="us_email" name="us_email" required> <input
						id="emailSender" type="button" value="인증" class="btn btn-primary btn-sm"
						>
				</p>
				<p id="joincode">
					<label>인증번호</label> <input class="w3-input" type="number"
						id="inputCode" name="inputCode" placeholder="Enter code">
					<input type="button" value="확인" class="w3-input"
						onclick="checkJoinCode()">
				</p>

				<p>
					<label>이름</label> <input class="w3-input" type="text" id="mb_name"
						name="mb_name" placeholder="Enter mb_name"> <input
						type="button" value="중복체크" class="w3-input" onclick="checkname()">
				</p>

				<p>
					<label>비밀 번호</label> <input class="w3-input" type="password"
						id="mb_pw" name="mb_pw" placeholder="Password">
				</p>

				<p>
					<label>비밀 번호 확인</label> <input class="w3-input" type="password"
						id="pwCheck" name="pwCheck" placeholder="Password">
				</p>
			</div>
		</div>
	</div>

	<script>
	  $("#emailSender").on("click",
	function(){
		   var email = document.getElementById("us_email").value;
		   var id = document.getElementById("mb_id").value;
		   if(email==""){
			   alert("메일을 입력해 주세요.")
			   return false;
		   }
		   
		   $.ajax({ 
				url : "mailSending",
				type : "get",
				data : {"us_email" : email,
						"mb_id" : id	 },
				dataType: 'text'
				
			}).done((result) => {
			console.log("result=",result);
			
			
			}).fail((xhr) => {
			console.log("xhr=",xhr);
			}); 
		  
	   });
	   
	   function sendMail(email){
		   var xhttp= new XMLHttpRequest();
		   xhttp.onreadystatechange=function(){
			   if(xhttp.readyState==4){
				   if(xhttp.status == 200)
					   alert("메일을 정상적으로 보냇습니다.");
				   else
					   alert("올바른 메일 형식이 아닙니다.");
			   }
		   };
		   xhttp.open("POST",'sendMail/',true);
		   xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		   xhttp.send('email='+email);
		   return false;
	   }
	</script>

</body>
</html>