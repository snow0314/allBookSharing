<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
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
width:300px;
vertical-align:middle;
background-color:#F6D155;

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
width:75%;
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
.delbtn{
	width:95px;
	height:38px;
	border:1px solid #00539C;
	font-size:15px;
	color:#00539C;
	font-weight:800;
	background-color:white;
	margin-left:30px;
}
.delbtn:hover{
cursor:pointer;
background-color:#00539C;
	color:white;
}
.su{
width:100%;
background-color:black;
opacity:0.4;
float:right;
font-size:25px;
color:white;
margin:0;

}
.su:hover{
background-color:blue;
opacity:0.5;
cursor:pointer;
}
</style>
<body>
<h1 id="d">추천도서리스트</h1>

<select name="recomonth" id="recomonth" onchange=recoChange()>
    <option value="04" id="fourth">2020/04</option>
    <option value="03">2020/03</option>
    <option value="02">2020/02</option>
    <option value="01">2020/01</option>
</select>
  
<table id="recommendList">

</table>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">추천글 수정</h4>
        </div>
        <div class="modal-body">
           <textarea  id="textcontent" name="content" cols="78" rows="10" ></textarea>
        </div>
        <div class="modal-footer">
          <input type="hidden" id="idid" value="">
          <button type="button" id="sujung" class="btn btn-default">수정</button>	
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
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
		    	console.log(result);
		    			var str="";
		    			$.each(result,function(index,item){
		    				
		    				str+='<tr class="ttr"><td><div class="recoimgdiv"><img src="'+item.re_image+'" class="recoimg"></div></td>';
		    				str+='<td class="recotd"><span class="bname">'+item.re_bname+'</span><br>'+item.re_bwriter+'<br>'+item.re_publisher+'<br>'+item.re_publicday+'<br>'
		    				         +item.bg_cate+'/'+item.sg_cate+'<br><span onclick="introshow('+index+')"style="font-size:25px;" >서평<i class="fa fa-chevron-circle-down" style="margin-right:82%;margin-top:8px;font-size:25px"></i></span></td>';
		    				str+='<td class="recontents"><h3 class="geul">추천글</h3><div class="chu" id="c'+index+'">'+item.re_contents+'</div><br><div class="su" data-toggle="modal" data-target="#myModal" data-contents="c'+index+'" data-isbn="'+item.re_bcode+'" >수정<i class="far fa-edit"></i></div></td><td ><button class="delbtn"  data-re_bcode="'+item.re_bcode+'">삭제&nbsp;<i class="fa fa-trash-o"></i></button></td></tr>';
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
 
$(document).on("click",".delbtn",function(){
	console.log("북코드",$(this).data("re_bcode"));
	var result2=confirm("삭제하시겠습니까?");
	if(result2){
		$.ajax({
			type:'get',
    		url:'recommenddelete',
    		data:{"re_bcode":$(this).data('re_bcode')},
    		success:function(result){
    			console.log("삭제결과",result);
    			alert("삭제되었습니다.");
    	 },
    	 error:function(xhr,status){ 
	    	console.log("xhr3=", xhr);
			console.log("status3=", status);
	 }
	})
	recoChange();
		}
		else{
			alert("취소");
		}
		
	})
$(document).on("click",".su",function(){
	console.log($(this).data("isbn"));
	$("#idid").val($(this).data("isbn"));
	$("#textcontent").text($("#"+$(this).data("contents")).text());
	
})
$(document).on("click","#sujung",function(){
	
 	var result2=confirm("수정하시겠습니까?");
	if(result2){
		$.ajax({
			type:'get',
    		url:'recomodify',
    		data:{"re_bcode":$("#idid").val(),"re_contents":$("#textcontent").val()},
    		success:function(result){
    			console.log("삭제결과",result);
    			alert("수정되었습니다.");
    	 },
    	 error:function(xhr,status){ 
	    	console.log("xhr3=", xhr);
			console.log("status3=", status);
	 }
	})
	recoChange();
		}
		else{
			alert("취소");
		} 
})
</script>
</html>