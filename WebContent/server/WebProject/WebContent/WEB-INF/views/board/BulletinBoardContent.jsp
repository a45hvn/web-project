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

        .center {            
            padding-top: 50px;
            background-color: #eee;     
        }

        /* 박스전체 */
        #centerBoxMain{
            /* border: 1px solid black;             */
            width: 1250px;
            /* height: 1000px; */
            margin: 0px auto;          
            font-size: 1.1em;     
        }

        /* 질문내용 박스 */
        #centerBox2 {
            margin-top: 25px;
            border-bottom: 1px solid #0C1B23; 
            border-top: 1px solid #0C1B23; 
            border-bottom-style: dashed;
            width: 1150px;            
            display: inline-block;
        }

        /* 답글내용 박스 */
        #centerBox3 {            
            /* border: 1px solid red; */
            border-bottom: 1px solid #0C1B23; 
            border-bottom-style: dashed;
            width: 1150px;               
        }

        /* 답글쓰기 박스 */
        #centerBox4 {
            /* border: 1px solid #0C1B23;  */
            border-bottom: 1px solid #0C1B23; 
            border-bottom-style: dashed;
            width: 1150px;            
        }

        /* 목록버튼 , TOP버튼 박스 */
        #centerBox5 {
            /* border: 1px solid #0C1B23;  */
            width: 1150px;            
            display: inline-block;
            margin-top: 10px;
            margin-bottom: 25px;
        }

        /* 박스전체의 박스*/
        .centerBox {          
            margin-left: 25px;
        }

        /* 질문박스 span들 */
        #centerBox2 span {
            /* border: 1px solid blue;                         */
            padding-top: 5px;            
            margin-left: 5px;   
            float: right;                 
            margin-right: 5px;   
            font-weight: bold;                 ;                 
        }

        /* 질문박스 제목 */
        #centerBox2 span:nth-child(1) {
            /* background-color: red; */
            float: left;            
            padding-left: 5px;                        
        }

        /* 질문박스 내용 */
        #centerBox2 .content {
            /* border: 1px solid blue; */
            height: 250px;            
            margin-left: 5px;            
            padding: 5px;
            margin-top: 10px;
        }

        /* 답글박스 div들 */
        #centerBox3 div {
            /* border: 1px solid green;                         */
            margin-left: 5px;                     
            font-weight: bold; 
            padding-left: 5px;   
        }

        /* 답글쓰기 글쓴이 */
        #centerBox3 div:nth-child(1) {
            padding-top: 8px;            
        }

        /* 답글 내용 */
        #centerBox3 .content {
            height: 100px;
            font-weight: normal;
            padding-top: 5px;                        
        }

        /* 답글내용 3번째 dvi */
        #centerBox3 div:nth-child(4) {
            /* border: 1px solid green;                 */
            margin-bottom: 5px;
        }

        /* 댓글 박스 div들 */
        #centerBox4 div {
            /* border: 1px solid indigo;                         */
            padding: 5px;
            font-weight: bold;            
            padding-left: 10px;
            
        }
        
        /* 이미티콘버튼, 등록버튼 */
        #centerBox4 div span input {
            /* border: 1px solid indigo;                         */
            /* background-color: red; */
        }

        /* 댓글쓰기 내용 */
        #centerBox4 textarea {
            resize:none;
        }

        /* 목록버튼, TOP버튼 */
        #centerBox5 > span {
            /* border: 1px solid red; */
            width: 50px;
            float: right;     
            margin-right: 15px;
            margin-left: 5px;                                                       
        }

        /* 모든 버튼들 */
        #centerBox5 > span input, #centerBox4 span input, #centerBox3 input {            
            /* background-color: #1E3440; */
            /* color: white;   */
            height: 25px;
            line-height: 0.8em;
        }

        #centerBox6 {
            /* border: 1px solid red; width: 150px; */
            margin-left: 33px;
            margin-top: 7px;
            margin-bottom: 15px;
        }

        #centerBox6 span {
            background-color: #1E3440;
            font-size: 1.1em;
            color: white;  
            padding: 3px;
            font-weight: bold;
        }

        #centerBox6 a {
            color: black;
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
        <div class="pageContentTitle"><img src="images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">자유게시판</span></div>

        <div id="centerBoxMain">
            
            <!-- 질문한 글 -->
            <div id="centerBox2" class="centerBox">
                <div>
                    <span>제목: [등록/이적]구단 등록 어떻게 하나요?</span>
                    <span>작성시간: 2020.07.18 21:35</span>
                    <span>작성자 | hejun</span>
                    <div style="clear: both;"></div>
                </div>
                <div class="content">새로 가입했는데 <br>
                    구단 등록 하려면 어떻게 해야 되나요?
                </div>
            </div>
            <!-- 답변목록 -->
            <div id="centerBox3" class="centerBox">                
                <div id="centerBox6">
                    <span>댓글</span>
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
            <!-- 목록, Top -->
            <div id="centerBox5" class="centerBox">
                <span><input type="button" value="▲TOP" class="btn btn-primary"></span>
                <span><input type="button" value="목록" class="btn btn-primary"></span>
            </div>

        </div>   

    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

    	$("#centerBox5 > span input, #centerBox4 span input, #centerBox3 input ").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#centerBox5 > span input, #centerBox4 span input, #centerBox3 input ").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

        
    </script>
    
    
</body>

</html>