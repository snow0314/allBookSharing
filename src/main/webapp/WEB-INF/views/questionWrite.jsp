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
<div>

<input type="text" name="qs_title" placeholder="제목" required="required"/>

<select id="lb_loc" required="required" name="qs_lcode">
<option value="">선택</option>
</select>

<div id="content">
<textarea class="form-control" name="qs_content" id="p_content" required="required"></textarea>
<select name="qs_show" required="required">
<option value="">선택</option>
<option value="0">공개</option>
<option value="1">비공개</option>
</select>
</div>
<div style="margin-top:70px;">
<input type="submit" value="등록" class="btn btn-success" style="margin-right:50px;" formaction="questionwrite?${_csrf.parameterName}=${_csrf.token}"/>
<input type="button"  value="취소" class="btn btn-success" onclick="goBack();"/>
</div>
</form>

<script type="text/javascript">

function goBack(){
	window.history.back();
	
}
</script>

</div>
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
</body>
</html>