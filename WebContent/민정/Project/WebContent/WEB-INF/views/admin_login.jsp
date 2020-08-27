<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="en">

<head>
    
   	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>  
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_111.css" />
</head>
<style>
    

    body {
        background-color: #f2f4f7
    }

    .loginBox {
        padding: 35px;
        width: 500px;
        height: 800px;
        margin: 100px auto;

    }

    .loginBox>div>img {
        width: 150px;
        height: 150px;
        float: left;

        margin: 35px 130px;
    }

    /* 
    .loginBox>div:first-child {
        width: 300px;
        height: 170px;
        padding: 20px;
        border: 1px solid #000; */
    /* margin: 30px 120px; */
    /* } */

    .loginInput>.id,
    .loginInput>.pw,
    .loginInput>.loginBtn {
        width: 400px;
        height: 50px;
        margin: 10px;
    }

    .loginInput>.loginBtn {
        background-color: #8f8f8f;
        color: white;
        font-size: 1.5em;
        line-height: 35px;

    }

    .loginInfo {
        margin-top: 40px;
        font-size: 0.9em;
        padding-left: 18px;
    }

    .loginInfo>a {
        margin: 10px;
    }

    .signIn>a {
        position: relative;
        top: 20px;
        width: 200px;
        float: left;

    }

    #copy {
        color: #8f8f8f;
        position: relative;
        top: 170px;
        left: 100px;
        font-size: 0.8em;

    }
</style>

<body>
    <div class="loginBox">
        <div><img src="${pageContext.request.contextPath}/images/rogo_3.png" id="rogo" style="margin-bottom: 70px;"></div>
        <div class="loginInput">
            <input type="text" class="id required form-control" id="login-id" title="manager ID" value placeholder="manager ID">
            <input type="password" class="pw required form-control" id="login-pw" title="password" value placeholder="password">
            <a href="#" class="loginBtn btn" id="loginBtn">로그인</a>

        </div>
        
        <hr>
        
        <div id="copy">Copyrightⓒ ssangyongsoft All Rights reserved.</div>
    </div>
</body>
    <script>
        $("#rogo").hover(function () {
            $(this).css("cursor","pointer")
        }).click(function () {
            location.href="main.html"
        });
    </script>

</html>