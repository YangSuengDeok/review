<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Security</title>
    <link rel="stylesheet" type = "text/css" href="./css/Security.css">
</head>
<body>
    <form>
        <div class="box">
            <div class="header">보안</div>
            <br>
            <input type="button" value="이메일 인증" onclick="location.href='email.jsp'">
            <br><br><br>
            <input type="button" value="본인인증을 위한 질문설정" onclick="location.href='s_myquestion.jsp'">
            <br><br><br> 
            <input type="button" value="비밀번호 변경" onclick="location.href='newpw.jsp'">
            
        </div>
    </form>
    
</body>
</html>