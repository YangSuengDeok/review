<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.commentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="comment" class="comment.comment" scope="page" />
<jsp:setProperty name="comment" property="mainRiveiwID" />
<jsp:setProperty name="comment" property="commentText" />
<jsp:setProperty name="comment" property="star1" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>요리보고 저리뷰 고</title>
</head>
<body>    
 <%
 	String star1 = null;
 	if(request.getParameter("star1") != null) {
		star1 = (String) request.getParameter("star1");
	}
 
	String userID = null;
	if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); // 자신에게 할당된 고유 아이디
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {
		if (comment.getCommentText() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				commentDAO commentDAO = new commentDAO();
				int result = commentDAO.write(comment.getCommentText(), comment.getMainRiveiwID(), userID, comment.getStar1());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'newMainVeiw.jsp?mainRiveiwID="+comment.getMainRiveiwID()+"'");
					script.println("</script>");
				}
			}
	}
 %>
</body>
</html>