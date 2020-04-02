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


<script>
	jQuery(function($) {
		$("#foo-table").DataTable({
			"info" : true,
			"order": [[0, 'desc']], // asc 또는 desc
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
#foo-table_paginate{
text-align: center;
}
#modal_detail{
cursor: pointer;
}

</style>

</head>
<body>

<div style="width:80%;margin:0 10%; ">
<h1>배송 관리</h1>
<table id="foo-table" class="table table-bordered" >
      <thead>
         <tr>
         <th>배송 번호</th>
         <th>제목</th>
         <th>사용자 ID</th>
         <th>배송신청일</th>
         <th>상태</th>
         </tr>
      </thead>
      <tbody id='tb'>
      </tbody>
    </table>
      </div>

<script>

let list=${list};
console.log(list);

for(let i=0;i<list.length;i++){
   var $tr= $("<tr>").appendTo($("#tb"));
   $tr.append("<td>"+list[i].bo_num+"</td>");
   $tr.append("<td><a id='modal_detail' data-toggle='modal' data-target='#myModal' data-number='"+list[i].bo_num+"'>배송 신청 확인바랍니다.</a></td>");
   $tr.append("<td>"+list[i].bo_id+"</td>");
   $tr.append("<td>"+list[i].bd_date+"</td>");
   if(list[i].bd_state_num==7)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>반납완료</span></td>");
   if(list[i].bd_state_num==6)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>오프라인반납완료</span></td>");
   if(list[i].bd_state_num==5)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>반납신청</span></td>");
   if(list[i].bd_state_num==4)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>배송완료</span></td>");
   if(list[i].bd_state_num==3)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>배송취소</span></td>");
   if(list[i].bd_state_num==2)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>배송신청</span></td>");
   if(list[i].bd_state_num==1)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>대출중</span></td>");
  
}

</script>




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
</body>


<script>
//modal 오픈시 ajax
$(document).on("click", "#modal_detail",function(e){
	 var params = e.target.dataset.number; 
	 
	 console.log("bo_num",params);
	 
	 $.ajaxSetup({         
        beforeSend : function(xhr){
           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
        });//먼저 보냄
	  
        $.ajax({
            url : "lbdeliverydetail",
            type : "post",
            data : {"bo_num":params}, 
            success : function(response) {
            
           	    $("#modal-header").empty();
                $("#modal-body").empty();
                $("#modal-footer").empty(); 
                
                console.log("1",response);
                
                $("#modal-header").append(""+response[0].bo_num+"번 배송 리스트").css("font-weight","bold").css("font-size","20px");
                
                var str="";
                var footer="";
                	
                str+="<div>";
                str+="<input type='hidden' name='br_num' value='"+response[0].bo_num+"' />";
             // str+="<input type='hidden' name='be_rnum' value='"+response.br_num+"' />";
                str+="<div style='padding: 0 8px; line-height: 40px; border-top: 1px solid rgba(0,0,0,0.2); border-bottom: 1px solid rgba(0,0,0,0.2); text-align: left; background-color:rgba(0,0,0,0.1)'>";
                str+="<span>"+response[0].bo_id+"</span>";
                if(response[0].bd_state_num==1)
                str+="<span id='state' style='font-size: 12px; color: red;'>(대출중)</span>";
                if(response[0].bd_state_num==2)
                str+="<span id='state' style='font-size: 12px; color: red;'>(배송신청)</span>";
                if(response[0].bd_state_num==3)
                str+="<span id='state' style='font-size: 12px; color: red;'>(배송 취소)</span>";
                if(response[0].bd_state_num==4)
                str+="<span id='state' style='font-size: 12px; color: red;'>(배송 완료)</span>";
                if(response[0].bd_state_num==5)
                str+="<span id='state' style='font-size: 12px; color: red;'>(반납 신청)</span>";
                if(response[0].bd_state_num==6)
                str+="<span id='state' style='font-size: 12px; color: red;'>(오프라인 반납 완료)</span>";
                if(response[0].bd_state_num==7)
                str+="<span id='state' style='font-size: 12px; color: red;'>(반납 안료)</span>";
                str+="<span style='float: right; font-size: 14px;'><i class='far fa-clock'></i>"+response[0].bd_date+"</span>";
                str+="</div></div>";
                for(var i=0;i<response.length;i++){
                  str+="<div style='display:flex; margin:10px 10px;'>";
                  
                  str+="<div style='display:flex; margin:10px 10px;'>";
                
               	   str+="<div style='margin-right:10px;'>";
               	   str+="<img src='"+response[i].bk_image+"' alt='도서 이미지' />";
                   str+="</div>";
                
                  str+="<div>";
                  str+="도서명 : "+response[i].bk_name+"<br/><br/>ISBN 코드 : "+response[i].bd_bcode+"<br/><br/>저  자 : "+response[i].bk_writer+"<br/><br/>신청 권수 : <input type='text' value='"+response[i].bd_count+"'  readOnly style='width:74px; text-align:right;'/>";
                  str+="</div>";
                  
                str+="</div>";

                str+="<div style='text-align:center;'>";
                str+="<select class='bd_reason' name='bd_reason'  style='float: left; margin-right: 10px; height: 34px; margin-top:50px; margin-bottom:15px;'>";
                str+="<option value=''>취소 사유</option>";
                str+="<option value='희망도서구입제한도서'>희망도서 구입제한 도서</option>";
                str+="<option value='부적합한내용의도서'>부적합한내용의 도서</option>";
                str+="<option value='구입불가능한도서'>구입불가능한 도서</option>";
                
                str+="</select>";
                str+="<input type='button' id='deliveryCancel' class='btn btn-warning' data-number='"+response[i].bd_num+"' data-num="+i+"  value='취소' />"; 
                
                str+="</div>"; 
                str+="</div>"; 
                }
               $("#modal-body").append(str); 
               for(var i=0;i<response.length;i++){
            	   
              if(response[i].bd_state_num==2)
               footer="<input type='button' value='배송 완료' style='margin-right:10px;' class='btn btn-primary'>";
               }
               
               footer+="<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>";
               $("#modal-footer").append(footer); 
               
               
            }, error : function(jqXHR, status, e) {
                console.error("희망도서 모달 에러");
            }

        });		//ajax end
      
});		//modal end


$(document).on("click", "#deliveryCancel",function(e){
	var params = e.target.dataset.number; 
	var num = e.target.dataset.num; 
	
	var bd_reason = $(".bd_reason").eq(num).val(); 
	console.log("상세 번호 = ",params);
	console.log("번호 = ",num);
	console.log($(".bd_reason").eq(num).val());
	
	
	$.ajaxSetup({         
        beforeSend : function(xhr){
           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
        });//먼저 보냄
        $.ajax({
            url : "lbdeliverycancel",
            type : "post",
            data : {"bd_num":params,"bd_reason":bd_reason}, 
            success : function(response) {
           	 console.log("취소 결과 = ",response);
           	 
           	 
           	     },
            error : function(jqXHR, status, e) {
                console.error("상호대차 도서관 에러");
            }
        
            
        });	//ajax End
	
	

});

</script>





</html>