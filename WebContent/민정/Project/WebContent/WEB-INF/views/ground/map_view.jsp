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
		text-align: center;
	}
	#map{
		margin: 0px auto;
	}
	#close{
		background-color:#1b5b8f;
		color: white;
		font-size: 1.1em;
		font-weight: bold;
	}
</style>

</head>

<body>

	
	
	<div id="center">
	<div id="map" style="width:560px;height:430px;"></div>
	<br>
	<button id="close" class="btn btn-default btn-md" onclick="window.close();">닫기</button>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97657bc2431013b37e87a7e501e25268"></script>
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${dto.lat}, ${dto.lng}),//위도, 경도
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
	
	
</body>

</html>