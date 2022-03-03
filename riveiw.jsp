<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="reveiw.RiveiwDAO" %>
<%@ page import="reveiw.Riveiw" %>
<%@ page import="java.util.ArrayList" %>
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

<style type="text/css">
	a, a:hover {
		color:#000000;
		text-decoration: none;
	}
</style>

</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); // 로그인을 한 사람이라면 이제 고유 아이디가 담긴다 그렇지 않은 사람들은 null값이 담긴다
	}
	int  pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
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
				<li><a href="index.jsp">home</a></li>
				<li><a href="riveiw.jsp">게시판</a></li>
				<li><a href="customer.jsp">고객센터</a></li>
			</ul>
		</header>
		<hr size ="5" whidth="100%" align="center" color="black" id="h">
	</div>
	
	<div class="container">
		<div class="row">
			<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%					
						RiveiwDAO riveiwDAO = new RiveiwDAO();
						ArrayList<Riveiw> list = riveiwDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getRiveiwID() %></td>
						<td><a href ="veiw.jsp?riveiwID=<%= list.get(i).getRiveiwID() %>"><%= list.get(i).getRiveiwTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getRiveiwDate().substring(0, 11) + list.get(i).getRiveiwDate().substring(11, 13) + "시" + list.get(i).getRiveiwDate().substring(14, 16) + "분" %></td>
						<td><%= list.get(i).getBbsCount() %></td>
						
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
				<a href="riveiw.jsp?pageNumber=<%=pageNumber - 1 %>" class= "btn btn-success btn-arraw-left">이전</a>	
			<%
				} if (riveiwDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="riveiw.jsp?pageNumber=<%=pageNumber + 1 %>" class= "btn btn-success btn-arraw-left">다음</a>	
			<%
				}
			%>
			<a href="write.jsp" class="btn2 btn-primary pull-right">글쓰기</a>
		</div>
	</div>

   
	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>