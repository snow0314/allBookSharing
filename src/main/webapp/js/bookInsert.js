function list(data) {
		/*var $containerDiv=$("<div>");
		$containerDiv.addClass("container p-3 my-3 border");
		var $table=$("<table>");
		
		$("<td>").appendTo($tr).attr("rowspan", "3").css("width", "40%");
		var $td=$("<td>").appendTo($tr);
		var  $("<div>").addClass("input-group mb-3 input-group-sm").appendTo($td);*/
		console.log("list",data);
		var str="";
		for(var i=0;i<3;i++){
			var temp=data[i];
			str+="<div class='container p-3 my-3 border'>";
			str+="<table>";
			str+="<tr>";
			str+="<td rowspan='3' style='width: 40%'>";
			str+="<img src='"+temp.thumbnail+"'>";
			str+="</td>"
			str+="<td>";
	        str+="<div class='input-group mb-3 input-group-sm'>";        
	        str+="<div class='input-group-prepend'>";           
	        str+="<span class='input-group-text' style='width: 75px; text-align: center;'>ISBN 코드</span>";
	        str+="</div>";
	        str+="<input type='text' class='form-control' value='"+temp.isbn+"'>";
	        str+="</div>";
	        str+="</td>";
	        str+="</tr>";                   
	        str+="<tr>";               
	        str+="<td>";                
	        str+="<div class='input-group mb-3 input-group-sm'>";        
	        str+="<div class='input-group-prepend'>";            
	        str+="<span class='input-group-text' style='width: 75px; text-align: center;'>도서명</span>";
	        str+="</div>";
	        str+="<input type='text' class='form-control' value='"+temp.title+"'>";                   
	        str+="</div>";                
	        str+="</td>";               
	        str+="</tr>";            
	        str+="<tr>";        
	        str+="<td>";    
	        str+="<div class='input-group mb-3 input-group-sm'>";
	        str+="<div class='input-group-prepend'>";
	        str+="<span class='input-group-text' style='width: 75px; text-align: center;'>저자</span>";
	        str+="</div>";
	        str+="<input type='text' class='form-control' value='"+temp.authors+"'>";
	        str+="</div>";
	        str+="</td>";
	        str+="</tr>";
	        str+="</table>";       
	        str+="</div>";
		}
	
		
		
        
        $(str).appendTo($(".modal-body"));
        //var str="";         
	}
	
	