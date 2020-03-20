<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/jquery.serializeObject.js"></script>
<script>
	function logout(){
		$('#logoutFrm').submit();
	}
	
</script>
<style>
html, body {
	height: 100%;
	margin: 0
}

#articleView_layer {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#articleView_layer.open {
	display: block;
	color: red
}

#articleView_layer #bg_layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
	z-index: 100
}

#contents_layer {
	position: absolute;
	top: 40%;
	left: 40%;
	width: 400px;
	height: 400px;
	margin: -150px 0 0 -194px;
	padding: 28px 28px 0 28px;
	border: 2px solid #555;
	background: #fff;
	font-size: 12px;
	z-index: 200;
	color: #767676;
	line-height: normal;
	white-space: normal;
	overflow: scroll
}
</style>
</head>
<body>
	


	<h3>회원정보</h3>
	<table id="one_table">
		<tr height="30">
			<td width="80" bgcolor="pink" align="center">id</td>
			<td>${mb.m_id }</td>
		</tr>
		<tr height="30">
			<td width="80" bgcolor="pink" align="center">이름</td>
			<td>${mb.m_name }</td>
		</tr>
		
		
	</table>

	<table style="margin: auto; padding: 50px">
		<tr bgcolor="skyblue" height="30">
			<th width="100">글번호</th>
			<th width="100">제목</th>
			<th width="100">작성자</th>
			<th width="100">공개여부</th>
			<th width="100">상태</th>
			<th width="100">작성일</th>
			
		</tr>
		<c:forEach var="question" items="${qList}">
			<tr height="25">
				<td>${question.qs_num}</td>
				<!-- href="#" 페이지 맨위로 이동뒤 이벤트 발생 
			     href="#"; 페이지 현재위치에서 이벤트 발생-->
				<td><a href="#" onclick="articleView(${question.qs_num})">${question.qs_title}</a></td>
				<td align="center">${question.qs_id}</td>
				<td align="center">${question.qs_show}</td>
				<td align="center">${question.qs_state}</td>
				<td align="center">${question.qs_date}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 글쓰기 -->
	<form action="writefrm">
		<button>글쓰기</button>
	</form>
	<!-- 페이징 출력 -->
	<div align="center" id="page">${paging}</div>


	<!-- 모달 박스 -->
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer"></div>
	</div>

	<form action="test">
		컬럼명<input type="text" name="cName"><br> 검색 <input
			type="text" name="search" />
		<button>컬럼 검색</button>
	</form>


	<script>
	function articleView(qs_num){
		$("#articleView_layer").addClass('open');	//모달박스  나타내기
		$.ajax({
			type:'get',
			url:'contents',
			data:{qNum:qs_num},
			dataType:'html',
			success:function(data){
				
				$("#contents_layer").html(data);
			},
			error:function(error){
				console.log(error);
			}
			
		})//ajax End
	}//function End
	
	//모달박스 해제
	var $layerWindow=$("#articleView_layer");
	$layerWindow.find('#bg_layer').on('mousedown',function(event){
		console.log(event);
		$layerWindow.removeClass('open');
	});
	//esc 입력시 모달 해제
	$(document).keydown(function(event){
		console.log(event);
		if(event.keyCode!=27)
			return;
		else if($layerWindow.hasClass('open'))
			$layerWindow.removeClass('open');
	});
	$(function(){
		var result='${qNum}';
		if(result===''){
			return;
		}
		if(parseInt(result)>0){
			alert('${qNum}'+'번 글을 삭제하였다');
		}
	});
</script>
</body>
</html>