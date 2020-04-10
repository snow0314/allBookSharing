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
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
   #content{
    width: 900px;
    height: 650px;
   }
   .btn btn-success{
     width: 120px; 
     height: 60px;
   }
  #lb_loc{
   float:right;
   margin-right:33%;
   height:36px;
   }
   #qs_show{
   float:right;
   height:32px;
   width:150px;
   }
   #submenu {
  		float: left;
  		width: 15%;
  		height: 100%;  
  	  margin-left: 8%;
  	  margin-top:2%;
}
.subbtn{
width:100%;
background-color:white;
height:55px;
font-family: 'Nanum Gothic Coding', monospace;
font-weight:bold;
font-size:20px;
border:none;


} 
.subbtn:hover{
background-color:#F0EAD6;
}
.subtopbtn{
width:100%;
font-family: 'Hanna', sans-serif;
height:98px;
background-color:#223A5E;
color:white;
}
</style>

</head>
<body>
<jsp:include page="header.jsp" />
<aside id="submenu">

		<button class="subtopbtn" disabled>
			<h2>도서관 서비스</h2>
		</button>
		<br>
		<button class="subbtn"
			onclick="location.href = 'readingroommove' ">열람실 예약</button>
		<br>
		<button class="subbtn" onclick="location.href = 'questionmove' ">건의 사항</button>
		<br>
		<button class="subbtn" onclick="location.href = 'hopebookmove' ">희망도서 신청</button>
		<br>
		<button class="subbtn" onclick="location.href = 'noticemove' ">공지사항</button>
			
</aside>
<h1 style="font-family: 'Hanna', sans-serif;margin-left:35%;margin-top:3%;">수정</h1>

<form  action="updatequestion" method="post" style="width:70%;margin-left:35%; margin-top:2%;">

<input type="text" name="qs_title" id="qs_title1" placeholder="제목" required="required" style="width:300px; margin-bottom:10px;   height:36px;"/>



<div id="content">
<textarea class="form-control" name="qs_content" id=p_content></textarea>
<div style="margin-top: 10px;">
</div>
</div>
<div style="margin-top:80px;margin-left:15%;margin-bottom:10%;">
<input type="submit" id="sub_btn" value="수정" class="btn btn-success" style="margin-right:20px;background-color:#223A5E;"/>
<input type="button"  value="취소" class="btn btn-success" style="background-color:#223A5E;" onclick="goBack();"/>
</div>
<input type="hidden" name="qs_num" id="qs_num1" />
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>

<script type="text/javascript">

function goBack(){
	window.history.back();
	
}
</script>





<script type="text/javascript">
CKEDITOR.replace('p_content'
                , {height: 500
                 });
 
</script>

<script>

var json=${json};
console.log("json=",json);

$("#qs_title1").val(json.qs_title);
$("#p_content").val(json.qs_content);
$("#qs_num1").val(json.qs_num);
</script>
</body>
</html>