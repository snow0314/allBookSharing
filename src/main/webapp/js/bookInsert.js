function listShow(data) {
		/*var $containerDiv=$("<div>");
		$containerDiv.addClass("container p-3 my-3 border");
		var $table=$("<table>");
		
		$("<td>").appendTo($tr).attr("rowspan", "3").css("width", "40%");
		var $td=$("<td>").appendTo($tr);
		var  $("<div>").addClass("input-group mb-3 input-group-sm").appendTo($td);*/
		console.log("list",data);
		$("#contents").empty();
		var str="";
		
		for(var i=0;i<data.length;i++){
			console.log("temp",data[i]);
			str+="<div class='container p-3 my-3 border' onclick='listSelect("+i+")'>";
			str+="<table>";
			str+="<tr>";
			str+="<td rowspan='3' style='width: 40%'>";
			str+="<img src='"+data[i].thumbnail+"'>";
			str+="</td>"
			str+="<td>";
	        str+="<div class='input-group mb-3 input-group-sm'>";        
	        str+="<div class='input-group-prepend'>";           
	        str+="<span class='input-group-text' style='width: 75px; text-align: center;'>ISBN 코드</span>";
	        str+="</div>";
	        str+="<input type='text' class='form-control' readonly='readonly' value='"+data[i].isbn+"'>";
	        str+="</div>";
	        str+="</td>";
	        str+="</tr>";                   
	        str+="<tr>";               
	        str+="<td>";                
	        str+="<div class='input-group mb-3 input-group-sm'>";        
	        str+="<div class='input-group-prepend'>";            
	        str+="<span class='input-group-text' style='width: 75px; text-align: center;'>도서명</span>";
	        str+="</div>";
	        str+="<input type='text' class='form-control' readonly='readonly' value='"+data[i].title+"'>";                   
	        str+="</div>";                
	        str+="</td>";               
	        str+="</tr>";            
	        str+="<tr>";        
	        str+="<td>";    
	        str+="<div class='input-group mb-3 input-group-sm'>";
	        str+="<div class='input-group-prepend'>";
	        str+="<span class='input-group-text' style='width: 75px; text-align: center;'>저자</span>";
	        str+="</div>";
	        str+="<input type='text' class='form-control' readonly='readonly' value='"+data[i].authors+"'>";
	        str+="</div>";
	        str+="</td>";
	        str+="</tr>";
	        str+="</table>";       
	        str+="</div>";
		}
        
        $(str).appendTo($("#contents"));
        str="";         
	} //listShow End
	
function listSelect(index){
	console.log(temp[index]);
	$("#bk_image").attr("value", temp[index].thumbnail);
	$("#bk_image2").attr("src", temp[index].thumbnail);
	$("#bk_code").attr("value", temp[index].isbn);
	$("#bk_name").attr("value", temp[index].title);
	$("#bk_writer").attr("value", temp[index].authors);
	$("#bk_publicday").attr("value", temp[index].datetime);
	$("#bk_publisher").attr("value", temp[index].publisher);
	$("#bk_introduction").text(temp[index].contents);
	
}
	
	
	

