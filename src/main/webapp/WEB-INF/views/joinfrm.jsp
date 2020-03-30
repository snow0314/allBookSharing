<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!--지도 api  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04cfe5f1eb29416b59e4313a6acea9b8&libraries=services">
</script>
<!--toastr -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" integrity="sha256-ENFZrbVzylNbgnXx0n3I1g//2WeO47XxoPe0vkp3NC8=" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js" integrity="sha256-3blsJd4Hli/7wCQ+bmgXfOdK7p/ZUMtPXY08jmxSSgk=" crossorigin="anonymous"></script>

<style>

/* #map{
border: 1px solid black;
background: #FFFFFF;
} */


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
   text-align:center;
   font-style:inherit;
   background: #BCF5A9;
   padding:5px 10px;
   margin-left: 50px;
   margin-bottom: 10px;
   margin-top: 5px;
   border-radius: 5px;
   display: inline-block;
   border: none;
   cursor:pointer;
   height: 43px;
   width: 120px;
}

#addr_btn{
   all:unset;
   color: #000000;
   font-weight:bold;
   font-style:inherit;
   background: #BCF5A9;
   padding:5px 20px;
   margin-left: 25px;
   margin-bottom: 10px;
   margin-top: 5px;
   border-radius: 5px;
   border: none;
   cursor:pointer;

}

#guide{
display: none;
}
#map{

display: none;
}
#id{
width: 300px;
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
<jsp:include page="header.jsp" />
 
   <div id="div">
		<form action="./memberjoin?${_csrf.parameterName}=${_csrf.token}" onsubmit="return check()"  enctype="multipart/form-data" method="post">
			<div id="join_background">
				<table class="table table-bordered">
				<tbody>
				<tr>
        <td id="pro_img"><label for="profile"><img id="show_profile" src="profile/${mb.us_image }" width="150" height="220" alt="프로필 사진"/></label></td>
        <td colspan="3"><input type="file" id="profile" class="form-control" name="us_image" accept=".jpg,.jpeg,.png,.gif,.bmp"><span class="help-block"
				id="helper_profile">1mb이하만 가능</span></td>
      </tr>
					<tr>
						<td width="180px">아이디</td>
						<td><input type="text" name="mb_id" maxlength="20" id="id" required>
						<span id="result"></span></td>
						<td colspan="2" ><input id="id_check" type="button" value="중복확인">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="3">
						<input type="password" name="mb_pw" maxlength="30" id="pw" required>
						<span id='pw_ck'> </span>
						</td>
					</tr>

					<tr>
						<td>비밀번호체크</td>
						<td colspan="3"><input type="password" maxlength="30"
							id="pwcheck" required>
							<span id='pw_ck2'> </span>
							</td>		
					</tr>


					<tr>
						<td>이름</td>
						<td colspan="3"><input type="text" name="mb_name" maxlength="30" id="name" required>
						<span id='irum'></span>
						</td>
					</tr>

					<tr>
						<td>핸드폰</td>
						<td colspan="3"><input type="text" name="us_phone"  id="tel" required>
						<span id='tel_ck'> </span>
						</td>
					</tr>
					<tr>
            <td><b>이메일:</b></td>

            <td colspan="3"><input id="email" name="us_email" type="text" placeholder="이메일(xxx@xxx.xxx)" required/>
            <span id='emali_ck'></span>
            </td>
         
         </tr>


					 <tr>
            <td><b>지역선택:</b></td>
            <td colspan="2"><input id='area' name="mb_area" type="text" readonly required/></td>
            <td><select  id="mb_area" class="foot1">
                  <option value="">선택</option>
                  <option value="서울">서울</option>
                  <option value="인천">인천</option>
                  <option value="시흥">시흥</option>
                  <option value="부천">부천</option>
                  <option value="성남">성남</option>
                  <option value="강릉">강릉</option>
                  <option value="속초">속초</option>
                  <option value="원주">원주</option>
                  <option value="서산">서산</option>
                  <option value="천안">천안</option>
                  <option value="공주">공주</option>
                  <option value="청주">청주</option>
                  <option value="충주">충주</option>
                  <option value="춘천">춘천</option>
                  <option value="대전">대전</option>
                  <option value="경주">경주</option>
                  <option value="문경">문경</option>
                  <option value="포항">포항</option>
                  <option value="창원">창원</option>
                  <option value="통영">통영</option>
                  <option value="김해">김해</option>
                  <option value="대구">대구</option>
                  <option value="전주">전주</option>
                  <option value="군산">군산</option>
                  <option value="남원">남원</option>
                  <option value="광주">광주</option>
                  <option value="순천">순천</option>
                  <option value="광양">광양</option>
                  <option value="울산">울산</option>
                  <option value="부산">부산</option>
                  <option value="제주">제주</option>
            </select></td>

         </tr>


					<tr>
            <td><b>주소:</b></td>

            <td colspan="3"><label for="addr_btn"><input type="text" id="sample4_postcode"  placeholder="우편번호" readOnly required> </label>
               <input type="button" id="addr_btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="sample4_roadAddress" placeholder="도로명주소"  readOnly required> 
               <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readOnly required> 
               <input type="text" id="sample4_detailAddress" placeholder="상세주소" required>
               <input type="text" id="sample4_extraAddress" placeholder="참고항목" readOnly required></td>
         </tr>
         
         
        
				 </tbody>
				</table>
            <div id="guide" style="color: #999; display: none"></div>
            <div id="map" style="width: 100%; height: 350px;"></div>

			<input type="hidden" name="_csrf" value="${_csrf.token}">

				<input class="btn" type="submit" value="회원가입" id="hag" > 
				<input type="hidden" id="addr" name="us_address" />
				<input id="hag"class="btn" type="submit" value="취소" formaction="./">
			</div>
		</form>
	</div>
   <script>
   let addr="";

   
   
   	//지역 선택
	$("#mb_area").on("change",function(){
		
		$("#area").val($("#mb_area").val());
	});
   	
   	
   
   
   let idck=0;
   //아이디 검사 및 중복 체크
   $("#id_check").on("click", function(){
	  let mb_id=$("#id").val();
	//정규식 : 영숫자 8-10자
	  var patt=/^[A-Za-z0-9]{4,16}$/
	  console.log("id="+$("#id").val());
	  if(mb_id==""){
		  toastr.error('아이디를 입력해주세요!', '경고');
		  $('#result').html("");
		  return;
	  }else if(!patt.test(mb_id)){
		  toastr.error('아이디는 영어나 숫자 4~16자 입니다.', '경고');
		  $('#result').html("");
		  return;
	  }
	  
	  $.ajax({
          type : 'get',
          url : "idcheck",
          data : {mb_id:mb_id},
          success : function(data) {
             $('#result').html(data).css('color', 'red');
             console.log("data=", data);
             /* console.log("data=", result);
             console.log("status=", status);
             console.log("xhr=", xhr); */

          },
          error : function(xhr, status) {
             $('#result').html(xhr.responseText).css('color', 'green');
             console.log("xhr=", xhr);
             console.log("status=", status);
             if (status == "error") {
                idck = 0;
             } else {
                idck = 1;
             }
          }


       }); //end ajax
	   
	   
   });	//fct end
   
   
 //비밀번호 정규식 확인
 $("#pw").on("blur", function(){
	 var password=$("#pw").val();
		//특수문자 하나이상 포함하는 8~10자(전방탐색 이용)
		//특수문자는 비밀번호 중 어느 위치에 있어도 된다.
		//오라클로 치면 like '*a'라고하면 a가 어느 위치에 있어도 된다.(즉 앞에 임의의 글자가 있어도 된다.)
		//?=앞에서부터 검색, .은 임의의 문자, *는 0이상
		//.*[!@#$%^&*] --> 앞에서 부터 임의의 문자 다음에 특수문자 .*!@#$%^&*이 온다.
		//()는 독립된 하나의 조건 ->(?=.*[!@#$%^&*])는 특수문자가 하나있다라는 조건
		var patt=/(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,14}$/;
		if(password.length==0)
			return $("#pw_ck").text("필수 입력입니다.").css("color","red");
			else if(!patt.test(password))
				return $("#pw_ck").text("비밀번호는 특수문자 포함 8~14자 입니다.").css("color","red");
		$("#pw_ck").text("");
			return true;
	 
 });
   
 //비밀번호 재확인 
 $("#pwcheck").on("blur", function(){
	 var password=$("#pw").val();
	 var password2=$("#pwcheck").val();
	 
	 if(password2.length==0)
		 return $("#pw_ck2").text("필수 입력입니다.").css("color","red");
	 else if(password!=password2){
		 $("#pwcheck").val("");
		 return $("#pw_ck2").text("비밀번호가 일치하지 않습니다.").css("color","red");
	 }
	 $("#pw_ck2").text("");
		return true;
 });
 
 //이름 정규식으로 확인
 $("#name").on("blur", function(){
	 var irum=$("#name").val();
	//이름은 한글 2~10자
		var patt=/^[가-힣]{2,10}$/;
		if(irum.length==0){
			return $("#irum").text("필수 입력입니다.").css("color","red");
		}
		else if(!patt.test(irum)){
			return $("#irum").text("필수 이름은 한글 2~10자 입니다.").css("color","red");
		}
		$("#irum").text("");
		return true;
 });
 
 //전화번호 확인
 let tel; //전역변수를 선언해서 join에서 같이 사용한다.
 $("#tel").on("blur", function(){
	 const originalTel=$("#tel").val();
	 const telPatten=/^[0-9]{10,11}$/
		//전화번호 - 문자를 찾아 삭제한다.
		// /g : global의미 -> 하나만이 아니고 모두 찾아 바꿔라
		 tel=originalTel.replace(/\-/g,'');
		 if(tel.length==0)
			 return $("#tel_ck").text("필수 입력입니다.").css("color","red");
		 else if(!telPatten.test(tel)){
			 $("#tel").val("");
				 return $("#tel_ck").text("전화번호를 다시 입력해주세요.").css("color","red");
			 }
					$("#tel_ck").text("");
			return true;
 });

//이메일 체크
 $("#email").on("blur", function(){
	 let email=$("#email").val();
	 let patt=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 if(email.length==0)
		 return $("#emali_ck").text("필수 입력입니다.").css("color","red");
	 else if(!patt.test(email)){
		 return $("#emali_ck").text("이메일 형식에 맞게 입력해주세요.").css("color","red");
	 }
	 $("#emali_ck").text("");
		return true;	 
 });
 
 
 
 
 
//주소 합친후 submit
	function check(){
		addr=$("#sample4_postcode").val()+" "+$("#sample4_roadAddress").val()+" "
		+$("#sample4_detailAddress").val()+$("#sample4_extraAddress").val();
		$("#addr").val(addr);
	
		if(idck==0){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		
	}
	
   
   
   
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