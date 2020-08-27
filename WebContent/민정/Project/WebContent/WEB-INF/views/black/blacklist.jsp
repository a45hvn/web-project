<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>  
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_111.css" />

    <style>

        /* html,body{ height: 1500px%; overflow: hidden;}        */
        
        #searchBox{
           
            margin-left: 60%;
            margin-right: auto;
        }
 
        .selectbox{
            height: 30px;
            width: 140px;
            font-size: 15px;
        }
        #searchbtn{
            position: relative;
            left: 4px;
        }
        #btnOption{
            
            /* border: 1px solid orange;
            position: relative;
            left: 90%;
            
            width: 80px;
            height: 40px;
            font-size: 18px;
            font-weight: bold;
            border: 0; */
            
           position: relative;
           margin-left: 94.2%;
           width: 70px;
           height: 30px;
           bottom: 5px;
       
        }

        #tbl1{
            width: 1100px;
             margin: 0px auto;
            font-size: 1.1em;
            /* text-align: center; */
            border: none;
            
        }
        
        
       .selectbox{
           height: 25px;
       }
       
        #searchbtn, #writebtn {
            
            height: 30px;
        }

        

        

        .pageContentTitle{
            width: 1200px;
            /* border: 1px solid green; */
            position: relative;
            top: 80px;
            height: 150px; margin: 0px auto;
            
        }
        #centerbox1{
            position: relative;
            margin: 0px auto;
            width: 1100px;
            height: 45px;
            border-bottom: 1px solid black;
            /* margin-left: 50px; */
        }
        #centerbox2{
            /* border: 1px solid tomato; */
            width: 1100px;
            height: 550px;
            margin: 0px auto;
        }

        #centerbox3 {
            /* border: 1px solid red; */
            width: 1100px;
            height: 70px;
            margin: 0px auto;
            /* margin-top: 40px; */
           
        }

        #centerbox4 {
            width: 1100px;
            height: 50px;
            /* display: inline-block;  */
            margin: 0px auto;
            /* border: 1px solid red;                    */
        }
        

    </style>
</head>
<body>
     <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
     <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    
    <div class="adminPage">
        <ul id="ul1">
                 <li style=" text-align: center;"><img id="admin_img" src="${pageContext.request.contextPath}/images/rogo5.png"></li>
            <li class="menu1"><a href="#">경기결과(리그)</a></li>
            <li class="menu2"><a href="#">경기결과(친선)</a></li>
            <li class="menu3"><a href="#">공지사항</a></li>
            <li class="menu4"><a href="#">블랙리스트</a></li>
            <li class="menu5"><a href="#">경기장 관리</a></li>
            <li class="menu6"><a href="#">경기장 일정</a></li>
            <li class="menu7"><a href="#">구단관리</a></li>
            <li class="menu8"><a href="#">선수관리</a></li>


        </ul>
    </div>
    <header>
		<%String path = application.getContextPath();
    			out.write(path); %>
    </header>
    <div class="center">
        <div class="pageContentTitle">
           <img src="${pageContext.request.contextPath}/images/rogowithoutletter.png" class="contentTitleImg" />
            <span class="contentTitle">블랙리스트</span>
        </div>        

             <div id="centerbox1">
                   
            </div> 
            <br>
            <div id="centerbox2">
            <table class="table table-striped tbl-lg" id="tbl1" style="margin-top: 0px;">
                <thead class="thead-dark">
                <tr>
                    <th><input type="checkbox" name="" id="th_checkAll" onclick="checkAll();"></th>
                    <th>번호</th>
                    <th>회원명</th>
                    <th>사유</th>
                    <th>시작날짜</th>
                    <th>해제 날짜</th>
           
                </tr>
                </thead>
                <tbody>
                	<c:if test="${empty search and list.size() == 0 }">
           				<tr>
           					<td colspan = "5"> 게시물이 없습니다.</td>
           				</tr>
           			</c:if>
           			<c:forEach items = "${list}" var="dto">
           				<tr>
           					<td><input type="checkbox" name="checkRow" id="checkbox"></td>
           					<td>${dto.seq }</td>
           					<td>${dto.name}</td>
           					<td>${dto.reason}</td>
           					<td>${dto.startDate}</td>
           					<td>${dto.endDate}</td>
           					
           				</tr>
           			</c:forEach>
                </tbody>
                
            </table>            
            </div>
               
            <div id="centerbox3">                 
                <input type="button" value="삭제"class="btn btn-default btnOption"id="btnOption">
                 ${pagebar}
            </div> 
            <form id="searchForm" action="${pageContext.request.contextPath}/black/black.do" method = "GET">
            <div id="centerbox4">
                <div style="float: right; font-size: 15px; margin: 5px;">                
                    <select name="searchKeyWord" style=" height: 30px;">
                        <option value="name">회원명</option>
                        <option value="reason">사유</option>
                    </select>
                    <input name = "search" id="searchkeyWord" type="text" size="35" style="height: 30px;">
                    <a href=""><input id="searchbtn" type="button" value="검색" onclick="$('#searchForm').submit;"></a>
                </div>
            </div> 
            </form>   
    </div>
    <script>
        function checkAll(){
                 if( $("#th_checkAll").is(':checked') ){
                 $("input[name=checkRow]").prop("checked", true);
                }else{
                $("input[name=checkRow]").prop("checked", false);
                    }
                }
        $("#pagebar").val(${page});
        
    </script>
    <script src="${pageContext.request.contextPath}/js/eventAdmin.js"></script>
	<script src="${pageContext.request.contextPath}/js/submain.js"></script>
</body>
</html>