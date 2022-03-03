<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PW</title>
    <link rel="stylesheet" type = "text/css" href="css/forgotID.css">
		
	
</head>
<body>
    <form method="post" action="forgotIDAction.jsp">
        <div class="box">
        	이름 : <br>
        	<input type="text" name="userName"><br>
            주민등록번호 : <br>
            <input type="text" name="userJumin">-<input type="password" name="userJumin2">
            <input type="submit" value="아이디 찾기">      
        </div>
    </form>
    
</body>
</html>