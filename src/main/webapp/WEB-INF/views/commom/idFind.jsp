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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>아이디 찾기</title>
<style>
#us_email {
	width: 380px
}

#str_email02 {
	width: 380px;
}

#jin {
	display: flex;
}

#search{
  
   
}
</style>
</head>
<body>
      
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기</h3>
			</div>
			<div>
				<label>Email</label>
				<div id="jin">
					<input class="w3-input" type="text" id="us_email" name="us_email"
						required>@<input type="text" name="email2"
						id="str_email02" disabled value="선택하세요" class="w3-input">
					<select name="email1" id="email1">
						<option value="0">선택하세요</option>
						<option value="1">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</div>
				<br>
				<div>아이디는:<span id='search'></span></div>
          
				<p class="w3-center">
					<button id="findBtn"
						class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">아이디 찾기</button>


					<button type="button" onclick="history.go(-1);"
						class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">로그인페이지 이동</button>
						
				    <button type="button" id="passwordFind"
						class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">비밀번호 찾기</button>
				</p>
			</div>
		</div>
	</div>
	<script>
	$("#passwordFind").click(function(){
		location.href="pwfindfrm"
	});
	
	
		$("#findBtn").on("click",function() {
					let email = $("#us_email").val() + "@"
							+ $("#str_email02").val();

					console.log(email);

					$.ajax({
						type : 'get',
						url : 'idfind',
						data : {"email":email},
						dataType : 'text',
						success: function (data) {
							console.log(data);
							/* search */
							$("#search").text(data);
						},
						error : function (error) {
							console.log(data);
						}
					});

				});

		$(document).ready(function() {
			$("#str_email02").hide();

		});

		$("#email1").change(function() {
			$("#email1 option:selected").each(function() {
				if ($(this).val() == '1') {
					$("#str_email02").show();
					$("#str_email02").val('');
					$("#str_email02").attr("disabled", false);
				} else if ($(this).val() == '0') {
					$("#str_email02").hide();
				} else {
					$("#str_email02").show();
					$("#str_email02").val($(this).text()); //선택값 입력 
					$("#str_email02").attr("disabled", true); //비활성화
				}
			});
		});
	</script>
</body>
</html>