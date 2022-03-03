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

                <li><a href=""><i class="fas fa-shopping-basket"></i>&nbsp;������/��Ʈ</a></li>
                <li><a href=""><i class="fas fa-store"></i>&nbsp;������</a></li>
                <li><a href=""><i class="fas fa-walking"></i>&nbsp;&nbsp;�</a></li>
                <li><a href=""><i class="fas fa-home"></i>&nbsp;��ȭ�ü�</a></li>
                <li><a href=""><i class="fas fa-train"></i>&nbsp;&nbsp;����</a></li>
                <li><a href=""><i class="fas fa-kiwi-bird"></i>&nbsp;��Ÿ</a></li>


        </ul>

</nav>

<%
	request.getSession().getServletContext().getRealPath("/");
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); // �α����� �� ����̶�� ���� ���� ���̵� ���� �׷��� ���� ������� null���� ����
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
			<p>������ ��</p>
			<ul>
				<li><a href="index.jsp">home</a></li>
				<li><a href="riveiw.jsp">�Խ���</a></li>
				<li><a href="customer.jsp">������</a></li>
			</ul>
		</header>
		<hr size ="5" width="100%" align="center" color="black" id="h">
	
		<section border="1">
		<p>���� �Խ���</p>
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
					
					�ۼ��� : <%=list.get(i).getUserID() %><br>
					ī�װ� : <%=list.get(i).getKategori() %><br>
					���� ���� : <%=list.get(i).getMainCentent() %><br>
					�ۼ��� : <%=list.get(i).getReg_date() %><br>
					��ȸ�� : <%=list.get(i).getBbsCount() %>
					
					</td>
				</tr>
			<%} %>
		</table>	
		</p>
		<form method="post" action="searchedBbs.jsp">
		<input type="text" name="search" placeholder="ī�װ��� �Է��ϼ���."> 
		<button type="submit" class="btn2 btn-primary mx-1 mt-2">�˻�
		<span class="glyphicon glyphicon-search"></span>
		</button>
		</form>
		<a href="mainWrite.jsp">���� �����</a>
		</section>
		
		<footer>
		<p style="color:gray">�žȻ���б�</p>
		</footer>
	
	
	</div>

	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>