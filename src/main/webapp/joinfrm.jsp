<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04cfe5f1eb29416b59e4313a6acea9b8&libraries=services">
	
</script>

<style>

/* #map{
border: 1px solid black;
background: #FFFFFF;
} */
form {
	background: #F1F8E0
}

table, tr, td {
	border: solid black 1px;
}

h1 {
	text-align: center;
}

form {
	border: 1px solid #ccc;
	margin: auto;
	height: 50%;
	width: 610px;
	padding: 30px;
}

#name {
	width: 175px;
	height: 23px;
	margin-left: 69px;
	margin-bottom: 8px;
}

#year {
	width: 56px;
	height: 23px;
	margin-left: 32px;
	margin-bottom: 8px;
}

#birth {
	width: 56px;
	height: 23px;
	margin-bottom: 8px;
}

#day {
	width: 56px;
	height: 23px;
	margin-bottom: 8px;
}

#email {
	width: 176px;
	height: 23px;
	margin-left: 53px;
	margin-right: 8px;
	margin-bottom: 8px;
}

#str_email02 {
	width: 176px;
	height: 23px;
	margin-bottom: 8px;
}

#email1 {
	width: 100px;
	height: 29px;
	margin-left: 8px;
	margin-bottom: 8px;
}

#buyerid {
	width: 176px;
	height: 23px;
	margin-left: 48px;
	margin-bottom: 8px;
}

#pw {
	width: 176px;
	height: 23px;
	margin-left: 32px;
	margin-bottom: 8px;
}

#pw1 {
	width: 176px;
	height: 23px;
	margin-bottom: 8px;
}

#phone {
	width: 47px;
	height: 29px;
	margin-left: 42px;
	margin-bottom: 8px;
}

#phone1 {
	width: 41px;
	height: 23px;
	margin-left: 8px;
	margin-right: 8px;
	margin-bottom: 8px;
}

#phone2 {
	width: 41px;
	height: 23px;
	margin-left: 8px;
	margin-bottom: 8px;
}

#subbtn1 {
	color: #000000;
	clear: right;
	text-transform: uppercase;
	text-decoration: none;
	background: #BCF5A9;
	padding-right: 20px;
	padding-left: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	margin-left: 195px;
	margin-bottom: 10px;
	margin-top: 5px;
	border-radius: 5px;
	display: inline-block;
	border: none;
	transition: all 0.4s ease 0s;
}

#cancel1 {
	color: #000000;
	clear: right;
	text-transform: uppercase;
	text-decoration: none;
	background: #BCF5A9;
	padding-right: 20px;
	padding-left: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	margin-left: 25px;
	margin-bottom: 10px;
	margin-top: 5px;
	border-radius: 5px;
	display: inline-block;
	border: none;
	transition: all 0.4s ease 0s;
}
</style>
<script>
	//프사 출력하기 : 1 mb가 넘으면 오류
	function loadImage() {
		//console.log($("#profile"));
		var file = $("#profile")[0].files[0]; //프사는 1개만등록
		var maxSize = 1024 * 1024; //1mb
		if (file.size > maxSize) {
			toastr.warning("사진은1MB이하여야 합니다.", "경고");
			$("#profile").val(""); //파일명 삭제
			return false; //작업 실패
		}
		//하드디스크에 있는 이미지파일을 로딩해서 화면에 출력
		var reader = new FileReader();
		reader.onload = function(e) {
			console.log("e=", e);
			$('#show_profile').attr('src', e.target.result);
		}
		reader.readAsDataURL(file); //서버가 아닌 pc에서 파일을 읽어오기 떄문에 빠름
		return true;
	}
	$(function() {
		//각 input요소에 이벤트 지정
		$("#profile").on("change", loadImage);
	});
</script>
</head>

<body>
	<h1>회원가입 페이지</h1>

	<form name="joinForm" action="memberjoin">
		<img id="show_profile" height="240">

		<div class="form-group">
			<label for="profile">프로필 사진</label> <span class="help-block"
				id="helper_profile">1m이하만 가능</span> <input type="file" id="profile"
				class="form-control" name="profile"
				accept=".jpg,.jpeg,.png,.gif,.bmp">
		</div>

		<tr>
			<td><b>이름:</b><input id="name" name="name" type="text"
				placeholder="이름" class="txt" /></td>
			<input type="radio" name="gener" checked="checked" />
			<span class="up">남자</span>&nbsp;&nbsp;
			<input type="radio" name="gener" />
			<span class="up">여자</span>


			<br>
		</tr>
		<tr>
			<b>생년월일:</b>
			<td><select name="year" id="year" class="foot1">
					<option value="">년도</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
					<option value="2017">2017</option>
					<option value="2016">2016</option>
					<option value="2015">2015</option>
					<option value="2014">2014</option>
					<option value="2013">2013</option>
					<option value="2012">2012</option>
					<option value="2011">2011</option>
					<option value="2010">2010</option>
					<option value="2009">2009</option>
					<option value="2008">2008</option>
					<option value="2007">2007</option>
					<option value="2006">2006</option>
					<option value="2005">2005</option>
					<option value="2004">2004</option>
					<option value="2003">2003</option>
					<option value="2002">2002</option>
					<option value="2001">2001</option>
					<option value="2000">2000</option>
					<option value="1999">1999</option>
					<option value="1998">1998</option>
					<option value="1997">1997</option>
					<option value="1996">1996</option>
					<option value="1995">1995</option>
					<option value="1994">1994</option>
					<option value="1993">1993</option>
					<option value="1992">1992</option>
					<option value="1991">1991</option>
					<option value="1990">1990</option>
					<option value="1989">1989</option>
					<option value="1988">1988</option>
					<option value="1987">1987</option>
					<option value="1986">1986</option>
					<option value="1985">1985</option>
					<option value="1984">1984</option>
					<option value="1983">1983</option>
					<option value="1982">1982</option>
					<option value="1981">1981</option>
					<option value="1980">1980</option>
					<option value="1979">1979</option>
					<option value="1978">1978</option>
					<option value="1977">1977</option>
					<option value="1976">1976</option>
					<option value="1975">1975</option>
					<option value="1974">1974</option>
					<option value="1973">1973</option>
					<option value="1972">1972</option>
					<option value="1971">1971</option>
					<option value="1970">1970</option>
					<option value="1970">1969</option>
					<option value="1970">1968</option>
					<option value="1970">1967</option>
					<option value="1970">1966</option>
					<option value="1970">1965</option>
					<option value="1970">1964</option>
					<option value="1970">1963</option>
					<option value="1970">1962</option>
					<option value="1970">1961</option>
					<option value="1970">1960</option>
			</select></td>
			<td><select name="birth" id="birth" class="foot1">
					<option value="">월</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
			</select></td>
			<td><select name="day" id="day" class="foot1">
					<option value="">일</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
			</select></td>
			<br>
		</tr>
		<tr>
			<td><b>이메일:</b><input id="email" name="email" type="text"
				placeholder="이메일" class="txt" />@ <input type="text" name="email2"
				id="str_email02" disabled value="선택하세요"> <select
				name="email1" id="email1">
					<option value="0">선택하세요</option>
					<option value="1">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
			</select></td>
			<br>
			<b>아이디:</b>
			<input id="buyerid" name="buyerid" type="text" placeholder="아이디"
				class="username_input" />
			<button type="button" id="checkbtn" onclick="checkbtn"
				class="btn btn-default">중복확인</button>
			<img id="id_check_sucess" style="display: none;">
			<br>
			<b>비밀번호:</b>
			<input id="pw" name="pw" type="password" placeholder="비밀번호"
				class="txt" />
			<br>
			<b>비밀번호확인:</b>
			<input id="pw1" name="pw1" type="password" placeholder="비밀번호확인"
				class="txt" />
			<br>
		</tr>
		<div id="pwdiv"></div>
		<tr>
			<td><b>전화번호</b><select name="phone" id="phone" class="foot1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
			</select></td>
			<td>-<input type="text" id="phone1" name="phone1" class="txt" />-<input
				type="txt" id="phone2" name="phone2" class="txt">
			</td>
			<br>
		</tr>
		<tr>
			<td><b>주소<b></b><br> <input type="text"
					id="sample4_postcode" placeholder="우편번호"> <input
					type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
					name="branchaddress"> <input type="text"
					id="sample4_jibunAddress" placeholder="지번주소"><br> <input
					type="text" id="sample4_detailAddress" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
		</tr>
		<br>
		<br>
		<span id="guide" style="color: #999; display: none"></span>
		<div id="map" style="width: 100%; height: 350px;"></div>

		<div>
			<tr>
				<td><input type="button" onclick="subbtn" id="subbtn1"
					value="회원가입" /></td>

				<td><a href='' onClick="history.back()"><input
						type="button" onclick="cancel" id="cancel1" value="회원가입취소">
				</a></td>
			</tr>
		</div>
	</form>


	<script>
		$(document).ready(function() {
			$("#str_email02").hide();

		});
		$('.username_input').change(function() {
			$('#id_check_sucess').hide();
			$('.btn btn-default').show();
			$('.username_input').attr("check_result", "fail");

		});

		$("#cancel1").on('click', function() {
			location.href = 'history.back()';
		});
		$('#checkbtn').on('click', function() {
			var buyerid = $("#buyerid").val();
			$.ajax({
				type : 'POST',
				url :"/memberjoin",
				data : {
					buyerid : buyerid
				},
				success : function(result) {
					if (result == 1) {
						$('.username_input').attr("check_result", "success");
						$('#id_check_sucess').show();
						$('.btn btn-default').hide();
					} else if (result == 0) {
						alert('아이디가 중복입니다.');
					} else {
						alert('아이디가 입력되지 않았습니다');
					}
				}
			}); //end ajax    
		}); //end on   

		$("#subbtn1").on('click', function() {
			var joinForm = document.joinForm; //joinForm=form 태그의 name값
			var name = joinForm.name.value;
			var year = joinForm.year.value;
			var birth = joinForm.birth.value;
			var day = joinForm.day.value;
			var email = joinForm.email.value;
			var email2 = joinForm.email2.value;
			var email1 = joinForm.email1.value;
			var id = joinForm.buyerid.value;
			var pw = joinForm.pw.value; //pw=비밀번호input태그의 name값 (응용해서 아이디도 사용가능)
			var pw1 = joinForm.pw1.value;//위와같지만 pw1은 비밀번호 input태그의 name값임
			var phone1 = joinForm.phone1.value;
			var phone2 = joinForm.phone2.value;

			if (!name) {
				alert("이름을 입력해 주세요")
			} else if (!year || !birth || !day) {
				alert("생년월일을 선택해주세요")
			} else if (!email || !email1 || !email2) {
				alert("이메일을 입력해주세요")
			} else if (email2 == "선택하세요") {
				alert("이메일을 선택하거나 직접 입력하여주세요")
			} else if (!id) {
				alert("아이디를 입력해주세요")
			} else if ($('.username_input').attr("check_result") == "fail") {
				alert("아이디 중복체크를 해주시기 바랍니다.");
				$('.username_input').focus();
				return false;
			} else if (!pw || !pw1) { //이건 그냥 유도리있게 써라 !에 var값 추가한거 쓰면 됨)
				alert("비밀번호를 입력해주세요")
			} else if (pw.length < 8) {
				alert("비밀번호는 8자 이상이어야 합니다.");
			} else if (pw.length > 20) {
				alert("비밀번호는 20자 이하이어야 합니다.");
			} else if (pw1.length < 8) {
				alert("비밀번호는 8자 이상이어야 합니다.");
			} else if (pw1.length > 20) {
				alert("비밀번호는 20자 이하이어야 합니다.");
			} else if (pw == pw1 && pw.length < 8) {
				alert("비밀번호는 8자 이상이어야 합니다.");
			} else if (pw == pw1 && pw.length > 20) {
				alert("비밀번호는 20자 이하이어야 합니다.");
			} else if (!phone1 || !phone2) {
				alert("전화번호를 입력해주세요")
			} else {
				alert("회원가입이 완료되었습니다.")
				joinForm.submit();
			}
		});

		$("#pw").keyup(
				function() {
					var pw = $("#pw").val();
					if (pw.length < 8) {
						$("#pwdiv").text("비밀번호는 8자 이상이어야 합니다.").css("color",
								"orangered");
					}
					if (pw.length > 20) {
						$("#pwdiv").text("비밀번호는 20자 이하이어야 합니다.").css("color",
								"orangered");
					}
				});

		$("#pw1").keyup(
				function() {
					var pw = $("#pw").val();
					var pw1 = $("#pw1").val();
					if (pw1.length < 8) {
						$("#pwdiv").text("비밀번호는 8자 이상이어야 합니다.").css("color",
								"orangered");
					} else if (pw1.length > 20) {
						$("#pwdiv").text("비밀번호는 20자 이하이어야 합니다.").css("color",
								"orangered");
					} else if (pw == pw1 && pw.length > 8) {
						$("#pwdiv").text("");
					} else if (pw == pw1 && pw.length < 8) {
						$("#pwdiv").text("비밀번호는 8자 이상이어야 합니다.").css("color",
								"orangered");
					} else if (pw == pw1 && pw.length < 20) {
						$("#pwdiv").text("");
					} else if (pw == pw1 && pw.length > 20) {
						$("#pwdiv").text("비밀번호는 20자 이하이어야 합니다.").css("color",
								"orangered");
					} else {
						$("#pwdiv").text("비밀번호가 다릅니다.").css("color",
								"orangered");
					}
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
		$("#cancel1").on('click', function() {
			location.href = "adminPage.jsp"
		});
	</script>
</body>
</html>
