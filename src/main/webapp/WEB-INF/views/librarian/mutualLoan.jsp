<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			},
			"columnDefs": [
				{ "width": "3%", "targets": 0 },
				{ "width": "30%", "targets": 1 },
				{ "width": "8%", "targets": 2 },
				{ "width": "10%", "targets": 3 },
				{ "width": "12%", "targets": 4 }
				
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

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{font-family: 'Jeju Gothic', sans-serif;}
</style>

</head>
<body>

<div style="width:80%;margin:0 10%; ">
<h1>상호대차</h1>
<table id="foo-table" class="table table-bordered" >
      <thead>
         <tr>
         <th>No</th>
         <th>제목</th>
         <th>도서관</th>
         <th>작성일</th>
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
   $tr.append("<td>"+list[i].be_num+"</td>");
   $tr.append("<td><a id='modal_detail' data-toggle='modal' data-target='#myModal' data-number='"+list[i].be_num+"'>상호 대차를 신청합니다.</a></td>");
   $tr.append("<td>"+list[i].lb_name+"</td>");	
   $tr.append("<td>"+list[i].be_date+"</td>");
   if(list[i].be_situation==0)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>대기중</span></td>");
   if(list[i].be_situation==1)
	   $tr.append("<td><span style='color:blue; font-weight:bold;'>수락</span></td>");
   if(list[i].be_situation==2)
	   $tr.append("<td><span style='color:orange; font-weight:bold;'>거절</span></td>");
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

 <script>
 
 
 $(document).on("click", "#modal_detail",function(e){
	 var params = e.target.dataset.number; 
	 
	 console.log("be_num",params);
	 
	 
 	 $.ajaxSetup({         
         beforeSend : function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
         });//먼저 보냄
	  
         $.ajax({
             url : "mutaulloandetail",
             type : "get",
             data : {"be_num":params}, 
             success : function(response) {
            	 $("#modal-header").empty();
                 $("#modal-body").empty();
                 $("#modal-footer").empty();
                 console.log("1",response);
                 console.log(response.br_titile);
                 
                 $("#modal-header").append("상호 대차를 신청합니다.").css("font-weight","bold").css("font-size","20px");
                 var str="";
                 var footer="";
                 str+="<div>";
                 str+="<input type='hidden' name='be_num' value='"+response.be_num+"' />";
                 str+="<input type='hidden' name='be_rnum' value='"+response.be_rnum+"' />";
                 str+="<div style='padding: 0 8px; line-height: 40px; border-top: 1px solid rgba(0,0,0,0.2); border-bottom: 1px solid rgba(0,0,0,0.2); text-align: left; background-color:rgba(0,0,0,0.1)'>";
                 str+="<span>"+response.lb_name+"</span>";
                 if(response.be_situation==0)
                 str+="<span id='state' style='font-size: 12px; color: red;'>(대기중)</span>";
                 if(response.be_situation==1)
                 str+="<span id='state' style='font-size: 12px; color: blue;'>(수락)</span>";
                 if(response.be_situation==2)
                 str+="<span id='state' style='font-size: 12px; color: orange;'>(거절)</span>";
                 str+="<span style='float: right; font-size: 14px;'><i class='far fa-clock'></i>"+response.be_date+"</span>";
                 str+="</div></div>";
                 str+="<div style='display:flex; margin:10px 10px;'>";
                 str+="<div style='margin-right:10px;'>";
                 str+="<img src='"+response.bk_image+"' alt='도서 이미지' />";
                 str+="</div>";
                 str+="<div>";
                 str+="도서명 : "+response.bk_name+"<br/><br/>ISBN 코드 : "+response.be_bcode+"<br/><br/>저  자 : "+response.bk_writer+"<br/><br/>상호 대차 신청 권수 : "+response.be_count+"<br/><br/>현재 보유 권수 : "+response.bk_quantity+"";
                 str+="</div>";
                 str+="</div>";
                $("#modal-body").append(str); 
                console.log("신청받은 도서관 코드 =",response.be_res_lcode);
                if(response.be_situation == 0){		//0=대기중
                footer+="<input type='submit' value='거절' formaction='mutulloanfalse' class='btn btn-warning' style='float: left;'>";
                footer+="<input type='submit' value='수락' formaction='mutulloanaccept' class='btn btn-primary' style='margin-right: 10px;'>";
                footer+="<input type='hidden' name='be_bcode' value=\""+response.be_bcode+"\">";
                footer+="<input type='hidden' name='be_count' value=\""+response.be_count+"\">";
                footer+="<input type='hidden' name='be_res_lcode' value=\""+response.be_res_lcode+"\">";
                }
                
                footer+="<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>";
                footer+="<div id='choice'>";
                footer+="</div>";
                $("#modal-footer").append(footer);
                 
                
             }, error : function(jqXHR, status, e) {
                 console.error("상호대차 모달 에러");
             }
 
         }); 		//ajax end
         
 });		//modal end
 

/*   //상호대차 신청 submit
 $(document).on("change", "#lb_choice",function(e){
	 
	console.log($("#"+e.target.selectedIndex+"").text());
	
	var res=$("#"+e.target.selectedIndex+"").text();
	console.log("res=",res);
	var qty=res.replace(/[^0-9]/g,"");
	console.log("qty=",qty);
            	 $("#choice2").empty();
	 $("<input>").attr("type","number").prop("name","be_count").attr("value","1").prop("max",qty).prop("min","1").css("margin-right","10px").css("text-align","right").css("float","left").css("width","60px").css("height","34px").appendTo("#choice2");
	 $("<input>").attr("type","submit").attr("value","상호대차신청").prop("class","btn btn-success").css("float","left").appendTo("#choice2");
 }); */
 
 </script> 
 
</body>

</html>