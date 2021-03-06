<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" href="/soccer/css/textbroadcastingschedule.css">
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
    
    <style>
    
    </style>
</head>

   	<%@include file="/WEB-INF/views/inc/header.jsp" %>

    <div id="topBoard">
    </div>
<div id="scoreBoard">
        <div id="subOuter">
            <div class="menuTitleBox">
                <div class="menuTitle">문자중계</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>문자중계</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem" style="background-color:rgb(15, 13, 13);"><a
                                    href="textbroadcastingschedule.html">문자중계</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	 <div class="center">

        <div class="pageContentTitle">
            <img src="images/rogowithoutletter.png" class="contentTitleImg" /><span class="contentTitle">문자중계일정</span>
        </div>

        <div id="centerMainBox">
            <div id="centerbox1">
                <div id="outerBox">
                    <select name="" id="selectgametype">
                        <option value="1">정규리그</option>
                        <option value="2">친선경기</option>
                    </select>
                    <div class="dateBox">
                        <span>시작일 : </span>
                        <input type="date" class="inputDate" id="startDate" />
                        <span>종료일 : </span>
                        <input type="date" class="inputDate" id="endDate" />
                    </div>
                    <div class="searchBox">
                        <span id="searchcontent">팀이름 검색</span>
                        <input id="searchkeyword" type="text" />
                        <a href=""><input id="searchbtn" type="button" value="검색" class="btn btn-primary" /></a>
                        <input id="writebtn" type="button" value="글쓰기" class="btn btn-primary" />
                    </div>
                    <select name="" id="selectrow">
                        <option value="10">10개씩 보기</option>
                        <option value="25">25개씩 보기</option>
                        <option value="50">50개씩 보기</option>
                    </select>
                </div>
            </div>
            <div id="centerbox2">
                <table class="table table-bordered table-striped" id="verticalTable" style="margin-top: 0px;">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>리그</th>
                            <th>시간</th>
                            <th>장소</th>
                            <th>경기</th>
                            <th>이긴 팀</th>
                            <th>문자중계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>2020</td>
                            <td>2020. 07. 05.(일) <span id="beginTime">14:00</span></td>
                            <td>역삼초등학교</td>
                            <td>
                                <span class="team" id="teamA">하하하FC</span>
                                <span>vs</span>
                                <span class="team" id="teamB">쌍용FC</span>
                            </td>
                            <td><span class="team"></span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td></td>
                            <td></td>
                            <td>강남축구장</td>
                            <td>
                                <span class="team" id="teamA">안녕FC</span>
                                <span>vs</span>
                                <span class="team" id="teamB">애플FC</span>
                            </td>
                            <td><span class="team">애플FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <span class="team" id="teamA"></span>
                                <span>vs</span>
                                <span class="team" id="teamB"></span>
                            </td>
                            <td><span class="team">하하하FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <span class="team" id="teamA"></span>
                                <span>vs</span>
                                <span class="team" id="teamB"></span>
                            </td>
                            <td><span class="team">하하하FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <span class="team" id="teamA"></span>
                                <span>vs</span>
                                <span class="team" id="teamB"></span>
                            </td>
                            <td><span class="team">하하하FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <span class="team" id="teamA"></span>
                                <span>vs</span>
                                <span class="team" id="teamB"></span>
                            </td>
                            <td><span class="team">하하하FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <span class="team" id="teamA"></span>
                                <span>vs</span>
                                <span class="team" id="teamB"></span>
                            </td>
                            <td><span class="team">하하하FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <span class="team" id="teamA"></span>
                                <span>vs</span>
                                <span class="team" id="teamB"></span>
                            </td>
                            <td><span class="team">하하하FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <span class="team" id="teamA"></span>
                                <span>vs</span>
                                <span class="team" id="teamB"></span>
                            </td>
                            <td><span class="team">하하하FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <span class="team" id="teamA"></span>
                                <span>vs</span>
                                <span class="team" id="teamB"></span>
                            </td>
                            <td><span class="team">하하하FC</span></td>
                            <td><input type="button" value="문자중계" class="textBtn btn btn-default"></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="centerbox3">
                <ul id="pagination" class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a class="nowPage" href="#" name="page">1</a></li>
                    <li><a href="#" name="page">2</a></li>
                    <li><a href="#" name="page">3</a></li>
                    <li><a href="#" name="page">4</a></li>
                    <li><a href="#" name="page">5</a></li>
                    <li><a href="#" name="page">6</a></li>
                    <li><a href="#" name="page">7</a></li>
                    <li><a href="#" name="page">8</a></li>
                    <li><a href="#" name="page">9</a></li>
                    <li><a href="#" name="page">10</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- <div style="clear: both;"></div> -->
        </div>

    </div>
	
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>
    // main page

    $("#pagination > li >a").click(function () {
        // alert($(this).text());
        $("#pagination > li>a").removeClass("nowPage");
        $(this).addClass("nowPage");
    });

    $("#searchbtn").mouseover(function () {
        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");
    });

    $("#searchbtn").mouseout(function () {
        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");
    });

    $("#writebtn").mouseover(function () {
        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");
    });

    $("#writebtn").mouseout(function () {
        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");
    });
    // <span class="glyphicon glyphicon-map-marker"></span>
    console.log($("#verticalTable tbody td:nth-child(3)").contents());

    // 지도마크 넣고 연결시키기
    $("#verticalTable tbody td:nth-child(4)").append("<span class='glyphicon glyphicon-map-marker'></span>");
    $("#verticalTable tbody td:nth-child(4)")
        .children()
        .mouseover(function () {
            $(this).css({ cursor: "pointer" });
        })
        .click(function () {
            console.log($(this).parent().text());
        });


    $(".textBtn").click(function () {
        location.href = "textbroadcasting.html";
    })
        

        
    </script>
    
    
</body>

</html>