<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<!-- 폰트어썸 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
</style>

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
<div id="del" style="float:;">
<form action="deletenotice?${_csrf.parameterName}=${_csrf.token}" method="post">
<input type="hidden" name="no_num" value="${notice.no_num}" />

<input type="submit" id="del_btn" value="삭제" class="btn"/>
</form>
</div>
</div>
</div>


</body>
</html>