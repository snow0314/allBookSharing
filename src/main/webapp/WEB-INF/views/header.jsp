<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
  
  
  <style>
  .container3{
               padding:50px 10px;
                margin:50px 10px;
            }
            #logo:hover{
                text-decoration: none;
                color:white;
            }
            #logo{
                margin-bottom: 
            }
            .button-7{
              width:140px;
              height:50px;
              border:2px solid #34495e;
              float:right;
              text-align:center;
              cursor:pointer;
              position:relative;
              box-sizing:border-box;
              overflow:hidden;
              margin:10px 10px 50px 10px;

            }
            .button-7 a{
              font-family:arial;
              font-size:16px;
              color:#34495e;
              text-decoration:none;
              line-height:50px;
              transition:all .5s ease;
              z-index:2;
              position:relative;

            }
            .eff-7{
              width:140px;
              height:50px;
              border:0px solid #34495e;
              position:absolute;
              transition:all .5s ease;
              z-index:1;
              box-sizing:border-box;

            }
            .button-7:hover .eff-7{
              border:70px solid #34495e;
            }
            .button-7:hover a{
              color:#fff;
            }
            .container2{
              width:100%;
              height:70px;
              padding-right: 30px;
              background-color: white;
                }    
            .recoimg{
                width:auto;
                height:500px;
            }
            .text{
                margin-top:-30px;
                margin-bottom: 30px;
            }
  
  
  </style>




</head>
<body class="homepage">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       <script> $('.carousel').carousel({ interval: 1600  }) </script>

<!--header-->
        <sec:authorize access="isAnonymous()">
        <div class="container2">
        <div class="button-7">
            <div class="eff-7"></div>
            <a href="joinfrm.jsp"> 회원가입 </a>         
         </div>
         <div class="button-7">
            <div class="eff-7"></div>
            <a href="loginfrm"> 로그인 </a>         
         </div>
        </div>
        </sec:authorize>
        
        <sec:authorize access="isAuthenticated()">
       <div class="container2">
        
         <div class="button-7">
            <div class="eff-7"></div>
            <a id="logout" href="#" onclick="logoutGo()"> 로그아웃 </a>         
         </div>
        </div>
        <form action="logout" name="logoutform" method="post">
        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        </form>
        </sec:authorize>


<div id="header">
<h1><a href="#" id="logo">온책나누리</a></h1>

<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="./">Home</a></li>
								<li>
									<a href="">나의 도서관</a>
									<ul>
										<li><a href="movemypage">마이페이지</a></li>
										<li><a href="#">배송목록</a></li>
										<li><a href="#">대출목록</a></li>
										<li><a href="">희망도서목록</a></li>
									</ul>
								</li>
								<li><a href="left-sidebar.html">자료검색</a>
								     <ul>
										<li><a href="#">통합검색</a></li>
										<li><a href="#">인기도서</a></li>
										<li><a href="#">추천도서</a></li>
									</ul>
								</li>
								<li><a href="right-sidebar.html">도서관 이용안내</a>
								    <ul>
										<li><a href="#">열람실 예약안내</a></li>
										<li><a href="#">회원등급 기준</a></li>
										<li><a href="#">배송서비스 안내</a></li>
										<li><a href="">도서관 일정안내</a></li>
									</ul>
								</li>
								<li><a href="no-sidebar.html">도서관 서비스</a>
								    <ul>
										<li><a href="#">열람실 예약</a></li>
										<li><a href="#">건의 사항</a></li>
										<li><a href="#">희망도서 신청</a></li>
										<li><a href="">공지사항</a></li>
									</ul>
								</li>
							</ul>
						</nav>
</div>





</body>
</html>