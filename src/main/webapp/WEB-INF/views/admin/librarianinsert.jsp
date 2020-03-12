<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사서등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?
appkey=04cfe5f1eb29416b59e4313a6acea9b8&libraries=services"></script>


<style>
#id2{
display:flex;

}
form {
   margin: auto;
   height: 50%;
   width: 810px;
   padding: 30px;
}



#hag{

padding: 5px 0;
width: 100px;
font-size: 17px;
}
#id_check {
   all:unset;
   color: #000000;
   font-weight:bold;
   font-style:inherit;
   background: #BCF5A9;
   padding:5px 10px;
   margin-left: 25px;
   margin-bottom: 10px;
   margin-top: 5px;
   border-radius: 5px;
   display: inline-block;
   border: none;
}
#id{
width: 200px;
}

</style>
</head>
<body>
<jsp:include page="adminheader.jsp" />
 
   <div id="div">
		<form method="post">
			<div id="join_background">
				<table class="table table-bordered">
				<tbody>
					<tr>
						<td width="180px">아이디</td>
						<td id="id2" colspan="3">
						<input type="text" name="la_id" maxlength="20" id="id">
						<input id="id_check" type="button" value="중복확인">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="3">
						<input type="password" name="la_pw" maxlength="30" id="pw">
						</td>
					</tr>

					<tr>
						<td>비밀번호체크</td>
						<td colspan="3">
						<input type="password" maxlength="30" id="pwcheck">
						</td>		
					</tr>

					<tr>
						<td>도서관</td>
						<td colspan="3">
						<input type="text" name="la_lcode" maxlength="30" id="lb">
						</td>
					</tr>
					<tr>
						<td>지역선택 :</td>
						<td><input type="text"  id="loc" name="la_loc"/>
						<select id="url2">
								<option>서울&nbsp;</option>
								<option>인천&nbsp;</option>
								<option>경기&nbsp;</option>
						</select></td>
					</tr>
				 </tbody>
				</table>

				<input class="btn" type="submit" value="확인"  id="hag" formaction="librarianinsert"> 
				<input id="hag"class="btn" type="submit" value="취소" formaction="./">
				<input type="hidden" name="_csrf" value="${_csrf.token}">
			</div>
		</form>
	</div>
	<script>
	/* let str="";
	$("#hag").on("submit",function(){
		str=$("#la_id").val()+$("#la_pw").val()+$("#la_lcode").val()
		+$("#la_loc").val();
			console.log("str="+str);
	} */
	
	
	</script>
	<!-- Footer -->
			<div id="footer">
				<div class="container">

					<!-- Lists -->
						<div class="row">
							<div class="8u">
								<section>
									<header class="major">
										<h2>Donec dictum metus</h2>
										<span class="byline">Quisque semper augue mattis wisi maecenas ligula</span>
									</header>
									<div class="row">
										<section class="6u">
											<ul class="default">
												<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
												<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
												<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
												<li><a href="#">Cras vitae metus aliquam  pharetra.</a></li>
											</ul>
										</section>
										<section class="6u">
											<ul class="default">
												<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
												<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
												<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
												<li><a href="#">Cras vitae metus aliquam  pharetra.</a></li>
											</ul>
										</section>
									</div>
								</section>
							</div>
							<div class="4u">
								<section>
									<header class="major">
										<h2>Donec dictum metus</h2>
										<span class="byline">Mattis wisi maecenas ligula</span>
									</header>
									<ul class="contact">
										<li>
											<span class="address">Address</span>
											<span>1234 Somewhere Road #4285 <br />Nashville, TN 00000</span>
										</li>
										<li>
											<span class="mail">Mail</span>
											<span><a href="#">someone@untitled.tld</a></span>
										</li>
										<li>
											<span class="phone">Phone</span>
											<span>(000) 000-0000</span>
										</li>
									</ul>	
								</section>
							</div>
						</div>

					<!-- Copyright -->
						<div class="copyright">
							Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
						</div>

				</div>
			</div>
	

   <script>

   </script>
</body>
</html>