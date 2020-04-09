<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51d85dd9bcbc0b96d2984712a09ec4&libraries=services,clusterer,drawing"></script>

</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
#nationsidebar{
	width:21%;
	float:right;
	display:inline-block;
	margin-right:5%;
	}
.li{
color:black;}
.br{
font-family: 'Jeju Gothic', sans-serif;
color:black;
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
#main{
width:75%;
margin-left:20%;
position:absolute;
}
.information{
width:65%;
float:left;
margin-left:8%;
}
#title{
font-family: 'Hanna', sans-serif;
margin-left:14%;
}
.libbtn{
	width:150px;
	height:50px;
	border:1px solid #00539C;
	font-size:16px;
	color:#00539C;
	font-weight:800;
	background-color:white;
	margin-right:2px;
	margin-bottom:2px;
	font-weight:800;
}
.libbtn:hover{
	background-color:#00539C;
	color:white;
	cursor:pointer;
}
#loclib{
margin-left:85px;
width:90%;
}
i{
float:right;
}
#map{
margin-bottom:25px;
}
#phone{
font-size:20px;
font-family: 'Jeju Gothic', sans-serif;

}
.ul{
display:none;
}

</style>
<body>

<h1 id='title'>도서관 정보</h1>
<div class="information">
<div id='loclib'></div>
<div id="map" style="width: 80%; height: 350px;margin-left:90px;margin-top:20px;"></div>
<div id='info' style="width: 40%;margin-left:90px"></div>
</div>
<div id='nationsidebar'>
<div class='bigregion'><h5 class='br'><a href=#; onclick='jiyuckLibrary(this)'>서울</a></h5></div>
<br><hr><div class='bigregion'><h5 class='br'>경기도<i class='fa fa-plus'></i></h5><ul class='ul'><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>시흥</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>부천</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>성남</a></li></ul></div>
<br><hr><div class='bigregion'><a href=#; onclick='jiyuckLibrary(this)'><h5 class='br'>인천</h5></a></div>
<br><hr><div class='bigregion'><h5 class='br'>강원도<i class='fa fa-plus'></i></h5><ul class='ul'><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>강릉</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>속초</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>원주</a></li></ul></div>
<br><hr><div class='bigregion'><a href=#; onclick='jiyuckLibrary(this)'><h5 class='br'>대전</h5></a></div>
<br><hr><div class='bigregion'><h5 class='br'>충청남도<i class='fa fa-plus'></i> </h5><ul class='ul'><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>서산</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>천안</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>공주</a></li></ul></div>
<br><hr><div class='bigregion'><h5 class='br'>충청북도 <i class='fa fa-plus'></i></h5><ul class='ul'><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>청주</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>충주</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>제천</a></li></ul></div>
<br><hr><div class='bigregion'><h5 class='br'>전라남도<i class='fa fa-plus'></i></h5><ul class='ul'><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>광주</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>순천</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>광양</a></li></ul></div>
<br><hr><div class='bigregion'><h5 class='br'>전라북도 <i class='fa fa-plus'></i></h5><ul class='ul'><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>전주</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>군산</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>남원</a></li></ul></div>
<br><hr><div class='bigregion'><h5 class='br'>경상남도<i class='fa fa-plus'></i> </h5><ul class='ul'><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>창원</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>통영</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>김해</a></li></ul></div>
<br><hr><div class='bigregion'><a href=#; onclick='jiyuckLibrary(this)'><h5 class='br'>부산</h5></a></div>
<br><hr><div class='bigregion'><a href=#; onclick='jiyuckLibrary(this)'><h5 class='br'>대구</h5></a></div>
<br><hr><div class='bigregion'><a href=#; onclick='jiyuckLibrary(this)'><h5 class='br'>울산</h5></a></div>
<br><hr><div class='bigregion'><h5 class='br'>경상북도<i class='fa fa-plus'></i> </h5><ul class='ul'><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>경주</a></li><li class='li'><a href=#; onclick='jiyuckLibrary(this)' class='li'>문경</a></li><li><a href=#; onclick='jiyuckLibrary(this)' class='li'>포항</a></li></ul></div>
<br><hr><div class='bigregion'><a href=#; onclick='jiyuckLibrary(this)'><h5 class='br'>제주도</h5></a></div>
</div>
</body>


<script>

$('.bigregion').click(function(){
	
	$(this).find("ul").slideToggle("normal");
})

function jiyuckLibrary(e){
	console.log($(e).text());
	$.ajax({
		type:'get',
		url:'jiyucklib',
		data:{"lb_loc":$(e).text()},
	    dataType:'json',
	    success:function(result){
	    	var str="";
	    	$.each(result,function(index,item){   
	    		str+="<button class='libbtn'  data-lb_code='"+item.lb_code+"'>"+item.lb_name+"</button>";
	    		
	    	});
	    	$('#loclib').html(str); 

	    },
	    error:function(xhr,status){
	    	console.log("xhr3=", xhr);
			console.log("status=", status);
	    }
		
	});
}

$("#loclib").on("click",".libbtn",function(){
	console.log("도서관코드",$(this).data("lb_code"));
	 $.ajax({
	type:'get',
	url:'libinformation',
	data:{"lb_code":$(this).data("lb_code")},
    dataType:'json',
    success:function(result){
    	console.log(result);
    	var str="";
    	$.each(result,function(index,item){   
    		str+="<div id='phone'>도서관 이름 &nbsp;&nbsp"+item.lb_name+"<br>";
    		str+="전화번호 &nbsp;&nbsp;"+item.lb_phone+"<br>이메일 &nbsp;&nbsp;"+item.lb_email+"<br>주소 &nbsp;&nbsp;"+item.lb_roadaddr+"</div>";
    	
    		
    	});
    	$('#info').html(str); 
    	console.log("경도",result[0].lb_longitude);
    	mapCreate(result[0].lb_longitude,result[0].lb_latitude,result[0].lb_roadaddr);
    },
    error:function(xhr,status){
    	console.log("xhr3=", xhr);
		console.log("status=", status);
    }
	
}); 
	
})

function mapCreate(latitude,longitude,roadAddr) {
	
	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(latitude, longitude),
		level: 3
	};
	
	var coords = new kakao.maps.LatLng(
			latitude,
			longitude);
	
	
	var map = new kakao.maps.Map(container, options);
	
	// 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">' +
            roadAddr +
            '</div>'
    });
    infowindow
        .open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords); 
}
	
	
	

</script>
</html>