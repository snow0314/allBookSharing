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
#table{
width: 700px;
border: red;
margin-left: 400px;
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
#pw{
width: 200px;
}
#div_btn{
margin-left: 550px;
}
#btn{
padding:5px;
width: 50px;
}
</style>
</head>
<body>


<jsp:include page="header.jsp" />

<div id="div_body">
<form action="">
<table id="table" class="table table-bordered">
    <tbody>
    
     <tr>
        <td id="pro_img"><label for="profile"><img id="show_profile" height="240" alt="프로필 사진"></label></td>
        <td><input type="file" id="profile" class="form-control" name="us_image" accept=".jpg,.jpeg,.png,.gif,.bmp"><span class="help-block"
				id="helper_profile">1mb이하만 가능</span></td>
      </tr>
    
      <tr>
        <th>아이디</th>
        <td><input id="mb_id" type="text"  value="${mb.mb_id}" readOnly></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="text" id="pw" ></td>
      </tr>
      <tr>
        <td>비밀번호 확인</td>
        <td><input type="text" id="pw" ></td>
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
        <td>주소</td>
        <td><input type="text" value="${mb.us_address}" ></td>
      </tr>
      
      <tr>
        <td>핸드폰</td>
        <td><input type="text" value="${mb.us_phone}"></td>
      </tr>
      
      <tr>
        <td>이메일</td>
        <td><input type="text" value="${mb.us_email}"></td>
      </tr>
      
      
    </tbody>
  </table>
  <div id="div_btn">
  <input id="btn" type="submit" value="수정" />
  <input id="btn" type="submit" value="취소" formaction="movemypage" />
  </div>
</form>
</div>

</body>
</html>