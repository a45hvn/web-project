<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>  
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>  

<style>
	#center{
		border: 1px solid red;
		text-align:center;
		position: relative;
		
		top: 430px;
	}
	#map{
		position: relative;
		float:right;
	
	}
	#close{
		background-color:#1b5b8f;
		color: white;
		font-size: 1.1em;
		font-weight: bold;
		margin: 0px auto;
	}	
	
</style>

</head>
<body>
	
	<form name="searchform" action="${page.Context.request.contextPath}/ground/map_new.do" method="GET">
	<div>
		<input type="text" name = "search" id="search" placeholder="이름을 입력하세요">
		<input type = "submit" id="go_search" value="검색" class="btn btn-default btn-md">
	</div>
	</form>
	<div id="map" style="width:600px;height:430px;"></div>
	<br><div id="center">
	<button id="close" class="btn btn-default btn-md" onclick="window.close();">닫기</button>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97657bc2431013b37e87a7e501e25268"></script>
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.566826, 126.9786567),//위도, 경도
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		var places = new kakao.maps.services.Places();
		places.setMap(map);
		
		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        console.log(result);
		    }
		};

		places.keywordSearch('판교 치킨', callback);
	</script>
	
</body>
</html>