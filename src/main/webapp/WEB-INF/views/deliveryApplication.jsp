<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/deliveryCheckBox.css">
</head>

<style>
    @import url(//fonts.googleapis.com/earlyaccess/hanna.css);
    @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

    h4 {
        font-family: 'Hanna', sans-serif;
    }

    h3 {
        font-family: 'Hanna', sans-serif;
    }

    #d {
        font-family: 'Hanna', sans-serif;
        margin-bottom: 30px;
        margin-left: 10%
    }

    .recontents {
        width: 370px;
        vertical-align: middle;
        background-color: #F6D155;
        border-radius: 20px;
        padding: 10px;
        text-align: center;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .recotd {
        vertical-align: middle;
        font-family: 'Noto Sans KR', sans-serif;
        font-weight: 750;
        padding-left: 20px;
    }

    .recoimg {
        width: 100%;
        height: 175px;
    }

    .recoimgdiv {
        background-color: grey;
        padding: 10px;
        margin-left: 20px;
        width: 160px;

    }

    .bname {
        color: #00498c;
        font-size: x-large;
        font-weight: bold;
    }

    #recommendList {
        width: 80%;
        margin-left: 5%;
        border-collapse: separate;
        border-spacing: 0 20px;
    }

    #recommendList tr {
        margin-bottom: 40px;
    }

    .recointro {
        padding: 0 5%;
        border: 2px solid #6B5B95;
        border-radius: 20px;
        font-family: 'Noto Sans KR', sans-serif;
    }

    tr {
        height: 100px;
    }
</style>

<body>
    <div class="container" style="margin-top: 100px;">
        <table id="delivery" class="table table-bordered">
			<colgroup>
				<col width="20%">
				<col width="15%">
				<col width="65%">
			</colgroup>
            

        </table>
    </div>
    <div class="container p-3 my-3 border" style="width: 1107px">
    	배송비 :<span id="cnt">권수</span> * <span id="libCnt">도서관수</span> = <span id="total">총배송비</span> 
    </div>
</body>
<script>
$(document).ready( function () {
	$.ajax({ //도서관 정보 가져오는 에이작스
		url : "getdeliverylist",
		type : "get",
		dataType:'json'
		
}).done((result) => {
	console.log("result=",result);
	var str="";
	$("#delivery").empty();
	for(let i=0;i<result.length;i++){
		str+="<tr>";
		str+="<td style='text-align: center; vertical-align:middle;'>";
		str+="<div class='checkbox checkbox-inline checkbox-success checkbox-md'>";
		str+="<input type='checkbox' class='styled' id='"+i+"'  "
				+" data-decode='"+result[i].de_code+"' data-delcode='"+result[i].de_lcode+"' data-quantity='"+result[i].de_quantity+"' value='option3'>";
		str+="<label for='"+i+"'></label>";
		str+="</div>";
		str+="</td><td>";
		str+="<div class='recoimgdiv'><img src='"+result[i].bk_image+"' class='recoimg'></div>";
		str+="</td>";
		str+="<td class='recotd'>";
		str+="<span class='bname'>"+result[i].bk_name+"</span>";
		str+="<input type='hidden' name='de_code' value='"+result[i].de_code+"'";
		str+="<br>저자 : "+result[i].bk_writer+"";
		str+="<br>출판사 : "+result[i].bk_publisher+"";
		str+="<br>출판일 : "+result[i].bk_publicday+"";
		str+="<br>대분류/소분류 : "+result[i].bg_cate+"/"+result[i].sg_cate;
		str+="<br>도서관 : "+result[i].lb_name+"";
		str+="<input type='hidden' name='de_lcode' value='"+result[i].de_lcode+"'";
		str+="<br><br>권수 : "+result[i].de_quantity+"";
		str+="</td>";
		str+="<td style='text-align: center; vertical-align:middle;'>";
		str+="<input type='button' value='삭제'>";
		str+="</td></tr>";
	}
	$(str).appendTo($("#delivery"));
   
}).fail((xhr) => {
	console.log("xhr=",xhr);
}); //ajax End

}); //ready End

$("div").on("change",".styled",function(){
	
	console.log("attr1",$(this).attr("checked"))
	
	if($(this).attr("checked")==undefined || $(this).attr("checked")==false){
		$(this).attr("checked",true);
	}else{
		$(this).attr("checked",false);
	}
	console.log("attr2",$(this).attr("checked"));
	console.log("de_code",$(this).data("decode"));
	console.log("de_lcode",$(this).data("delcode"));
	console.log("de_quantity",$(this).data("quantity"));
	let temp=0;
	let libCnt=0;
	let lib=new Array();;
	$('.styled:checked').each(function() {
		temp+=$(this).data("quantity");
		lib.push($(this).data("delcode"));
   });
	console.log("temp",temp);
	console.log("lib",lib);
	console.log("유니크",$.unique(lib));
	$("#cnt").text(temp);
	
});

</script></html>
