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
  margin-top:7%;
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
#recomonth{
float:right;
margin-right:10%;
margin-bottom:20px;
width:120px;
height:40px;
}


</style>
<body>
<h1 id="d">추천도서</h1>

<select name="recomonth" id="recomonth" onchange=recoChange()>
    <option value="04" id="fourth">2020/04</option>
    <option value="03">2020/03</option>
    <option value="02">2020/02</option>
    <option value="01">2020/01</option>
</select>
  
<table id="recommendList">

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
 
 $(document).ready(function(){
	 $("select option[value='04']").prop("selected","selected");
	 recoChange();
 })
function recoChange(){
	 var month=$("#recomonth option:selected").val();

		$.ajax({
			type:'get',
			url:'selrecommend',
			async: false,
		    data:{"re_date":month}, 
		    dataType:'json',
		    success:function(result){
		    	
		    			var str="";
		    			$.each(result,function(index,item){
		    				str+='<tr class="ttr"><td><h2><i id="down" class="fa fa-thumbs-o-up"></i></h2></td>';
		    				str+='<td><div class="recoimgdiv"><img src="'+item.re_image+'" class="recoimg"></div></td>';
		    				str+='<td class="recotd"><span class="bname">'+item.re_bname+'</span><br>'+item.re_bwriter+'<br>'+item.re_publisher+'<br>'+item.re_publicday+'<br>'
		    				         +item.bg_cate+'/'+item.sg_cate+'<br><span onclick="introshow('+index+')"style="font-size:25px;" >서평<i class="fa fa-chevron-circle-down" style="margin-right:82%;margin-top:8px;font-size:25px"></i></span></td>';
		    				str+='<td class="recontents"><h4>추천글</h4>'+item.re_contents+'</td></tr>';
		    				str+=' <tr style="visibility:collapse;" class="introtr" id="'+index+'"><td  colspan="4" class="recointro">'+item.re_introduction+'</td></tr>';
		    	    	});
		    			
		    			$('#recommendList').html(str);
		    		},
		    	
	    error:function(xhr,status){
		    	console.log("xhr2=", xhr);
				console.log("status=", status);
		    }
		})  
}

</script>
</html>