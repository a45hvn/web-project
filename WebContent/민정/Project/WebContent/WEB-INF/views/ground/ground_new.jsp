<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>  
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_111.css" />
    
    <style>

        #text1{
            /* border: 1px solid green; */
            position: relative;
            
        }


        .pageContentTitle{
            /* border: 1px solid green; */
            width: 1200px;
            margin: 0px auto;
            position: relative;
            top: 60px;
          
            
        }
        .center {            
            padding-top: 50px;
            background-color: #eee;  
            /* padding-bottom: 50px;                    */
            /* text-align: center; */
        }

        #centerMainBox {
            /* border: 1px solid black; */
            width: 1200px;
            height: 700px;
            margin: 0px auto;    
            font-size: 20px;        
            font-weight: bold;
            
        }

        #centerBox1 {
            /* border: 1px solid red; */
            width: 700px;
            height: 50px;
            float: left;          
            margin-left: 15px;  
            margin-bottom: 40px;
            padding-top: 40px;
        }

        #centerBox2 {
            /* border: 1px solid red; */
            
            width: 700px;
            height: 50px;             
            display: inline-block;
            margin-left: 15px;  
            padding-top: 40px;
            margin-bottom: 40px;

        }

        #centerBox3 {
             border: 1px solid green;
            width: 700px;
     		height:auto; 
            margin-left: 15px; 
            
            
            
        }
        
        #centerBox3 #ground_search{
        
        	float: left;
        }

        #centerBox4 {
            border: 1px solid red;
            width: 150px;
            height: 50px; 
            float: right;   
            margin-right: 58px;       
              
            
            position: relative;
            left: 60px;
            top: 230px;

        }

        #centerBox6 {
            border: 1px solid blue;
            width: 700px;
            height: 50px; 
            margin-left: 15px; 
            margin-bottom: 40px;
            padding-top: 40px;
        }
        #tbl1 select, #centerBox5 input, #centerBox4 input , #centerBox4 button{
            color: white; 
            background-color: #1E3440 ;
            padding-bottom: 5px;
        }

        

        #mainBox{
            position: relative;
            top: 0px;
            /* border: 1px solid hotpink; */
            width: 1000px;
            margin: 0px auto;
        }
        #centerBox7{
            border: 1px solid #ccc;
            width: 402px;
            height: 302px;
            position: relative;
            left: 500px;
            bottom: 150px;
            display: inline-block;
        }
        #address{
            width: 400px;
            height: 300px;
        }

		#blanck{
			width:40px;
		}
		
		#map{
			border: 1px solid gray;
		}
		
		#tbl1{
			position: relative;
			left: 50px;
			top: 100px;
		}
		
    </style>
</head>
<body>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    <div class="adminPage" id="adminPage">
        <ul id="ul1">
            <li style=" text-align: center;"><img id="admin_img" src="${pageContext.request.contextPath}/images/rogo5.png"></li>
            <li class="menu1"><a href="#">경기결과(리그)</a></li>
            <li class="menu2"><a href="#">경기결과(친선)</a></li>
            <li class="menu3"><a href="#">공지사항</a></li>
            <li class="menu4"><a href="#">블랙리스트</a></li>
            <li class="menu5"><a href="#">경기장 관리</a></li>
            <li class="menu6"><a href="#">경기장 일정</a></li>
            <li class="menu7"><a href="#">구단관리</a></li>
            <li class="menu8"><a href="#">선수관리</a></li>


        </ul>
    </div>
    <header>

    </header>
    <%! String searchKeyWord=""; %>
    <div class="center">
        <div class="pageContentTitle">
            <img src="${pageContext.request.contextPath}/images/rogowithoutletter.png" class="contentTitleImg">
            <span class="contentTitle">경기장 등록</span>
        </div>
        <div id="centerMainBox">

            <form name = "writeform" action="${pageContext.request.contextPath}/groundok.do" method="POST" >
                <div id="mainBox">
                <!-- 지역 입력 -->
                <div id="centerBox1">
                    
                   
                   
                </div>
				<!-- 경기장 검색 -->
				<table id="tbl1">
				<tr>
					<td>지역 : </td>
					<td id="blanck"></td>
					<td id="text1"> 
						<select name="location" id="selectrow" >
                        <option value="서울">서울</option>
                        <option value="부산">부산</option>
                        <option value="대구">대구</option>   
                        <option value="인천">인천</option>   
                        <option value="광주">광주</option>   
                        <option value="대전">대전</option>   
                        <option value="울산">울산</option>   
                        <option value="세종">세종</option>   
                        <option value="경기">경기</option>   
                        <option value="강원">강원</option>   
                        <option value="충북">충북</option>   
                        <option value="충남">충남</option>   
                        <option value="전북">전북</option>   
                        <option value="전남">전남</option>   
                        <option value="경북">경북</option>   
                        <option value="경남">경남</option>   
                        <option value="제주">제주</option>   
                    </select>
                   </td>
				</tr>
				<tr>
					<td colspan="3" style="height: 50px;">
				</tr>
				<tr>
					<td>경기장 이름 :</td>
					<td id="blanck"></td>
					<td><button value="검색" type = "button" id = "search_map"
					onclick="window.open('${pageContext.request.contextPath}/ground/map_new.do','팝업창 이름(map_new)','width=800,height=500');">검색</button></td>
				</tr>
				<tr>
					<td colspan="3" style="height: 50px;">
				</tr>
				<tr>
					<td>주소 :</td>
					<td id="blanck"></td>
					<td><input type="text" id="search_ground"></td>
				</tr>
				</table>
	              
	            <div id = "centerBox4">	
		        	<input type="button" value="등록" onclick="writeCheck();">
	                <button type="button" class="writebtn" id="writebtn2"  onclick="location.href='/soccer/ground/ground.do';"> 
	                	목록
	                </button>
                </div>
              </div>
            </form>
        </div>
        </div>
  
    
    <!-- 스크립트------------------------------------------------------------- -->
    <script>

        var flag = false;
        $(document).scroll(function () {

            if ($(document).scrollTop() > $
                ("#main").position().top) {

                if (!flag) {
                    $("#main").css({
                        position: "fixed",
                        top: -$("#main").outerHeight(),
                        bottom: ""
                    });

                    $("#main").animate({
                        top: "0px"
                    }, 1000, function () {
                        //alert();
                        flag = true;
                    });
                }

            }

        });
        
        function writeCheck() { var form = document.writeform; 	
    	
    	form.submit(); }
        
       
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97657bc2431013b37e87a7e501e25268"></script>
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.566826, 126.9786567),//위도, 경도
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
    <script src="js/eventAdmin.js"></script>
    <!-- <script src="js/submain.js"></script> -->
</body>
</html>