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
     #playerSearch tr{
            /* border: 1px solid black; */
            font-size: 1.2em;
        }

        #playerSearch {
            width: 400px;
        }

        .pageContentTitle{
            margin-bottom: 50px;
        }

        #playerList tbody tr th{
            text-align: center;

        }
        #playerList tbody tr td:nth-child(1n+2){
            text-align: center;
            /* border: gray 1px solid; */
        }

        .playerInfo{
            text-align: center;
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
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem" style="background-color: rgb(15, 13, 13);"><a href="playerStatus.jsp">선수현황</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->



	<!-- 내용 시작 -->
	
	<div class="center" style="height: auto;">
        <div class="pageContentTitle"><img src="../images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">전체선수목록</span></div>
      
        <div id="playerSearch">
            <table class="table table-bordered" style="border: 1px solid black;">
                <tr>
                    <th>선수검색</th>
                    <td>
                        <input type="text" id="playerSearchText">
                        <input type="button" value="검색" id="playerSearchButton">
                        <!-- <input onkeyup="filter()" type="text" id="value" placeholder="Type to Search"> -->
                    </td>
                </tr>
                <tr>
                    <th>포지션</th>
                    <td>
                        <select name="position1" id="position1">
                            <option>전체</option>
                            <option>공격수(FW)</option>
                            <option>미드필더(MF)</option>
                            <option>수비수(DF)</option>
                            <option>골키퍼(GK))</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>

        <hr style="border: 1px solid black;">

        <div id="playerList">
            <table class="table table-bordered">
                <tr>
                    <th>선수명</th>
                    <th>소속팀</th>
                    <th>생년월일</th>
                    <th>포지션</th>
                    <th>상세보기</th>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">홍길동</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">공격수(FW)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">권진현</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">골키퍼(GK)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">황용하</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">미드필더(MF)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">김호연</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">수비수(DF)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">홍길동</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">미드필더(MF)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">홍길동</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">공격수(FW)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">홍길동</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">공격수(FW)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">홍길동</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">공격수(FW)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">홍길동</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">공격수(FW)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                <tr>
                    <td>
                        <div class="playerInfo">
                            <div><img src="../images/man_01.png" alt="" style="width: 100px;"><span class="playername">홍길동</span></div>
                        </div>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="teamName">쌍용FC</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="birth">1980-04-15</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <span class="positions">공격수(FW)</span>
                    </td>
                    <td>
                        <br>
                        <br>
                        <input type="button" value="상세보기" class="btn btn-primary"></td>
                </tr>
                
            </table>

            <div>
                <nav>
                    <ul class="pagination">
                      <li>
                        <a href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li>
                        <a href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                  
            </div>
        </div>
        
    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

    $(".btn-primary").click(function () {

        location.href="playerDetails.do"
        
    });

    // 검색결과
    
    $("#playerSearchButton").click(function () {

        //선수이름 입력창 값
        var playerSearchText = $("#playerSearchText").val();
        //선수 포지션 선택값
        var playerPositionS = $("#position1 option:selected").val();
        
        //선수리스트 이름 목록
        var playername = $(".playername");

        //선수리스트 포지션 목록
        var playerPositionL = $(".positions");



        // console.log(playerPosition);
        // console.log(playerPositionL[0].innerText);
        
        for(var i=0; i<playername.length; i++) {
            
            // console.log(playerSearchText == playername[i]);

            if(playerSearchText == playername[i].innerText && playerPositionS == playerPositionL[i].innerText) {

                playername[i].parentElement.parentElement.parentElement.parentElement.style.display = "show";

             } else {
                playername[i].parentElement.parentElement.parentElement.parentElement.style.display = "none";
            }


        }
        
        
    }); 

        
    </script>
    
    
</body>

</html>