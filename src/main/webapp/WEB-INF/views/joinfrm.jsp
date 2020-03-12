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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04cfe5f1eb29416b59e4313a6acea9b8&libraries=services">
   
</script>


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
   font-style:inherit;
   background: #BCF5A9;
   padding:5px 10px;
   margin-left: 25px;
   margin-bottom: 10px;
   margin-top: 5px;
   border-radius: 5px;
   display: inline-block;
   border: none;
}
#id{
width: 200px;
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
		<form method="post">
			<div id="join_background">
				<table class="table table-bordered">
				<tbody>
				<tr>
        <td id="pro_img"><label for="profile"><img id="show_profile" src="profile/${mb.us_image }" width="150" height="220" alt="프로필 사진"/></label></td>
        <td colspan="2"><input type="file" id="profile" class="form-control" name="us_image" accept=".jpg,.jpeg,.png,.gif,.bmp"><span class="help-block"
				id="helper_profile">1mb이하만 가능</span></td>
      </tr>
					<tr>
						<td width="180px">아이디</td>
						<td colspan="3"><input type="text" name="id" maxlength="20" id="id">
						<input id="id_check" type="button" value="중복확인">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="3"><input type="password" name="pw" maxlength="30" id="pw"></td>
					</tr>

					<tr>
						<td>비밀번호체크</td>
						<td colspan="3"><input type="password" name="pwcheck" maxlength="30"
							id="pwcheck"></td>		
					</tr>


					<tr>
						<td>이름</td>
						<td colspan="3"><input type="text" name="name" maxlength="30" id="name"></td>
					</tr>

					<tr>
						<td>전화번호</td>
						<td colspan="3"><input type="text" name="tel" maxlength="11" id="tel"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="mail1" id="mail"></td>
						<td>@&nbsp;&nbsp;<input type="text" id="mail2" name="mail2"
							readOnly style="margin-bottom: 10px;" value="" /></td>
						<td><select id="url1">

								<option value="1">직접입력</option>
								<option value="@naver.com">naver.com</option>
								<option value="@daum.net">daum.net</option>
								<option value="@google.com">google.com</option>
						</select></td>

					</tr>


					<tr>
						<td>지역선택 :</td>
						<td><select id="url2">
								<option>서울&nbsp;</option>
								<option>인천&nbsp;</option>
								<option>경기&nbsp;</option>
						</select></td>
					</tr>

					<tr>
						<td rowspan="2">주소</td>
						<td><input class="addr3" type="text" id="addr1" name="addr1"
							readOnly /></td>
						<td><input class="addr3" type="text" name="addr2"
							style="width: 250px;"></td>
					</tr>
				 </tbody>
				</table>

				<input class="btn" type="button" value="확인" formaction="memberjoin"
					id="hag"> <input id="hag"class="btn" type="submit" value="취소"
					formaction="home">
			</div>
		</form>
	</div>

   <script>
      //전화번호
          function getTypeCheck(s, spc) {
        var i;
        
        for (i = 0; i < s.length; i++) {
            if (spc.indexOf(s.substring(i, i + 1)) < 0) {
                return false;
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
           
              if(!getTypeCheck(obj.value, NUM)) {
                  alert("숫자를 입력해주세요.");
                  
                  obj.value = obj.value.replace(re,"");
                  obj.value = n2;
                  
                  obj.focus();
                  
                  return false;
              }
          

   </script>
</body>
</html>