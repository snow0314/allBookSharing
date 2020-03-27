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
   #title{
     width: 400px;
     margin-bottom: 15px;
   }
   #dv{
    margin-left: 300px;
    margin-top: 40px;
   }
</style>

</head>
<body>
<div id="dv">
<form method="post" action="noticeWrite">


<input type="text" name="no_title" placeholder="제목" required="required" id="title"/>


<div id="content">
<textarea class="form-control" name="no_content" id="p_content"></textarea>
</div>
<div style="margin-top:70px;">
<input type="submit" id="sub_btn" value="등록" class="btn btn-success" style="margin-right:50px;" formaction="noticewrite?${_csrf.parameterName}=${_csrf.token}"/>
<input type="button"  value="취소" class="btn btn-success" onclick="goBack();"/>
</div>
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

</div>
</body>
</html>