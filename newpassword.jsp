<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PW</title>
    <link rel="stylesheet" type = "text/css" href="css/newpassword.css">
		
	
</head>
<body>
    <form method="post" action="newpasswordAction.jsp">
        <div class="box">
        	���̵� : <input type="text" name="userID">
            ���� ��й�ȣ : <input type="password" name="userPassword">
            <input type="button" value="������ �ϱ�" onclick="location.href='index.jsp'">
            ���ο� ��й�ȣ : <input type="password" placeholder="NEW PASSWORD" name="usernewPassword1">
            ��й�ȣ Ȯ�� : <input type="password" placeholder="NEW PASSWORD" name="usernewPassword2">
            <input type="submit" value="�����ϱ�">
            
        </div>
    </form>
    
</body>
</html>