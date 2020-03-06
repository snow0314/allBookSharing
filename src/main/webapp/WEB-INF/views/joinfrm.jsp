<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>

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

<jsp:include page="header.jsp" /> 
   <h1>회원가입 페이지</h1>


   <form name="joinForm" action="memberjoin">

      <img id="show_profile" height="240">

      <div class="form-group">
         <label for="profile">프로필 사진</label> <span class="help-block"
            id="helper_profile">1mb이하만 가능</span><br> <input type="file"
            id="profile" class="form-control" name="us_image"
            accept=".jpg,.jpeg,.png,.gif,.bmp">
      </div>
      <table>
         <tr>
            <td><b>이름:</b></td>

            <td><input id="name" name="mb_name" type="text"
               placeholder="이름" class="txt" /></td>
         </tr>

         <tr>
            <td><b>이메일:</b></td>

            <td><input id="email" name="us_email" type="text"
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
         </tr>

         <tr>
            <td><b>아이디:</b></td>

            <td><input id="buyerid" name="us_id" type="text"
               placeholder="아이디" class="username_input" />
               <button type="button" id="checkbtn" onclick="checkbtn"
                  class="btn btn-default">중복확인</button></td>
         </tr>
         <tr>
            <td></td>
            <td id="result"></td>
         </tr>
         <tr>
            <td><b>비밀번호:</b></td>
            <td><input id="pw" name="mb_pw" type="password"
               placeholder="비밀번호" class="txt" /></td>
         </tr>
         <tr>
            <td><b>비밀번호확인:</b></td>
            <td><input id="pw1" name="pw1" type="password"
               placeholder="비밀번호확인" class="txt" /></td>

         </tr>
         <tr>
            <td id="pwdiv"></td>
         </tr>
         <tr>
            <td><b>전화번호:</b></td>

            <td><input type="text" name="us_phone" id="juminA" onkeyup="onlyNum(this, '');" onchange="onlyNum(this, '');" />


            </td>

         </tr>

         <tr>
            <td><b>지역선택:</b></td>
            <td><select name="mb_area" id="mb_area" class="foot1">
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
            </select></td>

         </tr>



         <tr>
            <td><b>주소:</b></td>

            <td><input type="text" id="sample4_postcode" name="us_address"
               placeholder="우편번호"> <input type="button"
               onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="sample4_roadAddress" placeholder="도로명주소"
               name="branchaddress"> <input type="text"
               id="sample4_jibunAddress" placeholder="지번주소"><br> <input
               type="text" id="sample4_detailAddress" placeholder="상세주소">
               <input type="text" id="sample4_extraAddress" placeholder="참고항목"></td>
         </tr>


         <tr>
            <td id="guide" style="color: #999; display: none"></td>
            <td colspan="2" id="map" style="width: 100%; height: 350px;"></td>
         </tr>



         <tr>
            <td><input type="button" onclick="subbtn" id="subbtn1" value="회원가입"/></td>

            <td><a href='' onClick="history.back()"><input
                  type="button" onclick="cancel" id="cancel1" value="회원가입취소">
            </a></td>
         </tr>
      </table>

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

      let idck = 0;
      $('#checkbtn').on('click', function() { //아이디 중복 검사
         var buyerid = $("#buyerid").val();
         $.ajax({
            type : 'get',
            url : "idcheck",
            data : "id=" + buyerid,
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
      }); //end on   

      $("#subbtn1").on('click', function() {
         var joinForm = document.joinForm; //joinForm=form 태그의 name값
         var name = joinForm.mb_name.value;
         var email = joinForm.us_email.value;
         var email2 = joinForm.email2.value;
         var email1 = joinForm.email1.value;
         var id = joinForm.us_id.value;
         var pw = joinForm.mb_pw.value; //pw=비밀번호input태그의 name값 (응용해서 아이디도 사용가능)
         var pw1 = joinForm.pw1.value;//위와같지만 pw1은 비밀번호 input태그의 name값임
         var phone1 = joinForm.us_phone.value;
         var phone2 = joinForm.phone2.value;

         var sample4_postcode = joinForm.us_address.value;
         console.log(sample4_postcode);
         if (!name) {
            alert("이름을 입력해 주세요")
            /* } else if (!year || !birth || !day) {
               alert("생년월일을 선택해주세요") */
         } else if (!email || !email1 || !email2) {
            alert("이메일을 입력해주세요")
         } else if (email2 == "선택하세요") {
            alert("이메일을 선택하거나 직접 입력하여주세요")
         } else if (!id) {
            alert("아이디를 입력해주세요")
         } else if (idck == 0) {
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
         } else if (sample4_postcode == "") {
            alert("주소를 입력해주세요");
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
         location.href = "index.jsp"
      });
      
      
      //전화번호
          function getTypeCheck(s, spc) {
        var i;
        
        for (i = 0; i < s.length; i++) {
            if (spc.indexOf(s.substring(i, i + 1)) < 0) {
                return false;
            }
        }
        
        return true;
    }
    
    function onlyNum(obj,n) {
        var re = /[^0-9]/gi;
        var NUM = "0123456789";
        var str_space = /\s/;
     
        if(n == undefined || n == null) {
            var n = "";
            var n2 = "";
        } 
        else {
            if(n == "") {
                var n = "";
                var n2 = "";
            } 
            else {
                var n = eval(n);
                var n2 = n;
            }
        }



     

   </script>
</body>
</html>