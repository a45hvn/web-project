<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/soccer/css/jquery-ui.css">
    <link rel="stylesheet" href="/soccer/css/bootstrap.css">    
    <script src="/soccer/js/jquery-1.12.4.js"></script>
    <script src="/soccer/js/bootstrap.js"></script>
    <script src="/soccer/js/jquery-ui.js"></script>
    <style>

	   #mainBox {
           /* border: 1px solid black; */
           /* width: 1000px;            */
           font-size: 1.1em;
           font-weight: bold;
       }
       
       #box1 {
           border: 1px solid black;
           width: 400px;           
           margin: 0 auto;         
           margin-bottom: 5px;             
       }
       
       #box2 {
           /* border: 1px solid black;            */
           width: 250px;           
           padding-left: 80px;           
           margin: 0 auto;                    
       }

       table {
           /* border: 1px solid black; */
           text-align: center;   
       }

       table tr {
            border: 1px solid white;
       }

       table tr, table td{
            /* border: 1px solid cornflowerblue; */
            padding: 10px;                        
       }

       table select, table input, #box2 input{            
            height: 25px;
            text-align: center;
            /* background-color: red; */            
       }

       table tr:nth-child(1) td:nth-child(1) {
            width: 70px;           
            
       }

       table tr:nth-child(2) input {
           width: 80px;
           text-align: center;
       }

       table tr:nth-child(5) input {
            float: right;   
            margin-left: 5px;
       }

        table tr td:nth-child(1)  {
           background-color: #92DAEC;
       }

        table {
            /* background-color: #0C1B23; */
       }

        #table2 th, #table2 td{
           border: 1px solid black;                      
       }

       /* checkbox들 */
       #table2 td:nth-child(1) {           
           background-color: white;
           padding-right: 18px;
       }

       /* 시간 기입 */
       #time {         
            width: 40px; 
            height: 25px;           
       }

       /* 추가버튼, 삭제버튼 */
       .btn {           
           margin-top: 10px;
           height: 25px;
           line-height: 0.8em;
       }
       
    </style>
</head>

<body>

   
      <div id="mainBox">
        
        <div id="box1">
            <table id="table1">
                <tr>
                    <td>팀</td>
                    <td>
                        <select name="" id="">
                        <option value="">역삼FC</option>
                        <option value="">강남FC</option>
                        <option value="">서울FC</option>
                        <option value="">인천FC</option>
                        </select>
                    </td>
                    <td>
                        <select name="" id="">
                        <option value="">역삼FC</option>
                        <option value="">강남FC</option>
                        <option value="">서울FC</option>
                        <option value="">인천FC</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>점수</td>
                    <td><input type="text" name="" id=""></td>
                    <td><input type="text" name="" id=""></td>
                </tr>
                <tr>
                    <td>날짜</td>
                    <td colspan="2"><input type="date" name="" id=""></td>                    
                </tr>
                <tr>
                    <td>시간</td>
                    <td colspan="2"><input type="time" name="" id=""></td>                    
                </tr>
                <tr>
                    <td>내용</td>                    
                    <td colspan="2">
                        <table id="table2">
                            <thead> 
                                <!-- <input type="button" value="+" id="add"> -->
                                <tr>
                                    <td>
                                        <input type="checkbox" name="" id="">
                                    </td>
                                    <td>팀</th>
                                    <td>선수</th>
                                    <td>시간</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="" class="cbcheck" value="1">
                                    </td>
                                    <td>
                                        <select name="" id="">
                                            <option value="">역삼FC</option>
                                            <option value="">강남FC</option>
                                            <option value="">서울FC</option>
                                            <option value="">인천FC</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="" id="">
                                            <option value="">오희준</option>
                                            <option value="">권택진</option>
                                            <option value="">이수지</option>
                                            <option value="">최재성</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" name="" id="time" style="height: 24px;">
                                    </td>
                                </tr>
                            </tbody>
                            
                        </table>
                        <div><input type="button" value="삭제" id="btnAdd" style="" class="btn"></div>
                        <div><input type="button" value="추가" id="btnDel" style="" class="btn"></div>
                    </td>
            </table>
        </div>
                <div id="box2">
                    <input type="button" value="완료" style="" class="btn">
                    <input type="button" value="취소" style="" class="btn">
                </div>
    </div>

    <style>

       

    </style>

    <script>

    $("input").mouseover(function() {
        // alert($(this).text());
        $(this).css("background-color", "#92DAEC").css("color", "black");

        })

        $("input").mouseout(function() {
        // alert($(this).text());
        $(this).css("background-color", "").css("color", "");
        })
   
       /*  var nums={};
        $(".cbcheck").click(function(){
            $(this).val();
            $(this).parent().parent().remove();
        })

        $("#btnDel").click(function(){

        }) */

    </script>

</body>

</html>