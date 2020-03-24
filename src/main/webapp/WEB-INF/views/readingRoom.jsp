<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container p-3 my-3 border">
        <h2 style="text-align: center">열람실 예약 안내문</h2>
        <p>1. 열람실 예약은 신중히</p>
        <p>2. 열람실 예약은 더 신중히</p>
        <p>3. 열람실 예약은 더욱 더 신중히</p>
        <p>4. 한번 예약하면 되돌릴 수 없습니다.</p>
    </div>

    <div class="container p-3 my-3 border">
        <div class="row">
            <div class="col-md-4">
                <div class="container p-3 my-3 border">
                    <select class="custom-select" id="lb_loc" name="lb_loc">
                        <option selected>도서관이 위치한 지역을 선택해 주세요.</option>
                      
                    </select>
                  <div class="container p-3 my-3 border">
                    지도?
                </div>  
                </div>
                
            </div>

            <div class="col-md-4">
                <div class="container p-3 my-3 border">
                    도서관 목록

                </div>
            </div>
             <div class="col-md-4">
                <div class="container p-3 my-3 border">
                    열람실 목록

                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
$(function() {
	$.ajax({ //지역 정보 가져오는 메소드
		url : "getzoneinfo",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	
 	var info=result;
 	
	for(var i=0;i<info.length;i++){
		$("<option>").text(info[i].lb_loc).attr("value",info[i].lb_loc).appendTo($("#lb_loc"));
	}  
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //도서관 이름 ajax End
});

$("#lb_loc").on("change", function(){ //지역 선택시 도서관 목록 보여주는 메소드
	console.log("선택한 지역:",$(this).val());
	
	$.ajax({ //지역 정보 가져오는 메소드
		url : "getzoneinfo",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	
 	var info=result;
 	
	for(var i=0;i<info.length;i++){
		$("<option>").text(info[i].lb_loc).attr("value",info[i].lb_loc).appendTo($("#lb_loc"));
	}  
	
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End
	
});

</script>
</html>