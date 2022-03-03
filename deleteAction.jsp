<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reveiw.RiveiwDAO" %>
<%@ page import="reveiw.Riveiw" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
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
    			if (!userID.equals(riveiw.getUserID())) {
    				PrintWriter script = response.getWriter();
    				script.println("<script>");
    				script.println("alert('권한이 없습니다.')");
    				script.println("location.href = 'riveiw.jsp'");
    				script.println("</script>");
    			} else {
    				
    				RiveiwDAO reveiwDAO = new RiveiwDAO();
    				int result = reveiwDAO.delete(riveiwID);
    				if (result == -1) {
    					PrintWriter script = response.getWriter();
    					script.println("<script>");
    					script.println("alert('글 삭제에 실패했습니다.')");
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
    	%>
</body>
</html>