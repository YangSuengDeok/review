<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reveiw.RiveiwDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="riveiw" class="reveiw.Riveiw" scope="page" />
<jsp:setProperty name="riveiw" property="riveiwTitle" />
<jsp:setProperty name="riveiw" property="riveiwContent" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>요리보고 저리뷰 고</title>
</head>
<body>    
	<%
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
    		if (riveiw.getRiveiwTitle() == null || riveiw.getRiveiwContent() == null) {
    				PrintWriter script = response.getWriter();
    				script.println("<script>");
    				script.println("alert('입력이 안된 사항이 있습니다.')");
    				script.println("history.back()");
    				script.println("</script>");
    			} else {
    				RiveiwDAO reveiwDAO = new RiveiwDAO();
    				int result = reveiwDAO.write(riveiw.getRiveiwTitle(), userID , riveiw.getRiveiwContent(), riveiw.getBbsCount());
    				if (result == -1) {
    					PrintWriter script = response.getWriter();
    					script.println("<script>");
    					script.println("alert('글쓰기에 실패했습니다.')");
    					script.println("history.back()");
    					script.println("</script>");
    				}
    				else {
    					PrintWriter script = response.getWriter();
    					script.println("<script>");
    					script.println("location.href = 'riveiw.jsp'");
    					script.println("</script>");
    				}
    			}
    		
    			}
    	%>
</body>
</html>