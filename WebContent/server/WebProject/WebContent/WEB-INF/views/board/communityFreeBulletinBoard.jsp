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
    <link rel="stylesheet" href="/soccer/css/communityFreeBulletinBoard.css">
    
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
                            <li class="subMenuItem"><a href="friendlymatchrecruit.html">친선경기모집</a></li>
                            <li class="subMenuItem"><a href="mercenaryrecruit.html">용병모집</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>

    </div>
    <!-- 상단부 끝 -->

	<!-- 내용 시작 -->
	
	   <div class="center">
        <div class="pageContentTitle"><img src="/soccer/images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">자유게시판</span></div>

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
                    
                    <!-- 테이블 -->
                    <div id="centerbox2">
                        <table class="table table-striped" id="verticalTable" style="">
                            <thead>
                                <tr>
                                    <th>순번</th>
                                    <th>제목</th>                
                                    <th>작성자</th>
                                    <th>작성시간</th>
                                    <th>조회</th>
                                </tr>
                            </thead>
                            	
                            	<!-- 검색했는데 게시물이 없을 경우 -->
                            	<c:if test="${not empty search and list.size() == 0}">
                            		<tr>
                            			<td colspan="5">검색 결과가 없습니다.</td>
                            		</tr>                            		                            	
                            	</c:if>
                            	
                            	<!-- 게시물이 없을때 -->
                            	<c:if test="${empty search and list.size() == 0}">
                            		<tr>
                            			<td colspan=5>게시물이 없습니다.</td>
                            		</tr>
                            	</c:if>
                            	
                            
                            	<c:forEach items="${list}" var="dto">
                                <tr>
                                    <td>${dto.seq}</td>
                                    <td><a href="#">${dto.title}</a></td>
                                    <td>${dto.member_seq}</td>
                                    <td>${dto.regdate}</td>
                                    <td>${dto.readcount}</td>                   
                                </tr>    
                                </c:forEach>                                                          
                        </table>                     
                    </div>
        
        			<!-- 페이지 버튼 -->
                    <div id="centerbox3">                
                    
                        <!-- <ul id="pagination" class="pagination" style="float: right;">
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
                        </ul>    -->
                        
                        ${pagebar}
                        
                    </div> 
                    
                    <div id="centerbox4">
                        <div style="float: right;">
                        <!-- 검색창 -->                
                            <form method="GET" action="/soccer/board/communityFreeBulletinBoard.do" id="searchForm" style="display: inline;">
	                            <select>
	                                <option value="title" id="title">제목</option>
	                                <option value="content" id="content">내용</option>
	                                <option value="title_content" id="title_content">제목+내용</option>
	                                <option value="writer" id="writer">글쓴이</option>
	                            </select>                            
	                            <input id="searchkeyword" name="searchkeyword" type="text" size="35" style="height: 25px;" required value="${search}">
	                            <input id="searchbtn" type="button" value="검색" class="btn btn-primary" onclick="$('#searchForm').submit();">
                            </form>                           
                            <input id="writebtn" type="button" value="글쓰기" onclick=""; class="btn btn-primary">
                        </div>
                    </div>
                    
                </div>

    </div>
	
	
	<!-- 내용 끝 -->
	
	
	
	
	
	<!-- 하단부  -->
    <%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- 스크립트------------------------------------------------------------- -->
    <script>

        $("#pagination > li >a").click(function() {

            //alert($(this).text());            
            $("#pagination > li>a").removeClass("nowPage");    
            $(this).addClass("nowPage");            
            
        })  
        
             

        $("#searchbtn").mouseover(function() {

            // alert($(this).text());
            $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#searchbtn").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

        $("#writebtn").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#writebtn").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

        $("#verticalTable a").click(function() {                    
             alert($(this));
         
            location.href = "BulletinBoardContent.html"
                  
        }); 
        
       /* 
               검색 방법선택하는건데 이 방법 아닌것 같음..
       
       var itemValue="";
        $("#centerbox4 div form select").selectmenu({
        	change: function (event, data) {
        		itemValue=data.item.value;
        		alert(data.item.value);
        		location.href="/soccer/board/communityFreeBulletinBoard.do?type="+itemValue;	
        		
        	}
        	
        }); 
        
        */
  
        

    </script>
    
    
</body>

</html>