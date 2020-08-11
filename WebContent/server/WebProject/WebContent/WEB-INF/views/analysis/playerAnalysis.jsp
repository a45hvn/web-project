<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        select{
            margin-top: 50px;
            height: 30px;
            width: 80px;
        }

        select:nth-child(1){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(2){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(3){
            border:1px solid rgb(134, 0, 0);
            color: rgb(134, 0, 0);
        }
        select:nth-child(1n+4){
            border:1px solid rgb(11, 72, 255);
            color: rgb(11, 72, 255);
        }
        .playerTitle{
            
            border : 3px solid rgb(134, 0, 0);
            width: 600px;
            margin-top: 30px;
            height: 100px;
            float: left;
            
        }
        .playerTitle:nth-child(3){
            
            border : 3px solid rgb(11, 72, 255);
            
        }
        .playerTitle img{
            width: 80px; 
            /* float: left;  */
           /*  margin-top: 0px ;  */
             margin-left: 70px;
        }
        .playerTitle a{
            font-size: 1.3em;
            color: black;
        }
        .playerTitle span{
            font-size: 1.3em;
        }
        .playerCharts{
            border-left: 1px solid rgb(134, 0, 0);
            border-right: 1px solid rgb(11, 72, 255);
            width: 1230px;
            margin-left: 30px;
            float: left;
        }
        .playerPhoto{
            /* border: 1px solid black; */
            width: 300px;
            padding-left: 35px;
        }
        .playerPhoto img{
            border: 5px solid rgb(134, 0, 0);
            border-radius: 50% 50%;
            width: 250px;
            margin-top: 55px;
            

        }
        .playerCharts div{
            float: left;
        }
        #playerInfo tbody th{
            text-align: center;

        }
        .pageContentTitle {
            /* background-color: rgb(238, 238, 238); */
        }
/* ---------------------------------------------------------------- */
        #container {
        height: 400px;
        }

        .highcharts-figure, .highcharts-data-table table {
        min-width: 310px; 
        max-width: 800px;
        margin: 1em auto;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #EBEBEB;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }
        .highcharts-data-table caption {
        padding: 1em 0;
        font-size: 1.2em;
        color: #555;
        }
        .highcharts-data-table th {
            font-weight: 600;
        padding: 0.5em;
        }
        .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
        padding: 0.5em;
        }
        .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
        background: #f8f8f8;
        }
        .highcharts-data-table tr:hover {
        background: #f1f7ff;
        }
        rect {
            /* fill: rgb(238, 238, 238); */
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
                    <span>선수분석</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="teamAnalysis.html">팀분석</a></li>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="teamAnalysis.jsp">선수분석</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->


    <div class="center" style="height: 1000px;">
        <!-- 선수 선택 -->
        <div class="pageContentTitle" style="border-bottom: 1px solid black;"><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
            class="contentTitle">전력분석(선수)</span>
        </div>
        <!--  -->
        <div style="width: 100%;  height: 850px; float: left;">
            <div>
                <select name="" id="team1" style="margin-left: 160px;">
                    <option value="">경기</option>
                </select>
                <select name="" id="team1">
                    <option value="">쌍용FC</option>
                    <option value="">타겟FC</option>
                    <option value="">쌍용FC</option>
                    <option value="">쌍용FC</option>
                    <option value="">쌍용FC</option>
                </select>
                <select name="" id="team1">
                    <option value="">권현진</option>
                    <option value="">김동현</option>
                    <option value="">장정현</option>
                    <option value="">이호연</option>
                    <option value="">홍준식</option>
                    <option value="">강경준</option>
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
                <select name="" id="team1">
                    <option value="">김동현</option>
                    <option value="">권현진</option>
                    <option value="">장정현</option>
                    <option value="">이호연</option>
                    <option value="">홍준식</option>
                    <option value="">강경준</option>
                </select>
            </div>

            <div class="playerTitle" style="margin-left: 30px; border-top: 7px solid rgb(134, 0, 0);">
                <div style="text-align: left; width: 250px; float: left;">
                    
                    <span class="birth">1997-05-13</span><br>
                    <span class="spec">180/69kg</span><br>
                    <span class="position">MF</span>
                    

                </div>
                
                <span style=" float: left;width: 140px; margin-top: 30px;">권현진</span>

                <img src="../images/rogo.png" alt="" class="rogo" style="margin-left: 50px;">
            </div>

            <div class="playerTitle" style="margin-left: 30px; border-top: 7px solid rgb(11, 72, 255);">
                <img src="../images/rogo.png" alt=""class="rogo" style=" float: left;">

                <span style="margin-left: 100px; display:block; float: left;  margin-top: 30px;">김동현</span>

                <div style="text-align: right;  width: 290px; margin-left: 300px;">
                    <span class="birth">1995-07-13</span><br>
                    <span class="spec">170/60kg</span><br>
                    <span class="position">MF</span>
                </div>
            </div>

            <!-- 플레이어 차트 -->
            <div class="playerCharts" >
                <div class="playerPhoto"><img src="/soccer/images/man_01.png" alt=""></div>
                <figure class="highcharts-figure">
                    <div id="container"></div>
                    
                  </figure>
                <div class="playerPhoto"><img src="/soccer/images/man_02.png" alt="" style="border: 5px solid rgb(11, 72, 255); margin-top: 41px;"></div>
            </div>
            <div style="float: left; border: gray 1px solid; width: 1230px; margin-left: 30px; text-align: center; padding-top: 20px;" >
                <table class="table table-bordered" style="text-align: center;" id="playerInfo">
                    <tr>
                        <td>1</td>
                        <th>경기수</th>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <th>득점</th>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <th>도움</th>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>0</td>
                        <th>경고</th>
                        <td>1</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>


        Highcharts.chart('container', {
  chart: {
    type: 'spline'
  },
  title: {
    text: '선수 전력 분석'
  },
  subtitle: {
    // text: 'Source: WorldClimate.com'
  },
  xAxis: {
    categories: ['득점', '도움', '파울', '태클', '선방']
  },
  yAxis: {
    title: {
      text: 'Temperature'
    },
    labels: {
      formatter: function () {
        return this.value ;
      }
    }
  },
  tooltip: {
    crosshairs: true,
    shared: true
  },
  plotOptions: {
    spline: {
      marker: {
        radius: 4,
        lineColor: '#666666',
        lineWidth: 1
      }
    }
  },
  series: [{
    name: 'Blue',
    marker: {
      symbol: 'square'
    },
    data: [10, 6, 3, 7, 0]

  }, {
    name: 'Red',
    marker: {
      symbol: 'diamond'
    },
    data: [7,4,1,5,0]
  }]
});
    $("text").css("font-size","1.3em").css("font-weight", "bold")
    $(".highcharts-credits").css("font-size","0em")
    </script>
    
    
</body>

</html>