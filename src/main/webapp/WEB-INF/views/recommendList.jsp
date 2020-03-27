<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
</head>
<style>

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
h4{
font-family: 'Hanna', sans-serif;
}
h3{
font-family: 'Hanna', sans-serif;
}
#d{
	font-family: 'Hanna', sans-serif;
	margin-bottom:30px;
	margin-left:10%
	}
.recontents{
width:370px;
vertical-align:middle;
background-color:#F6D155;
border-radius:20px;
padding:10px;
text-align:center;
font-family: 'Noto Sans KR', sans-serif;
}
.recotd{
vertical-align:middle;
font-family: 'Noto Sans KR', sans-serif;
font-weight:750;
padding-left:20px;
}
.recoimg{
	width:100%;
	height:175px;
}
.recoimgdiv{
	background-color:grey;
	padding:10px;
	margin-left:20px;
	width:160px;

}
.bname{
	color:#00498c;
	font-size: x-large;
	font-weight:bold;
	}

#recommendList{
width:80%;
margin-left:10%;
 border-collapse: separate;
  border-spacing: 0 20px;
}
#recommendList tr{
margin-bottom:40px;
}

.recointro{
padding:0 5%;
border:2px solid #6B5B95;
border-radius:20px;
font-family: 'Noto Sans KR', sans-serif;
}
tr{
height:100px;
}

</style>
<body>
<h1 id="d">추천도서</h1>
<table id="recommendList">
<c:forEach var="recommend" items="${rmList}" varStatus="status">
	<tr class="ttr">
		<td><h2><i  id="down" class="fa fa-thumbs-o-up"></i></h2></td>
		<td><div class="recoimgdiv"><img src="${recommend.re_image }" class="recoimg"></div></td>
		<td class="recotd"><span class="bname">${recommend.re_bname }</span><br>${recommend.re_bwriter }
  			 <br>${recommend.re_publisher }<br>${recommend.re_publicday }<br>${recommend.bg_cate }/${recommend.sg_cate }
  			 <br><span onclick="introshow(${status.index})"style="font-size:25px;" >서평<i class="fa fa-chevron-circle-down" style="margin-right:82%;margin-top:8px;font-size:25px"></i></span></td>
		<td class="recontents"><h4>추천글</h4>"${recommend.re_contents}"</td>
	</tr>
	<tr style="visibility:collapse;" class="introtr" id="${status.index}">
	<td  colspan="4" class="recointro">
	 ${recommend.re_introduction}</td>
	</tr>
</c:forEach>
</table>
</body>
<script>
 function introshow(index){
	 console.log(index);

	if($('#'+index).css("visibility")=="collapse"){
	
		$('#'+index).css("visibility","visible");
	}else if($('#'+index).css("visibility")=="visible"){
	
		$('#'+index).css("visibility","collapse");
	}
} 
</script>
</html>