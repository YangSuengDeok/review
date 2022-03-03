<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="mainRiveiw.mainRiveiw" %>
<%@ page import="mainRiveiw.mainRiveiwDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
    <title>요리보고 저리뷰 고</title>
    <link rel="stylesheet" type = "text/css" href="css/bootstrap.css">
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
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int mainRiveiwID = 0;
	if(request.getParameter("mainRiveiwID") != null) {
		mainRiveiwID = Integer.parseInt(request.getParameter("mainRiveiwID"));
	}
	if (mainRiveiwID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'mainRiveiw.jsp'");
		script.println("</script>");
	}
	mainRiveiw riveiw = new mainRiveiwDAO().getMainRiveiw(mainRiveiwID);
	if (!userID.equals(riveiw.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'mainRiveiw.jsp'");
		script.println("</script>");
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
		<div class="row">
		<form method="post" action="mainUpdateAction.jsp?mainRiveiwID=<%= mainRiveiwID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">리뷰 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="file" class="form-control" placeholder="리뷰 사진" name="reg_img" maxlength="50" value="<%= riveiw.getReg_img() %>"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="카테고리" name="kategori" maxlength="50" value="<%= riveiw.getKategori() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="리뷰 내용" name="mainCentent" maxlength="2048" style="height: 350px;"><%= riveiw.getMainCentent() %></textarea></td>
					</tr>
				</tbody>				
			</table>
			<input type="submit" class="btn2 btn-primary pull-right" value="리뷰 수정">
		</form>
		</div>
	</div>

   
	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>