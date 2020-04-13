<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- 폰트어썸 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  
  <style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

#update_btn{
all:unset;
padding: 6px 12px;
cursor: pointer;
text-align: center;
vertical-align: center;
color: #fff;
background-color: #5bc0de;
font-weight: 400;
border-radius: 5px;
margin-right: 25px;
  }
 
  
#del_btn{
all:unset;
padding: 6px 12px;
cursor: pointer;
text-align: center;
vertical-align: center;
color: #fff;
background-color: #dc3545;
font-weight: 400;
border-radius: 5px;
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
		<button class="subbtn" onclick="location.href = 'noticemove' ">공지 사항</button>
		<br>
		<button class="subbtn" onclick="location.href = 'hopebookmove' ">희망도서 신청</button>

	</aside>
<div align="center" style="margin-top: 10px;">
<div style="width: 80%;margin-left:15%;">
 
<h2 style="font-family: 'Hanna', sans-serif;width: 70%;margin-top:5%; margin-bottom: 20px; text-align: left;">제목: &nbsp;${question.qs_title}</h2>
<div>
<div style="width: 70%; padding: 0 8px; line-height: 40px; border-top: 1px solid rgba(0,0,0,0.2); border-bottom: 1px solid rgba(0,0,0,0.2); text-align: left; background-color:rgba(0,0,0,0.1)">
<span>${question.qs_id}</span>
<span id="state" style="font-size: 12px; color: red;">(${question.qs_state})</span>
<span style="float: right; font-size: 14px;"><i class="far fa-clock"></i> ${question.qs_date}</span>
</div>
</div>
<pre style="text-align:left; margin-top:10px; margin-right:7%; width: 70%; border: 1px solid rgba(0,0,0,0.2);height:450px;font-size:30px;">
${question.qs_content}
</pre>

</div>
<div style="width: 70%; margin-top: 40px;">
<div style="width: 80%; text-align: left;margin-left:21%; font-size:30px; font-weight: bold; margin-bottom:10%;">
<i class="fas fa-comment-dots"></i> 답변


<pre id="answer" style=" border: 1px solid rgba(0,0,0,0.2);">
${answer.aw_contents}
</pre>
<form action="deletequestion?${_csrf.parameterName}=${_csrf.token}" method="post">
<div id="del" style="float:right;">
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</div>
</div>

<script>
let state="${question.qs_state}";
console.log(state);
if(state=="대기중"){	
	$("#answer").text("\r\n아직 답변이 없습니다.\r\n\r\n").css("text-align","center");
    $("#state").css("color","red");
}
if(state=="답변완료"){
	$("#state").css("color","blue");	
}
</script>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<sec:authentication var="principal" property="principal" />
<script>
let id="${question.qs_id}";
let logid="${principal.username}";
console.log("id="+id);
console.log("logid="+logid);

if(id==logid){
	
	$("<input>").attr("type","hidden").attr("value",${question.qs_num}).prop("name","qs_num").appendTo($("#del"));	
	$("<input>").attr("type","submit").attr("value","수정").prop("id","update_btn").attr("formaction","updatequs").appendTo($("#del"));
	$("<input>").attr("type","submit").attr("value","삭제").prop("id","del_btn").appendTo($("#del"));	
	
}

$("#del_btn").click(function(){
	
	return confirm("삭제하시겠습니까?");
});

$("#update_btn").click(function(){
	
	return confirm("수정하시겠습니까?");
});


</script>
</body>
</html>