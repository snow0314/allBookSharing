<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사서등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!--toastr -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" integrity="sha256-ENFZrbVzylNbgnXx0n3I1g//2WeO47XxoPe0vkp3NC8=" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js" integrity="sha256-3blsJd4Hli/7wCQ+bmgXfOdK7p/ZUMtPXY08jmxSSgk=" crossorigin="anonymous"></script>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body{font-family: 'Jeju Gothic', sans-serif;}

#id_check {
   all:unset;
   color: #000000;
   font-weight:bold;
   text-align:center;
   font-style:inherit;
   background: #BCF5A9;
   padding:5px 10px;
   margin-left: 50px;
   margin-bottom: 10px;
   margin-top: 5px;
   border-radius: 5px;
   display: inline-block;
   border: none;
   cursor:pointer;
   height: 30px;
   width: 120px;
   }

</style>
</head>
<body>
<div class="container p-3 my-3 border" style="text-align: center" >
		<h3>사서 계정 등록</h3>
	</div>
<form method="post">
		<div class="container p-3 my-3 border" >
		<div class="col-lg-6">
			<table class="table table-borderless">
			<tr>
				<td>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width:120.39px;height: 38px;">아이디</span>
					</div>
				<input type="text" name="la_id" maxlength="20" id="id" required style="height:38px;"/>
				
				<input id="id_check" type="button" value="중복확인"/>
					</div>
					<span id="result"></span>
				</td>
			</tr>
			
		<tr>
			<td>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width:120.39px;">비밀번호</span>
					</div>
						<input type="password" name="la_pw" maxlength="30" id="pw">
					</div>
			</td>
		</tr>

					
		<tr>
			<td>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width:120.39px;">비밀번호 확인</span>
					</div>
						<input type="password" maxlength="30" id="pwcheck">
					</div>
			</td>
		</tr>
					
		<tr>
			<td>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width:120.39px;">도서관</span>
					</div>
					<select id="lb_name" name="lb_name" style="width:170px;">
						<option value="">선택</option>		
					</select>
				</div>
			</td>
		</tr>

		<tr>
			<td>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">도서관 코드</span>
					</div>
					<input type="text" name="la_lcode" class="form-control" maxlength="30" readonly="readonly" id="lb" readonly="readonly">
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width:110.39px;">지역</span>
				</div>
					<input type="text" name="la_loc" maxlength="30" class="form-control" readonly="readonly" id="lb2">
				</div>
			</td>
		</tr>
		
		<tr>
			<td><input type="hidden" name="_csrf" value="${_csrf.token}">
			<input class="btn btn-outline-success" type="submit" value="등록"  id="hag" formaction="librarianinsert">
			<input id="hag"class="btn btn-outline-success" type="submit" value="취소" formaction="./"></td>
		</tr>
</table>
</div>
</div>
</form>
<script>
var data;

$(function() {
	$.ajax({ //도서관 정보 가져오는 메소드
		url : "getlibraryinfo",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
	data=result;
 	var info=result;
	for(var i=0;i<info.length;i++){
		$("<option>").text(info[i].lb_name).attr("value",info[i].lb_code+","+info[i].lb_loc).appendTo($("#lb_name"));
	} 
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //도서관 이름 ajax End
});

$("#lb_name").on("change", function(){
	console.log($("#lb_loc").val());
	console.log($("#lb_name").val());
	let li_code=$("#lb_name").val();
	data=li_code.split(",");
	$("#lb").val(data[0]);
	$("#lb2").val(data[1]);
});

 


/* //지역선택
$("#la_loc").on("change",function(){
		
		$("#area").val($("#la_loc").val());
	});
 */	
//아이디 검사 및 중복 체크
	let idck=0;
	   
	   $("#id_check").on("click", function(){
		  let mb_id=$("#id").val();
		//정규식 : 영숫자 8-10자
		  var patt=/^[A-Za-z0-9]{4,16}$/
		  console.log("id="+$("#id").val());
		  if(mb_id==""){
			  toastr.error('아이디를 입력해주세요!', '경고');
			  return;
		  }else if(!patt.test(mb_id)){
			  toastr.error('아이디는 영어나 숫자 4~16자 입니다.', '경고');
			  return;
		  }
		  
		  $.ajax({
	          type : 'get',
	          url : "idcheck",
	          data : {mb_id:mb_id},
	          success : function(data) {
	             $('#result').html(data).css('color', 'red');
	             console.log("data=", data);
	          },
	          error : function(xhr, status) {
	        	  if(xhr.responseText=="사용불가능한 아이디입니다"){
	        		  $('#result').html(xhr.responseText).css('color', 'red');
	        	  }else{
	        		  $('#result').html(xhr.responseText).css('color', 'green');
	        	  }
	        	  
	             
	             console.log("xhr=", xhr);
	             console.log("status=", status);
	             if (status == "error") {
	                idck = 0;
	             } else {
	                idck = 1;
	             }
	          }
	       }); //end ajax
	   });	//fct end
	   
	  
</script>
	
	</body>
</html>