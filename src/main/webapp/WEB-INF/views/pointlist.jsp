<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
#title{
text-align: center;
}
td{
text-align: center;

}
#area{
	width: 500px;
}
#btn{

margin-left: 850px;
margin-right: 100px;
}


</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	 <!-- ${list} --> 
	<form method="POST">
		<table class="table">
			<thead>
				<tr>
					<th id="title">거래번호</th>
					<th id="title">날짜</th>
					<th id="title">일출포인트</th>
					<th id="title">거래내용</th>
				</tr>
			</thead>

			<tbody id="tb">
				
				
			</tbody>

		</table>
<!-- <div id='btn'>
<button  type="submit" class="btn btn-secondary btn-lg"><a href="myPage.jsp">뒤로가기</a></button>
<button  type="submit" class="btn btn-secondary btn-lg"><a href="PointUser.jsp">포인트충전</a></button>
</div> -->

	</form>
	<script>
		var list = ${list};
		
			var str="";
			for (var i = 0; i < list.length; i++) {
				console.log("list", list[i]);

				str += "<tr>";

				str += "<td >";
				str += list[i].pl_num;
				str += "</td>"

				str += "<td>";
				str += list[i].pl_date;
				str += "</td>";

				str += "<td>";
				str += list[i].pl_inout;
				str += "</td>";

				str += "<td>";
				str += list[i].pl_contents;
				str += "</td>";

				str += "</tr>";
			}
			$(str).appendTo($("#tb"));
			
	
	</script>
</body>
</html>