<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
    <title>요리보고 저리뷰 고</title>
   	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" type = "text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type = "text/css" href="./css/index.css">
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
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#" class="info-btn">내 정보
                <span class="fas fa-caret-down first"></span>
            </a>
            <ul class="info-show">
                <li><a href="#">프로필</a></li>
                <li><a href="profileformal.jsp">프로필 설정</a></li>
                <li><a href="riveiw.jsp">내 게시글</a></li>
            </ul>
            </li>
            <li><a href="map.jsp" target="_blank">지도</a></li>
            <li><a href="#" class="s-btn">설정
                <span class="fas fa-caret-down second"></span>
            </a>
            <ul class="s-show">
                <li><a href="#">알림</a></li>
                <li><a href="customer.jsp">고객센터</a></li>
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



    <h1>
        <span>저</span><span>리</span><span>뷰</span> <span>고</span>
    </h1>
    <form action="https://www.google.com/search" method="GET">
        <div class="mx-auto mt-5 search-bar input-group mb-3 active">
            <input name="q" type="text" class="rounded-pill form-control" placeholder="가고 싶은 곳을 검색하시오." aria-label="Recipient's username" aria-describedby="button-addon2">
        </div>
    </form>
    
    <%
    	if (userID == null) {
    %>
    
    	<table class="wi">
        <tr>
            <td>
                <h6><a href="login.jsp"> 로그인 </a></h6>
            </td>
            <td>
                <h6><a href="join.jsp"> 회원가입 </a></h6>
            </td>
        </tr>

    	</talbe>
    
    <%
    	} else {
    %>
   
   		<table class="wi">
        <tr>
            <td>
                <h6><a href="#" target="_blank"> 회원관리 </a></h6>
            </td>
            <td>
                <h6><a href="logoutAction.jsp"> 로그아웃 </a></h6>
            </td>
        </tr>

    </talbe>
   
   <%
    	}
   %>
   
   
	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>