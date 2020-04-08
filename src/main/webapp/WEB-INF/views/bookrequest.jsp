<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
table, th, td {
	border: 2px solid #bcbcbc;
	font-size: 20px;
	text-align: center;
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

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
</style>
</head>
<body>
<jsp:include page="header2.jsp" />

<aside id="submenu">

		<button class="subtopbtn" disabled>
			<h2>도서관 서비스</h2>
		</button>
		<br>
		<button class="subbtn"
			onclick="location.href = 'readingroommove' ">열람실 예약</button>
		<br>
		<button class="subbtn" onclick="location.href = 'questionmove' ">건의 사항</button>
		<br>
		<button class="subbtn" onclick="location.href = 'noticemove' ">공지 사항</button>
		<br>
		<button class="subbtn" onclick="location.href = 'hopebookmove' ">희망도서 신청</button>
		

	</aside>


<main id="totalsearchlist">
 	<section>
 	<h1 style="font-family: 'Hanna', sans-serif;">희망도서 신청</h1>
<h3 style="font-family: 'Hanna', sans-serif;margin-top:30px;"><i class='far fa-hand-point-right'></i>희망도서 신청 안내</h3>
 	<table class="table">
				<thead class="thead-dark">
<tr class="basic_ul"  >
	<th style="font-family: 'Noto Sans KR', sans-serif;padding-top:20px;padding-bottom:20px;">
	&nbsp;- 신청일 포함 1주 3권 이내(권당 5만원 이하)
	<br>&nbsp;- 신청 대상 : 단행본(연속간행물, 비도서(전자책, 오디오북 등)은 신청 제외)
	<br>&nbsp;- 희망도서 선정 : 도서관 운영위원회 심의를 거쳐 선정함
 	<br>&nbsp;- 희망도서 비치 알림 : SMS 전송(안내 문자 수신을 위해 개인정보수정에서 SMS 수신 체크 확인)
	<br>&nbsp;- 우선대출 기간 : 신청도서관 도서 비치일로부터 주말까지 
	</th>
</tr>
</thead>
 	</table>
<h3 style="font-family: 'Hanna', sans-serif;"><i class='far fa-hand-point-right'></i>희망도서 선정 제외기준</h3>
<div class="over_table">
	<table class="table">
		<caption style="color: black;font-family: 'Noto Sans KR', sans-serif;">
		희망도서 신청 제외기준 내용 및 종류 등 안내
		</caption>
		<thead class="thead-dark" style="font-family: 'Jeju Myeongjo', serif;">
			<tr>
				<td>기 준</td>
				<td>내  용</td>
				<td>비 고 </td>
			</tr>
		</thead>
		<tbody style="text-align: center;font-family: 'Jeju Myeongjo', serif;">
			<tr>
				<td>가격</td>
				<td>5만원 이상인 도서</td>
				<td class="txt_left">&nbsp;</td>
			</tr>
			<tr>
				<td rowspan="11" style="vertical-align:middle">제외종류</td>
				<td>소장도서, 중복 신청도서, 신간 구입 예정도서</td>
				<td class="txt_left">&nbsp;</td>
			</tr>
			<tr>
				<td>문제집, 수험서, 참고서, 대학교재, 전문서적</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>서지사항이 불분명한 도서</td>
				<td>서명, 저자명, 출판사 등</td>
			</tr>
			<tr>
				<td>판타지,  로맨스, 무협지, 성인만화(학습만화 제외)</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>전집</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>미풍양속, 정서에 문제를 유발할 수 있는 유해도서</td>
				<td>음란서적, 폭력물 등</td>
			</tr>
			<tr>
				<td>영리 또는 정치 목적의 신청도서</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>간증 등 개인적 성향이 강한 종교 관련 도서</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>소장이 적합하지 않은 형태의 도서</td>
				<td>색칠, 스티커, 퍼즐, 컬러링북 등 교구가 많은 도서</td>
			</tr>
			<tr>
				<td>비슷한 주제를 여러 권 신청할 경우</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>정기간행물(잡지 등 연속간행물)</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>입수가능성</td>
				<td>품절 및 절판 도서, 미출간도서</td>
				<td>희망도서 선정시점에 시중에 판매되지 않은 자료</td>
			</tr>
			<tr>
				<td>최신성</td>
				<td>발행된 지 5년 이상인 도서</td>
				<td>컴퓨터, 과학, 신학문 분야는 출판된 지 2년 이상인 자료</td>
			</tr>
		</tbody>
	</table>
</div>
<p class="basic_p">※ 신청하신 자료는 자료선정위원회의 심의를 거쳐 구입, 정리 후 이용자에게 제공됩니다.</p>

<h3 style="font-family: 'Hanna', sans-serif;"><i class='far fa-hand-point-right'></i>희망도서 선정 확인</h3>
<ul class="basic_ul" style="font-family: 'Nanum Gothic Coding', monospace;font-size:15px;">
	<li>신청중 : 희망도서 담당자가 구입 타당성 검토 및 서지사항 확인 중인 상태</li>
	<li>처리중 : 희망도서를 구입에 반영하여 주문 중인 상태</li>
	<li>취소됨 : 구입에서 제외된 상태(취소 사유 확인 가능)</li>
	<li>소장중 : 희망도서를 자료실에 비치한 상태</li>
</ul>

<br>
 
<div class="btn_set" style="margin-left:330px;    ">
 <a href="hopebookapply" class="book_btn01"><input type="button" value="신청하기" style="background-color: #223A5E;margin-left:70px;"></a> 
						&nbsp;&nbsp;

<a href="./" class="book_btn02"><input type="button" value="신청확인" style="background-color: #223A5E;"></a> </div>

						</section>
						</main>
</body>
</html>