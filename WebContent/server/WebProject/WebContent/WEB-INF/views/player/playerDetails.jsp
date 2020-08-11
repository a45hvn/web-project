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
    
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
    
    <style>
    	div .table {
            width: 70%;
        }

        .title {
            margin-top: 30px;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 1.3em;
        }
        input {
            margin-right: 10px;
        }
        .pageContentTitle{
            border-bottom: 1px solid black;
            margin-bottom: 30px;
        }
        .title{
            margin-left: 50px;
        }
    </style>
</head>

   	<%@include file="/WEB-INF/views/inc/header.jsp" %>

    <div id="topBoard">
    </div>

    <div id="scoreBoard">
        <div id="subOuter">
            <div class="menuTitleBox">
                <div class="menuTitle">선수현황</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>선수현황</span>
                    <span>></span>
                    <span>선수정보 상세보기</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="playerStatus.html">선수현황</a>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->



	<!-- 내용 시작 -->
	
	 <div class="center" style="height: 1000px;">
        <div class="pageContentTitle"><img src="../images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">선수정보 상세보기</span></div>
        <div style="width: 90%; margin-top: 50px;">
            <img src="../images/man_03.png" alt="" width="250px" style="float: left; display: block; margin-right: 50px; border: 3px solid black; margin-left: 50px; ">
            <table class="table table-striped table-bordered">
                <tr>
                    <th>선수이름</th>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>1995-04-15</td>
                </tr>
                <tr>
                    <th>소속팀</th>
                    <td>쌍용FC</td>
                </tr>
                <tr>
                    <th>등번호</th>
                    <td>9</td>
                </tr>
                <tr>
                    <th>포지션</th>
                    <td>FW</td>
                </tr>
                <tr>
                    <th>신장</th>
                    <td>177</td>
                </tr>
                <tr>
                    <th>체중</th>
                    <td>70kg</td>
                </tr>
            </table>
        </div>
        <div>
            <input id="message" type="button" class="btn btn-success" value="선수에게 메시지" style="margin-left: 50px;">
            <!-- <br> -->
            <input id="friend" type="button" class="btn btn-info" value="친구신청">
        </div>

        <div class="title glyphicon glyphicon-list" > 전체경기정보(친선포함)</div>
        <div style="margin-left: 50px;">
            <table class="table table-bordered table-striped">
                <tr>
                    <th>경기수</th>
                    <th>득점</th>
                    <th>도움</th>
                    <th>유효슈팅</th>
                    <th>파울</th>
                    <th>경고</th>
                    <th>퇴장</th>
                </tr>
                <tr>
                    <td>25</td>
                    <td>20</td>
                    <td>2</td>
                    <td>35</td>
                    <td>5</td>
                    <td>3</td>
                    <td>0</td>
                </tr>
            </table>
        </div>
        <div class="title glyphicon glyphicon-list">리그 성적</div>
        <div style="margin-left: 50px;">
            <table class="table table-bordered table-striped">
                <tr>
                    <th>경기수</th>
                    <th>득점</th>
                    <th>도움</th>
                    <th>유효슈팅</th>
                    <th>파울</th>
                    <th>경고</th>
                    <th>퇴장</th>
                </tr>
                <tr>
                    <td>25</td>
                    <td>20</td>
                    <td>2</td>
                    <td>35</td>
                    <td>5</td>
                    <td>3</td>
                    <td>0</td>
                </tr>
            </table>
        </div>
        <div class="title glyphicon glyphicon-list">댓글목록</div>
        <div style="margin-left: 50px;">
            <table class="table table-bordered table-striped">
                <tr>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>작성일자</th>
                    <th>내용</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>축구왕</td>
                    <td>2020-07-20</td>
                    <td>저번경기 잘 봤습니다.</td>
                </tr>
            </table>
        </div>
    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>
    
    $("#message").click(function () {
        window.open("message.jsp","message","width=550, height = 400, left = 700, top = 200")
        
    });
    /* $("#comment").click(function (){
        location.href="playerComments.jsp"
    }); */
    $("#friend").click(function (){
        // window.open("addFriend.html","message","width=300, height = 200, left = 800, top = 200")
        alert("친구신청완료!")
    });
        

        
    </script>
    
    
</body>

</html>