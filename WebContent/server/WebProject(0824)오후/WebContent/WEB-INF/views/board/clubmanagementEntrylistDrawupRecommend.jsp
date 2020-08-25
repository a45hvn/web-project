<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">
    <link rel="stylesheet" href="/soccer/css/clubmanagementEntrylistDrawupRecommend.css">
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>
    <script src="/soccer/js/jquery-ui.js"></script>
    <style>

    </style>
</head>

<body>

   
   <div id="mainBox">
        <div id="box1">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th></th>
                        <th>포지션</th>
                        <th>번호</th>
                        <th>이름</th>
                        <th>나이</th>
                    </tr>                    
                </thead>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>FW</td>
                    <td>2</td>
                    <td>오희준</td>
                    <td>26</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>FW</td>
                    <td>2</td>
                    <td>오희준</td>
                    <td>26</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>FW</td>
                    <td>2</td>
                    <td>오희준</td>
                    <td>26</td>
                </tr>     
                <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>FW</td>
                    <td>2</td>
                    <td>오희준</td>
                    <td>26</td>
                </tr>   
                <tr>
                    <td><input type="checkbox" name="" id="cb1"></td>
                    <td>FW</td>
                    <td>2</td>
                    <td>오희준</td>
                    <td>26</td>
                </tr>            
            </table>
        </div>
        <div id="box2">
            <span><input type="button" value="완료" class="btn btn-primary"></span>
            <span><input type="button" value="취소" class="btn btn-primary"></span>
        </div>        
    </div>

    <style>

       

    </style>

    <script>

    	$("#box2 input").mouseover(function() {

        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("#box2 input").mouseout(function() {

        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");

        })

    </script>

</body>

</html>