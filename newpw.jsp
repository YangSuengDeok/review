<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PW</title>
    <link rel="stylesheet" type = "text/css" href="./css/newpw.css">
</head>
<body>
    <form>
        <div class="box">
            현재 비밀번호 : <input type="text">
            <input type="button" value="다음에 하기" onclick="location.href='index.jsp'">
            새로운 비밀번호 : <input type="password" placeholder="NEW PASSWORD">
            비밀번호 확인 : <input type="password" placeholder="NEW PASSWORD">
            <input type="submit" value="변경하기">
            
        </div>
    </form>
    
</body>
</html>