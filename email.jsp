<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>email</title>
    <link rel="stylesheet" type = "text/css" href="./css/email.css">
</head>
<body>
    <form>
        <div class="box">
            E-mail <br><input type="text" placeholder="E-mail">
            <a>@</a>
            <select>
                <option value="self">직접입력</option>
                <option value="naver">naver.com</option>
                <option value="daum">daum.net</option>
                <option value="nate">nate.com</option>
                <option value="gmail">gmail.com</option>
                <option value="yahoo">yahoo.com</option>
            </select>
            <input type="text" placeholder="직접입력">
            <br><br><br>
           
          
            <input type="text" placeholder="인증번호입력">
            <input type="button" value="인증번호">
            <br><br>
            <input type="submit" value="확인">
            <br>
            <input type="reset" value="취소">
        </div>
    </form>
</body>
</html>