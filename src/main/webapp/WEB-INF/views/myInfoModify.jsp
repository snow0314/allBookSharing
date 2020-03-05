<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<jsp:include page="header.jsp" />

${mb }



<form name="joinForm" action="memberjoin">
      <img id="show_profile" height="240">

      <div class="form-group">
         <label for="profile">프로필 사진</label> <span class="help-block"
            id="helper_profile">1mb이하만 가능</span><br> <input type="file" id="profile" 
            class="form-control" name="us_image"
            accept=".jpg,.jpeg,.png,.gif,.bmp">
      </div>
         <br>
      <tr>
         <td><b>이름:</b><input id="name" name="mb_name" type="text"
            placeholder="이름" class="txt" /></td>
         <input type="radio" name="gener" checked="checked" />
         <span class="up">남자</span>&nbsp;&nbsp;
         <input type="radio" name="gener" />
         <span class="up">여자</span>


         <br>
      </tr>
      <!-- <tr>
         <b>생년월일:</b>
         <td><select name="year" id="year" class="foot1">
               <option value="">년도</option>
               <option value="2019">2019</option>
               <option value="2018">2018</option>
               <option value="2017">2017</option>
               <option value="2016">2016</option>
               <option value="2015">2015</option>
               <option value="2014">2014</option>
               <option value="2013">2013</option>
               <option value="2012">2012</option>
               <option value="2011">2011</option>
               <option value="2010">2010</option>
               <option value="2009">2009</option>
               <option value="2008">2008</option>
               <option value="2007">2007</option>
               <option value="2006">2006</option>
               <option value="2005">2005</option>
               <option value="2004">2004</option>
               <option value="2003">2003</option>
               <option value="2002">2002</option>
               <option value="2001">2001</option>
               <option value="2000">2000</option>
               <option value="1999">1999</option>
               <option value="1998">1998</option>
               <option value="1997">1997</option>
               <option value="1996">1996</option>
               <option value="1995">1995</option>
               <option value="1994">1994</option>
               <option value="1993">1993</option>
               <option value="1992">1992</option>
               <option value="1991">1991</option>
               <option value="1990">1990</option>
               <option value="1989">1989</option>
               <option value="1988">1988</option>
               <option value="1987">1987</option>
               <option value="1986">1986</option>
               <option value="1985">1985</option>
               <option value="1984">1984</option>
               <option value="1983">1983</option>
               <option value="1982">1982</option>
               <option value="1981">1981</option>
               <option value="1980">1980</option>
               <option value="1979">1979</option>
               <option value="1978">1978</option>
               <option value="1977">1977</option>
               <option value="1976">1976</option>
               <option value="1975">1975</option>
               <option value="1974">1974</option>
               <option value="1973">1973</option>
               <option value="1972">1972</option>
               <option value="1971">1971</option>
               <option value="1970">1970</option>
               <option value="1970">1969</option>
               <option value="1970">1968</option>
               <option value="1970">1967</option>
               <option value="1970">1966</option>
               <option value="1970">1965</option>
               <option value="1970">1964</option>
               <option value="1970">1963</option>
               <option value="1970">1962</option>
               <option value="1970">1961</option>
               <option value="1970">1960</option>
         </select></td>
         <td><select name="birth" id="birth" class="foot1">
               <option value="">월</option>
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
               <option value="6">6</option>
               <option value="7">7</option>
               <option value="8">8</option>
               <option value="9">9</option>
               <option value="10">10</option>
               <option value="11">11</option>
               <option value="12">12</option>
         </select></td>
         <td><select name="day" id="day" class="foot1">
               <option value="">일</option>
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
               <option value="6">6</option>
               <option value="7">7</option>
               <option value="8">8</option>
               <option value="9">9</option>
               <option value="10">10</option>
               <option value="11">11</option>
               <option value="12">12</option>
               <option value="13">13</option>
               <option value="14">14</option>
               <option value="15">15</option>
               <option value="16">16</option>
               <option value="17">17</option>
               <option value="18">18</option>
               <option value="19">19</option>
               <option value="20">20</option>
               <option value="21">21</option>
               <option value="22">22</option>
               <option value="23">23</option>
               <option value="24">24</option>
               <option value="25">25</option>
               <option value="26">26</option>
               <option value="27">27</option>
               <option value="28">28</option>
               <option value="29">29</option>
               <option value="30">30</option>
               <option value="31">31</option>
         </select></td>
         <br>
      </tr> -->
      <tr>
         <td><b>이메일:</b><input id="email" name="us_email" type="text"
            placeholder="이메일" class="txt" />@ <input type="text" name="email2"
            id="str_email02" disabled value="선택하세요"> <select
            name="email1" id="email1">
               <option value="0">선택하세요</option>
               <option value="1">직접입력</option>
               <option value="naver.com">naver.com</option>
               <option value="nate.com">nate.com</option>
               <option value="gmail.com">gmail.com</option>
               <option value="daum.net">daum.net</option>
         </select></td>
         <br>
         <b>아이디:</b>
         
         <input id="buyerid" name="us_id" type="text" placeholder="아이디"
            class="username_input" />
         <button type="button" id="checkbtn" onclick="checkbtn"
            class="btn btn-default">중복확인</button>
         <div id="result"></div>
         <br>
         <b>비밀번호:</b>
         <input id="pw" name="mb_pw" type="password" placeholder="비밀번호"
            class="txt" />
         <br>
         <b>비밀번호확인:</b>
         <input id="pw1" name="pw1" type="password" placeholder="비밀번호확인"
            class="txt" />
         <br>
      </tr>
      <div id="pwdiv"></div>
      <tr>
         <td><b>전화번호</b><select name="us_phone" id="phone" class="foot1">
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="016">016</option>
               <option value="017">017</option>
               <option value="018">018</option>
               <option value="019">019</option>
         </select></td>
         <td>-<input type="text" id="phone1" name="phone1" class="txt" />-<input
            type="txt" id="phone2" name="phone2" class="txt">
         </td>
         <br>
      </tr>
      <tr>
         <td><b>주소<b></b><br> <input type="text"
               id="sample4_postcode" name="us_address" placeholder="우편번호"> <input
               type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="sample4_roadAddress" placeholder="도로명주소"
               name="branchaddress"> <input type="text"
               id="sample4_jibunAddress" placeholder="지번주소"><br> <input
               type="text" id="sample4_detailAddress" placeholder="상세주소">
               <input type="text" id="sample4_extraAddress" placeholder="참고항목">
      </tr>
      <br>
      <br>
      <span id="guide" style="color: #999; display: none"></span>
      <div id="map" style="width: 100%; height: 350px;"></div>

      <div>
         <tr>
            <td><input type="button" onclick="subbtn" id="subbtn1"
               value="회원가입" /></td>

            <td><a href='' onClick="history.back()"><input
                  type="button" onclick="cancel" id="cancel1" value="회원가입취소">
            </a></td>
         </tr>
      </div>
   </form>



</body>
</html>