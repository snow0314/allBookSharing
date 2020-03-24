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
.btn{
all:unset;
padding: 6px 12px;
cursor: pointer;
text-align: center;
vertical-align: center;
color: #fff;
background-color: #007bff;
font-weight: 400;
border-radius: 5px;
}



</style>

</head>
<body>
<div align="center" style="margin-top: 10px;">
<div style="width: 80%;">
<h1 style="width: 80%; margin-bottom: 20px; text-align: left;">${question.qs_title}</h1>
<div>
<div style="width: 79%; padding: 0 8px; line-height: 40px; border-top: 1px solid rgba(0,0,0,0.2); border-bottom: 1px solid rgba(0,0,0,0.2); text-align: left; background-color:rgba(0,0,0,0.1)">
<span>${question.qs_id}</span>
<span id="state" style="font-size: 12px; color: red;">(${question.qs_state})</span>
<span style="float: right; font-size: 14px;"><i class="far fa-clock"></i> ${question.qs_date}</span>
</div>
</div>
<pre style="text-align:left; margin-top:10px; width: 80%; border: 1px solid rgba(0,0,0,0.2);">
${question.qs_content}
</pre>
</div>
<div style="width: 80%; margin-top: 40px;">
<div style="width: 80%; text-align: left; font-size:20px; font-weight: bold;">
<i class="fas fa-comment-dots"></i> 답변

<pre style=" border: 1px solid rgba(0,0,0,0.2);">
${answer.aw_contents}
</pre>

<form action="questionanswer?${_csrf.parameterName}=${_csrf.token}" method="post">
<input type="hidden" name="aw_q_num" value='${question.qs_num}' />
<div id='ans' style=" margin-top: 10px;" >
<textarea  name="aw_contents" id="text" cols="133" rows="20">

</textarea>
</div>
<div style="float: right;">
<input type="submit" class="btn"  value='등록'/>
<input type="button" class="btn"  value='취소' onclick="goBack();"/>
</div>
</form>

</div>
</div>
</div>
<script>
let state="${question.qs_state}";
console.log(state);
if(state=="대기중")
$("#state").css("color","red");
if(state=="답변완료"){
$("#text").css("display","none");	
$(".btn").css("display","none");	
$("#state").css("color","blue");
}
</script>

<script>
function goBack(){
	window.history.back();
	
}
</script>

</body>
</html>