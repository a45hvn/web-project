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
	<link rel="stylesheet" href="css/clubmanagementPlayerManagement.css">
    
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
                class="contentTitle">선수관리</span></div>

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
                        <table class="table table-striped" id="verticalTable" style="">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="" id="checkAll"></th>
                                    <th>순번</th>
                                    <th>포지션</th> 
                                    <th>이름</th>
                                    <th>나이</th>
                                    <th>전화번호</th>                                    
                                    <th>입단일시</th>
                                </tr>
                            </thead>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th>1</th>
                                    <th>MF</th> 
                                    <td><a href="#">오희준</a></td>
                                    <th>26</th>
                                    <th>010-2222-2222</th>                                    
                                    <th>2019.12.20</th>                   
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>     
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>      
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>   
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>   
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>    
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>     
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>     
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>     
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name="" id=""></th>
                                    <th></th>
                                    <th></th>   
                                    <td><a href="#"></a></td>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>    
                                </tr>           
                        </table>                     
                    </div>

                    <div id="centerbox4">
                        <div style="float: right;">
                           <input id="centerbox4Btn" type="button" value="방출하기" onclick=""; class="btn btn-primary">
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

    $("#centerbox4Btn").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#centerbox4Btn").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

        $("#centerbox2 tr td ").click(function() {                    
            // alert($(this));
            child = window.open(
            "clubmanagementPlayerManagementCheck.html",
            "check",
            "width=720, height=760, top=180, left=730"
                                                
        );
        }); 

        $("#centerbox4 input ").click(function() {                    
            // alert($(this));
            child = window.open(
            "clubmanagementPlayerRemove.html",
            "check",
            "width=420, height=190, top=250, left=750"
                                                
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