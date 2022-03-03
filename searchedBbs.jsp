<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="mainRiveiw.newDAO"%>
<%@ page import="mainRiveiw.mainRiveiw"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
    <title>요리보고 저리뷰 고</title>
    <link rel="stylesheet" type = "text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type = "text/css" href="./css/searched.css">
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
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber =1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			System.out.println("pageNumber="+pageNumber);
		}
		String search = null;
		if(request.getParameter("search")!=null){
			search = (String) request.getParameter("search");
			System.out.println("search from parameter is :" + search);
		}
		if(session.getAttribute("search")!=null){
			search = (String) session.getAttribute("search");
			System.out.println("search from session is :" + search);
		}
	%>
	
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
					newDAO main = new newDAO();
					ArrayList<mainRiveiw> list = main.getSearchedList(pageNumber, search);
					for (int i = 0; i < list.size(); i++) {
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
					<%
						}
					%>
			</table>	
		</p>
		<form method="post" action="searchedBbs.jsp">
		<input type="text" name="search" placeholder="카테고리를 입력하세요." > 
		<button type="submit" class="btn2 btn-primary mx-1 mt-2">검색
		<span class="glyphicon glyphicon-search"></span>
		</button>
		</form>
		<a href="mainWrite.jsp">리뷰 남기기</a>
		</section>
		
		<footer>
		<p style="color:gray">신안산대학교</p>
		</footer>
			
			<%
				if(pageNumber != 1) {
			%>
				<a href="mainRiveiw.jsp?pageNumber=<%=pageNumber - 1 %>" class= "btn btn-success btn-arraw-left">이전</a>	
			<%
				} if (main.nextPage(pageNumber + 1)) {
			%>
				<a href="mainRiveiw.jsp?pageNumber=<%=pageNumber + 1 %>" class= "btn btn-success btn-arraw-left">다음</a>	
			<%
				}
			%>
			
		</div>
	
<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>