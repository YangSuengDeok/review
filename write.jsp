<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
    <title>요리보고 저리뷰 고</title>
    <link rel="stylesheet" type = "text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type = "text/css" href="./css/write.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); // 로그인을 한 사람이라면 이제 고유 아이디가 담긴다 그렇지 않은 사람들은 null값이 담긴다
	}
%>    
   
   
<div class="btn">
        <span class="fas fa-bars"></span>
    </div>
<nav class="sidebar">
    <div class="text">Menu</div>
        <ul>
            <li><a href="main.html" target="_blank">Home</a></li>
            <li><a href="#" class="info-btn">내 정보
                <span class="fas fa-caret-down first"></span>
            </a>
            <ul class="info-show">
                <li><a href="#">내 정보</a></li>
                <li><a href="#">내 즐겨찾기</a></li>
                <li><a href="#">내 게시글</a></li>
            </ul>
            </li>
            <li><a href="map.html" target="_blank">지도</a></li>
            <li><a href="#" class="s-btn">설정
                <span class="fas fa-caret-down second"></span>
            </a>
            <ul class="s-show">
                <li><a href="#">알림</a></li>
                <li><a href="#">보안</a></li>
                <li><a href="customer.html" target="_blank">고객센터</a></li>
            </ul>
            </li>
        </ul>
    
</nav>
<script>
    $('.btn').click(function(){
        $(this).toggleClass("click");
        $('.sidebar').toggleClass("show");
    });
    $('.info-btn').click(function(){
        $('nav ul .info-show').toggleClass("show");
        $('nav ul .first').toggleClass("rotate");
    });
    $('.s-btn').click(function(){
        $('nav ul .s-show').toggleClass("show1");
        $('nav ul .second').toggleClass("rotate");
    });
    $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
    });
</script>
	
	<div class="container">
		<header>
			<p><font size="5px">저리뷰 고</font></p>
			<ul>
				<li><a href="index.jsp"><font color="black">home</font></a></li>
				<li><a href="riveiw.jsp"><font color="black">게시판</font></a></li>
				<li><a href="customer.jsp"><font color="black">고객센터</font></a></li>
			</ul>
		</header>
		<hr size ="5" whidth="100%" align="center" color="black" id="h">
	</div>
	
	<div class="container">
		<div class="row">
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="riveiwTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="riveiwContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>				
			</table>
			<input type="submit" class="btn2 btn-primary pull-right" value="글쓰기">
		</form>
		</div>
	</div>

   
	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>