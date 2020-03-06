<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 등록</title>
<script src="js/jquery.min.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
	type="text/javascript"></script>
	
<style>
 	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 	ul { padding:0; margin:0; list-style:none;  }

 	div#root { width:90%; margin:0 auto; }
 
 	header#header { font-size:60px; padding:20px 0; }
 	header#header h1 a { color:#000; font-weight:bold; }
 
 	nav#nav { padding:10px; text-align:right; }
 	nav#nav ul li { display:inline-block; margin-left:10px; }

  	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 	section#container::after { content:""; display:block; clear:both; }
 	aside { float:left; width:200px; }
 	div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 	aside ul li { text-align:center; margin-bottom:10px; }
 	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
 
 	footer#footer { background:#f9f9f9; padding:20px; }
 	footer#footer ul li { display:inline-block; margin-right:10px; }
</style>
</head>
<body>
<form>
<section id="container">
<aside>
 <ul>
  <li><a href="">도서관 등록</a></li>
  <li><a href="">도서관 수정</a></li>
  <li><a href="">도서관 삭제</a></li>
 </ul>
</aside>
</section>

<div class="container2">
	<div class="inputArea">
	<label for="Name">도서관 이름</label>
	<input type="text" id="Name" name="Name" />
	</div>

	<div class="inputArea">
	<label for="Area">지역</label>
	<select>
	<option>서울</option>
	<option>인천</option>
	<option>경기</option>
	</select>
	</div>

	<div class="inputArea">
	<lable for="address">주소</lable>
	<input type="text" id="Address" name="Address"/>
	</div>

	<div class="inputArea">
	<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
	</div>
</div>

</form>
</body>
</html>