
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
      
<script>
        jQuery(function($){
            $("#foo-table").DataTable({
            	 "dom": '<"top"il>t<"bottom"prf><"clear">',
            	 "order": [[0, 'desc']], // asc 또는 desc
                 "language":{
                  "emptyTable": "데이터가 없어요.",
                  "info": "현재 _START_ - _END_ / _TOTAL_건",
                  "infoEmpty": "데이터 없음",
                  "paginate": {
                         "next": "다음",
                         "previous": "이전"
                     }
                 },
            	 "columnDefs": [
     				{ "width": "5%", "targets": 0 },
     				{ "width": "8%", "targets": 1 },
     				{ "width": "20%", "targets": 2 },
     				{ "width": "15%", "targets": 3 },
     				{ "width": "10%", "targets": 4 }
     				
     			  ]
            	 
            	 
            });
        });
    </script>

<title>희망도서 신청 게시판</title>
<script>
    var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
    $.fn.bootstrapBtn = bootstrapButton            // give $().bootstrapBtn the Bootstrap functionality
    </script>
  
    
    <style>
    #submenu {
  		float: left;
  		width: 15%;
  		height: 100%;  
  	  margin-left: 8%;
  	  margin-top:2%;
}
    .subtopbtn{
width:100%;
font-family: 'Hanna', sans-serif;
height:98px;
background-color:#223A5E;
color:white;
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
	#foo-table_paginate{
text-align: center;
}

#modal_detail{
cursor: pointer;
}
    </style>
    
</head>
<body>
<jsp:include page="header2.jsp" />

<nav id="submenu">
	<button class="subtopbtn" disabled><h2>나의 도서관</h2></button><br>
    <button class="subbtn" onclick="location.href = 'movemypage' " >마이 페이지</button><br>
    <button class="subbtn" onclick="location.href = 'moveloanlist'">대출 목록</button><br>
    <button class="subbtn" onclick="location.href = 'movehopelist'">희망 도서 신청 목록</button>
</nav>

<main id="totalsearchlist">

		<div>
		<h1 style="margin-bottom:80px;">희망 도서 목록</h1>
		<hr />
<table id="foo-table" class="table table-bordered">
		<thead>
			<tr>
			<th>요청번호</th>
			<th>도서관</th>
			<th>신청 제목</th>
			<th>작성일</th>
			<th>상태</th>
			</tr>
		</thead>
		<tbody id='tb'>
		</tbody>
    </table>

		</div>
		
<!-- Modal -->
 <form action="exchange" method="post">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div id='modal-header' class="modal-header">
          <button type='button' class='close' data-dismiss='modal'>&times;</button>
        </div>
        <div id='modal-body' class="modal-body">
        </div>
        <div id='modal-footer' class="modal-footer">
   
        </div>
      </div>
      
    </div>
  </div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 </form>
 
 		
</main>
<script>
let list=${list};
console.log(list);

for(let i=0;i<list.length;i++){
	var $tr= $("<tr>").appendTo($("#tb"));
	$tr.append("<td>"+list[i].br_num+"</td>");
	$tr.append("<td>"+list[i].lb_name+"</td>");
	$tr.append("<td><a id='modal_detail' data-toggle='modal' data-target='#myModal' data-number='"+list[i].br_num+"' >"+list[i].br_titile+"</a></td>");
	$tr.append("<td>"+list[i].br_date+"</td>");
	if(list[i].br_situation==0)
	$tr.append("<td style='color:red; font-weight:bold;'>대기중</td>");
	if(list[i].br_situation==1|| list[i].br_situation==4 || list[i].br_situation==5)
	$tr.append("<td style='color:green;font-weight:bold;'>처리중</td>");
	if(list[i].br_situation==2)
	$tr.append("<td style='color:orange; font-weight:bold;'>반려</td>");
	if(list[i].br_situation==3)
	$tr.append("<td style='color:blue;font-weight:bold;'>처리완료</td>");
	
	
	
}
</script>


<script>
//modal 오픈시 ajax
$(document).on("click", "#modal_detail",function(e){
	 var params = e.target.dataset.number; 
	 
	 console.log("게시글",params);
	 
	 
	 $.ajaxSetup({         
        beforeSend : function(xhr){
           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
        });//먼저 보냄
	  
        $.ajax({
            url : "lbhopedetail",
            type : "post",
            data : {"br_num":params}, 
            success : function(response) {
            
           	    $("#modal-header").empty();
                $("#modal-body").empty();
                $("#modal-footer").empty(); 
                console.log("1",response);
                console.log(response.br_titile);
                
                $("#modal-header").append(response.br_titile).css("font-weight","bold").css("font-size","20px");
                
                var str="";
                var footer="";
                str+="<div>";
                str+="<input type='hidden' name='br_num' value='"+response.br_num+"' />";
                str+="<input type='hidden' name='be_rnum' value='"+response.br_num+"' />";
                console.log("response.br_lcode",response.br_lcode);
               // str+="<input type='hidden' name='be_res_lcode' value='"+response.br_lcode+"' />";
                str+="<div style='padding: 0 8px; line-height: 40px; border-top: 1px solid rgba(0,0,0,0.2); border-bottom: 1px solid rgba(0,0,0,0.2); text-align: left; background-color:rgba(0,0,0,0.1)'>";
                str+="<span>"+response.br_id+"</span>";
                if(response.br_situation==0)
                str+="<span id='state' style='font-size: 12px; color: red;'>(대기중)</span>";
                if(response.br_situation==1)
                str+="<span id='state' style='font-size: 12px; color: green;'>(처리중)</span>";
                if(response.br_situation==2)
                str+="<span id='state' style='font-size: 12px; color: orange;'>(반려)</span>";
                if(response.br_situation==3)
                str+="<span id='state' style='font-size: 12px; color: blue;'>(처리완료)</span>";
                if(response.br_situation==4)
                str+="<span id='state' style='font-size: 12px; color: green;'>(상호대차수락)</span>";
                str+="<span style='float: right; font-size: 14px;'><i class='far fa-clock'></i>"+response.br_date+"</span>";
                str+="</div></div>";
                str+="<div style='display:flex; margin:10px 10px;'>";
                str+="<div style='margin-right:10px;'>";
                str+="<img src='"+response.br_image+"' alt='도서 이미지' />";
                str+="</div>";
                str+="<div>";
                str+="도서명 : "+response.br_name+"<br/><br/>ISBN 코드 : "+response.br_bcode+"<br/><br/>저  자 : "+response.br_writer+"<br/><br/>도서신청이유 : "+response.br_reason+"";
                str+="</div>";
               $("#modal-body").append(str); 
               
               
               
               footer+="<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>";
               if(response.br_false!=null){
               footer+="<div style='float:left; font-weight:bold; color:red;'>";
               footer+="반려 사유 : "+response.br_false+"";
               footer+="</div>";
           	}
               $("#modal-footer").append(footer);
               
            }, error : function(jqXHR, status, e) {
                console.error("희망도서 모달 에러");
            }

        });		//ajax end
        
});		//modal end

</script>

</body>
</html>