<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="reveiw.Riveiw" %>
<%@ page import="reveiw.RiveiwDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
    <title>요리보고 저리뷰 고</title>
    <link rel="stylesheet" type = "text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type = "text/css" href="./css/riveiw.css">
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
	int riveiwID = 0;
	if(request.getParameter("riveiwID") != null) {
		riveiwID = Integer.parseInt(request.getParameter("riveiwID"));
	}
	if (riveiwID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'riveiw.jsp'");
		script.println("</script>");
	}
	Riveiw riveiw = new RiveiwDAO().getRiveiw(riveiwID);
%>

<div class="btn3">
        <span class="fas fa-bars"></span>
    </div>
<nav class="sidebar">
    <div class="text">Menu</div>
        <ul>
            <li><a href="main.jsp">Home</a></li>
            <li><a href="#" class="info-btn">내 정보
                <span class="fas fa-caret-down first"></span>
            </a>
            <ul class="info-show">
                <li><a href="#">내 정보</a></li>
                <li><a href="#">내 즐겨찾기</a></li>
                <li class="active"><a href="#">내 게시글</a></li>
            </ul>
            </li>
            <li><a href="map.jsp" target="_blank">지도</a></li>
            <li><a href="#" class="s-btn">설정
                <span class="fas fa-caret-down second"></span>
            </a>
            <ul class="s-show">
                <li><a href="#">알림</a></li>
                <li><a href="#">보안</a></li>
                <li><a href="customer.jsp" target="_blank">고객센터</a></li>
            </ul>
            </li>
        </ul>
    
</nav>

<script>
    $('.btn3').click(function(){
        $(this).toggleClass("click");
        $('.sidebar').toggleClass("show");
    });
    $('.info-btn3').click(function(){
        $('nav ul .info-show').toggleClass("show");
        $('nav ul .first').toggleClass("rotate");
    });
    $('.s-btn3').click(function(){
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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= riveiw.getRiveiwTitle().replaceAll(" ", "&nbsp").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= riveiw.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= riveiw.getRiveiwDate().substring(0, 11) + riveiw.getRiveiwDate().substring(11, 13) + "시" + riveiw.getRiveiwDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-glign: left;"><%= riveiw.getRiveiwContent().replaceAll(" ", "&nbsp").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td colspan="2"><%= riveiw.getBbsCount() +1%></td>
					</tr>
				</tbody>				
			</table>
			<a href="riveiw.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(riveiw.getUserID())) {
			%>
					<a href="update.jsp?riveiwID=<%= riveiwID %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('이 내용을 삭제하시겠습니까?')" href="deleteAction.jsp?riveiwID=<%= riveiwID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>

	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>