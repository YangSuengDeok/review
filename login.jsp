<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>요리보고 저리뷰 고</title>
    <link rel="stylesheet" type = "text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/login.css">
    <script src="jquery-3.4.1.js"></script>
</head>
<body>    
    <div class="login_box">
    <section class="login_form">
    <form action="loginAction.jsp" method="post">
        <h1> 로그인 </h1>
            <div class="int-area">
                <input type="text" name="userID" id="id"
                autocomplete="off" maxlength="20" required>
                <label for="id">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="userPassword" id="pw"
                autocomplete="off" required>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                <button id = "btn" type="submit" class="btn btn-primary form-control">LOGIN</button>
            </div>
	</form>
        <div class="caption">
            <a href="forgot.jsp">Forgot Password?</a>
        </div>
    </section>
    </div>
	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>