<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
<!-- 달력 플러그인 -->	
<link href='./plugins/fullcalendar-4.4.0/packages/core/main.css'
	rel='stylesheet' />
<link href='./plugins/fullcalendar-4.4.0/packages/daygrid/main.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='./plugins/fullcalendar-4.4.0/packages/core/main.js'></script>
<script src='./plugins/fullcalendar-4.4.0/packages/interaction/main.js'></script>
<script src='./plugins/fullcalendar-4.4.0/packages/daygrid/main.js'></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>	
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
#title{
font-family: 'Hanna', sans-serif;

}
#nationsidebar{
	width:15%;
	float:right;
	display:inline-block;
	margin-right:10%;
	}
#lib{
width:90%;
float:left;

}
#wrap{
width:65%;
float:left;

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

.br {
	font-family: 'Jeju Gothic', sans-serif;
	color: black;
}

a {
	color: black;
}

.li {
	color: black;
}

#mylib {
	color: black;
	font-family: 'Jeju Gothic', sans-serif;
	font-size: large;
}

i {
	float: right;
}

ul {
	list-style-type: none;
	padding: 0;
}
.tab {
  overflow: hidden;
  background-color: #e3f2fd;
  width:100%; 
  height: 100%;
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
  background-repeat: no-repeat
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #bbdefb;
}
.tab button:active {
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

/* 달력 스타일 */
#wrap {
	width: 1100px;
	margin: 0 auto;
}

#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	float: left;
	width: 70%;
	margin-bottom:10%;
}

</style>
</head>
<body>

<h1 id='title'>도서관 일정</h1>
		<div id="nationsidebar" >
			
				<div class='bigregion'>
					<h5 class='br'>
						<a href=#; onclick='jiyuckLibrary(this)'>서울</a>
					</h5>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						경기도<i class='fa fa-plus'></i>
					</h5>
					<ul>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>시흥</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>부천</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>성남</a></li>
					</ul>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						<a href=#;  onclick='jiyuckLibrary(this)'>인천</a>
					</h5>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						강원도<i class='fa fa-plus'></i>
					</h5>
					<ul>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>강릉</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>속초</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>원주</a></li>
					</ul>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						<a href=#;  onclick='jiyuckLibrary(this)'>대전</a>
					</h5>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						충청남도<i class='fa fa-plus'></i>
					</h5>
					<ul>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>서산</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>천안</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>공주</a></li>
					</ul>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						충청북도 <i class='fa fa-plus'></i>
					</h5>
					<ul>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>청주</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>충주</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>제천</a></li>
					</ul>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						전라남도<i class='fa fa-plus'></i>
					</h5>
					<ul>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>광주</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>순천</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>광양</a></li>
					</ul>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						전라북도 <i class='fa fa-plus'></i>
					</h5>
					<ul>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>전주</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>군산</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>남원</a></li>
					</ul>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						경상남도<i class='fa fa-plus'></i>
					</h5>
					<ul>
						<li><a href=#;  class='li'onclick='jiyuckLibrary(this)'>창원</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>통영</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>김해</a></li>
					</ul>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						<a href=#; onclick='jiyuckLibrary(this)'>부산</a>
					</h5>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						<a href=#; onclick='jiyuckLibrary(this)'>대구</a>
					</h5>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						<a href=#; onclick='jiyuckLibrary(this)'>울산</a>
					</h5>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						경상북도<i class='fa fa-plus'></i>
					</h5>
					<ul>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>경주</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>문경</a></li>
						<li><a href=#;  class='li' onclick='jiyuckLibrary(this)'>포항</a></li>
					</ul>
				</div>
				<br>
				<hr>
				<div class='bigregion'>
					<h5 class='br'>
						<a href=#; onclick='jiyuckLibrary(this)'>제주도</a>
					</h5>
				</div>
				
			

		</div>

		<div class="col-9" style="padding-right: 50px;">
			<div  id='lib' class="p-3 my-3 border">
			<div class="tab">
			
			</div>
			</div>
			
			<div id='wrap'>

			<div id='calendar'></div>

			<div style='clear: both'></div>

		</div>
		</div>
	

</body>
<script type="text/javascript">
$(function() {

		$('.bigregion').children("ul").slideUp();
}); //ready End
	
	$('.bigregion').click(function() {
		$(this).find("ul").slideToggle("normal");
	});//지역 클릭시 토글해주는 메소드
	
	function jiyuckLibrary(e){ //지역 선택시 해당 지역에  속하는 도서관 보여주는 메소드
		console.log($(e).text());
		$.ajax({ //지역 정보에 해당하는 도서관 보여주는 에이작스
			url : "getloclibray",
			type : "get",
			data : {"loc" : $(e).text()},
			dataType:'json'
			
	}).done((result) => {
		
		$(".tab").empty();
		result.forEach(function(item){
			$("<button>").addClass("tablinks").text(item.lb_name).attr("data-code",item.lb_code)
			.appendTo($(".tab"));

		});
		
	}).fail((xhr) => {
	
	}); //ajax End
	}
	
	$(".tab").on("click",".tablinks",function(){
		$("#calendar").empty();	
		calendarLoad($(this).data("code"));
		$(".tablinks").removeClass("active");
		$(this).addClass('active');
	});		
	function calendarLoad(lb_code) {
				var Calendar = FullCalendar.Calendar;
				
				/* initialize the external events
				-----------------------------------------------------------------*/

				var containerEl = document
						.getElementById('external-events-list');
		
				var calendarEl = document.getElementById('calendar');
				var calendar = new Calendar(
						calendarEl,
						{
							plugins : [ 'dayGrid' ],
							header : {
								left : 'prev,next today',
								center : 'title',
								right : 'dayGridMonth'
							},
							eventLimit : true,
							eventSources : [ { //도서관 일정 가져오고 달력에 뿌려주는 부분
								events : function(info,
										successCallback,
										failureCallback) {

									$.ajax({
										url : 'libraycalendarinfo',
										type : 'get',
										data : {"lb_code" : lb_code},
										dataType : 'json',
										success : function(data) {
											successCallback(data);
										}
									}); //ajax End

								}
							} ]
							
						});

				calendar.render();
			} //calendarLoad End
</script>
</html>