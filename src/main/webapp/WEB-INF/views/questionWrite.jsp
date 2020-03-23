<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>

<style>
   #content{
    width: 900px;
    height: 650px;
   }
   .btn btn-success{
     width: 100px; 
     height: 50px;
   }
   
</style>

</head>
<body>
<form method="post">


<input type="text" name="qs_title" placeholder="제목" required="required"/>

<select id="lb_loc" required="required" name="qs_lcode">
<option value="">선택</option>
</select>

<div id="content">
<textarea class="form-control" name="qs_content" id="p_content"></textarea>
<div style="margin-top: 10px;">
<select name="qs_show" id="qs_show" required="required">
<option value="">선택</option>
<option value="0">공개</option>
<option value="1">비공개</option>
</select>
<input type="hidden" id='sel' name="qs_pw" placeholder="숫자 4자리" maxlength="4" />
<span id="pw_ck"></span>
</div>
</div>
<div style="margin-top:70px;">
<input type="submit" id="sub_btn" value="등록" class="btn btn-success" style="margin-right:50px;" formaction="questionwrite?${_csrf.parameterName}=${_csrf.token}"/>
<input type="button"  value="취소" class="btn btn-success" onclick="goBack();"/>
</div>
</form>

<script type="text/javascript">

function goBack(){
	window.history.back();
	
}
</script>


<!-- 도서관 코드 불러오기 -->
<script>
let list=${list};
console.log(list);
for(var i=0;i<list.length;i++){
	$("<option>").text(list[i].lb_name).attr("value",list[i].lb_code).appendTo($("#lb_loc"));
}

</script>


<script type="text/javascript">
CKEDITOR.replace('p_content'
                , {height: 500
                 });
 
</script>

<script>

$("#qs_show").on("change",function(){
	console.log($("#qs_show").val());
	if($("#qs_show").val()==1){
		$("#sel").attr("type","text").attr("required",true).attr("disabled",false);
	}
	else{
		$("#sel").attr("type","hidden").attr("required",false).attr("disabled",true);
		
	}
});


//비밀번호 정규식 확인
$("#sel").on("blur", function(){
	 var password=$("#sel").val();
		var patt=/^[0-9]{4}$/;
		if(password.length==0)
			return $("#pw_ck").text("필수 입력입니다.").css("color","red");
			else if(!patt.test(password)){
					
				$("#pw_ck").text("비밀번호는 숫자 4글자 입니다.").css("color","red");
				return $("#sel").val("");
			}
		$("#pw_ck").text("");
			return true;
	 
});



</script>
</body>
</html>