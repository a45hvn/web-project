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
	<link rel="stylesheet" href="/soccer/css/clubmanagementFriendlyMatchRecruitManagement.css">
	
    
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
                    <span>구단관리</span>
                    <span>></span>
                    <span>구단신청관리</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                          <li class="subMenuItem"><a href="clubmanagementClubApplicationManagement.html">구단신청관리</a></li>
                            <li class="subMenuItem"><a href="clubmanagementPlayerManagement.html">선수관리</a></li>
                            <li class="subMenuItem"><a href="clubmanagementEntrylistDrawup.html">엔트리작성</a></li>
                            <li class="subMenuItem"><a href="clubmanagementFriendlyMatchResultDrawup.html">경기결과반영</a></li>
                            <li class="subMenuItem"><a href="clubmanagementFriendlyMatchRecruitManagement.html">친선경기모집관리</a></li>
                            <li class="subMenuItem"><a href="#"></a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	
	 <div class="center">
        <div class="pageContentTitle"><img src="images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">친선경기모집관리</span></div>

                <div id="centerMainBox">
                    <div id="centerbox1">
                        <select name="" id="selectrow">
                            <option value="">10개씩 보기</option>
                            <option value="">25개씩 보기</option>
                            <option value="">50개씩 보기</option>   
                        </select>
                        <span id="sortform">
                            <a href="#" class="glyphicon glyphicon-list"></a>
                            <a href="#" class ="glyphicon glyphicon-list-alt"></a>
                            <a href="#" class="glyphicon glyphicon-th-large"></a>
                        </span>            
                    </div>
                    <div id="centerbox2">
                        <table class="table table-striped" id="verticalTable">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="" id="checkAll"></th>
                                    <th>순번</th>
                                    <th>말머리</th> 
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>일시</th>
                                    <th>인원</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>1</td>
                                    <td>친선경기모집(팀)</td>
                                    <td><a href="#">7월 18일 토요일 친선경기 하실 분 구합니다.(경기 시흥)</a></td> 
                                    <td>오희준</td>
                                    <td>2020.07.18</td>
                                    <td>18/38</td>      
                                    <td>미완료</td>        
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>2</td>
                                    <td>친선경기모집(용병)</td>
                                    <td><a href="#">7월 15일 토요일 친선경기 하실 분 구합니다.(경기 성남)</a></td> 
                                    <td>오희준</td>
                                    <td>2020.07.15</td>
                                    <td>2/5</td>      
                                    <td>미완료</td>    
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td>3</td>
                                    <td>친선경기모집(용병)</td>
                                    <td><a href="#">7월 12일 토요일 친선경기 하실 분 구합니다.(경기 용인)</a></td> 
                                    <td>오희준</td>
                                    <td>2020.07.11</td>
                                    <td>5/5</td>      
                                    <td>완료</td>     
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#"></a></td> 
                                    <td></td>
                                    <td></td>
                                    <td></td>      
                                    <td></td>              
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#"></a></td> 
                                    <td></td>
                                    <td></td>
                                    <td></td>      
                                    <td></td>         
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#"></a></td> 
                                    <td></td>
                                    <td></td>
                                    <td></td>      
                                    <td></td>            
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#"></a></td> 
                                    <td></td>
                                    <td></td>
                                    <td></td>      
                                    <td></td>         
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#"></a></td> 
                                    <td></td>
                                    <td></td>
                                    <td></td>      
                                    <td></td>           
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#"></a></td> 
                                    <td></td>
                                    <td></td>
                                    <td></td>      
                                    <td></td>             
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" id=""></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#"></a></td> 
                                    <td></td>
                                    <td></td>
                                    <td></td>      
                                    <td></td>        
                                </tr>           
                        </table>                     
                    </div>

                    <div id="centerbox5">
                        <input id="acceptBtn" type="button" value="승인" class="btn btn-primary">
                        <input id="refuseBtn" type="button" value="거절" class="btn btn-primary">
                    </div>
                    <div style="clear: both;"></div>

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
                    <div style="clear: both;"></div>
                    
                    <div id="centerbox4">
                        <div>
                            <select>
                                <option value="">제목</option>
                                <option value="">내용</option>
                                <option value="">제목+내용</option>
                                <option value="">글쓴이</option>
                            </select>
                            <input id="searchkeyword" type="text" size="35">
                            <a href=""><input id="searchbtn" type="button" value="검색" class="btn btn-primary"></a>                           
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                    
                </div>

    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

    	$("#pagination > li >a").click(function() {

        // alert($(this).text());            
        $("#pagination > li>a").removeClass("nowPage");    
        $(this).addClass("nowPage");            

        })  

        $("#searchbtn, #acceptBtn, #refuseBtn").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#searchbtn, #acceptBtn, #refuseBtn").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

        $("#verticalTable a").click(function() {                    
            // alert($(this));
            child = window.open(
            "clubmanagementFriendlyMatchRecruitManagementCheckMercenary.html",
            "check",
            "width=640, height=520, top=350, left=650"
        );
        }); 

        // 전체선택
        $("#checkAll").click(function () {
        
        //만약 전체 선택 체크박스가 체크된상태일경우 
        if($("#checkAll").prop("checked")) { 
            //해당화면에 전체 checkbox들을 체크해준다 
        $("input[type=checkbox]").prop("checked",true); 
        
        } 
            // 전체선택 체크박스가 해제된 경우 
        else { 
            //해당화면에 모든 checkbox들의 체크를해제시킨다. 
        $("input[type=checkbox]").prop("checked",false); }
        
        }); 

        
    </script>
    
    
</body>

</html>