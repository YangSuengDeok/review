<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mainRiveiw.mainRiveiwDAO" %>
<%@ page import="mainRiveiw.mainRiveiw" %>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>	
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" type = "text/css" href="./css/newriveiw.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor="#F8F8FF">

<div class="categorybtn">
     <span class="fas fa-search"></span>
</div>
<nav class="categorysidebar">
    <div class="categorytext">Category</div>
        <ul>

                <li><a href=""><i class="fas fa-shopping-basket"></i>&nbsp;편의점/마트</a></li>
                <li><a href=""><i class="fas fa-store"></i>&nbsp;음식점</a></li>
                <li><a href=""><i class="fas fa-walking"></i>&nbsp;&nbsp;운동</a></li>
                <li><a href=""><i class="fas fa-home"></i>&nbsp;문화시설</a></li>
                <li><a href=""><i class="fas fa-train"></i>&nbsp;&nbsp;교통</a></li>
                <li><a href=""><i class="fas fa-kiwi-bird"></i>&nbsp;기타</a></li>


        </ul>

</nav>

<%
	request.getSession().getServletContext().getRealPath("/");
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); // 로그인을 한 사람이라면 이제 고유 아이디가 담긴다 그렇지 않은 사람들은 null값이 담긴다
	}
	int  pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<script>

    $('.categorybtn').click(function(){
        $(this).toggleClass("click");
        $('.categorysidebar').toggleClass("show");
    });

    $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
    });
</script> 
	<div class="container">
		<header>
			<p>저리뷰 고</p>
			<ul>
				<li><a href="index.jsp">home</a></li>
				<li><a href="riveiw.jsp">게시판</a></li>
				<li><a href="customer.jsp">고객센터</a></li>
			</ul>
		</header>
		<hr size ="5" width="100%" align="center" color="black" id="h">
	
		<section border="1">
		<p>리뷰 게시판</p>
		<p>
		<table width="100%"align="center" cellspacing="30px">
			<%
				mainRiveiwDAO mainRiveiwDAO = new mainRiveiwDAO();
				ArrayList<mainRiveiw> list = mainRiveiwDAO.getList(pageNumber);
				for(int i = 0; i < list.size(); i++){ 
			%>
				<tr>
					<td><a href ="newMainVeiw.jsp?mainRiveiwID=<%= list.get(i).getMainRiveiwID() %>"><img src="${pageContext.request.contextPath}/upload/<%=list.get(i).getReg_img() %>" width="300" height="300"><br><p align="center"></p></a></td>
					<td align="left">
					
					작성자 : <%=list.get(i).getUserID() %><br>
					카테고리 : <%=list.get(i).getKategori() %><br>
					리뷰 내용 : <%=list.get(i).getMainCentent() %><br>
					작성일 : <%=list.get(i).getReg_date() %><br>
					조회수 : <%=list.get(i).getBbsCount() %>
					
					</td>
				</tr>
			<%} %>
		</table>	
		</p>
		<form method="post" action="searchedBbs.jsp">
		<input type="text" name="search" placeholder="카테고리를 입력하세요."> 
		<button type="submit" class="btn2 btn-primary mx-1 mt-2">검색
		<span class="glyphicon glyphicon-search"></span>
		</button>
		</form>
		<a href="mainWrite.jsp">리뷰 남기기</a>
		</section>
		
		<footer>
		<p style="color:gray">신안산대학교</p>
		</footer>
	
	
	</div>

	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>