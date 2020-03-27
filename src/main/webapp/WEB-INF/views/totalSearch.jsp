<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<title>통합검색</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 페이징 처리 플러그인 -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>	
<!-- 페이징 처리 플러그인 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

#popularlist{
margin-left:10%;
width:80%

}
#popularlist .prighttd{
vertical-align:middle;
font-weight:bold;
}
#popularlist .img{
margin:7px;

}
#popularlist td{
	 border-bottom: 2px solid #c0c0c0;
	}
	#d{
		font-family: 'Hanna', sans-serif;
		margin-bottom:30px;
		margin-left:10%
		}
	#a{
		font-family: 'Hanna', sans-serif;
	}
	#b{
		font-family: 'Hanna', sans-serif;
	}
	#d{
		font-family: 'Hanna', sans-serif;
	}
	#e{
		font-family: 'Hanna', sans-serif;
	}

	#bookinput{
	  width:65%;
	  display: inline-block;
	  border-radius: 10px;
	  
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
	
	#bookname{
		width:70%;
		margin-left: 15%
	}
	
	#submanu ul {
 	 list-style-type: none;
 	 padding: 0;
	}
	#select{
		margin-left:10%;
		height:48px;
		width:100px;
	}

	
	#searchbtn{
	height:45px;
	width:73px;
	margin-top:-5px;
	
	}
	
	#bkname{
	margin-top:-100px;
	color:#00498c;
	text-decoration:none;
	font-size: x-large;
	font-weight:bold;
	margin-bottom:100px;
	
	}
	#bkname:hover{
	text-decoration:underline;
	}
	.lname{
	font-weight:600;
	}
	h1{
	font-size:50px;
	}
	
	img{
	width:95px;
	height:166px;
	}
	/* Style the tab */
.tab {
  overflow: hidden;
  background-color: #e3f2fd;
  width:83%;
  margin-left:10%;
  margin-bottom:10px;
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
  background-color: #bbdefb;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #1976d2;
  color:white;
}

/* Style the tab content */
.tabcontent {
  
  padding: 6px 12px;
  border-top: none;
}
	#myRegion{
	width:83%;
	margin-left:10%;
	}
	#nationwide{
	width:83%;
	margin-left:10%;
	
	}
	
	#nationsidebar{
	width:25%;
	float:right;
	display:inline-block;
	}
	
	#regionsearchList{
	display:inline-block;
	width:73%;
	float:left;
	}
	#regionsearchList .lefttd{
	padding:7px;
	}
	#regionsearchList .righttd{
	vertical-align:middle;
	padding-left:5%;
	font-weight:500;
	}
	#regionsearchList td{
	 border-bottom: 2px solid #c0c0c0;
	}
	#totalsearchList td{
	 border-bottom: 2px solid #c0c0c0;
	}
	
	#totalsearchList .righttd{
	vertical-align:middle;
	padding-left:5%;
	font-weight:500;
	}
	#totalsearchList .lefttd{
	padding:7px;
	}
	#totalsearchList{
	display:inline-block;
	width:73%;
	float:left;
	}
	
	
	#totalsearchlist{
		float:right;
		background-color:white;
		width:65%;
		height:auto;
		margin-right: 8%;
        margin-top:2%;
        margin-bottom: 5%;
        padding:0px;
	}
	.bigregion {
  border: none;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  transition-duration: 0.4s;
  cursor: pointer;
  width:100%;
  margin-bottom:-20px;
}


.div {
  background-color: white; 
  color: black; 
}

.div:hover {
  background-color: #008CBA;
  color: white;
}
.br{
font-family: 'Jeju Gothic', sans-serif;
color:black;
}
.li{
color:black;}
#mylib{
color:black;
font-family: 'Jeju Gothic', sans-serif;
font-size:large;
}

#sidebar{
	width:25%;
	float:right;
	border:2px solid #F0EAD6;
	background-color:#F0EAD6;
	display:inline-block;
	text-align:center;
	vertical-align:middle;
	padding:30px 10px;
	border-radius: 20px;
	}
#myregionlb{
margin-bottom:0;
}
#submenu {
  		float: left;
  		width: 15%;
  		height: 100%;  
  	  margin-left: 8%;
  	  margin-top:2%;
}
.subbtn{
width:100%;
background-color:white;
height:55px;
font-family: 'Nanum Gothic Coding', monospace;
font-weight:bold;
font-size:20px;
border:none;


}
.subbtn:hover{
background-color:#F0EAD6;
}
.subtopbtn{
width:100%;
font-family: 'Hanna', sans-serif;
height:98px;
background-color:#223A5E;
color:white;
}
i{
float:right;
}
</style>
</head>

<body>
<jsp:include page="header.jsp" />

<!--main-->

<nav id="submenu">
	<button class="subtopbtn" disabled><h2>자료검색</h2></button><br>
    <button class="subbtn" onclick="location.href = 'totalsearch' " >통합검색</button><br>
    <button class="subbtn" onclick="getPage('besttopten')">인기도서</button><br>
    <button class="subbtn" onclick="getPage('recommend')">추천도서</button>
</nav>

<main id="totalsearchlist">
    <h1 id="d">통합검색</h1>

    
    
    <select id="select">
    	<option value="BK_NAME">제목</option>
    	<option value="BK_WRITER">저자</option>
    	<option value="BK_CODE">ISBN코드</option>    	 
    </select>
	<input type="text" id="bookinput">
	<button type="button" class="btn btn-outline-primary" onclick="bookList()" id="searchbtn">검색</button>
	
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
<script src="js/ajaxCsrf.js"></script>
<script>
window.onload = function () {
	console.log("bk_name",${bk_name});
	$('#bookinput').val(${bk_name});
	
	if($('#bookinput').val()!=""){
		if($("#id").val()!==""){
			$(".tab").html("<button class='tablinks' onclick='myregionSearch()' id='defaultOpen'>내 지역</button><button class='tablinks' onclick='totalBookSearch()'>전국소장정보</button>");
			
		}else if($("#id").val()==""){
			$(".tab").html("<button class='tablinks' onclick='totalBookSearch()' id='defaultOpen'>전국</button>");

		}
		document.getElementById("defaultOpen").click();
	}
}

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
	    	$("#contents").append("<div id='nationwide' class='tabcontent'><h2 id='a'>전국 통합검색</h2><table id='totalsearchList'><table></div><div id='nationsidebar'></div>");
	    	
	 		var str="";
	    	if(result!=undefined){
	    		$('#totalsearchList').empty();
	    		
	    	$.each(result,function(index,item){
	    		console.log(item.bk_code);
	    		str+='<tr id="tr"><td class="lefttd">'+'<image src="'+item.bk_image+'"></td>';
	    		str+='<td class="righttd">'+'<a href="bookdetailpage?bk_code='+item.bk_code+'&bk_lcode='+item.bk_lcode+'" id="bkname">'+item.bk_name+'</a><br>'+item.bk_writer+'<br>'+
	    		item.bk_publisher+'<br>'+item.bk_publicday+'<br><p class="lname">'+item.bk_lname+'</p></td></tr>';
	    	});
	    	
	 
	    	$('#totalsearchList').append(str);
	    	}
	    	
	    	
	    },
	    error:function(xhr,status){
	    	console.log("xhr2=", xhr);
			console.log("status=", status);
	    }
	});
	openCity(event, 'nationwide');
	$("#nationsidebar").html("<div class='bigregion'><a href=#; onclick='jiyuckSearch(this)'><h5 class='br'>서울</h5></a></div>"
							+"<br><hr><div class='bigregion'><h5 class='br'>경기도<i class='fa fa-plus'></i></h5><ul><li><a href=#; onclick='jiyuckSearch(this)' class='li'>시흥</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>부천</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>성남</a></li></ul></div>"
							+"<br><hr><div class='bigregion'><a href=#; onclick='jiyuckSearch(this)'><h5 class='br'>인천</h5></a></div>"
							+"<br><hr><div class='bigregion'><h5 class='br'>강원도<i class='fa fa-plus'></i></h5><ul><li><a href=#; onclick='jiyuckSearch(this)' class='li'>강릉</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>속초</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>원주</a></li></ul></div>"
							+"<br><hr><div class='bigregion'><a href=#; onclick='jiyuckSearch(this)'><h5 class='br'>대전</h5></a></div>"
							+"<br><hr><div class='bigregion'><h5 class='br'>충청남도<i class='fa fa-plus'></i> </h5><ul ><li><a href=#; onclick='jiyuckSearch(this)' class='li'>서산</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>천안</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>공주</a></li></ul></div>"
							+"<br><hr><div class='bigregion'><h5 class='br'>충청북도 <i class='fa fa-plus'></i></h5><ul><li><a href=#; onclick='jiyuckSearch(this)' class='li'>청주</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>충주</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>제천</a></li></ul></div>"
							+"<br><hr><div class='bigregion'><h5 class='br'>전라남도<i class='fa fa-plus'></i></h5><ul><li><a href=#; onclick='jiyuckSearch(this)' class='li'>광주</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>순천</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>광양</a></li></ul></div>"
							+"<br><hr><div class='bigregion'><h5 class='br'>전라북도 <i class='fa fa-plus'></i></h5><ul><li><a href=#; onclick='jiyuckSearch(this)' class='li'>전주</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>군산</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>남원</a></li></ul></div>"
							+"<br><hr><div class='bigregion'><h5 class='br'>경상남도<i class='fa fa-plus'></i> </h5><ul><li><a href=#; onclick='jiyuckSearch(this)' class='li'>창원</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>통영</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>김해</a></li></ul></div>"
							+"<br><hr><div class='bigregion'><a href=#; onclick='jiyuckSearch(this)'><h5 class='br'>부산</h5></a></div>"
							+"<br><hr><div class='bigregion'><a href=#; onclick='jiyuckSearch(this)'><h5 class='br'>대구</h5></a></div>"
							+"<br><hr><div class='bigregion'><a href=#; onclick='jiyuckSearch(this)'><h5 class='br'>울산</h5></a></div>"
							+"<br><hr><div class='bigregion'><h5 class='br'>경상북도<i class='fa fa-plus'></i> </h5><ul><li><a href=#; onclick='jiyuckSearch(this)' class='li'>경주</a></li><li class='li'><a href=#; onclick='jiyuckSearch(this)' class='li'>문경</a></li><li><a href=#; onclick='jiyuckSearch(this)' class='li'>포항</a></li></ul></div>"
							+"<br><hr><div class='bigregion'><a href=#; onclick='jiyuckSearch(this)'><h5 class='br'>제주도</h5></a></div>");

$(document).ready(function(){
	$('.bigregion').children("ul").slideUp();	
});
	$('.bigregion').click(function(){
		
		$(this).find("ul").slideToggle("normal");
	})

}
	

function jiyuckSearch(e){
	console.log($(e).text());
	$.ajax({
		type:'get',
		url:'jiyucksearch',
		async: false,
	    data:{"bk_search":$('#bookinput').val() ,"selectval":$('#select').val(),"bk_loc":$(e).text()},
	    dataType:'json',
	    success:function(result){
	    	
	    	
	 		var str="";
	    	if(result!=undefined){
	    		$('#totalsearchList').empty();
	    		
	    	$.each(result,function(index,item){
	   
	    		str+='<tr id="tr"><td class="lefttd">'+'<image src="'+item.bk_image+'"></td>';
	    		str+='<td class="righttd">'+'<a href="bookdetailpage?bk_code='+item.bk_code+'&bk_lcode='+item.bk_lcode+'" id="bkname">'+item.bk_name+'</a><br>'+item.bk_writer+'<br>'+
	    		item.bk_publisher+'<br>'+item.bk_publicday+'<br><p class="lname">'+item.bk_lname+'</p></td></tr>';
	    	});
				
	    	$('#totalsearchList').append(str);
	    	}
	    },
	    error:function(xhr,status){
	    	console.log("xhr3=", xhr);
			console.log("status=", status);
	    }
})
}
function regionlibSearch(lb_code){
	$.ajax({
		type:'get',
		url:'regionlibsearch',
		async: false,
	    data:{"bk_search":$('#bookinput').val() ,"selectval":$('#select').val(),"bk_lcode":lb_code},
	    dataType:'json',
	    success:function(result){
	    	console.log(result);
	 		var str="";
	    	if(result!=undefined){
	    		$('#regionsearchList').empty();
	    		
	    	$.each(result,function(index,item){
	   
	    		str+='<tr id="tr"><td class="lefttd">'+'<image src="'+item.bk_image+'"></td>';
	    		str+='<td class="righttd">'+'<a href="bookdetailpage?bk_code='+item.bk_code+'&bk_lcode='+item.bk_lcode+'" id="bkname">'+item.bk_name+'</a><br>'+item.bk_writer+'<br>'+
	    		item.bk_publisher+'<br>'+item.bk_publicday+'<br><p class="lname">'+item.bk_lname+'</p></td></tr>';
	    	});
				
	    	$('#regionsearchList').append(str);
	    	}
	    },
	    error:function(xhr,status){
	    	console.log("xhr3=", xhr);
			console.log("status=", status);
	    }
})
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
	    		str+="<li><a href='javascript:regionlibSearch("+item.lb_code+")' id='mylib'>"+item.lb_name+'('+item.lb_quantity+")</li>";
	    		
	    	});
	    	$('#myregionlb').html(str); 
	    	$('#myregionlb').css('display', 'block');	
	    },
	    error:function(xhr,status){
	    	console.log("xhr3=", xhr);
			console.log("status=", status);
	    }
		
	});//내지역 도서관 목록 가져오기

	
	$.ajax({//사이드 바 도서관 별 검색결과
		type:'get',
		url:'myregionsearch',
		async: false,
	    data:{"bk_search":$('#bookinput').val() ,"selectval":$('#select').val()},
	    dataType:'json',
	    success:function(result){
	    	$("#contents").append("<div id='myRegion' class='tabcontent'><h2 id='e'>"+result[0].bk_loc+"</h2><table id='regionsearchList'><table></div><div id='sidebar'><ul id='myregionlb'></ul></div>");
	    	
	 		var str="";
	    	if(result!=undefined){
	    		$('#regionsearchList').empty();
	    		
	    	$.each(result,function(index,item){
	   
	    		str+='<tr id="tr"><td class="lefttd">'+'<image src="'+item.bk_image+'"></td>';
	    		str+='<td class="righttd">'+'<a href="bookdetailpage?bk_code='+item.bk_code+'&bk_lcode='+item.bk_lcode+'" id="bkname">'+item.bk_name+'</a><br>'+item.bk_writer+'<br>'+
	    		item.bk_publisher+'<br>'+item.bk_publicday+'<br><p class="lname">'+item.bk_lname+'</p></td></tr>';
	    	});
				
	    	$('#regionsearchList').append(str);
	    	}
	    },
	    error:function(xhr,status){
	    	console.log("xhr3=", xhr);
			console.log("status=", status);
	    }
});
	openCity(event, 'myRegion');
	
}

function getPage(url) {

$.ajax({
	url:url,
	type:'get',
	success:function(page){
		$("#totalsearchlist").html(page);
	},
	error:function(){
		alert("실패");
	}
})
}  



$("#bookinput").keyup(function(e){
	if(e.keyCode == 13) 
		bookList();
	});







</script>
</body>
</html>