<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mainRiveiw.mainRiveiwDAO" %>
<%@ page import="mainRiveiw.mainRiveiw" %>
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
    	    	    			
    	    	    			int mainRiveiwID = 0;
    	    	    			if(request.getParameter("mainRiveiwID") != null) {
    	    	    				mainRiveiwID = Integer.parseInt(request.getParameter("mainRiveiwID"));
    	    	    			}
    	    	    			if (mainRiveiwID == 0) {
    	    	    				PrintWriter script = response.getWriter();
    	    	    				script.println("<script>");
    	    	    				script.println("alert('유효하지 않은 글입니다.')");
    	    	    				script.println("location.href = 'newriveiw.jsp'");
    	    	    				script.println("</script>");
    	    	    			}
    	    	    			mainRiveiw riveiw = new mainRiveiwDAO().getMainRiveiw(mainRiveiwID);
    	    	    			if (!userID.equals(riveiw.getUserID())) {
    	    	    				PrintWriter script = response.getWriter();
    	    	    				script.println("<script>");
    	    	    				script.println("alert('권한이 없습니다.')");
    	    	    				script.println("location.href = 'newriveiw.jsp'");
    	    	    				script.println("</script>");
    	    	    			} else {
    	    	    		if (request.getParameter("reg_img") == null || request.getParameter("kategori") == null || request.getParameter("mainCentent") == null
    	    	    				|| request.getParameter("reg_img").equals("") || request.getParameter("kategori").equals("") || request.getParameter("mainCentent").equals("")) {
    	    	    				PrintWriter script = response.getWriter();
    	    	    				script.println("<script>");
    	    	    				script.println("alert('입력이 안된 사항이 있습니다.')");
    	    	    				script.println("history.back()");
    	    	    				script.println("</script>");
    	    	    			} else {
    	    	    				mainRiveiwDAO mainDAO = new mainRiveiwDAO();
    	    	    				int result = mainDAO.mainUpdate(mainRiveiwID, request.getParameter("reg_img"), request.getParameter("kategori"), request.getParameter("mainCentent"));
    	    	    				if (result == -1) {
    	    	    					PrintWriter script = response.getWriter();
    	    	    					script.println("<script>");
    	    	    					script.println("alert('글 수정에 실패했습니다.')");
    	    	    					script.println("history.back()");
    	    	    					script.println("</script>");
    	    	    				}
    	    	    				else {
    	    	    					PrintWriter script = response.getWriter();
    	    	    					script.println("<script>");
    	    	    					script.println("location.href = 'newriveiw.jsp'");
    	    	    					script.println("</script>");
    	    	    				}
    	    	    			}
    	    	    		
    	    	    			}
    	%>
</body>
</html>