<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요리보고 저리뷰 고</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/customerr.css">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>


<div class="btn5">
        <span class="fas fa-bars"></span>
    </div>
<nav class="sidebar">
    <div class="text">Menu</div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#profile.jsp" class="info-btn">내 정보
                <span class="fas fa-caret-down first"></span>
            </a>
            <ul class="info-show">
                <li><a href="profile.jsp">프로필</a></li>
                <li><a href="profileformal.jsp">프로필 설정</a></li>
                <li><a href="riveiw.jsp">내 게시글</a></li>
            </ul>
            </li>
            <li><a href="map2.html" target="_blank">지도</a></li>
            <li><a href="#" class="s-btn5">설정
                <span class="fas fa-caret-down second"></span>
            </a>
            <ul class="s-show">
                <li><a href="#">알림</a></li>
                <li><a href="customer.jsp">고객센터</a></li>
            </ul>
            </li>
        </ul>
    
</nav>

	<div class="container">
		<header2>
			<p><font size="5px">저리뷰 고</font></p>
			<ul>
				<li><a href="index.jsp">home</a></li>
				<li><a href="riveiw.jsp">게시판</a></li>
				<li><a href="customer.jsp">고객센터</a></li>
			</ul>
		</header2>
		<hr size ="5" whidth="100%" align="center" color="black" id="h">
	
<script>
    $('.btn5').click(function(){
        $(this).toggleClass("click");
        $('.sidebar').toggleClass("show");
    });
    $('.info-btn').click(function(){
        $('nav ul .info-show').toggleClass("show");
        $('nav ul .first').toggleClass("rotate");
    });
    $('.s-btn5').click(function(){
        $('nav ul .s-show').toggleClass("show1");
        $('nav ul .second').toggleClass("rotate");
    });
    $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
    });
</script>

    <div class="box">
    
        <div class="header"> 고객센터 </div>
        <form action="https://www.google.com/search" method="GET">
            <div class="mx-auto mt-5 search-bar input-group mb-3">
                <input name="q" type="text" class="rounded-pill form-control" placeholder="가고 싶은 곳을 검색하시오." aria-label="Recipient's username" aria-describedby="button-addon2">
            </div>
        </form>

    <div class="spot"><h3>공지사항</h3> <span><a href="index.jsp" align="left">홈으로 돌아갑니다.</a></span></div><br>

    <div class="container">
    	<center>
        <h4 align="left">필요한 서비스를 선택하세요.</h4>
        </center>
    </div>

    <div class="content" align="left">
        <span class="tit">정보 관리</span> 
        <span class="tit_m">(아래의 링크들을 이용해주세요.)</span>
    </div>
    <div align="left">
        <ul>
            <li><a href="forgotID.jsp"> 저리뷰 ID/PW 찾기 </a></li>
            <li><a href="Security.jsp"> PWADDWORD 변경 </a></li>
            <li><a href="profileupdate.jsp"> 정보 수정 </a></li>
        </ul>
    </div>

    <div class="content" align="left">
        <span class="tit">신고센터</span> 
        <span class="tit_m">(유해 또는 침해에 대한 게시물을 발견 시 신고를 해주세요.)</span>
    </div>
	<ul align="left">
		<a href="report.jsp"><button type="submit" class="btn btn-danger">신고하기</button></a>
		<!--
		<li><a href="report.jsp" name="유해물 정보 신고"> 유해물 정보 신고 </a></li>
        <li><a href="#"> 저작권 침해 신고 </a></li>
        <li><a href="#"> 명예 훼손 신고 </a></li>
        <li><a href="#"> 도용 정보 신고 </a></li>
        -->
    </ul>
    </div>
            
    <script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.min.js"></script>        
</body>
</html>