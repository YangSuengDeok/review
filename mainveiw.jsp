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
	mainRiveiw main = new mainRiveiwDAO().getMainRiveiw(mainRiveiwID);
%>    
   
  
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">리뷰 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">리뷰 사진</td>
						<td colspan="2"><%= main.getReg_img() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= main.getUserID() %></td>
					</tr>
					<tr>
						<td>작성 일자</td>
						<td colspan="2"><%= main.getReg_date().substring(0, 11) + main.getReg_date().substring(11, 13) + "시" + main.getReg_date().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td colspan="2"><%= main.getKategori() %></td>
					</tr> 
					<tr>
						<td>리뷰 내용</td>
						<td colspan="2" style="min-height: 200px; text-glign: left;"><%= main.getMainCentent().replaceAll(" ", "&nbsp").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>				
			</table>
			<a href="mainRiveiw.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(main.getUserID())) {
			%>
					<a href="mainUpdate.jsp?mainRiveiwID=<%= mainRiveiwID %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('이 내용을 삭제하시겠습니까?')" href="mainDeleteAction.jsp?mainRiveiwID=<%= mainRiveiwID %>" class="btn btn-primary">삭제</a>
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