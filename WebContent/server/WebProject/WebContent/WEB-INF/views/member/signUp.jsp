<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">
    <script src="/soccer/js/bootstrap.js"></script>
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/jquery-ui.js"></script>
	<style>

        #mainForm {
           width: 700px;
           margin: 0px auto;
        }
        
		#input {
			
			margin-top: 100px;
		}
		
		
        #input div{
            font-size: 1.2em;
        }

        #agreeform{
            width: 700px;
            margin: 0px auto;
        }
        #agreeform > div{
            width: 500px;
        }
        h3{
            margin-top: -70px;
            font-weight: bold;
        }

        label{
            margin-left: -20px;
        }
        textarea{
            width: 500px;
        }

        #agreeButton{
            width: 600px;
            margin: 0px auto;
            padding-bottom: 100px;
        }

        .import{
            font-weight: bold;
            color: royalblue;
            font-size: 1.2em;
        }

        .inputText{
            margin-bottom: 20px;
            height: 35px;
        }
        
        #mainrogo{
        	position: relative;
        	left: 150px
        }
        
        hr {
        	border: 1px solid black;
        }

	</style>
</head>
<body>
    <script src="/soccer/js/jquery-ui.js"></script>
		<div id="mainForm">
        <div><img src="../images/rogo.png" alt="" id="mainrogo"></div>
        <div id="input">
            <h3><span class="glyphicon glyphicon-ok"></span>  회원가입</h3>
            <hr>
            <form method="POST" action="/soccer/member/signUpok.do" enctype="multipart/form-data" autocomplete="off" id="signForm">
                <div>아이디</div> 
                <input type="text" id="id" name="id" size="50px" class="inputText" placeholder="아이디를 입력하세요" >
                <button type="button" id="btnCheck" >중복검사</button>
                <span id="result"></span>
                <div>비밀번호</div>
                <input type="password" id="password" name="password" size="50px" class="inputText" placeholder="비밀번호를 입력하세요" > <b>* 8자리이상(영문 + 숫자)</b>
                <div>비밀번호확인</div>
                <input type="password" id="rePassword" name="repassword" size="50px" class="inputText" placeholder="비밀번호를 다시 입력하세요" >
                <div>이름</div>
                <input type="text" id="name" name="name" size="50px" class="inputText" placeholder="이름을 입력하세요" >
                <div>생년월일</div>
                <input type="text" id="date" name="date" size="50px" class="inputText" placeholder="생년원일을 선택하세요" >
                <div>주소</div>
                <input type="text" id="address" name="address" size="50px" class="inputText" placeholder="주소를 입력하세요" >
                <div>연고지</div>
                <select name="homeseq" id="homeseq" class="inputText">
                <option value="1:서울">1:서울</option>
                <option value="2:부산">2:부산</option>
                <option value="3:대구">3:대구</option>
                <option value="4:인천">4:인천</option>
                <option value="5:광주">5:광주</option>
                <option value="6:대전<">6:대전</option>
                <option value="7:울산">7:울산</option>
                <option value="8:세종">8:세종</option>
                <option value="9:경기">9:경기</option>
                <option value="10:강원">10:강원</option>
                <option value="11:충북">11:충북</option>
                <option value="12:충남">12:충남</option>
                <option value="13:전북">13:전북</option>
                <option value="14:전남">14:전남</option>
                <option value="15:경북">15:경북</option>
                <option value="16:경남">16:경남</option>
                <option value="17:제주">17:제주</option>
            	</select>
                <div>휴대전화번호</div>
                <input type="text" id="tel" name="tel" size="20px" class="inputText" style="text-align: center;" maxlength="13" > 
                <input type="file" id="image" name="image" name="image" placeholder="사진" class="inputText">
            </form>
        </div>
        <hr >
	</div>

    <div id="agreeform">
        <div class="agree">
            <div class="checkbox">
                <input type="checkbox" name="checkAll" id="checkAll">
                <label for="checkAll">
                    나는 축구왕 이용약관, 개인정보 취급방침 모두 동의합니다.<span class="import">(필수)</span>
                </label>
            </div>
            <div class="checkbox">
                <input type="checkbox" name="check1" id="check1">
                <label for="check1">
                    나는 축구왕 이용약관 동의 <span class="import">(필수)</span>
                </label>
            </div>
            <textarea name="" id="" cols="30" rows="10" readonly>제 1 조 (목적)

이 약관은 나는 축구왕이 운영하는 웹사이트에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 합니다)를 나는 축구왕 계정(이하 “나는 축구왕 계정”이라 합니다)으로 가입하여 이용함에 있어 나는 축구왕과 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다.
            
제 ２ 조 (정의)

1. [나는축구왕]이란 [협회]가 재화 또는 용역(이하 “재화 등”이라 합니다)을 이용자에게 제공하기 위하여 컴퓨터 등 정보 통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며 아울러 [시흥시야구협회, 시흥시야구협회 웹사이트]를 운영하는 사업자의 의미로도 사용합니다.
2. [이용자]란 [시흥시야구협회]에 접속하여 이 약관에 따라 [시흥시야구협회]의 "서비스"를 이용하는 자를 통칭합니다.
3. [회원]이라 함은 [이용자] 중 [시흥시야구협회 계정]에 등록하고 [시흥시야구협회]에 개인정보를 제공하여 회원등록을 한 자로서,
[시흥시야구협회]의 정보를 지속적으로 제공받으며 [시흥시야구협회]이 제공하는 "서비스"를 계속적으로 이용할 수 있는 자를 말합니다.
4. [아이디(ID)]라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 [협회]가 승인하는 문자와 숫자의 조합을 의미합니다.
5. [비밀번호]라 함은 "회원"이 부여 받은 아이디(ID)와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
6. [유료서비스]라 함은 [시흥시야구협회]이 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, 통계서비스, 동영상, 리포트, 아이템 및 기타 유료 콘텐츠를 포함) 및
제반 서비스를 의미합니다. 7. [선불전자지급수단]이라 함은 원볼포인트 등 [협회]가 발행 당시 미리 "회원"에게 공지한 전자금융거래법상 "선불전자지급수단"을 말합니다.
8. [게시물]이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스"상에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
9. [사이트]라 함은 [협회]가 "서비스"를 "회원"에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 협회가 운영하는 웹사이트, 모바일웹,
            앱 등의 서비스를 통칭하여 말합니다.
            
            제 3 조 (약관등의 명시와 설명 및 개정)
            
            1. [시흥시야구협회]은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함),
            전화번호, 전자우편주소, 사업자 등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 알 수 있도록 [시흥시야구협회]의 서비스 화면에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. 2. [시흥시야구협회]은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구합니다.
            
            3. [시흥시야구협회]은 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 및 정보보호등에 관한 법률, 방문판매등에 관한 법률, 소비자보호법 등 관련법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
            
            4. [시흥시야구협회]은 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 시흥시야구협회 웹사이트의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 [시흥시야구협회]은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
            
            5. [시흥시야구협회]은 약관을 개정할 경우에는 그 개정약관은 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 [시흥시야구협회]에 송신하여 [시흥시야구협회]의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
            
            6. [시흥시야구협회]이 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사 표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정 약관에 동의한 것으로 봅니다.
            
            7. 회원이 개정약관의 적용에 동의하지 않는 경우 협회는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 협회는 이용계약을 해지할 수 있습니다.8. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제등에 관한 법률, 공정거래위원회가 정하는 전자상거래등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
            </textarea>
        </div>
        <div class="agree">
            <div class="checkbox">
                <input type="checkbox" name="check2" id="check2">
                <label for="check2">
                    개인정보 취급방침에 대한 동의 <span class="import">(필수)</span>
                </label>
            </div>
            <textarea name="" id="" cols="30" rows="10" readonly>제 1 조 (목적)

이 약관은 나는축구왕(이하 “커뮤니티”라 합니다)가 운영하는 축구커뮤니티 웹사이트에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 합니다)를 나는축구왕 계정(이하 “나는축구왕 계정”이라 합니다)으로 가입하여 이용함에 있어 나는축구왕과 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다.

 제 ２ 조 (정의)
1. [나는축구왕 ]이란 [협회]가 재화 또는 용역(이하 “재화 등”이라 합니다)을 이용자에게 제공하기 위하여 컴퓨터 등 정보 통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며 아울러 [시흥시야구협회, 시흥시야구협회 웹사이트]를 운영하는 사업자의 의미로도 사용합니다.
2. [이용자]란 [시흥시야구협회]에 접속하여 이 약관에 따라 [시흥시야구협회]의 "서비스"를 이용하는 자를 통칭합니다.
3. [회원]이라 함은 [이용자] 중 [시흥시야구협회 계정]에 등록하고 [시흥시야구협회]에 개인정보를 제공하여 회원등록을 한 자로서,
[시흥시야구협회]의 정보를 지속적으로 제공받으며 [시흥시야구협회]이 제공하는 "서비스"를 계속적으로 이용할 수 있는 자를 말합니다.
4. [아이디(ID)]라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 [협회]가 승인하는 문자와 숫자의 조합을 의미합니다.
5. [비밀번호]라 함은 "회원"이 부여 받은 아이디(ID)와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
6. [유료서비스]라 함은 [시흥시야구협회]이 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, 통계서비스, 동영상, 리포트, 아이템 및 기타 유료 콘텐츠를 포함) 및
            제반 서비스를 의미합니다. 7. [선불전자지급수단]이라 함은 원볼포인트 등 [협회]가 발행 당시 미리 "회원"에게 공지한 전자금융거래법상 "선불전자지급수단"을 말합니다.
            8. [게시물]이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스"상에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
            9. [사이트]라 함은 [협회]가 "서비스"를 "회원"에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 협회가 운영하는 웹사이트, 모바일웹,
            앱 등의 서비스를 통칭하여 말합니다.
            
            제 3 조 (약관등의 명시와 설명 및 개정)
            
            1. [시흥시야구협회]은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함),
            전화번호, 전자우편주소, 사업자 등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 알 수 있도록 [시흥시야구협회]의 서비스 화면에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. 2. [시흥시야구협회]은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구합니다.
            
            3. [시흥시야구협회]은 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 및 정보보호등에 관한 법률, 방문판매등에 관한 법률, 소비자보호법 등 관련법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
            
            4. [시흥시야구협회]은 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 시흥시야구협회 웹사이트의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 [시흥시야구협회]은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
            
            5. [시흥시야구협회]은 약관을 개정할 경우에는 그 개정약관은 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 [시흥시야구협회]에 송신하여 [시흥시야구협회]의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
            
            6. [시흥시야구협회]이 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사 표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정 약관에 동의한 것으로 봅니다.
            
            7. 회원이 개정약관의 적용에 동의하지 않는 경우 협회는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 협회는 이용계약을 해지할 수 있습니다.8. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제등에 관한 법률, 공정거래위원회가 정하는 전자상거래등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
            </textarea>
        </div>

        
        <hr>
    </div>
    
    



    
    <div id="agreeButton">
        <button type="button" class="btn btn-primary" id="btnSubmit">회원가입</button>
        
    </div>


	<script>
	
	 //아이디 중복검사
    $("#btnCheck").click(function() {
		//ajax 처리
		$.ajax({
			type: "POST",
			url: "/soccer/member/idCheck.do",
			data: "id=" + $("#id").val(),
			dataType: "json",
			success: function(result) {
				
				//result = { "use": 1 }
				//alert(result.use);
				if (result.use == 0) {
					$("#result").text("사용 가능한 아이디입니다.");
					$("#result").css("color", "royalblue");
				} else {
					$("#result").text("이미 사용중인 아이디입니다.");
					$("#result").css("color", "red");
				}
				
			},
			error: function(a,b,c) {
				
				console.log(a,b,c);
			}
		});
		
	});
	
	$("#date").datepicker({
		dateFormat: "yy-mm-dd",
    });
    
    // 약관모두동의
    $("#checkAll").click(function () {
        //만약 전체 선택 체크박스가 체크된상태일경우 
        if($("#checkAll").prop("checked")) { 
            //해당화면에 전체 checkbox들을 체크해준다 
        $("input[type=checkbox]").prop("checked",true); 
        // 전체선택 체크박스가 해제된 경우 
        } 
        else { 
            //해당화면에 모든 checkbox들의 체크를해제시킨다. 
        $("input[type=checkbox]").prop("checked",false); }
        
    });

    //div 숨기기
    // $("#updateModal").hide();

    //유효성검사
    $("#btnSubmit").click(function () {

        var id = $("#id").val();
        var pw = $("#password").val();
        var rpw = $("#rePassword").val();
        var name = $("#name").val();
        var date = $("#date").val();
        var tel = $("#tel").val();
        var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,}$/;
        var namechk = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

        if(id == "") {
            alert("아이디를 입력 해주세요.")

            $("#id").focus();
        }

        else if(pw == "") {
            alert("비밀번호를 입력 해주세요.")

            $("#password").focus();
        }

        else if(false === reg.test(pw)) {
            alert("비밀번호를 확인 해주세요.")
            
            $("#password").focus();
        }

        else if(pw != rpw) {
            alert("비밀번호가 일치하지 않습니다.")

            $("#rePassword").focus();
        }
        
        else if( name == "") {
            alert("이름을 입력 해주세요.")

            $("#name").focus();
        }
        else if (false == namechk.test(name)) {
            alert("이름은 한글만 입력가능합니다.")

            $("#name").focus();
        }

        else if( date == "") {
            alert("생년월일을 입력 해주세요.")

            $("#date").focus();
        }
        else if( tel == "") {
            alert("휴대전화번호를 입력 해주세요.")

            $("#tel").focus();
        }

        else if ( $("#check1").is(":checked") == false ) {
            alert("약관에 동의해주세요.")
        }

        else if ( $("#check2").is(":checked") == false ) {
            alert("약관에 동의해주세요.")
        }
        else {
        	
			$("#signForm").submit();    
		
        }
    });
    
   
    
 	 

    </script>
    <script src="/soccer/js/event.js"></script>
    <script src="/soccer/js/submain.js"></script>
</body>
</html>