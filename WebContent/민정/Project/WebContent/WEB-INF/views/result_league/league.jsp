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
        
        
        /* .btnOption{
           position: relative;
           width: 70px;
           height: 35px;
           bottom: 5px;
       } */

       .btnOption{
           position: relative;
           width: 70px;
           height: 35px;
       }
       /* #btnOption{
           position: relative;
           margin-left: 81.8%;
       } */
       #btnOption{
           position: relative;
           margin-left: 81.8%;
           width: 70px;
           height: 30px;
           bottom: 5px;
       
        }
       /* #tbl1{
           width: 1200px;
           margin: 50px;
           font-size: 1.1em;
           text-align: center;
       } */
       #tbl1{
            width: 1200px;
             margin: 0px auto;
            font-size: 1.1em;
            /* text-align: center; */
            border: none;
            
        }
       /* #tbl1 th{
           text-align: center;
           background-color: #92DAEC;
            color: #0C1B23;    
            font-weight: bold;
            font-size: 1.1em;
       } */
       /* #tbl1 tr{
            width: 800px;
            background-color: #1E3440;                
        } */
       /* #tbl1 td { padding-top: 20px; padding-bottom: 15px;  border: none;} */

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

       /* #centerbox1{
            position: relative;
            margin: 0px auto;
            width: 1200px;
            height: 45px;
            margin-bottom: 20px;
         
            
            border-bottom: 1px solid black;
        } */
        #centerbox1{
            position: relative;
            margin: 0px auto;
            width: 1200px;
            height: 45px;
            border-bottom: 1px solid black;
            /* margin-left: 50px; */
        }
       
        #centerbox2{
            /* border: 1px solid tomato; */
            width: 1200px;
            height: 550px;
            margin: 0px auto;
        }
        #centerbox3 {
            /* border: 1px solid red; */
            width: 1200px;
            height: 70px;
            margin: 0px auto;
            /* margin-top: 40px; */           
        }

        #centerbox4 {
            width: 1200px;
            height: 50px;
            /* display: inline-block;  */
            margin: 0px auto;
            /* border: 1px solid red;                    */
        }
        
        #searchbtn, #writebtn {
            /* color: white;    */
            height: 30px;
            /* background-color: #1E3440 ; */
        }

        .pageContentTitle{
            width: 1200px;
            /* border: 1px solid green; */
            position: relative;
            top: 80px;
            height: 150px; margin: 0px auto;
            
        }

    </style>
</head>
<script src="../jquery/js/jquery-1.12.4.js"></script>
<script src="../jquery/js/jquery-ui.js"></script>
<div class="adminPage">
    <ul id="ul1">
        <li style=" text-align: center;"><img id="admin_img" src="../webproject/images/rogo5.png"></li>
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

</header>
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
                    <span class="contentTitle">경기 결과(리그)</span>           
            </div>   
        <div id="centerbox1">    
            
        </div> 
        <br>
        <div id="centerbox2">
    <table class="table table-striped tbl-lg"  id="tbl1" style="margin-top: 0px;">
        <tr>
            <th><input type="checkbox" name="" id="th_checkAll" onclick="checkAll();"></th>
            <th>날짜</th>
            <th>시간</th>
            <th>리그</th>
            <th>장소</th>
            <th>경기</th>
            <th>스코어</th>
        </tr>
        
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.13(토)</td>
            <td>10:00</td>
            <td>2020 써머 리그</td>
            <td>수원 월드컵경기장</td>
            <td>홍길동팀 VS 하하하팀</td>
            <td>3-2</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.13(토)</td>
            <td>16:00</td>
            <td>2020 써머 리그</td>
            <td>수원 월드컵경기장</td>
            <td>아무개팀 VS 하하하팀</td>
            <td>0-1</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.14(일)</td>
            <td>13:00</td>
            <td>2020 써머 리그</td>
            <td>잠실경기장</td>
            <td>아무개팀 VS 홍길동팀</td>
            <td>4-5</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.17(수)</td>
            <td>15:00</td>
            <td>2020 써머 리그</td>
            <td>의왕 축구장</td>
            <td>하하하팀 VS 호호호팀</td>
            <td>3-7</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.17(수)</td>
            <td>19:00</td>
            <td>2020 써머 리그</td>
            <td>잠실경기장</td>
            <td>호호호팀 VS 아무개팀</td>
            <td>6-4</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.18(목)   </td>
            <td>17:00</td>
            <td>2020 써머 리그</td>
            <td>주암 체육공원</td>
            <td>호호호팀 VS 홍길동팀</td>
            <td>5-2</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.19(금)</td>
            <td>18:00</td>
            <td>2020 써머 리그</td>
            <td>주암 체육공원</td>
            <td>쌍용팀 VS 아무개팀</td>
            <td>7-4</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.19(금)</td>
            <td>18:00</td>
            <td>2020 써머 리그</td>
            <td>주암 체육공원</td>
            <td>쌍용팀 VS 아무개팀</td>
            <td>7-4</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.19(금)</td>
            <td>18:00</td>
            <td>2020 써머 리그</td>
            <td>주암 체육공원</td>
            <td>쌍용팀 VS 아무개팀</td>
            <td>7-4</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="checkRow" id="checkbox"></td>
            <td>06.19(금)</td>
            <td>18:00</td>
            <td>2020 써머 리그</td>
            <td>주암 체육공원</td>
            <td>쌍용팀 VS 아무개팀</td>
            <td>7-4</td>
        </tr>
       
    </table>
</div>
    <div id="centerbox4">
        <span id="btnOption">
            <button type="button" id="btnAdd_notice" value="추가" class="btn btn-default btnOption" onclick="location.href='${pageContext.request.contextPath}/write.do';">
             추가
            </button>
            <input type="button" value="수정"class="btn btn-default btnOption">
            <input type="button" value="삭제"class="btn btn-default btnOption">
        </span>
        ${pagebar}
    </div>
    
  	<form id="searchForm" action = "${pageContext.request.contextPath}/league/league.do" method="GET">
        <div id="centerbox3">
            <div style="float: right; font-size: 15px; margin: 5px;">                
                <select name="searchKeyWord" style=" height: 30px;" id="selectbox1">
                    <option value="league">리그</option>
                    <option value="match">경기</option>
                </select>
                <input name="search" id="searchkeyWord" type="text" size="35" style="height: 30px;">
                <a href=""><input id="searchbtn" type="button" value="검색" onclick="$('#searchForm').submit;" ></a>
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

    </script>
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