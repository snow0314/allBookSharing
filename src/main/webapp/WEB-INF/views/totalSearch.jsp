<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	}
	img{
	width:auto;
	height:auto;
	margin-bottom:-127px;
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
	
	<div id="bookList_layer"><table id="searchList"></table></div>	

</main>



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
	
	$.ajax({
		type:'get',
		url:'booksearch',
	    data:{"bk_search":$('#bookinput').val() ,"selectval":$('#select').val()},
	    dataType:'json',
	    success:function(result){
	    	console.log("result",result)
	 		var str="";
	    	if(result!=undefined){
	    		$('#searchList').empty();
	    		
	    	$.each(result,function(index,item){
	    		console.log(item.bk_code);
	    		str+='<tr id="tr"><td style="border:1px solid black;width:100px;height:176px;">'+'<image src="'+item.bk_image+'"></td>';
	    		str+='<td style="border:1px solid black;">'+'<a href="bookdetailpage?bk_code='+item.bk_code+'" id="bkname">'+item.bk_name+'</a><br>'+item.bk_writer+'<br>'+
	    		item.bk_publisher+'<br>'+item.bk_publicday+'<br>'+item.bk_lname+'</td></tr>';
	    	});
				
	    	$('#searchList').append(str);
	    	}
	    },
	    error:function(xhr,status){
	    	console.log("xhr=", xhr);
			console.log("status=", status);
	    }
	});
}


</script>
</body>
</html>