<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="/soccer/css/teamlist.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<style>
</style>
</head>

<%@include file="/WEB-INF/views/inc/header.jsp"%>

<div id="topBoard"></div>

<div id="scoreBoard">
	<div id="subOuter">
		<div class="menuTitleBox">
			<div class="menuTitle">구단현황</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>구단현황</span>

			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem">구단정보</li>
						<li class="subMenuItem">구단선수정보</li>
						<li class="subMenuItem">구단경기정보</li>
					</ul>
				</nav>
			</div>

		</div>
	</div>

</div>
<!-- 상단부 끝 -->


<div class="center">
	<div class="pageContentTitle">
		<img src="../images/rogowithoutletter.png" class="contentTitleImg" /><span
			class="contentTitle">전체 팀 목록</span>
	</div>

	<div id="centerMainBox">
		<div id="centerbox1">
			<select name="" id="selectrow">
				<option value="">10개씩 보기</option>
				<option value="">25개씩 보기</option>
				<option value="">50개씩 보기</option>
			</select> <span id="sortform"> <a href="#"
				class="glyphicon glyphicon-list"></a> <a href="#"
				class="glyphicon glyphicon-list-alt"></a> <a href="#"
				class="glyphicon glyphicon-th-large"></a>
			</span>
		</div>
		<div id="centerbox2">
				
			<table class="table table-striped table-bordered" id="verticalTable"">
				<thead>
					<tr>
						<th>순번</th>
						<th>로고</th>
						<th>팀명</th>
						<th>감독</th>
						<th>창단일</th>
						<th>팀원수</th>
						<th>홈구장</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.seq}</td>
							<td><img src="/soccer/images/${dto.logo==null?nopic.png:dto.logo}" alt="" /></td>
							<td>${dto.name}FC</td>
							<td>${dto.coachname }</td>
							<td>${dto.birth}</td>
							<td>${dto.count}명</td>
							<td>${dto.ground}<span class='glyphicon glyphicon-map-marker'>${dto.lat},${dto.lng }</span></td>
							<%-- 연고지 따위는 넣지 않습니다. --%>
						</tr>
					 </c:forEach>
				</tbody>
			</table>
		</div>
	
		<!-- 페이지 바 들어가는 곳 -->
		<div id="centerbox4">
			<div style="float: right;">
				<form id="sendForm" method="GET" action="/team/teamlist.do">
					<select name="selectrow" id="selectrow">
						<option value="teamname">팀명</option>
						<option value="coach">감독</option>
						<option value="teamground">홈구장</option>
					</select>
					<input id="searchkeyword" type="text" size="35" style="" />
					<input class="btn btn-primary" id="searchbtn" type="button" value="검색" />
					<input class="btn btn-primary" id="writebtn" type="button" value="글쓰기" onclick=$(#sendForm).submit()/>
				</form>
			</div>
		</div>
	</div>
</div>
<style>
#centerMainBox {
	/* border: 1px solid black; */
	width: 1200px;
	/* height: 950px; */
	margin: 0px auto;
}

#centerbox1 {
	border-bottom: 1px solid black;
	width: 1200px;
	margin-bottom: 10px;
	display: inline-block;
}

#centerbox2 {
	/* border: 1px solid black; */
	width: 1200px;
	font-size: 1.1em;
}

#centerbox3 {
	/* border: 1px solid red; */
	width: 1200px;
}

#centerbox4 {
	/* border: 1px solid blue; */
	width: 1200px;
	display: inline-block;
	margin-bottom: 25px;
}

#centerbox1 span, #centerbox1 select {
	/* border: 1px solid red; */
	display: inline-block;
}

#verticalTable {
	/* border: 1px solid blue; */
	
}

#pagination {
	/* border: 1px solid gold; */
	
}

#sortform, #selectrow {
	float: right;
	/* border: 1px solid gold; */
}

#sortform {
	margin-right: 10px;
	margin-top: 17px;
}

#selectrow {
	margin-top: 10px;
	color: black;
	padding-bottom: 5px;
}

#verticalTable {
	width: 1200px;
	/* height: 650px; */
}

#verticalTable th:nth-child(1) {
	width: 65px;
}

#verticalTable th:nth-child(2) {
	width: 480px;
}

#verticalTable th:nth-child(3) {
	width: 120px;
}

#verticalTable th:nth-child(4) {
	width: 100px;
}

#verticalTable th:nth-child(5) {
	width: 65px;
}

#verticalTable th, #verticalTable td {
	color: black;
}

#verticalTable thead tr th {
	width: 800px;
	color: black;
}

#verticalTable tr {
	width: 800px;
}

#verticalTable tr:nth-child(even) {
	width: 800px;
}

/* 게시판 목록 형식 */
#sortform a {
	color: #1e3440;
	margin-bottom: 15px;
}

#pagination .nowPage {
	background-color: #92daec;
}

/* 페이지 버튼 */
#pagination li a {
	color: black;
	height: 25px;
	line-height: 0.8em;
}

/* input 태그들 */
#centerbox4 select, #selectrow, #searchbtn, #writebtn {
	height: 25px;
	color: black;
	line-height: 0.8em;
}
</style>

<!-- 하단부  -->
<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>

<!-- 스크립트------------------------------------------------------------- -->
<script>
            
            $("#pagination > li >a").click(function () {
                // alert($(this).text());
                $("#pagination > li>a").removeClass("nowPage");
                $(this).addClass("nowPage");
            });

            $("#searchbtn").mouseover(function () {
                // alert($(this).text());
                $(this).css("background-color", "#92DAEC").css("color", "black");
            });

            $("#searchbtn").mouseout(function () {
                // alert($(this).text());
                $(this).css("background-color", "").css("color", "");
            });

            $("#writebtn").mouseover(function () {
                // alert($(this).text());
                $(this).css("background-color", "#92DAEC").css("color", "black");
            });

            $("#writebtn").mouseout(function () {
                // alert($(this).text());
                $(this).css("background-color", "").css("color", "");
            });


            
            $("#centerbox2 td:last-child")
                .children()
                .mouseover(function () {
                    $(this).css({ cursor: "pointer" });
                })
                .click(function () {
                    console.log($(this).parent().text());
                });
        
        </script>
</body>
</html>
