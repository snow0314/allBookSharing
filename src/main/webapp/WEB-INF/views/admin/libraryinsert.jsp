<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 등록</title>
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
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.form-group{
	width:60%;

}

.container2{
              width:100%;
              height:70px;
              padding-right: 30px;
              background-color: white;
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
            .text{
                margin-top:-30px;
                margin-bottom: 30px;
            }
}
</style>
</head>
<body class="homepage">
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       <script> $('.carousel').carousel({ interval: 1600  }) </script>
       


<!-- 도서관 등록 페이지 -->
<form method="post" autocomplete="off" action="libraryinsert">
<div id="main" class="wrapper style1">
	<section class="container">
		<div class="row" style="margin-bottom: -60px; margin-top: -5px;">
	</div>
	
	<!-- 내용 -->
	<div class="form-group">
		<label for="lb_code">도서관 코드</label>
		<input type="text" class="form-control" id="code" name="lb_code" placeholder="도서관 코드를 입력하세요"/>
	</div>
	
	<div class="form-group">
		<label for="lb_name">도서관 이름</label>
		<input type="text" class="form-control" id="name" name="lb_name" placeholder="도서관 이름을 입력하세요"/>
	</div>
	
	
	
	<div class="form-group">
    <label for="lb_loc">지역</label>
    <input type="text" class="form-control" id="loc" name="lb_loc"/>
		<select name="lb_area" id="lb_loc" class="foot1">
                  <option value="">선택</option>
                  <option value="서울">서울</option>
                  <option value="인천">인천</option>
                  <option value="경기">경기</option>
                  <option value="강원">강원</option>
                  <option value="충남">충남</option>
                  <option value="충북">충북</option>
                  <option value="대전">대전</option>
                  <option value="경북">경북</option>
                  <option value="경남">경남</option>
                  <option value="대구">대구</option>
                  <option value="전북">전북</option>
                  <option value="전남">전남</option>
                  <option value="울산">울산</option>
                  <option value="부산">부산</option>
                  <option value="제주">제주</option>
         </select>
    </div>
	<div class="form-group">
		<label for="lb_address">주소</label>
		<br>
		<input type="text" id="sample4_postcode" class="form-control"  placeholder="우편번호">
		<br>
		<input type="text" id="sample4_roadAddress" class="form-control" placeholder="도로명주소"> 
		<br>
		<input type="text" id="sample4_jibunAddress" class="form-control"  placeholder="지번주소">
		<br> 
		<input type="text" id="sample4_detailAddress" class="form-control"  placeholder="상세주소">
		<br>
		<input type="text" id="sample4_extraAddress" class="form-control"  placeholder="참고항목">
		<br>
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
		<br>
		
		<div class="form-group">
		<label for="lb_phone">전화번호</label>
		<input type="text" class="form-control" id="phone" name="lb_phone" placeholder="전화번호를 입력하세요"/>
	</div>
	<br>
	<div class="form-group">
		<label for="lb_email">도서관 이메일</label>
		<input type="text" class="form-control" id="email" name="lb_email" placeholder="도서관 이메일을 입력하세요"/>
	</div>
		<br>
		<span id="guide" style="color: #999; display: none"></span>
		<div id="map" style="width: 100%; height: 350px;"></div>
		<br>
	<input type="submit" id="subbtn1"  value="등록"/>
	<input type="hidden" name="_csrf" value="${_csrf.token}">
	<input type="hidden" id="addr" name="lb_address" value="">
	</div>
	
	</section>
</div>
</form>


<script>
		let str="";
$("#subbtn1").on("submit",function(){
	str=$("#sample4_postcode").val()+$("#sample4_roadAddress").val()+$("#sample4_jibunAddress").val()
	+$("#sample4_detailAddress").val()+$("#sample4_extraAddress").val();
		console.log("str="+str);
	$("#addr").val(str);
	console.log($("#addr").val());
});



		$("#btn").on("click",function(){		
		console.log($("#sample4_postcode").val());
		str=$("#sample4_postcode").val()+$("#sample4_roadAddress").val()+$("#sample4_jibunAddress").val()
		+$("#sample4_detailAddress").val()+$("#sample4_extraAddress").val();
		console.log("str="+str);
		});
		</script>
<!-- Footer -->
			<!-- <div id="footer">
				<div class="container">

					Lists
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

					Copyright
						<div class="copyright">
							Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
						</div>

				</div>
			</div> -->

<script>
//지역선택
$("#lb_loc").on('change', function(){
   console.log($("#lb_loc").val());
   $("#loc").val($("#lb_loc").val());
});
/* function ValidationCheck() {
	var validate = true;
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사
	var hanChecked = /^[가-힝a-zA-Z]{2,15}$/; // 한글 유효성검사(2자리 이상 15자리 이하)
	var phoneChecked = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-([0-9]{3,4})-([0-9]{4})$/;
	
	if($("#${commandName} #userEmail").val()) {
		if(!regExp.test($("#${commandName} #userEmail").val())){
		alert("이메일 주소가 유효하지 않습니다");
		$("#${commandName} #userEmail").focus();
		return false;
		}
		}
		if($("#${commandName} #userPhone").val()) {
		if(!phoneChecked.test($("#${commandName} #userPhone").val())) {
		alert("전화번호가 잘못 되었습니다.");
		$("#${commandName} #userPhone").focus();
		return false;
		}
	}
		if(!$("#${commandName} #userNm").val()) {
			alert("이름을 입력 하세요.");
			$("#${commandName} #userNm").focus();
			return false;
			}else if(!hanChecked.test($("#${commandName} #userNm").val())){
			alert("이름이 잘못 되었습니다.");
			$("#${commandName} #userNm").focus();
			return false;
			}else if(!$("#${commandName} #userEmail").val()) {
			alert("이메일을 입력하세요.");
			$("#${commandName} #userEmail").focus();
			}
			return false;
}
			else if(!$("#${commandName} #userFirstAddr").val()) {
				alert("주소를 클릭하여 선택해 주세요");
				$("#${commandName} #userZipCode").focus();
				return false;
			}
				}else if(!$("#${commandName} #userSecondAddr").val()) {
				alert("나머지 주소를 입력 해 주세요");
				$("#${commandName} #userSecondAddr").focus();
				return false;
				}else{
				return true;
		}
	}
} */

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById("sample4_roadAddress").value = roadAddr;
					document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					} else {
						document.getElementById("sample4_extraAddress").value = '';
					}

					var guideTextBox = document.getElementById("guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						guideTextBox.innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr + ')';
						guideTextBox.style.display = 'block';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						guideTextBox.innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr + ')';
						guideTextBox.style.display = 'block';
					} else {
						guideTextBox.innerHTML = '';
						guideTextBox.style.display = 'none';
					}

					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					mapOption = {
						center : new kakao.maps.LatLng(33.450701,
								126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer,
							mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									roadAddr,
									function(result, status) {

										// 정상적으로 검색이 완료됐으면
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y,
													result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																+ roadAddr
																+ '</div>'
													});
											infowindow
													.open(map, marker);

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});

				}

			}).open();
}


</script>
</body>
</html>