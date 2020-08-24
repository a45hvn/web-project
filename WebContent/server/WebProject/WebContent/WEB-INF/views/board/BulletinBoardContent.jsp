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
	<link rel="stylesheet" href="/soccer/css/BulletinBoardContent.css">
    
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
                     <span>커뮤니티</span>
                    <span>></span>
                    <span>자유게시판</span>
                </div>
                <div class="subMenuBox">
                    <nav class="subMenu">
                        <ul>
                            <li class="subMenuItem"><a href="communityQuestionBulletinBoard.html">질문게시판</a></li>
                            <li class="subMenuItem"><a href="communityGalleryBulletinBoard.html">갤러리</a></li>
                            <li class="subMenuItem"><a href="communityFreeBulletinBoard.html">자유게시판</a></li>
                            <li class="subMenuItem"><a href="communityLectureBulletinBoard.html">강의게시판</a></li>
                            <li class="subMenuItem"><a href="#">친선경기모집</a></li>
                            <li class="subMenuItem"><a href="#">용병모집</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	
	<!-- Center -------------------------------------------- -->

    <div class="center">
        <div class="pageContentTitle"><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">자유게시판</span></div>

        <div id="centerBoxMain">
            
            <!-- 질문한 글 -->
            <div id="centerBox2" class="centerBox">
                <div>
                    <span>제목:${dto.title}</span>
                    <span>작성시간: ${dto.regdate}</span>
                    <span>작성자 | ${dto.name}</span>
                    <div style="clear: both;"></div>
                </div>
                <div>               	
                    <c:if test="${dto.orgfilename != 'null'}">
	                <div><img src="/soccer/files/${dto.orgfilename}"></div>
	                </c:if> 	      
	                <div class="content">${dto.content}</div>
                </div>
                
            </div>
            <!-- 답변목록 -->
            <div id="centerBox3" class="centerBox">                
                <div id="centerBox6">
                    <span>[댓글]</span>
                    <a href="">최신순</a>
                    <a href="">등록순</a>
                </div>
                <div>                    
                    <span>이수지</span>
                </div>
                <div class="content">홈화면에서 등록하기 누르시면 됩니다~</div>
                <div>
                    <span>2020.07.18 21:40</span>
                    <span><input type="button" value="답글쓰기" class="btn btn-primary"></span>
                </div>
            </div>       
            <!-- 답변하기 -->
            <div id="centerBox4" class="centerBox">
                <div>글쓴이 이름</div>
                <div><textarea name="" id="" cols="103" rows="1" placeholder="댓글을 남겨보세요."></textarea></div>
                <div>
                    <span><input type="button" value="이모티콘" class="btn btn-primary"></span>
                    <span><input type="button" value="등록" class="btn btn-primary"></span>
                </div>
            </div>
            <!-- 목록, Top, 수정, 삭제 -->
            <div id="centerBox5" class="centerBox">
                <span><input type="button" id="top" value="▲TOP" class="btn btn-primary"></span>
                <span><input type="button" value="목록" class="btn btn-primary" onclick="location.href='/soccer/board/communityFreeBulletinBoard.do?search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}';"></span>
               
				<!-- 수정 -->
                <c:if test="${id == dto.id}">
                <span><input type="button" value="수정" class="btn btn-primary" onclick="location.href='/soccer/board/edit.do?seq=${dto.seq}&search=${search}&page=${page}&selectKeyword=${selectKeyword}&selectrow=${selectrow}';"></span>
                </c:if>
                                
                <!-- 삭제 -->    
                <c:if test="${id == dto.id}">
                <span><a id="deleteBtn" onclick="return confirm('정말로 삭제하시겠습니까?')" href="/soccer/board/deleteok.do?seq=${dto.seq}" class="btn btn-primary">삭제</a></span>
                </c:if>
                
                
                 
            </div>

        </div>   

    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>
	
    	//마우스를 버튼위로 올렸을 때 색 변화
    	$("#centerBox5 > span input, #centerBox4 span input, #centerBox3 input ").mouseover(function() {

       		$(this).css("background-color", "#92DAEC").css("color", "black");

        })

        //마우스를 버튼위로 내렸을 때 색 변화
        $("#centerBox5 > span input, #centerBox4 span input, #centerBox3 input ").mouseout(function() {

        	$(this).css("background-color", "").css("color", "");

        })

        //화면 맨위로 가기
        $("#top").click(function(){
        	
        	window.scrollTo(0,450);
        	
        });
    	
        
    </script>
    
    
</body>

</html>