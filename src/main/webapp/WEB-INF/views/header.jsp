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
      <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51d85dd9bcbc0b96d2984712a09ec4&libraries=services,clusterer,drawing"></script>
     
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
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
                font-size:80px;
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
  			
  			h1{
	font-family: 'Hanna', sans-serif;
	}
  </style>




</head>
<body class="homepage">
      
<!--header-->
        <sec:authorize access="isAnonymous()">
        <div class="container2">
        <div class="button-7">
            <div class="eff-7"></div>
            <a href="joinfrm"> 회원가입 </a>         
         </div>
         <div class="button-7">
            <div class="eff-7"></div>
            <a href="loginfrm"> 로그인 </a>         
         </div>
        </div>
        </sec:authorize>
        
        <sec:authorize access="isAuthenticated()"> 
        <sec:authorize access="hasRole('ROLE_LIBRARIAN')">
       <div class="container2">
        <div class="button-7">
            <div class="eff-7"></div>
           <a href="librarymain">관리 페이지</a>         
         </div>
         <div class="button-7">
            <div class="eff-7"></div>
            <a id="logout" href="#" onclick="logoutGo()"> 로그아웃 </a>         
         </div>
        </div>
        <form action="logout" name="logoutform" method="post">
        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        </form>
        </sec:authorize>
      
      <sec:authorize access="hasRole('ROLE_USER')">
       <div class="container2">
            <div class="eff-7" style="width:190px; margin-left:1520px; margin-top:20px; color:#2E2E2E;">
                        
            <span id=span><a href="movemypage"><sec:authentication property="principal.username"/></a></span>님 환영 합니다.
          
            </div>
         <div class="button-7">
            <a id="logout" href="#" onclick="logoutGo()"> 로그아웃 </a>         
         </div>
        </div>
        <form action="logout" name="logoutform" method="post">
        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        </form>
        </sec:authorize>
</sec:authorize>
<div id="header">
<h1><a href="./" id="logo">온책나누리</a></h1>

<!-- Nav -->
                  <nav id="nav">
                     <ul>
                        <li><a href="./">Home</a></li>
                        <li>
                           <a href="movemypage">나의 도서관</a>
                           <ul>
                              <li><a href="movemypage">마이페이지</a></li>
                              <li><a href="deliveryapplicationmove">배송신청목록</a></li>
                              <li><a href="moveloanlist">대출목록</a></li>
                              <li><a href="movehopelist">희망도서목록</a></li>
                           </ul>
                        </li>
                        <li><a href="totalsearch">자료검색</a>
                             <ul>
                              <li><a href="totalsearch">통합검색</a></li>
                              <li><a href="totalsearch?kind=besttopten">인기도서</a></li>
							  <li><a href="totalsearch?kind=recommend">추천도서</a></li>
                           </ul>
                        </li>
                        <li><a href="readingroominformation">도서관 이용안내</a>
                            <ul>
                              <li><a href="readingroominformation">열람실 예약안내</a></li>
                              <li><a href="readingroominformation?kind=membergrade">회원등급 기준</a></li>
                              <li><a href="readingroominformation?kind=deliveryinformation">배송서비스 안내</a></li>
                              <li><a href="readingroominformation?kind=libraryschedulemove">도서관 일정안내</a></li>
                              <li><a href="readingroominformation?kind=libraryinformationmove">도서관 정보</a></li>
                           </ul>
                        </li>
                        <li><a href="readingroommove">도서관 서비스</a>
                            <ul>
                              <li><a href="readingroommove">열람실 예약</a></li>
                              <li><a href="questionmove">건의 사항</a></li>
                              <li><a href="noticemove">공지 사항</a></li>
                              <li><a href="hopebookmove">희망도서 신청</a></li>
                           </ul>
                        </li>
                     </ul>
                  </nav>
</div>


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
         var logoutform=document.logoutform;
         logoutform.submit();
         
      }
   
   </script>


</body>
</html>