<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
#id2{
display:flex;

}
form {
   margin: auto;
   height: 50%;
   width: 810px;
   padding: 30px;
}

#hag{

padding: 5px 0;
width: 100px;
font-size: 17px;
}
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
   height: 43px;
   width: 120px;
}
#id{
width: 200px;
}

</style>
</head>
<body>
 <%-- <jsp:include page="adminheader.jsp" />  --%>
 
   <div id="div">
		<form method="post">
			<div id="join_background">
				<table class="table table-bordered">
				<tbody>
					<tr>
						<td width="180px">아이디</td>
						<td><input type="text" name="la_id" maxlength="20" id="id" required>
						<span id="result"></span></td>
						<td colspan="2" ><input id="id_check" type="button" value="중복확인">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="3">
						<input type="password" name="la_pw" maxlength="30" id="pw">
						</td>
					</tr>

					<tr>
						<td>비밀번호체크</td>
						<td colspan="3">
						<input type="password" maxlength="30" id="pwcheck">
						</td>		
					</tr>
					
					<tr>
					<c:if test="${!empty testList}" >

   					<select name="selectBox" id="selectBox" style="width:80px;" class="select_02">

      				<c:forEach var="testList" items="${testList}" varStatus="i">

         			<option value="${testList.name}">${testList.name}</option>

      			</c:forEach>

   			</select>

		</c:if>

						<!-- <td>도서관 이름</td>
						<td colspan="3">
						<input type="text" name="la_name" maxlength="30" id="lb">
						</td> -->
					</tr>
					<tr>

					<tr>
						<td>도서관 코드</td>
						<td colspan="3">
						<input type="text" name="la_lcode" maxlength="30" id="lb">
						</td>
					</tr>
					<tr>
						<td><b>지역선택</b></td>
            <td colspan="2"><input id='area' name="la_loc" type="text" readonly required/></td>
            <td><select  id="la_loc" class="foot1">
                  <option value="">선택</option>
                  <option value="서울">서울</option>
                  <option value="인천">인천</option>
                  <option value="경기">경기</option>
            </select></td>
		</tr>
	</tbody>
</table>

				<input class="btn" type="submit" value="확인"  id="hag" formaction="librarianinsert"> 
				<input id="hag"class="btn" type="submit" value="취소" formaction="./">
				<input type="hidden" name="_csrf" value="${_csrf.token}">
			</div>
		</form>
	</div>
<script>
//지역선택
$("#la_loc").on("change",function(){
		
		$("#area").val($("#la_loc").val());
	});
	
	let idck=0;
	   //아이디 검사 및 중복 체크
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
	             $('#result').html(xhr.responseText).css('color', 'green');
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
	<!-- Footer -->
			<!-- <div id="footer">
				<div class="container">

					Lists
						<div class="row">
							<div class="8u">
								<section>
									<header class="major">
										<h2>Donec dictum metus</h2>
										<span class="byline">Quisque semper augue mattis wisi maecenas ligula</span>
									</header>
									<div class="row">
										<section class="6u">
											<ul class="default">
												<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
												<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
												<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
												<li><a href="#">Cras vitae metus aliquam  pharetra.</a></li>
											</ul>
										</section>
										<section class="6u">
											<ul class="default">
												<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
												<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
												<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
												<li><a href="#">Cras vitae metus aliquam  pharetra.</a></li>
											</ul>
										</section>
									</div>
								</section>
							</div>
							<div class="4u">
								<section>
									<header class="major">
										<h2>Donec dictum metus</h2>
										<span class="byline">Mattis wisi maecenas ligula</span>
									</header>
									<ul class="contact">
										<li>
											<span class="address">Address</span>
											<span>1234 Somewhere Road #4285 <br />Nashville, TN 00000</span>
										</li>
										<li>
											<span class="mail">Mail</span>
											<span><a href="#">someone@untitled.tld</a></span>
										</li>
										<li>
											<span class="phone">Phone</span>
											<span>(000) 000-0000</span>
										</li>
									</ul>	
								</section>
							</div>
						</div> -->

					<!-- Copyright -->
						<!-- <div class="copyright">
							Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
						</div>
				</div>
			</div> -->
	</body>
</html>