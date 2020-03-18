<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>통합검색</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
<style>
	#bookinput{
	width:65%;
	  display: inline-block;
	}
	.container2{
              width:100%;
              height:70px;
              padding-right: 30px;
              background-color: white;
                }    

	#logo:hover{
                text-decoration: none;
                color:white;
            }
	
	
	.dropdown{
	float:left;
	}
	

	}
	#bookList_layer {
	width:500px;
	height:500px;
	border:2cpx solid green;
	}

	.button-7{
              width:140px;
              height:50px;
              border:2px solid #34495e;
              float:right;
              text-align:center;
              cursor:pointer;
              position:relative;
              box-sizing:border-box;
              overflow:hidden;
              margin:10px 10px 50px 10px;

            }
            .button-7 a{
              font-family:arial;
              font-size:16px;
              color:#34495e;
              text-decoration:none;
              line-height:50px;
              transition:all .5s ease;
              z-index:2;
              position:relative;

            }
            .eff-7{
              width:140px;
              height:50px;
              border:0px solid #34495e;
              position:absolute;
              transition:all .5s ease;
              z-index:1;
              box-sizing:border-box;

            }
            .button-7:hover .eff-7{
              border:70px solid #34495e;
            }
            .button-7:hover a{
              color:#fff;
            }
	#totalsearchlist{
		float:right;
		background-color:white;
		width:60%;
		height:auto;
        border:2px solid red;
		margin-right: 10%;
        margin-top:2%;
        margin-bottom: 5%;
        padding:0px;
	}
	#bookname{
		width:70%;
		margin-left: 15%
	}
	#submenu {
  		float: left;
  		width: 18%;
  		height: 100%;  
  	  background: #ffa700;
  	 padding: 20px;
  	  border:2px solid blue;
  	  margin-left: 8%;
  	  margin-top:2%;
}
	#select{
		margin-left:10%;
		height:48px;
	}

	#submanu ul {
 	 list-style-type: none;
 	 padding: 0;
	}
	#searchbtn{
	height:40px;
	width:65px;
	}
	#searchList{
	width:80%;
	margin-left:10%;
	}
	
	#bkname{
	margin-top:-100px;
	color:#2565AE;
	text-decoration:none;
	font-size: x-large;
	
	}
	#bkname:hover{
	text-decoration:underline;
	}
	h1{
	font-size:50px;

	}
	#tr{
	height:10px;
	width:100%;
	}
	img{
	width:auto;
	height:auto;
	margin-bottom:-127px;
	}
	/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
	#myRegion{
	width:100%;
	
	border: 1px solid black;
	
	}
	#sidebar{
	width:25%;
	float:right;
	border: 1px solid black;
	display:inline-block;
	}
	#regionsearchList{
	display:inline-block;
	width:73%;
	float:left;
	}
</style>
</head>

<body>
<jsp:include page="header.jsp" />

<!--main-->

<nav id="submenu">
	<h2>자료검색</h2>
  <ul>
   <li><a href="#">통합검색</a></li>
   <li><a href="#">인기도서</a></li>
   <li><a href="#">추천도서</a></li>
  </ul>
</nav>

<main id="totalsearchlist">
    <h1>통합검색</h1>
    <select id="select">
    	<option value="BK_NAME">제목</option>
    	<option value="BK_WRITER">저자</option>
    	<option value="BK_CODE">ISBN코드</option>    	 
    </select>
	<input type="text" id="bookinput">
	<button onclick="bookList()" id="searchbtn">검색</button>
	<br><br>
	
	
	<div class="tab"></div>
	<div id="contents"></div>

	
</main>

<sec:authorize access="isAuthenticated()">
 <input id="id" type="hidden" value="<sec:authentication property="principal.username"/>">
 </sec:authorize>
  <sec:authorize access="isAnonymous()">
<input id="id" type="hidden" value=""/>
</sec:authorize>

</body>
<!--nav-->
<!-- search -->
<!-- searchResult -->
<script>

function bookList(){
	var bksearch=document.getElementById("bookinput");
	if(bksearch.value==""){
		alert("검색어를 입력하세요.");
		bksearch.focus();
		return false;
	}
	if($("#id").val()!==""){
		$(".tab").html("<button class='tablinks' onclick='myregionSearch()' id='defaultOpen'>내 지역</button><button class='tablinks' onclick='totalBookSearch()'>전국소장정보</button>");
		
	}else if($("#id").val()==""){
		$(".tab").html("<button class='tablinks' onclick='totalBookSearch()' id='defaultOpen'>전국</button>");

	}
	document.getElementById("defaultOpen").click();
}//검색 클릭 시 

function openCity(evt, cityName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}

	
function totalBookSearch(){//전국 통합 검색
	$.ajax({
		type:'get',
		url:'totalbooksearch',
		async: false,
	    data:{"bk_search":$('#bookinput').val() ,"selectval":$('#select').val()},
	    dataType:'json',
	    success:function(result){
	    	$("#contents").append("<div id='nationwide' class='tabcontent'><h2>전국 통합검색</h2><table id='totalsearchList'><table></div>");
	    	
	 		var str="";
	    	if(result!=undefined){
	    		$('#totalsearchList').empty();
	    		
	    	$.each(result,function(index,item){
	    		console.log(item.bk_code);
	    		str+='<tr id="tr"><td style="border:1px solid black;width:100px;height:176px;">'+'<image src="'+item.bk_image+'"></td>';
	    		str+='<td style="border:1px solid black;">'+'<a href="bookdetailpage?bk_code='+item.bk_code+'&bk_lcode='+item.bk_lcode+'" id="bkname">'+item.bk_name+'</a><br>'+item.bk_writer+'<br>'+
	    		item.bk_publisher+'<br>'+item.bk_publicday+'<br>'+item.bk_lname+'</td></tr>';
	    	});
	    	console.log(str);
	    	$('#totalsearchList').append(str);
	    	}
	    },
	    error:function(xhr,status){
	    	console.log("xhr2=", xhr);
			console.log("status=", status);
	    }
	});
	openCity(event, 'nationwide');
}
	

function myregionSearch(){//내 지역 
	$.ajax({
		type:'get',
		url:'myregionlib',
		data:{"bk_search":$('#bookinput').val() ,"selectval":$('#select').val()},
	    dataType:'json',
	    success:function(result){
	    
	    	
	    	var str="";
	    	
	    	$.each(result,function(index,item){   
	    		str+='<li>'+item.lb_name+'('+item.lb_quantity+')</li>';
	    		
	    	});
	    	console.log(str);
	    	$('#myregionlb').html(str); 
	    },
	    error:function(xhr,status){
	    	console.log("xhr3=", xhr);
			console.log("status=", status);
	    }
		
	});//내지역 도서관 목록 가져오기
	
	$.ajax({
		type:'get',
		url:'myregionsearch',
		async: false,
	    data:{"bk_search":$('#bookinput').val() ,"selectval":$('#select').val()},
	    dataType:'json',
	    success:function(result){
	    	console.log("result",result);
	    	$("#contents").append("<div id='myRegion' class='tabcontent'><h2>"+result[0].bk_loc+"</h2><table id='regionsearchList'><table></div><div id='sidebar'><ul id='myregionlb'></ul></div>");
	    	
	 		var str="";
	    	if(result!=undefined){
	    		$('#regionsearchList').empty();
	    		
	    	$.each(result,function(index,item){
	   
	    		str+='<tr id="tr"><td style="border:1px solid black;width:100px;height:176px;">'+'<image src="'+item.bk_image+'"></td>';
	    		str+='<td style="border:1px solid black;">'+'<a href="bookdetailpage?bk_code='+item.bk_code+'&bk_lcode='+item.bk_lcode+'" id="bkname">'+item.bk_name+'</a><br>'+item.bk_writer+'<br>'+
	    		item.bk_publisher+'<br>'+item.bk_publicday+'<br>'+item.bk_lname+'</td></tr>';
	    	});
				
	    	$('#regionsearchList').append(str);
	    	}
	    },
	    error:function(xhr,status){
	    	console.log("xhr3=", xhr);
			console.log("status=", status);
	    }
});//내지역 검색도서리스트
	openCity(event, 'myRegion');
}



</script>
</body>
</html>