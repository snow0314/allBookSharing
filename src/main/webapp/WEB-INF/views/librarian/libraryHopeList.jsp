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
				{ "width": "8%", "targets": 1 },
				{ "width": "30%", "targets": 2 },
				{ "width": "8%", "targets": 3 },
				{ "width": "12%", "targets": 4 },
				{ "width": "10%", "targets": 5 }
				
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
<h1>희망도서</h1>
<table id="foo-table" class="table table-bordered" >
      <thead>
         <tr>
         <th>No</th>
         <th>도서관</th>
         <th>제목</th>
         <th>작성자</th>
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
   $tr.append("<td>"+list[i].br_num+"</td>");
   $tr.append("<td>"+list[i].lb_name+"</td>");	
   $tr.append("<td><a id='modal_detail' data-toggle='modal' data-target='#myModal' data-number='"+list[i].br_num+"'>"+list[i].br_titile+"</a></td>");
   $tr.append("<td>"+list[i].br_id+"</td>");
   $tr.append("<td>"+list[i].br_date+"</td>");
   if(list[i].br_situation==0)
	   $tr.append("<td><span style='color:red; font-weight:bold;'>대기중</span></td>");
   if(list[i].br_situation==1)
	   $tr.append("<td><span style='color:green; font-weight:bold;'>처리중</span></td>");
   if(list[i].br_situation==2)
	   $tr.append("<td><span style='color:orange; font-weight:bold;'>반려</span></td>");
   if(list[i].br_situation==3)
	   $tr.append("<td><span style='color:blue; font-weight:bold;'>처리완료</span></td>");
   if(list[i].br_situation==4)
	   $tr.append("<td><span style='color:green; font-weight:bold;'>상호 대차 수락</span></td>");
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
	 
	 console.log("게시글",params);
	 
	 
	 $.ajaxSetup({         
         beforeSend : function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
         });//먼저 보냄
	  
         $.ajax({
             url : "lbhopedetail",
             type : "get",
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
                 str+="<div>";
                 str+="도서명 : "+response.br_name+"";
                 str+="</div>";
                 str+="<div>";
                 str+="ISBN 코드 : "+response.br_bcode+"";
                 str+="</div>";
                 str+="<div>";
                 str+="저  자 : "+response.br_writer+"";
                 str+="</div>";
                 str+="<div>";
                 str+="도서신청이유 : "+response.br_reason+"";
                 str+="</div>";
                $("#modal-body").append(str); 
                console.log("상태=",response.br_situation);
                if(response.br_situation == 1){		//상태가 1(처리중)이면 취소버튼만 활성화
                    
                footer+="<input type='submit' value='취소' formaction='hopereturn' class='btn btn-warning' style='float: left;'>";
                footer+="<input type='hidden' name='be_bcode' value=\""+response.br_bcode+"\">";
                	
                }
                else if(response.br_situation == 4){		//상태가 4(상호대차수락 )이면 처리완료만 활성화
                    
	                footer+="<input type='submit'' value='처리완료' style='margin-right:10px;' formaction='hopecomplete' class='btn btn-primary'>";
                    footer+="<input type='hidden' name='be_bcode' value=\""+response.br_bcode+"\">";
                    	
                    }
                else if(response.br_situation != 0){		//상태가 대기중이 아니면 버튼 감추기
                
                }
                
                else{	//그외에 모든 버튼 활성화
                footer+="<select name='br_false'  style='float: left; margin-right: 10px; height: 34px;'>";
                footer+="<option value=''>선택</option>";
                footer+="<option value='희망도서구입제한도서'>희망도서 구입제한 도서</option>";
                footer+="<option value='부적합한내용의도서'>부적합한내용의 도서</option>";
                footer+="<option value='구입불가능한도서'>구입불가능한 도서</option>";
                footer+="</select>";
                
                footer+="<input type='submit' value='반려' formaction='hopereturn' class='btn btn-warning' style='float: left;'>";
                footer+="<input type='submit' value='처리완료' style='margin-right:5px;' formaction='hopecomplete' class='btn btn-primary'>";
                footer+="<input type='button' value='상호대차' id='swap' class='btn btn-success' data-isbn=\""+response.br_bcode+"\"style='margin-right:10px;'>";
                footer+="<input type='hidden' name='be_bcode' value=\""+response.br_bcode+"\">";
                }
                
                footer+="<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>";
                footer+="<div id='choice'>";
                footer+="</div>";
                $("#modal-footer").append(footer);
                
             }, error : function(jqXHR, status, e) {
                 console.error("희망도서 모달 에러");
             }
 
         });		//ajax end
         
 });		//modal end
 
 
 $(document).on("click", "#swap",function(e){
	 
var params = e.target.dataset.isbn; 
console.log(e);
console.log("isbn=",params);
	 $.ajaxSetup({         
         beforeSend : function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
         });//먼저 보냄
         $.ajax({
             url : "swapbooks",
             type : "get",
             data : {"br_bcode":params}, 
             success : function(response) {
            	 
            	 console.log(response);
            	 $("#choice").empty();
            	 var footer="";
            	 footer+="<hr />";
            	 footer+="<select name='be_res_lcode' id='lb_choice' required='required' style='float: left; margin-right: 10px; height: 34px;'>";
                 footer+="<option value=''>선택</option>";
            	 for(var i=0;i<response.length;i++){ 
                 footer+="<option id="+(i+1)+" value='"+response[i].lb_code+"'>"+response[i].lb_name+"&nbsp;&nbsp;"+response[i].bk_quantity+"권</option>";
            	 
            	 }
                 footer+="</select>";
            	 footer+="<div id='choice2'>";
            	 footer+="</div>";
                 footer+="";
                 footer+="";
                 footer+="";
            	 $("#choice").append(footer);
             },
             error : function(jqXHR, status, e) {
                 console.error("상호대차 도서관 에러");
             }
         
             
         });	//ajax End
	 
 }); //상호대차 버튼
 
 //상호대차 신청 submit
 $(document).on("change", "#lb_choice",function(e){
	 
	console.log($("#"+e.target.selectedIndex+"").text());
	
	var res=$("#"+e.target.selectedIndex+"").text();
	console.log("res=",res);
	var qty=res.replace(/[^0-9]/g,"");
	console.log("qty=",qty);
            	 $("#choice2").empty();
	 $("<input>").attr("type","number").prop("name","be_count").attr("value","1").prop("max",qty).prop("min","1").css("margin-right","10px").css("text-align","right").css("float","left").css("width","60px").css("height","34px").appendTo("#choice2");
	 $("<input>").attr("type","submit").attr("value","상호대차신청").prop("class","btn btn-success").css("float","left").appendTo("#choice2");
 });
 
 </script> 
 
</body>

</html>