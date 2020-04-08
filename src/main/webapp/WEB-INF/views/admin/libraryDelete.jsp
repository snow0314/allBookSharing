<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!--카카오 지도 api-->

<!--카카오 우편번호 api-->
<script type="text/javascript"
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- toastr CDN -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
   
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
</style>
</head>
<body>


<div class="container p-3 my-3 border" style="text-align: center" >
      <h3>도서관 정보 수정</h3>
   </div>
<form action="librarydelete" method="post">

		<!-- <div class="col-lg-6" style="width:37%; float:left;">
			<table class="table table-borderless">
			
			</table>
		</div> -->
		
		<div class="container p-3 my-3 border" >
		<div class="col-lg-10">
			<table class="table table-borderless">
			<tr>
				<td>
					<div id="sidebar" class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width:110.39px;">지역</span>
						</div>
					<select name="lb_loc" id="lb_loc" onclick="getLocLibray()" style="width:532px;">
						<option selected>선택</option>
					</select>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
					<div id="sidebar2" class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width:110.39px;">도서관</span>
						</div>
					<select name="br_lcode" id="lb_name" onchange="libraryinfo()" style="width:532px;">
						<option selected>선택</option>
					</select>
					</div>
				</td>
			</tr>
			<tr>
				<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">도서관 코드</span>
							</div>
							<input type="text" class="form-control" id="lb_code"
								name="lb_code" readonly="readonly">
						</div>
					</td>
					<td rowspan="5"><span id="guide"
						style="color: #999; display: none"></span>
						<div id="map" style="width: 80%; height: 350px;"></div></td>
				</tr>
				
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width:110.39px;">전화번호</span>
							</div>
							<input type="number" class="form-control" id="lb_phone"
								name="lb_phone" required="required">
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width:110.39px;">이메일</span>
							</div>
							<input type="email" class="form-control" id="lb_email"
								name="lb_email" required="required">
						</div>
					</td>
				</tr>
				
				<tr>


               <td><label for="lb_address">주소</label> <input type="text"
                  id="lb_postcode" name="lb_postcode" class="form-control"
                  placeholder="우편번호">
               </td>
            </tr>
            
            <tr>
               <td><input type="text" id="lb_roadaddr" name="lb_roadaddr"
                  class="form-control" placeholder="도로명주소" value="">
               <input type="text" id="lb_branchaddr" name="lb_branchaddr"
                  class="form-control" placeholder="지번주소" value=""></td>
            </tr>
            <tr>
               <td><input type="text" id="lb_detailaddr" name="lb_detailaddr"
                  class="form-control" placeholder="상세주소" value="" required="required"></td>
               <td><input type="text" id="lb_extraaddr" name="lb_extraaddr"
                  class="form-control" placeholder="참고항목" value=""> <input
                  type="hidden" id="lb_Latitude" name="lb_latitude" value="">
                  <input type="hidden" id="lb_longitude" name="lb_longitude"
                  value=""></td>
            </tr>

            <tr>
               <td><input type="hidden" name="_csrf" value="${_csrf.token}">
                  <input type="button"
                  class="btn btn-outline-success"
                  onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
                   />
                  <input type="submit" id="librarydelete" class="btn btn-outline-success"
                  value="수정하기"></td>
                  <td><input type="button" class="btn btn-outline-success" 
                   onclick="librarydrop()" value="삭제"></td>
            </tr>
         </table>
      </div>
      </div>
         
</form>

<script>
$(function() {
   var temp;
   
   $.ajax({ //지역 정보 넣어주는 에이작스
      url : "getlocinfo",
      type : "get",
      dataType:'json'
      
}).done((result) => {
   console.log("result=",result);
    var info=result;
   for(var i=0;i<info.length;i++){
      $("<option>").text(info[i].lb_loc).attr("value",info[i].lb_loc).appendTo($("#lb_loc"));
   } 
   
}).fail((xhr) => {
   console.log("xhr=",xhr);
}); //ajax End
});

function getLocLibray() {
   $.ajax({ //지역 정보에 해당하는 도서관 보여주는 에이작스
      url : "getloclibray",
      type : "get",
      data : {"loc" : $("#lb_loc").val()},
      dataType:'json'
      
}).done((result) => {
   console.log("result2=",result);
    var info=result;
    $("#lb_name").empty();
   $("<option>").text("선택").appendTo($("#lb_name"));
   for(var i=0;i<info.length;i++){
      $("<option>").text(info[i].lb_name).attr("value",info[i].lb_code).appendTo($("#lb_name"));
   } 
   
}).fail((xhr) => {
   console.log("xhr=",xhr);
}); // ajax End
}
</script>
</body>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51d85dd9bcbc0b96d2984712a09ec4&libraries=services,clusterer,drawing"></script>
<script>
function libraryinfo() {
   console.log("#br_lcode",$("#lb_name").val());
   $.ajax({ //도서관 정보 가져오는 에이작스
      url : "libraryinfo",
      type : "get",
      data : {"lb_code":$("#lb_name").val()},
      dataType:'json'
      
}).done((result) => {
   console.log("result=",result);
   $("#lb_code").val(result.lb_code);
   //$("#lb_name").val(result.lb_name);
   $("#lb_phone").val(result.lb_phone);
   $("#lb_email").val(result.lb_email);
   $("#lb_loc").val(result.lb_loc);
   $("#lb_postcode").val(result.lb_postcode);
   $("#lb_roadaddr").val(result.lb_roadaddr);
   $("#lb_branchaddr").val(result.lb_branchaddr);
   $("#lb_detailaddr").val(result.lb_detailaddr);
   $("#lb_extraaddr").val(result.lb_extraaddr);
   $("#lb_longitude").val(result.lb_longitude); //경도
   $("#lb_Latitude").val(result.lb_latitude); //위도
   
   
   mapCreate(result.lb_longitude,result.lb_latitude,result.lb_roadaddr);
   
}).fail((xhr) => {
   console.log("xhr=",xhr);
}); //ajax End
}
function mapCreate(latitude,longitude,roadAddr) {
   
   
   var container = document.getElementById('map');
   var options = {
      center: new kakao.maps.LatLng(latitude, longitude),
      level: 3
   };
   
   var coords = new kakao.maps.LatLng(
         latitude,
         longitude);
   
   
   var map = new kakao.maps.Map(container, options);
   
   // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">' +
            roadAddr +
            '</div>'
    });
    infowindow
        .open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords); 
}

function librarydrop(){ //삭제 버튼
   
   $.ajax({
      url : "librarydrop",
      type : "get",
      data : {"lb_code" : $("#lb_code").val()},
      dataType:'text'
      
}).done((result) => {
   console.log("result=",result);
   
   if(result=="성공"){
      toastr.success('성공', '삭제에 성공하셨습니다.');
   }else{
      toastr.error("실패", "삭제에 실패하셨습니다.");
   }
   
   location.reload(true);
   
}).fail((xhr) => {
   console.log("xhr=",xhr);
}); //ajax End
   
}

function sample4_execDaumPostcode() { //주소 등록하는 
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            if (data.bname !== '' &&
                /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            if (data.buildingName !== '' &&
                data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' +
                    data.buildingName : data.buildingName);
            }
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('lb_postcode').value = data.zonecode;
            document.getElementById("lb_roadaddr").value = roadAddr;
            document.getElementById("lb_branchaddr").value = data.jibunAddress;

            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if (roadAddr !== '') {
                document.getElementById("lb_extraaddr").value = extraRoadAddr;
            } else {
                document.getElementById("lb_extraaddr").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if (data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress +
                    extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' +
                    expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if (data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' +
                    expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701,
                        126.570667), // 지도의 중심좌표
                    level: 3
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
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });

                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">' +
                                    roadAddr +
                                    '</div>'
                            });
                            infowindow
                                .open(map, marker);

                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                            console.log("위도,경도:",coords);
                            $("#lb_Latitude").val(coords.Ga);
                            $("#lb_longitude").val(coords.Ha);
                            
                        }
                    });

        }

    }).open();
}
</script>
</html>