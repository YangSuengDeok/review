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
        ���� ���� : <select>
            <option value=""></option>
            <option value="area">����� �¾ ������?</option>
            <option value="food">����� �����ϴ� ������?</option>
            <option value="player">����� �����ϴ� ������?</option>
            <option value="schcool">����� �ʵ��б���?</option>
        </select><br><br>
        �� :     <input type="text" name="answer">
        <br><br>
        <input type="submit" value="�����Ϸ�"><input type="reset" value="���">
    </div>
    </form>
</body>
</html>