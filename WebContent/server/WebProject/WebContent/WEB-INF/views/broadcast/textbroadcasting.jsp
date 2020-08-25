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
        <link rel="stylesheet" href="/soccer/css/textbroadcasting.css">
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
            <img src="images/rogowithoutletter.png" class="contentTitleImg" /><span class="contentTitle">문자중계</span>
        </div>
        <div style="clear: both;"></div>
        <div class="centerInner">
            <!-- 어두운 파란색 배경 -->
            <div class="outerWraper">
                <!-- 선으로 되어 팀 이름과 로고 들어가는 박스 -->
                <div class="outerbox">
                    <div class="teamOuter" id="teamOuterA">
                        <div>
                            <div class="teamName" id="teamNameA">홍길동FC</div>
                            <img src="images/man_01.png" />
                            <div class="underLine"></div>
                        </div>
                    </div>
                    <div class="score">
                        <div class="insidescore">
                            <span class="teamScore" id="teamA">3</span>
                            -
                            <span class="teamScore" id="teamB">1</span>
                        </div>
                    </div>
                    <div class="teamOuter" id="teamOuterB">
                        <div>
                            <div class="teamName" id="teamNameB">하하하FC</div>
                            <img src="images/man_02.png" />
                            <div class="underLine"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="middle">
            <!-- 골넣은 결과 작성하는 곳 도움은 타이틀로 보이도록 함 -->
            <div class="gameSummary">
                <div id="teamSum">
                    <div id="evtA1" class="evts">
                        <div class="teamA">
                            <span class="evtBackNum">11</span>번 <span class="evtplayer">김찰찰</span>
                            <span class="assi"> 도움</span> [<span class="assiBackNum">11</span>번
                            <span class="assiplayer">박철철</span>]
                        </div>
                        <div class="time"><span class="evtMinute">20</span><span class="bun">분</span></div>
                        <div class="teamB"></div>
                    </div>
                    <div id="evtA2" class="evts">
                        <div class="teamA"></div>
                        <div class="time"><span class="evtMinute">20</span><span class="bun">분</span></div>
                        <div class="teamB"></div>
                    </div>
                    <div id="evtA3" class="evts">
                        <div class="teamA">
                            <span class="evtBackNum">12</span>번 <span class="evtplayer">이청청</span>
                            <span class="assi"> 도움</span> [<span class="assiBackNum">11</span>번
                            <span class="assiplayer">박철철</span>]
                        </div>
                        <div class="time"><span class="evtMinute">20</span><span class="bun">분</span></div>
                        <div class="teamB">
                            <span class="evtBackNum">15</span>번 <span class="evtplayer">김찰찰</span>
                            <span class="assi"> 도움</span> [<span class="assiBackNum">11</span>번
                            <span class="assiplayer">박철철</span>]
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="middle2">
            <!-- 팀 엔트리 및 문자중계 -->
            <div class="entryOuter">
                <div class="entry" id="teamAEntry">
                    <div class="player teamAPlayer playerHeader" id="teamAPlayer1">
                        <span class="backNum">번호</span>
                        <span class="playerName">이름</span>
                        <span class="position">포지션</span>
                    </div>
                    <c:forEach items="${getPlayerInformation}" var="dto">
                    <div class="player teamAPlayer" id="teamAPlayer1">
                        <span class="backNum">${dto.backNum}</span>
                        <span class="playerName">${dto.name}</span>
                        <span class="position">${dto.position}</span>
                    </div>
                    </c:forEach>
                </div>
                <div class="textBroadcast">
                    <span class="menuTitle2">문자 생중계</span>

                    <ul>
                    <c:forEach items="${broadCastList}" var="dto">
                        <li>
                            <span class="evtTime">${dto.time}</span>${dto.team} ${dto.playerName} ${dto.event}
                        </li>
                       </c:forEach>
                    </ul>
                </div>
                <div class="entry" id="teamBEntry">
                    <div class="player teamAPlayer playerHeader" id="teamAPlayer1">
                        <span class="backNum">번호</span>
                        <span class="playerName">이름</span>
                        <span class="position">포지션</span>
                    </div>
                    <c:forEach items="${getPlayerInformation}" var="dto">
                    <div class="player teaBAPlayer" id="teamBPlayer1">
                        <span class="backNum">${dto.backNum}</span>
                        <span class="playerName">${dto.name}</span>
                        <span class="position">${dto.position}</span>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
	
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

    </script>
       <script src="js/gamedetailinfo.js"></script>
    
</body>

</html>