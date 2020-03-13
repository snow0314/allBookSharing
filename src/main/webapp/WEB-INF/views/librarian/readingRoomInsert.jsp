<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
    

    </style>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <!-- 폰트 어썸 -->
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style>
    .btn-group-toggle label{
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
                        <label for="rm_col" class="control-label mb-1">행</label>
                        <input id="rm_col" name="rm_col" type="number" class="form-control cc-exp" value="" placeholder="행을 입력해주세요">
                        <span class="help-block" data-valmsg-for="cc-exp" data-valmsg-replace="true"></span>
                    </div>
                </div>
                <div class="col-4">
                    <label for="rm_row" class="control-label mb-1">열</label>
                    <div class="input-group">
                        <input id="rm_row" name="rm_row" type="number" class="form-control cc-cvc" value="" placeholder="열을 입력해주세요">
                    </div>
                </div>
                <div class="col-4">
                    <label for="total_seat" class="control-label mb-1">총 좌석수</label>
                    <div class="input-group">
                        <input id="total_seat" name="total_seat" type="tel" class="form-control cc-cvc" value="" 
                        readonly>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ml-auto" style="text-align: right">
                        <button id="create_seat" type="button" class="btn btn-success" cli>
                        <i class="fas fa-pen"></i>&nbsp; 좌석 생성</button>
              </div>
        </div>
        <div  class="container p-3 my-3 border" style="text-align: center">
            <div id="seats" class="btn-group-toggle" data-toggle="buttons">
            
            </div>
        </div>
    </form>

					
</body>
<script>
        
        $("#create_seat").on("click", function() {
            $("#seats").empty();
                   console.log($("#rm_row").val());
                   console.log($("#rm_col").val());
            let col = $("#rm_col").val(); //행
            let row = $("#rm_row").val(); //열
            
            for (let j = 1; j <= col; j++) {

                for (let i = 1; i <= row; i++) {
                    
                    let $label=$("<label>").addClass("btn btn-outline-success").appendTo($("#seats"));
                    
                    $("<input>").attr("type","checkbox").attr("data-col",j).attr("data-row",j).appendTo($label);
                    
                }
               $("<br>").appendTo($("#seats"));
            }
        });

        $("#seats").on("click","input",function(e){ //좌석 클릭시 checked 변경
            
            if($(this).attr("checked")=="checked"){
                $(this).attr("checked",false);
            }else{
                $(this).attr("checked",true);
            }
            
            
            console.log($(this).attr("checked"));
            
        });    

    </script>
</html>
