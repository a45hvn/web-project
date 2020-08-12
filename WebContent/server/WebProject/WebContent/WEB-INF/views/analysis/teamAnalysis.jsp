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
    #title{
            /* border: 3px solid gray; */
            width: 1000px;
            margin-left: 150px;
            margin-top: 30px;
            background-color: #0C1B23;
        }

        select{
            margin-top: 50px;
            height: 30px;
            width: 80px;
        }

        #vs{
            background-color: black;
            color: blanchedalmond;
            width: 80px;
            margin-left: 100px;
            margin-right: 100px;
            height: 50px;
            border-radius: 50% 50%;
            text-align: center;
            font-size: 2.3em;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .team{
            width: 200px;
            border: 1px black solid;
            height: 90px;
            margin-top: 10px;
            margin-bottom: 10px;
            border-radius: 10% 10%;
            color: honeydew;
            text-align: center;
            font-weight: bold;
            font-size: 1.3em;
        }
        #redTeam{
            margin-left: 150px;
            background-color: rgb(134, 0, 0);
        }
        #blueTeam{
            background-color:#005093;
        }

        select:nth-child(1){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(2){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(1n+3){
            border:1px solid #005093;
            color: #005093;
        }
        .acePhoto{
            width: 400px;
            /* float: left; */
            /* color: silver; */
        }
        .ace{
            float: left;
            /* color: silver; */
            /* border: silver 1px solid; */
            text-align: center;
            margin-top: 10px;
            margin-bottom: 10px;
            border-radius: 10% 10%;
            padding: 0px 10px;
        }
        .playerTitle{
            margin-top: 10px; 
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 1.2em;
        }
        .center{
            /* background-color: rgb(238, 238, 238); */
        }
        #data tr{
            text-align: center;
        }
        #data th{
            text-align: center;
        }
        .ace img {
            padding-bottom: 10px;
        }
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
                    <span>팀분석</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="teamAnalysis.do">팀분석</a></li>
                            <li class="subMenuItem"><a href="playerAnalysis.do">선수분석</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->



	<!-- 내용 시작 -->
	<div class="center" style="height: 1100px;">
        <div class="pageContentTitle" style="border-bottom: 1px solid black;"><img src="../images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">전력분석(팀)</span>
        </div>

        <div>
            <select name="" id="team1" style="margin-left: 260px;">
                <option value="">경기</option>
            </select>
            <select name="" id="team1">
                <option value="">쌍용FC</option>
                <option value="">타겟FC</option>
                <option value="">쌍용FC</option>
                <option value="">쌍용FC</option>
                <option value="">쌍용FC</option>
            </select>
            <select name="" id="team1" style="margin-left: 450px;">
                <option value="">서울</option>
            </select>
            <select name="" id="team1">
                <option value="">청춘FC</option>
                <option value="">역삼FC</option>
                <option value="">강남FC</option>
                <option value="">종로FC</option>
                <option value="">천호FC</option>
            </select>
        </div>

        <!-- 팀 vs 팀  -->
        <div id="title" style="float: left">
            <div id="redTeam" class="team" style="float: left;">
                쌍용FC <br> (경기) <br> 상대전적 : 2승
            </div>
            <div id="vs" style="float: left">
                vs
            </div>
            <div id="blueTeam" class="team" style="float: left">
                청춘FC <br> (서울) <br> 상대전적 : 2패
            </div>
        </div>
        
        <!-- 주목할 선수 -->
        <div style="float: left; width: 1000px; margin-left: 150px; border: 3px solid rgb(37, 65, 80);">
        <div class="ace" style="width: 300px; margin-left: 93px; border: 2px rgb(134, 0, 0) solid ;">
            <div class="playerTitle">주목할 선수</div>
            <img src="images/man_01.png" alt="">
            <table class="table table-bordered">
                <tr>
                    <th>선수명</th>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <th>득점</th>
                    <td>10</td>
                </tr>
                <tr>
                    <th>도움</th>
                    <td>5</td>
                </tr>
                <tr>
                    <th>평균평점</th>
                    <td>7</td>
                </tr>
            </table>
        </div>
        <div class="ace" style="margin-left: 200px; width: 300px; border: 2px solid #005093;">
            <div class="playerTitle">주목할 선수</div>
            <img src="images/man_02.png" alt="">
            <table class="table table-bordered">
                <tr>
                    <th>선수명</th>
                    <td>김강인</td>
                </tr>
                <tr>
                    <th>득점</th>
                    <td>5</td>
                </tr>
                <tr>
                    <th>도움</th>
                    <td>1</td>
                </tr>
                <tr>
                    <th>평균평점</th>
                    <td>6</td>
                </tr>
            </table>
        </div>
    </div>
    
    <div style="border: solid 3px rgb(37, 65, 80); width: 1000px; float: left; margin-left: 150px;">
        <div style="width: 99%; float: left; margin-left: 3px;" id="data">
            <h4 style="font-weight: bold;">팀 평균 데이터</h4>
            <table class="table table-bordered">
                <tr>
                    <td>3</td>
                    <th>평균득점</th>
                    <td>2.1</td>
                </tr>
                <tr>
                    <td>2</td>
                    <th>평균도움</th>
                    <td>1.7</td>
                </tr>
                <tr>
                    <td>8</td>
                    <th>평균평점</th>
                    <td>7.1</td>
                </tr>
                <tr>
                    <td>70%</td>
                    <th>승률</th>
                    <td>50%</td>
                </tr>
            </table>
        </div>
        
        
    </div>

        


    </div>
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

        

        
    </script>
    
    
</body>

</html>