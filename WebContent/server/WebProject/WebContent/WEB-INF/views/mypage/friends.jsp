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
    <link rel="stylesheet" href="/soccer/css/friends.css">
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
                <div class="menuTitle">마이페이지</div>
                <div class="breadcrumb">
                    <span>HOME</span>
                    <span>></span>
                    <span>마이페이지</span>
                    <span>></span>
                    <span>친구관리</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="mypage.html">마이페이지</a></li>
                            <li class="subMenuItem"><a href="clubSummary.html">구단정보관리</a></li>
                            <li class="subMenuItem" style="background-color:rgb(15, 13, 13);"><a
                                    href="friends.html">친구관리</a></li>
                            <li class="subMenuItem"><a href="dm.html">DM</a></li>
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
                class="contentTitle">친구관리</span></div>

        <!-- 검색창 -->

        <div class="contentsBox">
            <div class="search">
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
                    </div>
                </div>
            </div>

            <div id="tabs">
                <ul>
                    <li id="tab1Title"><a href="#tab1">Following</a></li>
                    <li id="tab2Title"><a href="#tab2">Follower</a></li>
                </ul>
                 <form method="POST" action="/soccer/mypage/friendsok.do"> 
                <div id="tab1">
                    <div class="friendsBox">
                        <table class="friends table table-bordered table-striped">
                       		<c:forEach items="${followingList}" var="dto">     
                            <tr>
                                <td>${dto.followingName}<img src="/soccer/images/${dto.followingImage}"></td>
                                <td>축구사랑</td>
                                <td><input type="hidden" value="${dto.following_seq}" name="following_seq"></td>
                                <td><input type="submit" value="팔로우취소" id="unfollow" class=" btn btn-info" 
<%--                                  onclick="location.href='/codestudy/member/friendsok.do?${dto.following_seq}';" --%>
                                 > </td>

                            </tr>
                       </c:forEach>
                        </table>
                    </div>
                   
                </div>
                <div id="tab2">  
               
                    <div class="friendsBox">
                        <table class="friends table table-bordered table-striped">
                        <c:forEach items="${followerList}" var= "dto">
                            <tr>
                            <td>${dto.followerName}<img src="/soccer/images/${dto.followerImage}"></td>
                            <td>축구사랑</td>
                            <td><input type="hidden" value="${dto.follower_seq}" name="follower_seq"></td>
                            <td><input type="submit" value="팔로우" id="follow" class=" btn btn-info" > </td>
<%--                             onclick="location.href='/codestudy/member/friendsok.do?${dto.follower_seq}';" --%>
                            </tr>
                            </c:forEach>
                            </table>
                    </div>
                </div>
                    

</form>
            </div>
        </div>
    </div>

	
	
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>
    
    
    $("#tabs").tabs({
        active: 2
    });
    // $('#tabs').css('border', "1px solid red");
    $('#tabs:even').css('background', "white");
    $('#tab1Title').css('background', "white");
    $('#tab2Title').css('background', "white");

   

        
    </script>
    
    
</body>

</html>