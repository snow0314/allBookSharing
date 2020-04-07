<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!--토스트  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

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



<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
#mb_area{
display:inline;
width:150px;
height:42px;
margin-left:10px;
}
#table{
width: 60%;
border: red;
margin-left: 20%;
}
#mb_id{
width: 200px;
border: none;
}
td,tr{
border: red;
}
#pro_img{
width: 200px;
height: 250px;
text-align: center;
}
#pw1{
width: 400px;
height:42px;
}
#pw2{
width: 400px;
height:42px;
display:inline;
}
#div_btn{
margin-left: 550px;
}

#pw_btn{
	padding: 5px;
	margin-top: 5px;
	width: 100px;
	font-size: 17px;
	display:inline;
	margin-left:20px;
	background-color:#17a2b8;
   color:white;
   border-radius:4px;
}
#modify{
margin-left:17%;
font-size:20px;
background-color:#17a2b8;
color:white;
border-radius:4px;
padding:5px;
}
#delete{
font-size:20px;
background-color:#17a2b8;
color:white;
border-radius:4px;
padding:5px;
}
#area{
width: 400px;
height:42px;
display:inline;
}
</style>
</head>
<body>


<jsp:include page="header.jsp" />

<div id="div_body">
<form action="./profilecomplet?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data"  method="post" style="padding:50px 0;">
<h1 style="font-family: 'Hanna', sans-serif;margin-bottom: 30px;margin-left:20%; ㅡ">개인정보 수정</h1>
<table id="table" class="table table-bordered">
    <tbody>
    
     <tr>
        <td id="pro_img" style="font-family: 'Hanna', sans-serif;font-size:20px;"><label for="profile"><img id="show_profile" style="width:200px;" src="/img/profile/${mb.us_image }"  alt="프로필 사진"/></label></td>
        <td colspan="2"><input type="file" id="profile" class="form-control" name="us_image" accept=".jpg,.jpeg,.png,.gif,.bmp"><span class="help-block"
				id="helper_profile">1mb이하만 가능</span></td>
      </tr>
    
      <tr>
        <th style="text-align:center;font-family: 'Hanna', sans-serif;font-size:20px;">아이디</th>
        <td colspan="2"><input id="mb_id" type="text" name="mb_id"  value="${mb.mb_id}" readOnly></td>
      </tr>
      <tr>
        <td style="text-align:center;font-family: 'Hanna', sans-serif;font-size:20px;">비밀번호</td>
        <td colspan="2"><input type="password" name="mb_pw" id="pw1" ></td>
      </tr>
      <tr>
        <td style="text-align:center;font-family: 'Hanna', sans-serif;font-size:20px;">비밀번호 확인</td>
        <td colspan="2"><input type="password" id="pw2" ><span id="pwCheck"></span><input type="button" id='pw_btn' value='비밀번호 변경' /></td>
      </tr>
      
      <tr>
            <td style="text-align:center;font-family: 'Hanna', sans-serif;font-size:20px;">지역선택</td>
            <td><input type="text" id='area' readOnly name="mb_area" value="${mb.mb_area}" />
            <select id="mb_area" class="foot1">
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
        <td style="text-align:center;font-family: 'Hanna', sans-serif;font-size:20px;">주소</td>
        <td colspan="2"><input type="text" style="height:42px;"  name="us_address" value="${mb.us_address}" required ></td>
      </tr>
      
      <tr>
        <td style="text-align:center;font-family: 'Hanna', sans-serif;font-size:20px;">핸드폰</td>
        <td colspan="2"><input type="text" style="height:42px;" name="us_phone" value="${mb.us_phone}" required></td>
      </tr>
      
      <tr>
        <td style="text-align:center;font-family: 'Hanna', sans-serif;font-size:20px;">이메일</td>
        <td colspan="2"><input type="text" style="height:42px;" name="us_email" value="${mb.us_email}" required></td>
      </tr>
      
      
    </tbody>
  </table>
        <input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
  <div id="div_btn">
  <input id="modify" type="submit" value="수정" />
  <input id="delete" type="button" value="취소" onclick="pageBack()" />
  </div>
</form>
</div>

<script>
function pageBack(){
	
	history.back();
}
//지역선택
$("#mb_area").on('change', function(){
	console.log($("#mb_area").val());
	$("#area").val($("#mb_area").val());
});

//비밀번호 변경
$("#pw_btn").on("click",function(){
	$("#pw1").val();
	$("#pw2").val();
	console.log($("#pw1").val());
	console.log($("#pw2").val());
	console.log($("#_csrf").val());
	if($("#pw1").val()!=$("#pw2").val()){
		
	$('#pwCheck').html("비밀번호가 일치하지 않습니다.").css('color', 'red').css('font-weight','bold');
	}
	else{
		
 	$.ajax({
		type : "POST",
		url :"updatepassword",
		data:{pw:$("#pw1").val(),_csrf:$("#_csrf").val()},
		success : function(data) {
	        alert("비밀번호가 변경되었습니다.");

	     },
		error : function(xhr, status) {
			alert("에러");
	     }
		
	}); //end ajax  
	
	}
		
	
});
</script>

</body>
</html>