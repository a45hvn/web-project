<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">    
    <link rel="stylesheet" href="/soccer/css/clubmanagementPlayerManagementCheck.css">
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>
    <script src="/soccer/js/jquery-ui.js"></script>
    <style>
	
		 /* 모달 */
        .modal-body {
            text-align: center;
            font-size: 1.1em;

        }

        .modal {
            text-align: center;
        }

        @media screen and (min-width: 768px) {
            .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
            }
        }

        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
        }
		
		#box1L {
			background-image: url("/soccer/images/${list[0].image}");
			background-repeat: no-repeat;
    		background-size: cover; 
		}
		
    </style>
</head>

<body>

   
    <div id="mainBox">
        
        <div id="box1">
            
            <div id="box1L">
                
            </div>
            <div id="box1R">
                <table class="table">  
                	<c:forEach items="${list}" var="dto">              
                    <tr>
                        <td>이름</td>
                        <td>${dto.name}</td>                        
                    </tr>
                    <tr>
                        <td>나이</td>
                        <td>${dto.old}</td>                        
                    </tr>
                    <tr>
                        <td>포지션</td>
                        <td>${dto.position}</td>                        
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td>${dto.tel}</td>                        
                    </tr>
                    <tr>
                        <td>입단일시</td>
                        <td>${dto.regdate}</td>                        
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>        
        <div style="clear: both;"></div>

        <div id="box2">
            <table>
                <thead class="table">
                    <tr>
                        <th style="width:500px">멘트</th>
                        <th>일자</th>
                    </tr>
                </thead>
                <tbody>  
	                <c:forEach items="${log}" var="dto">
	                <tr class='appended' style='height:22.4px;'>
	                    <td class='comment'><span>${dto.logcomment}</span><input class='input' type='text' style='display:none; width: 400px;' value="${dto.logcomment}" ></td>
	                    <td id='regdate'>${dto.logregdate}</td>
	                </tr>
	                </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="box3">
           <span>
                <input type="button" value="삭제" class="btn btn-primary" id="del">
            </span>
            <!-- <span>
                <input type="button" value="수정" class="btn btn-primary" id="update">
            </span> -->
            <span>
                <input type="button" value="추가" class="btn btn-primary" id="add">
            </span> 
        </div>

    </div>
    
     <!-- 삭제하기 Modal-->
        <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 400px;">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #25282A;">
                    <div class="modal-title" id="exampleModalLabel" style="color: #92DAEC; display: inline;" >수정 완료</div>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" style="color: white; font-size: 0.9em;">X</span>
                    </button>
                </div>
                <div class="modal-body">삭제 하시겠습니까?</div>
                <div class="modal-footer">
                    <!-- 예/아니오 선택 버튼 -->
                    <a class="btn btn-primary" id="modalY" href="#" data-dismiss="modal">예</a>
                    <button class="btn btn-primary" type="button" data-dismiss="modal">아니요</button>
                    
                    
                </div>
            </div>
        </div>
        </div>
    
    
    
    <style>

       

    </style>

    <script>

    	$("#box3 input" ).mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "red").css("color", "black");

        })

        $("#box3 input").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })
        
        // 삭제하기 모달
        $("#del").click(function (e) {
            e.preventDefault();
            $("#delModal").modal("show");
        });
    	
    	$("#add").click(function(){
     		let temp="<tr class='appended' style='height:22.4px;'>";
	    		temp+="<td class='comment'><span></span>";
	    		temp+="<input class='input' type='text' style='display:none; width: 400px;' >";
	    		temp+="</td>";
	    		temp+="<td id='regdate'>";
	    		temp+="</td>";
    		temp+="</tr>";
    		
    		$("#box2 tbody").append(temp);
    	});

    	$(document).on("click",".appended",function(){ 
    		$(this).find("span").text("");
    	   	$(this).find("input").css("display","");
    	   	$(this).keyup(function(event){
    	   		if(event.which==13){
    	   			$(this).find("input").css("display","none");
    	   			$(this).find("span").text($(this).find("input").val());
    	   			
    	   			$.ajax ({
    	   				
    	   				type: "GET",
    	   				url: "/board/clubmanagementPlayerManagementCheckOk.do",
    	   				data: {"entry_seq":${list[0].entry_seq, "text": $(this).find("input").val()},
    	   				success : function(result) {
    	   						if(result == 0) {
    	   							alert("저장에 실패했습니다.");		
    	   						}
    	   					},
    	   				error: function(a, b ,c) {
    	   						console.log(a, b, c);
    	   					}
    	   				
    	   				
    	   			})
    	   				
    	   			
    	   			
    	   			
    	   		}
    	   	})
    	 });
    	
    	
    	
    	
    </script>

</body>

</html>