<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>        
<!DOCTYPE HTML>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
   
	<head>
	
		<title>Horizons by TEMPLATED</title>
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
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"  crossorigin="anonymous"></script> 
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
		<style>
		@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
		.text{font-family: 'Hanna', sans-serif;}
		body{
		counter-reset:section;
		}
		h5::before {
		counter-increment:section;
		content:counter(section) ;
	}
	h5{
	font-family: 'Hanna', sans-serif;
	}
			.container3{
               padding:30px 10px;
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
                height:433px;
            }
            .text{
                margin-top:-30px;
                margin-bottom: 30px;
            }
            
            tr,td{
          	  border:1px solid black;}
            #tdd{
            text-align:center;
             vertical-align: middle;
            }

            }
            img{
            width:100%;
            margin:5px 0;
            
            }
           .topimg:hover {
  			opacity: 0.3;
  			cursor: pointer;
			}
			.rocoimg:hover{
			cursor: pointer;
			}
			
			.carousel-inner:hover{
			cursor: pointer;
			}
		
            .card{
            width:20%;
            float:left;
        
            }
           #map{
           height:430px;
           width:400px;
           margin-left:14%;
           }
          
       #popular{
     
       width:700px;
       margin-left:-85px;
       }
       .card-header{
       height:40px;
       border:3px solid #BCBCBE;
       border-radius: 20px;
       color:#264E36;
       padding:5px 0;
       }
       
   #indexmain{
           padding: 6em 0;
           }

  .row>*{
   padding-left:0;
  
   }
   .infowindow{
	padding:0;
	font-size:23px;
   }

      </style>

	</head>
	
	<body class="homepage">
		
        <!--header-->
        <sec:authorize access="isAnonymous()">
        <div class="container2">
        <div class="button-7" onclick="joinfrm()">
            <div class="eff-7"></div>
            <a href="#"> 회원가입 </a>         
         </div>
         <div class="button-7" onclick="loginfrm()">
            <div class="eff-7"></div>
            <a href="#"> 로그인 </a>         
         </div>
        </div>
        </sec:authorize>
        
        <script>
        //로그인페이지
        function loginfrm(){
        	window.location.href="loginfrm";
        }
        
        //회원가입페이지
        function joinfrm(){
        	window.location.href="joinfrm";
        }
        </script>
        
        
        
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          <div class="container2">
        <div class="button-7" onclick="adminmain()">
            <div class="eff-7"></div>
           <a href="#">관리자 페이지</a>         
         </div>
         <div class="button-7" onclick="logoutGo()">
            <div class="eff-7"></div>
            <a id="logout" href="#" > 로그아웃 </a>         
         </div>
        </div>
        <form action="logout" name="logoutform" method="post">
        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        </form>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_LIBRARIAN')">
       <div class="container2">
        <div class="button-7" onclick="librarymain()">
            <div class="eff-7"></div>
           <a href="librarymain">사서 페이지</a>         
         </div>
         <div class="button-7" onclick="logoutGo()">
            <div class="eff-7"></div>
            <a id="logout" href="#" > 로그아웃 </a>         
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
         <div class="button-7" onclick="logoutGo()">
            <div class="eff-7"></div>
            <a id="logout" href="#" > 로그아웃 </a>         
         </div>
       </div>  
       
        <form action="logout" name="logoutform" method="post">
        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        </form>
        </sec:authorize>
        
<script>
function adminmain(){
	window.location.href="adminmain";
}

function librarymain(){
	window.location.href="librarymain";
}

</script>
        
	<!-- banner -->
			<div id="header">
			
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="#" id="logo">온책나누리</a></h1>
					
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


					<!-- Banner -->
						<div id="banner">
							<div class="container">
								<section>
									<header class="major">
								<input type="text" id="bookinput" placeholder="책의 제목을  입력해주세요" class="form-control" style="width:70%;height:50px;margin-left:15%;background-color:aliceblue;color:black;">
                                    
									</header>
									<a href=#; onclick="mainBookSearch()" class="button alt">Book Search</a>
								</section>			
							</div>
						</div>

				</div>
			</div>

       <!-- Main -->
			<div id="indexmain" class="wrapper style1">
				<section class="container">
					<div class="row" style="margin-bottom: -60px; margin-top: -50px;">
					
						<!-- Content -->
							<div class="6u">
								<section>
									<ul class="style">
										<li>
											<span class="fa fa-wrench"></span>
											<h3>전국 통합검색</h3>
											<span>한 지역에 국한 되지않고 전국 도서관의 책 소장 정보를 확인할 수 있습니다.</span>
										</li>
										<li>
											<span class="fa fa-cloud"></span>
											<h3>배송 서비스</h3>
											<span>도서관 방문이 어려운 사용자를 위해 도서 배송 서비스를 제공합니다.</span>
										</li>
									</ul>
								</section>
							</div>
							<div class="6u">
								<section>
									<ul class="style">
										<li>
											<span class="fa fa-cogs"></span>
											<h3>희망도서 신청</h3>
											<span>도서관에 없는 책을 도서관에 비치할 수 있도록 사용자의 요청에 따라 구매 및 상호대차 서비스를 제공합니다.</span>
										</li>
										<li>
											<span class="fa fa-leaf"></span>
											<h3>사용자 등급혜택</h3>
											<span>
											    도서관 이용률 증가 위해 독서량에 따라 우수회원을 선발해서 혜택을 제공합니다.
											</span>
										</li>
									</ul>
								</section>
							</div>

					</div>
				</section>
			</div>

       
            
    
		<!-- Featured -->
			<div class="wrapper style2" >
				<section class="container3" >
					<div class="row no-collapse-1" id="three">
						<section class="4u" id="4u1" >
						    <h2 class='text'>추천도서</h2>
							
                            <div id="demo" class="carousel slide" data-ride="carousel" data-interval="2000"> 
                                <div class="carousel-inner"> 
							<!-- 슬라이드 쇼 --> 
							<div class="carousel-item active"> 
							<!--가로--> 
							<img class="recoimg" src="images/reco1.jpg" alt="First slide" id="First"> 
				
							</div> 
							<div class="carousel-item"> 
							<img class="recoimg" src="images/reco2.jpg" alt="Second slide" id="Second"> 
							
							</div> 
							<div class="carousel-item"> 
							<img class="recoimg" src="images/reco3.jpg" alt="Third slide" id="Third"> 
							
							</div> 
							
							<div class="carousel-item"> 
							<img class="recoimg" src="images/reco4.jpg" alt="Forth slide" id="Forth"> 
							
							</div>
							
							 <div class="carousel-item"> 
							<img class="recoimg" src="images/reco5.jpg" alt="Fifth slide" id="Fifth"> 
				
							</div>  
							
							
							<!-- / 슬라이드 쇼 끝 --> 
							
							<!-- 왼쪽 오른쪽 화살표 버튼 --> 
							<a class="carousel-control-prev" href="#demo" data-slide="prev"> 
							<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
							<!-- <span>Previous</span> --> 
							</a> 
							<a class="carousel-control-next" href="#demo" data-slide="next"> 
							<span class="carousel-control-next-icon" aria-hidden="true"></span> 
							<!-- <span>Next</span> --> 
							</a> 
							<!-- / 화살표 버튼 끝 --> 
							
							<!-- 인디케이터 --> 
							<ul class="carousel-indicators"> 
							<li data-target="#demo" data-slide-to="0" class="active" ></li> <!--0번부터시작--> 
							<li data-target="#demo" data-slide-to="1"></li> 
							<li data-target="#demo" data-slide-to="2"></li> 
							<li data-target="#demo" data-slide-to="3"></li> 
							<li data-target="#demo" data-slide-to="4"></li> 
							</ul> 
							<!-- 인디케이터 끝 --> 
							</div>
                            </div>
                        </section>
						
                         <section class="4u" >
						     <h2 class='text' style="margin-left:-85px;">인기도서</h2>
							<div id="popular" >
						
							</div>
							
						</section>
						<section class="4u" >
						     <h2 class='text' style="margin-left: -50px;">지도</h2>
							<div id="map"></div>
							
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

	</body>

	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	1b51d85dd9bcbc0b96d2984712a09ec4&libraries=clusterer"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51d85dd9bcbc0b96d2984712a09ec4"></script>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>

	<script type="text/javascript">

	function mainBookSearch(){
		var bk_name=document.getElementById("bookinput").value;
		if(bk_name==""){
			alert("검색어를 입력하세요.");
			document.getElementById("bookinput".focus()); 
			return false;
		}
		console.log(bk_name);
		location.href="mainbooksearch?bk_name='"+bk_name+"'";
		
	}
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
		
		$(document).ready(function(){
			
			$.ajax({
				type:'get',
		    	url:'mainpagetopten',
		    	dataType:"json",
		    	success:function(result){
		    		var str="";
		    		$.each(result,function(index,item){

		    			str+="<div class='card'><div class='card-header'><h5>위</h5></div><img class='topimg'  src='"+item.bk_image+"' onclick=\"location.href='topdetailpage?bk_code="+item.bk_code+"'\" /></div>";
		    			

		    		});
		    		$('#popular').html(str);
		    		
		    	},
		    	error:function(){ 
			    	alert("실패");
			 }
			})//ajax End
			
			$.ajax({
				type:'get',
		    	url:'mainrecommend',
		    	dataType:"json",
		    	success:function(result){
		    		
						$("#First").attr("src",result[0].re_image);
						$("#Second").attr("src",result[1].re_image);
						$("#Third").attr("src",result[2].re_image);
						$("#Forth").attr("src",result[3].re_image);
						$("#Fifth").attr("src",result[4].re_image);
		    	
					
		    		
		    	},
		    	error:function(){ 
			    	alert("실패");
			 }
			})//ajax End
				
			});
		
		$(".recoimg").click(function(){
		    location.href="totalsearch?kind=recommend";  
		    
		});
		
		
		///지도
		 var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
		        level : 14 // 지도의 확대 레벨
		    });

		   // 마커 클러스터러를 생성합니다
		    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
		    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
		    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
		    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
		    var clusterer = new kakao.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
		        minLevel: 10, // 클러스터 할 최소 지도 레벨
		        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
		    });

		    // 데이터를 가져오기 위해 jQuery를 사용합니다
		    // 데이터를 가져와 마커를 생성하고YY 클러스터러 객체에 넘겨줍니다
		    $.get("getlibrary", function(data) {
		        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
		        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		        console.log("data",data);
		        var markers = $(data).map(function(i, position) {
		        	console.log("position",position);
                  
		        	var marker =new kakao.maps.Marker({
		                position : new kakao.maps.LatLng(position.lb_longitude, position.lb_latitude)
		            });
		            var iwContent='<div class="infowindow"}>&nbsp;'+position.lb_name+'</div>';		 
		            var infowindow= new kakao.maps.InfoWindow({
				        content: iwContent // 인포윈도우에 표시할 내용
				    });
		            
		            kakao.maps.event.addListener(marker, 'mouseover', function(){
		            	  infowindow.open(map, marker);
		            });
				    kakao.maps.event.addListener(marker, 'mouseout', function(){
				    	  infowindow.close();
				    });    		
		            		
				    return marker;
		        });
		        
		        kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

			        // 현재 지도 레벨에서 1레벨 확대한 레벨
			        var level = map.getLevel()-1;

			        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
			        map.setLevel(level, {anchor: cluster.getCenter()});
			    }); 
		       
		        // 클러스터러에 마커들을 추가합니다
		        clusterer.addMarkers(markers);
		        
		       
		        

				    // 마커에 표시할 인포윈도우를 생성합니다
				    
				    
				});
		

		    

		   
		 
	</script>
	
</html>