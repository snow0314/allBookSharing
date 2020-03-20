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
<div>

<input type="text" placeholder="제목"/>

<div id="content">
<textarea class="form-control" id="p_content"></textarea>
</div>
<div style="margin-top:70px;">
<form method="post">
<input type="submit" value="등록" class="btn btn-success" style="margin-right:50px;" formaction="questionwrite"/>
<input type="button"  value="취소" class="btn btn-success" onclick="goBack();"/>
</form>
</div>

<script type="text/javascript">

function goBack(){
	window.history.back();
	
}
</script>

</div>
<script type="text/javascript">
 CKEDITOR.replace('p_content'
                , {height: 500                                                  
                 });
</script>
</body>
</html>