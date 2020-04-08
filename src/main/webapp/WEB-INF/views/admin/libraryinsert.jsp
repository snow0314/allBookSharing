<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>


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
		<h3>도서관 등록</h3>
	</div>
	<form action="libraryinsert" method="post">

		<div class="container p-3 my-3 border">
			<table class="table table-borderless">
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
						<div id="map" style="width: 100%; height: 350px;"></div></td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">도서관 이름</span>
							</div>
							<input type="text" class="form-control" id="lb_name"
								name="lb_name" required="required">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">소속지역</span>
							</div>

							<select name="lb_loc" id="lb_loc" class="foot1"
								required="required">
								<option value="">선택</option>
								<option value="서울">서울</option>
								<option value="인천">인천</option>
								<option value="시흥">시흥</option>
								<option value="부천">부천 </option>
								<option value="성남">성남</option>
								<option value="강릉">강릉</option>
								<option value="속초">속초</option>
								<option value="원주">원주</option>
								<option value="서산">서산</option>
								<option value="천안">천안</option>
								<option value="공주">공주</option>
								<option value="청주">청주</option>
								<option value="충주">충주</option>
								<option value="제천">제천</option>
								<option value="대전">대전</option>
								<option value="경주">경주</option>
								<option value="문경">문경</option>
								<option value="포항">포항</option>
								<option value="창원">창원</option>
								<option value="통영">통영</option>
								<option value="김해">김해</option>
								<option value="전주">전주</option>
								<option value="군산">군산</option>
								<option value="남원">남원</option>
								<option value="광주">광주</option>
								<option value="순천">순천</option>
								<option value="광양">광양</option>
								<option value="울산">울산</option>
								<option value="부산">부산</option>
								<option value="제주">제주</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">전화번호</span>
							</div>
							<input type="number" class="form-control" id="lb_phone"
								name="lb_phone">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">이메일</span>
							</div>
							<input type="email" class="form-control" id="lb_email"
								name="lb_email">
						</div>
					</td>
				</tr>
				<tr>


				</tr>
				<tr>

					<td><label for="lb_address">주소</label> <input type="text"
						id="lb_postcode" name="lb_postcode" class="form-control"
						placeholder="우편번호"></td>
					<td><br> <input type="button"
						class="btn btn-outline-success"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
						style="margin-top: 8px;" /></td>
				</tr>
				<tr>
					<td><input type="text" id="lb_roadaddr" name="lb_roadaddr"
						class="form-control" placeholder="도로명주소" value=""></td>
					<td><input type="text" id="lb_branchaddr" name="lb_branchaddr"
						class="form-control" placeholder="지번주소" value=""></td>
				</tr>
				<tr>
					<td><input type="text" id="lb_detailaddr" name="lb_detailaddr"
						class="form-control" placeholder="상세주소" value=""></td>
					<td><input type="text" id="lb_extraaddr" name="lb_extraaddr"
						class="form-control" placeholder="참고항목" value=""> <input
						type="hidden" id="lb_Latitude" name="lb_latitude" value="">
						<input type="hidden" id="lb_longitude" name="lb_longitude"
						value=""></td>
				</tr>

				<tr>
					<td><input type="hidden" name="_csrf" value="${_csrf.token}">

						<input type="submit" id="insert" class="btn btn-outline-success"
						value="등록하기"></td>
				</tr>

			</table>

		</div>

	</form>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51d85dd9bcbc0b96d2984712a09ec4&libraries=services,clusterer,drawing"></script>
<script>
$(document).ready( function () {
	if("${msg}"!=""){
		toastr.success('${msg}', '도서관 등록에 ${msg}하셨습니다.');
	}
	
	$.ajax({ //등록할 도서관 코드 가져오기
		url : "librarynextcode",
		type : "get",
		dataType:'text'
		
}).done((result) => {
	console.log("result=",result);
	$("#lb_code").val(result);
	
	
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
	
	
}); //ready End
	

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
