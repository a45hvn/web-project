<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/soccer/css/friendlymatchcontents.css">
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
			<div class="menuTitle">커뮤니티</div>
			<div class="breadcrumb">
				<span>HOME</span> <span>></span> <span>커뮤니티</span> <span>></span> <span>친선경기모집</span>
			</div>
			<div class="subMenuBox">
				<nav class="subMenu">
					<ul>
						<li class="subMenuItem"><a
							href="communityQuestionBulletinBoard.html">질문게시판</a></li>
						<li class="subMenuItem"><a
							href="communityGalleryBulletinBoard.html">갤러리</a></li>
						<li class="subMenuItem"><a
							href="communityFreeBulletinBoard.html">자유게시판</a></li>
						<li class="subMenuItem"><a
							href="communityLectureBulletinBoard.html">강의게시판</a></li>
						<li class="subMenuItem;"
							style="background-color: rgb(15, 13, 13);"><a
							href="friendlymatchrecruit.html">친선경기모집</a></li>
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

        <div class="pageContentTitle"><img src="images/rogowithoutletter.png" class="contentTitleImg"><span
                class="contentTitle">친선경기모집</span></div>
        <div id="contentsBox">


            <div id="centerBoxMain">

                <!-- 질문한 글 -->
                <div id="centerBox2" class="centerBox">
                    <div>
                        <span>제목: [친선경기모집] 7월 25일 친선경기 모집</span>
                        <span>작성시간: 2020.07.18 21:35</span>
                        <span>작성자 | heejun</span>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="content">
                        안녕하세요 dragon FC구단주 오희준입니다.<br>
                        7월 25일 경기를 같이 뛰실 팀을 모집합니다.<br>
                        신청해주시면 개별 연락 드릴게요.<br> 문의하실 내용은 아래 댓글로 달아주세요.<br>
                        일시 : 2020년 7월 25일 7시<br>
                        장소 : 서울시 서초구 양재동<br>
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
                    <div class="content">오전인가요 오후인가요?</div>
                    <div>
                        <span>2020.07.18 21:40</span>
                        <span><input type="button" value="답글쓰기" class="btn"></span>
                    </div>
                </div>
                <!-- 답변하기 -->
                <div id="centerBox4" class="centerBox">
                    <div>글쓴이 이름</div>
                    <div><textarea name="" id="" cols="103" rows="1"> 댓글을 남겨보세요</textarea></div>
                    <div>
                        <span><input type="button" value="이모티콘" class="btn"></span>
                        <span><input type="button" value="등록" class="btn"></span>
                    </div>
                </div>
                <!-- 목록, Top -->
                <div id="centerBox5" class="centerBox">
                    <span><input type="button" value="▲TOP" class="btn"></span>
                    <span><input type="button" value="목록" class="btn"></span>
                </div>
                <div><input type="button" value="신청하기" class="btn btn-info" id="applyBtn"></div>
            </div>
        </div>
    </div>
    </div>

    <!-- 친선경기신청 Modal-->
    <div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #25282A;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #92DAEC; display: inline;">친선경기신청</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" style="color:white">X</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>친선경기 신청이 완료되었습니다.</div>
                </div>
                <div class="modal-footer">
                    <!-- 비밀번호를 입력하고 ok버튼 누르면 회원 비밀번호와 비교하여 일치했을시 다시 물어보기  -->
                    <a class="btn" id="modalY" href="friendlymatchcontents.html">확인</a>
                    <button class="btn" type="button" data-dismiss="modal">cancle</button>
                </div>
            </div>
        </div>
    </div>



<!-- 내용 끝 -->





<!-- 하단부  -->
<%@include file="/WEB-INF/views/inc/footer.jsp"%>


<!-- 스크립트------------------------------------------------------------- -->
<script>
//신청하기 모달
$("#applyBtn").click(function (e) {
    e.preventDefault();
    $("#applyModal").modal("show");
});

</script>


</body>

</html>