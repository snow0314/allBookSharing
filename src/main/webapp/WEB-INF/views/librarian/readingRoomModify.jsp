<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<title>Document</title>
<style>
</style>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- 폰트 어썸 -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- toastr CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
.btn-group-toggle label {
	width: 70px;
	height: 70px;
}
</style>

</head>

<body>
	<form>
		<div class="container p-3 my-3 border">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">열람실 이름</span>
				</div>
				<input id="rm_name" name="rm_name" type="text" class="form-control">
			</div>
			<div class="row">
				<div class="col-4">
					<div class="form-group">
						<label for="rm_col" class="control-label mb-1">행</label> <input
							id="rm_col" name="rm_col" type="number"
							class="form-control cc-exp" value="" placeholder="행을 입력해주세요">
						<span class="help-block" data-valmsg-for="cc-exp"
							data-valmsg-replace="true"></span>
					</div>
				</div>
				<div class="col-4">
					<label for="rm_row" class="control-label mb-1">열</label>
					<div class="input-group">
						<input id="rm_row" name="rm_row" type="number"
							class="form-control cc-cvc" value="" placeholder="열을 입력해주세요">
					</div>
				</div>
				<div class="col-4">
					<label for="total_seat" class="control-label mb-1">총 좌석수</label>
					<div class="input-group">
						<input id="total_seat" name="total_seat" type="tel"
							class="form-control cc-cvc" value="" readonly>
					</div>
				</div>
			</div>


			<div class="col-md-4 ml-auto" style="text-align: right">
				<button id="create_seat" type="button" class="btn btn-success">
					<i class="fas fa-pen"></i>&nbsp; 좌석 생성
				</button>
				<button id="insert" type="button" class="btn btn-success">
					<i class="fas fa-pen"></i>&nbsp; 등록
				</button>
			</div>

		</div>
		<div class="container p-3 my-3 border" style="text-align: center">
			<div id="seats" class="btn-group-toggle" data-toggle="buttons">

			</div>
		</div>
	</form>


</body>
<script type="text/javascript" src="js/ajaxCsrf.js"></script>
<script>
$(document).ready( function () {
	console.log(${readingRoom});
	var readingRoom=${readingRoom};
	var seats=readingRoom.seats;
	console.log("seats:",seats);
	$("#rm_name").val(readingRoom.rm_name);
	$("#rm_col").val(readingRoom.rm_col);
	$("#rm_row").val(readingRoom.rm_low);
	$("#total_seat").val(readingRoom.totalSeat);
	
	let col=readingRoom.rm_col;
	let low=readingRoom.rm_low;
	
	console.log("col:",col);
	console.log("row:",low);
	
	for (let j = 1; j <= col; j++) {

        for (let i = 1; i <= low; i++) {
            
        	for(let k=0;k < seats.length; k++){
        		if(seats[k].se_low == i && seats[k].se_col == j){
        			
        			if(seats[k].se_place == 1){ //체크된 상태면 checked 상태를 true로 변경
        				let $label=$("<label>").addClass("btn btn-outline-success")
						   .appendTo($("#seats"));
 
 						$("<input>").attr("name","seat")
 									.attr("type","checkbox")
 									.attr("checked",true)
 									.attr("data-col",j)
 									.attr("data-row",i).appendTo($label);
        				
        			}else{
        				let $label=$("<label>").addClass("btn btn-outline-success")
        									   .appendTo($("#seats"));
                        
                        $("<input>").attr("name","seat")
                        			.attr("type","checkbox")
                        			.attr("checked",false)
                        			.attr("data-col",j)
                        			.attr("data-row",i).appendTo($label);
        			} // if else End
        			
        		} //if End
        		console.log("k:",k);
        	} //for k End
            console.log("i:",i);
        } //for i End
       $("<br>").appendTo($("#seats"));
        console.log("j:",j);
    } // for j End
	
	
});
		


		$("#insert").on("click", function() { //열람실 등록 메소드
			let data={};
			let name=$("#rm_name").val(); //열람실 이름
			let col = $("#rm_col").val(); //행
	        let row = $("#rm_row").val(); //열
	        var checkbox=[]; 
	        
	        data.rm_name=name;
	        data.rm_col=col;
	        data.rm_low=row;
	        
	        $('input:checkbox[name=seat]').each(function (){
				
				let temp={};
				temp.se_col=$(this).data("col");
				temp.se_low=$(this).data("row");
				if($(this).attr("checked")=="checked"){
					temp.se_place=1;
				}else{
					temp.se_place=0;
				}
				
				checkbox.push(temp);
	        });
			data.seats=checkbox;
	        
	        $.ajax({ 
				url : "libraryreadingroominsert",
				type : "post",
				data : {"json" : JSON.stringify(data)},
				dataType:'text'
				
			}).done((result) => {
			console.log("result=",result);
			
			if(result=="성공"){
				toastr.success('성공', '열람실 등록에 성공하셨습니다.');
			}else{
				toastr.error("실패", "열람실 등록에 실패하셨습니다.");
			}
			location.reload(true);
			
			}).fail((xhr) => {
			console.log("xhr=",xhr);
			}); //ajax End
	        
			
		}); //등록 버튼 End

        
        $("#create_seat").on("click", function() { //좌석 생성하는 메소드
            $("#seats").empty();
                   console.log($("#rm_row").val());
                   console.log($("#rm_col").val());
            let col = $("#rm_col").val(); //행
            let row = $("#rm_row").val(); //열
            
            for (let j = 1; j <= col; j++) {

                for (let i = 1; i <= row; i++) {
                    
                    let $label=$("<label>").addClass("btn btn-outline-success").appendTo($("#seats"));
                    
                    $("<input>").attr("name","seat") .attr("type","checkbox").attr("data-col",j).attr("data-row",i).appendTo($label);
                    
                }
               $("<br>").appendTo($("#seats"));
            }
        });

        $("#seats").on("click","input",function(e){ //좌석 클릭시 checked 변경 및 총 좌석수 계산
            
            if($(this).attr("checked")=="checked"){
                $(this).attr("checked",false);
            }else{
                $(this).attr("checked",true);
            }
            
            $('input:checkbox[name=seat]').length;
            $('input:checkbox[name=seat]:checked').length;
            
            $("#total_seat").val($('input:checkbox[name=seat]:checked').length);
         
        });    

    </script>
</html>
