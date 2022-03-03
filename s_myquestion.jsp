<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question</title>
    <link rel="stylesheet" type = "text/css" href="./css/s_myquestion.css">
</head>
<body>
    <form>
    <div class="box">
        질문 선택 : <select>
            <option value=""></option>
            <option value="area">당신이 태어난 지역은?</option>
            <option value="food">당신이 좋아하는 음식은?</option>
            <option value="player">당신이 좋아하는 선수는?</option>
            <option value="schcool">당신의 초등학교는?</option>
        </select><br><br>
        답 :     <input type="text" name="answer">
        <br><br>
        <input type="submit" value="설정완료"><input type="reset" value="취소">
    </div>
    </form>
</body>
</html>