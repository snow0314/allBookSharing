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

<div align="center" style="margin-top: 10px;">
<div style="width: 70%;">
<h1 style="width: 70%; margin-bottom: 20px; text-align: left;">${notice.no_title}</h1>
<div>
<div style="width: 70%; padding: 0 8px; line-height: 40px; border-top: 1px solid rgba(0,0,0,0.2); border-bottom: 1px solid rgba(0,0,0,0.2); text-align: left; background-color:rgba(0,0,0,0.1)">
<span>${notice.no_id}</span>

<span style="float: right; font-size: 14px;"><i class="far fa-clock"></i> ${notice.no_date}</span>
</div>
</div>
<pre style="text-align:left; margin-top:10px; width: 70%; border: 1px solid rgba(0,0,0,0.2);">
${notice.no_content}
</pre>
<div id="del" style="float:right;">
<form action="deletenotice?${_csrf.parameterName}=${_csrf.token}" method="post">
<input type="hidden" name="no_num" value="${notice.no_num}" />
<input type="submit" id="del_btn" value="삭제"/>
</form>
</div>
</div>
</div>


</body>
</html>