<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="en">
    <head>
        
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>  
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_111.css" />
    
        <style>

        
       .pageContentTitle{
            width: 1100px;
            /* border: 1px solid green; */
            position: relative;
            top: 80px;
            height: 150px;
             margin: 0px auto;
            
        }
       
       #searchBox{
           position: relative;
           margin-left: 70%;
           bottom: 7px;
           
            }
       .btnOption{
           position: relative;
           width: 70px;
           height: 35px;
       }
       #btnOption{
           position: relative;
           margin-left: 78.8%;
           width: 70px;
           height: 30px;
           /* bottom: px; */
       
        }
        
        #tbl1 td{
        	text-align: center;
        	
        	padding-top: 15px;
        	padding-bottom:5px;
        }
       #tbl1{
           width: 1100px;
           /* margin: 50px; */
           font-size: 1.1em;
            text-align: center; 
       }
       
       th{
       	text-align: center;
       }
       .selectbox{
           height: 25px;
       }
       .searchKeyword{
           height: 25px;
       }
       #searchBtn{
           height: 25px;
           text-align: center;
           position: relative;
           bottom: 0px;
       }
        #centerbox1{
            position: relative;
            
            width: 1100px;
            /* height: 45px; */
            margin: 0px auto;
            
            border-bottom: 1px solid black;
        }
       #centerbox2{
            /* border: 1px solid blue; */
           /* height: px; */
            width: 1100px;
            height: 550px;
            margin: 0px auto;
       }
       #centerbox3 {
            /* border: 1px solid red; */
            width: 1100px;
            height: 50px;
            margin: 0px auto;
            /* margin-top: 40px; */
           
        }

        #centerbox4 {
            /* border: 1px solid blue; */
            position: relative;
            /* left: 55px; */
            width: 1100px;
            height: 50px;
            margin: 0px auto;
            /* display: inline-block;    */
                   
        }
        /* #pagination .nowPage {
            background-color: #92DAEC;
        } */
        #searchbtn, #writebtn {
            /* color: white;    */
            height: 30px;
            /* background-color: #1E3440 ; */
        }

        
     
        
       

        #map{
            position: relative;
       		top: -5px;
            font-size: 0.9em;
            font-weight: bold;
            background-color:#4b87b8;
            color: white;
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
                    <span class="contentTitle">경기장 관리</span>           
            </div>              
                <br><br><br>
                <div id="centerbox1">
                    
                </div> 
                
                <br>
                <div id="centerbox2">
                <table class="table table-striped tbl-lg" id="tbl1" style="margin-top: 0px;">
                   <thead>
                    <tr>
                        <th><input type="checkbox" name="" id="th_checkAll" onclick="checkAll();"></th>
                        <th>번호</th>
                        <th>지역</th>
                        <th>경기장</th>
                        <th>주소</th>
                        <th>상세지도</th>
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
           						<td><input type="checkbox" name="checkRow" id="checkbox" ></td>
           						<td>${dto.seq }</td>
           						<td>${dto.home }</td>
           						<td>${dto.name }</td>
           						<td>${dto.address }</td>
           						<td><input type="button" value="상세보기" id="map" 
           						class="btn btn-default btn-sm bg-panel-darkblue"
           						onclick="window.open('${pageContext.request.contextPath}/ground/map_view.do?name=${dto.name }','팝업창 이름(map_view)','width=600,height=500');"></td>
           					
           					</tr>
           				</c:forEach>
                 	</tbody>
                </table>
            </div>
                <div id="centerbox4">
                    <span id="btnOption">
                        <input type="button" id="btnAdd_ground" value="추가" class="btn btn-default btnOption" onclick="location.href='${pageContext.request.contextPath}/ground/ground_new.do';">
                        <input type="button" value="수정"class="btn btn-default btnOption">
                        <input type="button" value="삭제"class="btn btn-default btnOption">
                    </span>  
                      ${pagebar} 
                </div>
               
               <form id="searchForm" action = "${pageContext.request.contextPath}/ground/ground.do" method="GET">
                <div id="centerbox4">
                    <div style="float: right; font-size: 15px; margin: 5px;">                
                        <select style=" height: 30px;" name="searchKeyWord" >
                            <option value="home">지역</option>
                            <option value="name">시설명</option>
                        </select>
                        <input name="search" id="searchkeyword" type="text" size="35" style="height: 30px;">
                        <a href=""><input id="searchbtn" type="button" value="검색" onclick="$('#searchForm').submit;"></a>
                    </div>
                </div>
                </form>
            
        </div>
       

        <!-- 스크립트------------------------------------------------------------- -->
        <script>
            var flag = false;
            $(document).scroll(function () {
                if ($(document).scrollTop() > $("#main").position().top) {
                    if (!flag) {
                        $("#main").css({
                            position: "fixed",
                            top: -$("#main").outerHeight(),
                            bottom: "",
                        });

                        $("#main").animate(
                            {
                                top: "0px",
                            },
                            1000,
                            function () {
                                //alert();
                                flag = true;
                            }
                        );
                    }
                }
            });
            // 메뉴 클릭시 발생하는 이벤트
            $(".menu")
                .click(function () {
                    // 어떤 메뉴를 눌렀는지 알려준다.

                    var menu = $(this).children().text();
                    console.log(menu);
                })
                .mouseover(function () {
                    // 호버. CSS 효과 줌
                    $(this).children().css({
                        // "text-shadow": "1px 1px 2px",
                        // color: "#F6BE0D",
                        // transform: "scale(1, 1)",
                        "background-color": "#0077C8",
                    });
                })
                .mouseout(function () {
                    // 토글
                    $(this).children().css({
                        "text-shadow": "",
                        color: "",
                        transform: "",
                        "background-color": "#25282A",
                    });
                });

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
