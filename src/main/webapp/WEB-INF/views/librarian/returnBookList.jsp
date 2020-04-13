<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사서 배송관리 리스트</title>

<!-- date table  -->
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script>
	jQuery(function($) {
		$("#foo-table").DataTable({
			"info" : true,
			"order": [[3, 'desc']], // asc 또는 desc
			"dom" : '<"top"il>t<"bottom"prf><"clear">',
			"language" : {
				"emptyTable" : "데이터가 없어요.",
				"info" : "현재 _START_ - _END_ / _TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"zeroRecords": "일치하는 데이터가 없어요.",
		        "loadingRecords": "로딩중...",
		        "processing":     "잠시만 기다려 주세요...",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			},
			"columnDefs": [
				{ "width": "5%", "targets": 0 },
				{ "width": "20%", "targets": 1 },
				{ "width": "10%", "targets": 2 },
				{ "width": "15%", "targets": 3 },
				{ "width": "8%", "targets": 4 }
				
			  ]
			
		});
	});
</script>


<!--모달 창 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>






<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
#foo-table_paginate{
text-align: center;
}
#modal_detail{
cursor: pointer;
}
body{font-family: 'Jeju Gothic', sans-serif;}
</style>

</head>
<body>

<div style="width:80%;margin:0 10%; ">
<h1>반납 관리</h1>
<table id="foo-table" class="table table-bordered" >
      <thead>
         <tr>
         <th>배송 번호</th>
         <th>제목</th>
         <th>사용자 ID</th>
         <th>대출일</th>
         <th>상태</th>
         </tr>
      </thead>
      <tbody id='tb' style="font-size:20px;font-weight:bold;">
      </tbody>
    </table>
      </div>

<script>

let list=${list};
console.log(list);
for(let i=0;i<list.length;i++){
	
   var $tr= $("<tr>").appendTo($("#tb"));
   $tr.append("<td>"+list[i].bo_num+"</td>");
   $tr.append("<td><a id='modal_detail' data-toggle='modal' data-target='#myModal' data-number='"+list[i].bd_num+"'>반납 신청 확인바랍니다.</a></td>");
   $tr.append("<td>"+list[i].bo_id+"</td>");
   $tr.append("<td>"+moment(list[i].bd_date).format('YYYY년 MM월 DD일 HH시:mm분')+"</td>");
   
   if(list[i].bd_state_num==7)
	   $tr.append("<td><span style='color:blue; font-weight:bold;'>반납완료</span></td>");
   if(list[i].bd_state_num==6)
	   $tr.append("<td><span style='color:blue; font-weight:bold;'>오프라인반납완료</span></td>");
   if(list[i].bd_state_num==5)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>반납신청</span></td>");
 
}

</script>




 <!-- Modal -->
 <form action="returnbookcomplete" method="post">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="font-size:20px;font-weight:blod;">
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
</body>


<script>
//modal 오픈시 ajax
$(document).on("click", "#modal_detail",function(e){
	 var params = e.target.dataset.number; 
	 
	 console.log("bd_num",params);
	 
	 	$.ajaxSetup({         
        beforeSend : function(xhr){
           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
        });//먼저 보냄
	  
        $.ajax({
            url : "returnbooksdetail",
            type : "post",
            data : {"bd_num":params}, 
            success : function(response) {
            
           	    $("#modal-header").empty();
                $("#modal-body").empty();
                $("#modal-footer").empty(); 
                
                console.log("1",response);
                
                $("#modal-header").append(""+response.bo_num+"번 배송 리스트").css("font-weight","bold").css("font-size","20px");
                
                var str="";
                var footer="";
                	
                str+="<div>";
                str+="<input type='hidden' name='bd_num' value='"+response.bd_num+"' />";
                str+="<input type='hidden' name='bd_bcode' value='"+response.bd_bcode+"' />";
                str+="<div style='padding: 0 8px; line-height: 40px; border-top: 1px solid rgba(0,0,0,0.2); border-bottom: 1px solid rgba(0,0,0,0.2); text-align: left; background-color:rgba(0,0,0,0.1)'>";
                str+="<span>"+response.bo_id+"</span>";
                
                if(response.bd_state_num==5)
                str+="<span id='state' style='font-size: 18px; color: red;'>(반납 신청)</span>";
                if(response.bd_state_num==6)
                str+="<span id='state' style='font-size: 18px; color: blue;'>(오프라인 반납 완료)</span>";
                if(response.bd_state_num==7)
                str+="<span id='state' style='font-size: 18px; color: blue;'>(반납 안료)</span>";
                
                str+="<span style='float: right; font-size: 18px;'><i class='far fa-clock'></i>"+response.bd_date+"</span>";
                str+="</div></div>";
                
                  str+="<div style='display:flex; margin:10px 10px;'>";
                  
                  str+="<div style='display:flex; margin:10px 10px;'>";
                
               	   str+="<div style='margin-right:10px;'>";
               	   str+="<img src='"+response.bk_image+"' alt='도서 이미지' />";
                   str+="</div>";
                
                  str+="<div>";
                 
                  str+="도서명 : "+response.bk_name+"<br/><br/>ISBN 코드 : "+response.bd_bcode+"<br/><br/>저  자 : "+response.bk_writer+"";
                  
                  str+="</div>";
                  
                str+="</div>";

                str+="</div>"; 
                
               $("#modal-body").append(str); 
            	   
              if(response.bd_state_num==5)
               footer="<input type='submit' value='반납 완료' style='margin-right:10px;' class='btn btn-primary'>";
               
               
               footer+="<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>";
               $("#modal-footer").append(footer); 
               
               
            }, error : function(jqXHR, status, e) {
                console.error("배송 모달 에러");
            }

        });		//ajax end
       
});		//modal end

</script>





</html>