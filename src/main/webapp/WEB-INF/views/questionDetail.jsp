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
</head>
<body>
 <jsp:include page="header.jsp" />
<div align="center" style="margin-top: 10px;">
<div style="width: 70%;">
<h1 style="width: 70%; margin-bottom: 20px; text-align: left;">${question.qs_title}</h1>
<div>
<div style="width: 70%; padding: 0 8px; line-height: 40px; border-top: 1px solid rgba(0,0,0,0.2); border-bottom: 1px solid rgba(0,0,0,0.2); text-align: left; background-color:rgba(0,0,0,0.1)">
<span>${question.qs_id}</span>
<span style="font-size: 12px; color: red;">(${question.qs_state})</span>
<span style="float: right; font-size: 14px;"><i class="far fa-clock"></i> ${question.qs_date}</span>
</div>
</div>
<pre style="text-align:left; margin-top:10px; width: 70%; border: 1px solid rgba(0,0,0,0.2);">
${question.qs_content}
</pre>

</div>
<div style="width: 70%; margin-top: 40px;">
<div style="width: 70%; text-align: left; font-size:20px; font-weight: bold;">
<i class="fas fa-comment-dots"></i> 답변
</div>
</div>
</div>
</body>
</html>