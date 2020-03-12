<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>관리자 페이지</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
	type="text/javascript"></script>
<style>
.container3 {
	padding: 50px 10px;
	margin: 50px 10px;
}

#logo:hover {
	text-decoration: none;
	color: white;
}

#logo {
	margin-bottom:
}

.button-7 {
	width: 140px;
	height: 50px;
	border: 2px solid #34495e;
	float: right;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 10px 10px 50px 10px;
}

.button-7 a {
	font-family: arial;
	font-size: 16px;
	color: #34495e;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}

.eff-7 {
	width: 140px;
	height: 50px;
	border: 0px solid #34495e;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-7:hover .eff-7 {
	border: 70px solid #34495e;
}

.button-7:hover a {
	color: #fff;
}

.container2 {
	width: 100%;
	height: 70px;
	padding-right: 30px;
	background-color: white;
}

.recoimg {
	width: auto;
	height: 500px;
}

.text {
	margin-top: -30px;
	margin-bottom: 30px;
}
</style>
</head>
<body class="homepage">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script>
		$('.carousel').carousel({
			interval : 1600
		})
	</script>



	<!--header-->
	<sec:authorize access="isAnonymous()">
		<div class="container2">
			<div class="button-7">
				<div class="eff-7"></div>
				<a href="index.jsp"> 로그아웃 </a>
			</div>
			<div class="button-7">
				<div class="eff-7"></div>
				<a href="index.jsp"> 도서관으로 이동 </a>
			</div>
		</div>
	</sec:authorize>


	<!-- banner -->
	<div id="header">

		<div class="container">

			<!-- Logo -->
			<h1>
				<a href="#" id="logo">온책나누리</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="#">도서관 관리</a>
						<ul>
							<li><a href="libraryinsertmove">도서관 등록</a></li>
							<li><a href="">도서관 수정</a></li>
							<li><a href="">도서관 삭제</a></li>
						</ul></li>
						
					<li><a href="">사서 관리</a>
						<ul>
							<li><a href="librarianinsertmove">사서 계정 등록</a></li>
							<li><a href="#">사서 계정 수정</a></li>
						</ul></li>
						
					<li><a href="">추천도서 관리</a>
						<ul>
						</ul></li>
						
					<li><a href="no-sidebar.html">도서관별 대출 현황</a>
						<ul>
						</ul></li>
				</ul>
			</nav>


			<!-- Banner -->
			<div id="banner">
				<div class="container">		
				</div>
			</div>
		</div>
	</div>

	<!-- Main -->
	<div id="main" class="wrapper style1">
		<section class="container">
			<div class="row" style="margin-bottom: -60px; margin-top: -50px;">

			</div>
		</section>
	</div>


	<!-- Featured -->
	<div class="wrapper style2">
		<section class="container3">
			<div class="row no-collapse-1">
				<section class="4u">
					<h2 class='text'>추천도서</h2>

					<div id="demo" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<!-- 슬라이드 쇼 -->
							<div class="carousel-item active">
								<!--가로-->
								<img class="recoimg" src="images/reco1.jpg" alt="First slide">

							</div>
							<div class="carousel-item">
								<img class="recoimg" src="images/reco2.jpg" alt="Second slide">

							</div>
							<div class="carousel-item">
								<img class="recoimg" src="images/reco3.jpg" alt="Third slide">

							</div>

							<div class="carousel-item">
								<img class="recoimg" src="images/reco4.jpg" alt="Forth slide">

							</div>

							<div class="carousel-item">
								<img class="recoimg" src="images/reco5.jpg" alt="Fifth slide">

							</div>


							<!-- / 슬라이드 쇼 끝 -->

							<!-- 왼쪽 오른쪽 화살표 버튼 -->
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<!-- <span>Previous</span> -->
							</a> <a class="carousel-control-next" href="#demo" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<!-- <span>Next</span> -->
							</a>
							<!-- / 화살표 버튼 끝 -->

							<!-- 인디케이터 -->
							<ul class="carousel-indicators">
								<li data-target="#demo" data-slide-to="0" class="active"></li>
								<!--0번부터시작-->
								<li data-target="#demo" data-slide-to="1"></li>
								<li data-target="#demo" data-slide-to="2"></li>
								<li data-target="#demo" data-slide-to="3"></li>
								<li data-target="#demo" data-slide-to="4"></li>
							</ul>
							<!-- 인디케이터 끝 -->
						</div>
					</div>
				</section>

				<section class="4u">
					<h2 class='text'>인기도서</h2>
					<div id="popular"></div>

				</section>
				<section class="4u">
					<h2 class='text'>지도</h2>
					<div id="popular"></div>

				</section>
			</div>
		</section>

	</div>




	<!-- Footer -->
	<div id="footer">
		<div class="container">

			<!-- Lists -->
			<div class="row">
				<div class="8u">
					<section>
						<header class="major">
							<h2>Donec dictum metus</h2>
							<span class="byline">Quisque semper augue mattis wisi
								maecenas ligula</span>
						</header>
						<div class="row">
							<section class="6u">
								<ul class="default">
									<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
									<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
									<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
									<li><a href="#">Cras vitae metus aliquam pharetra.</a></li>
								</ul>
							</section>
							<section class="6u">
								<ul class="default">
									<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
									<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
									<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
									<li><a href="#">Cras vitae metus aliquam pharetra.</a></li>
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
							<li><span class="address">Address</span> <span>1234
									Somewhere Road #4285 <br />Nashville, TN 00000
							</span></li>
							<li><span class="mail">Mail</span> <span><a href="#">someone@untitled.tld</a></span>
							</li>
							<li><span class="phone">Phone</span> <span>(000)
									000-0000</span></li>
						</ul>
					</section>
				</div>
			</div>

			<!-- Copyright -->
			<div class="copyright">
				Design: <a href="http://templated.co">TEMPLATED</a> Images: <a
					href="http://unsplash.com">Unsplash</a> (<a
					href="http://unsplash.com/cc0">CC0</a>)
			</div>

		</div>
	</div>

</body>
<script type="text/javascript">
	function logoutGo() {
		/* $.ajax({
			url: "logout",
			method: "post",
			beforeSend : function(xhr)
		    {   
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		    }
		}).done((result)=> {
			console.log("result=",result);
		}).fail((xhr)=> console.log(xhr)); */
		var logoutform = document.logoutform;
		logoutform.submit();

	}
</script>

</html>