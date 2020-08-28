<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/views/inc/asset.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/gamedetailinfo.css">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <link rel="">
    <style>

    </style>
</head>

<%@include file="/WEB-INF/views/inc/header.jsp" %>

<div id="topBoard">
</div>

<div id="scoreBoard">
    <div id="subOuter">
        <div class="menuTitleBox">
            <div class="menuTitle">커뮤니티</div>
            <div class="breadcrumb">
                <span>HOME</span>
                <span>></span>
                <span>전력분석</span>
                <span>></span>
                <span>선수분석</span>
            </div>
            <div class="subMenuBox">
                <nav class="subMenu">
                    <ul>
                        <li class="subMenuItem"><a href="teamAnalysis.html">팀분석</a></li>
                        <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a
                                href="playerAnalysis.html">선수분석</a></li>
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
                        <div class="teamName" id="teamNameA">${playerInfo1[0].teamname }FC</div>
                        <img src="/images/${playerInfo1[0].teamlogo}" />
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
                        <div class="teamName" id="teamNameB">${playerInfo2[0].teamname }FC</div>
                        <img src="/images/${playerInfo2[0].teamlogo}" />
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
                <c:forEach items="${playerInfo1 }" var="playerInfo" varStatus="status">
                    <div class="player teamAPlayer" id="teamAPlayer${status.index}">
                        <span class="backNum">${playerInfo.backnumber }</span>
                        <span class="playerName">${playerInfo.playername }</span>
                        <span class="position">${playerInfo.position }</span>
                    </div>
                </c:forEach>
            </div>
            <div id="bsBoard">
                <div id="timer">00분00초</div>
                <div class="textBroadcast">
                    <span class="menuTitle2">문자 생중계</span>
                    <ul>
                        <c:forEach items="${textBroadCast}" var="textBroadCast">
                            <li>
                                <span class="evtTime">[${textBroadCast.time }분]</span>
                                <span class="evtBacknumber">${textBroadCast.backnumber }번</span>
                                <span class="evtPlayerName">${textBroadCast.playername }선수</span>
                                <span class="evtEvent">${textBroadCast.event }</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div id="contentBox"></div>
                <div id="action">
                    <h4>경기내용 단축키 입력</h4>
                    <table class="table table-bordered">
                        <tbody>
                            <c:forEach var="i" begin="0" end="${bcList.size()}" step="2">
                                <tr>
                                    <td>${bcList[i].shortcut }</td>
                                    <td><kbd>${bcList[i].event}</kbd></td>
                                    <c:if test="${bcList.size()>=i+1}">
                                        <td>${bcList[i+1].shortcut }</td>
                                        <td><kbd>${bcList[i+1].event}</kbd></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="entry" id="teamBEntry">
                <div class="player teamBPlayer playerHeader" id="teamAPlayer1">
                    <span class="backNum">번호</span>
                    <span class="playerName">이름</span>
                    <span class="position">포지션</span>
                </div>
                <c:forEach items="${playerInfo2 }" var="playerInfo" varStatus="status">
                    <div class="player teamBPlayer" id="teamBPlayer${status.index}">
                        <span class="backNum">${playerInfo.backnumber }</span>
                        <span class="playerName">${playerInfo.playername }</span>
                        <span class="position">${playerInfo.position }</span>
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
<!-- <script src="/js/gamedetailinfo.js"></script> -->

<script type="text/javascript">
    var time = 0;
    var min = "";
    var sec = "";

    var x = setInterval(function () {
        min = parseInt(time / 60);
        sec = time % 60;
        if (min < 10) {
            min = "0" + min;
        }
        if (sec < 10) {
            sec = "0" + sec;
        }
        $("#timer").html(min + '<span>분</span>' + sec + '<span>초</span>');

        time++;

        if (time > 5700) {
            clearInterval(x);
            $("timer").html("경기 종료");
        }
    }, 1000);
</script>
<script>
    //키코드 이벤트들
    var which = "";

    $(document).bind('keypress', function (event) {
        which += event.which + "";// 단축키를 쌓는다
        //삭제 이벤트

        if (event.which == 26) {// ctrl + b
            $("#contentBox").css({ "border": "2px solid RGB(238,238,238)", "box-shadow": "" });
            $("#contentInfo").html("");
        }
        if (event.which == 10) { // 전송으로 사용
            console.log("컨트롤엔터눌려진다")
        }

    });

    //더블클릭을 통해 선수 정보를 입력창에 입력
    $(".player").dblclick(function () {

        var backnumber = $(this).find("span").eq(0).text();
        var playername = $(this).find("span").eq(1).text();
        var time = $("#timer").text().substring(0, 3);

        if ($(this).hasClass("teamAPlayer")) {
            var temp = "<div id='contentInfo' style='position: absolute; left:0%'>";
            temp += "<span>[";
            temp += time;
            temp += "]</span>";
            temp += "<span>";
            temp += backnumber;
            temp += "번</span>";
            temp += "<span>[";
            temp += playername;
            temp += "]</span>";
            temp += "</div>";
            $("#contentBox").css({ "border": " 2px solid RGB(134,0,0)", "box-shadow": "2px 2px 5px RGB(134,0,0), -2px -2px 5px RGB(134,0,0)" })
        } else {//if
            var temp = "<div id='contentInfo' style='position: absolute; right:0%'>";
            temp += "<span>[";
            temp += time;
            temp += "]</span>";
            temp += "<span>";
            temp += backnumber;
            temp += "번</span>";
            temp += "<span>[";
            temp += playername;
            temp += "]</span>";
            temp += "</div>";
            $("#contentBox").css({ "border": " 2px solid RGB(0,80,147)", "box-shadow": "2px 2px 5px RGB(0,80,147), -2px -2px 5px RGB(0,80,147)" })
        }

        $("#contentBox").html(temp);
        var c = $("#contentBox").html();
        console.log(c);

    });
</script>
</body>

</html>