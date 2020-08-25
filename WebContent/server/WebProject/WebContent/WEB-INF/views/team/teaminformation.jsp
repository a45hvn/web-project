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
    <link rel="stylesheet" href="/soccer/css/teaminformation.css">
  
    <style>
    
    </style>
</head>

   	<%@include file="/WEB-INF/views/inc/header.jsp" %>
	
    <div id="topBoard">
    </div>

    <div id="scoreBoard">
        <div id="subOuter">
		<div class="menuTitleBox">
			<div class="menuTitle">구단현황</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>구단현황</span> <span>></span> <span>구단정보</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem" style="background-color: #0F0D0D">구단정보</li>
						<li class="subMenuItem">구단선수정보</li>
						<li class="subMenuItem">구단경기전적</li>
					</ul>
				</nav>
			</div>

		</div>
	</div>

    </div>
    <!-- 상단부 끝 -->


        
        <div class="center">
            <div class="pageContentTitle"  >
                <img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg" /><span class="contentTitle">구단현황</span>
            </div>
                <div class="outerBox">
                    <div class="leftSideBox">
                        <div class="introOuter">
                            <div class="smallTitle">${teamInfo.teamname} FC 홈페이지 입니다.</div>
                            <div class="join" >
                                <form action=""><!-- transfer로 이동해야지 팀이름 들고서 -->
                                	<input class="btns btn btn-default" type="button" value="구단 가입 신청하기" id="btn1">
                                </form>
                            </div>
                            <div class="teamIntroBox"><img src="/soccer/images/${teamInfo.logo}" id="teamLogo" alt="teamLogo"></div>
                            <div class="introduce"> </div>
                            <div class="coachBox">
                                <div class="smallTitle">감독 소개</div>
                                <div id="coachBoxLeft"><img src="/soccer/images/${teamInfo.image}" alt=""><div>감독 : <span id="coachName">${teaminfo.coachname }</span></div></div>
                                <div id="coachBoxRight"><span>소개 : ${teamInfo.introduce }</span></div>

                            </div>
                         </div>
                        
                         <table class="table table-bordered table-striped tblBox">
                         	<tr>
                         		<td colspan="4">
                         			<select id="league_seq" name="league_seq">
                         				<c:forEach items="${league}" var="league">
                         					<option value="${league.seq}">${league.name}</option>
                         				</c:forEach>
                         			</select>
                         		</td>
                         	</tr>
                            <tr>
                                <th>리그 평균 승률</th>
                                <th>리그 평균 득점</th>
                                <th>리그 평균 실점</th>
                                <th>리그 평균 도움</th>
                            </tr>
                            <tr>
                                <td>60%</td>
                                <td>1.12</td>
                                <td>3.2</td>
                                <td>2.14</td>
                            </tr>
                        </table>
                        
                    </div>
                    <div class="rightSideBox">
                        <div class="smallTitle">구단 등록 선수 [<span id="memberNum">${playerInfoSize}</span>]</div>
                        <div class="tblBox">
                            <table class="table table-bordered table-striped playerTable" >
                                <tr>
                                    <th>등번호</th>
                                    <th>이름</th>
                                    <th>포지션</th>
                                    <th>출생년도</th>
                                    <th>신장</th>
                                    <th>몸무게</th>
                                </tr>
                                <c:forEach items="${playerInfo}" var="playerInfo">
                                <tr>
                                    <td>${playerInfo.backnumber}</td>
                                    <td>${playerInfo.playername}</td>
                                    <td>${playerInfo.position }</td>
                                    <td>${playerInfo.birth }</td>
                                    <td>${playerInfo.height}cm</td>
                                    <td>${playerInfo.weight}kg</td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>

                    </div>
                </div>
                <div class="underSideBox">
                    <div class="rightside">
                        <div class="smallTitleOuter">
                        <div class="localplace smallTitle">연고지 : [<span>${teamInfo.home }</span>]</div>
                        <div class="localhome smallTitle">홈구장 : [<span id="homeground">${teamInfo.ground }</span>]</div>
                        </div>
                       <div id="map" style="width: 680px; height: 400px; z-index: 3 ; border: 2px solid black;"></div>
                    </div>
                    <div class="leftside">
                        <div class="smallTitle">연도별 정규리그 순위</div>
                        <div ><figure class="highcharts-figure"><div id="container"></div></figure></div>
                    </div>
                </div>
            </div>
        </div>
       <!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


<!-- 지도 ------------------------------------- -->
<script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a12f06129cc70984e1f6a7fa73684a75"></script>
<script>
 var lat=${teamInfo.lat};
 var lng=${teamInfo.lng};

 var container = document.getElementById("map");
 
 var options = {
     center: new kakao.maps.LatLng(lat, lng),
     level: 3,
 };
 
 var marker = new kakao.maps.Marker({
         position: new kakao.maps.LatLng(lat, lng),
     });
 
 var map = new kakao.maps.Map(container, options);
     marker.setMap(map);
            
</script>
<!-- 차트 ------------------------------------- -->
<script>
var flag = false;
$(document).scroll(function () {
    if ($(document).scrollTop() > $("#main").position().top) {
        if (!flag) {
            $("#main").css({
                position: "fixed",
                top: -$("#main").outerHeight(),
                bottom: "",
                zIndex:10
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

Highcharts.chart('container', {

  title: {
    text: ' 2018-2020'
  },

  subtitle: {
    text: ''
  },

  yAxis: {
    title: {
      text: '순위'
    },
    reversed:true,
    
  },

  xAxis: {
    accessibility: {
      rangeDescription: 'Range: 2018 to 2020'
    }
  },

  legend: {
    layout: 'vertical',
    align: 'right',
    verticalAlign: 'middle'
  },

  plotOptions: {
    series: {
      label: {
        connectorAllowed: false
      },
      pointStart: 2018
    }
  },

  series: [{
    name: '강남FC',
    data: [null,null,7,4]
  }, {
    name: '역삼FC',
    data: [3,4,5,7]
  }, {
    name: '언주FC',
    data: [2,5,7,6]
  }, ],

  responsive: {
    rules: [{
      condition: {
        maxWidth: 500
      },
      chartOptions: {
        legend: {
          layout: 'horizontal',
          align: 'center',
          verticalAlign: 'bottom'
        }
      }
    }]
  }

});

        </script>
</body>

</html>
