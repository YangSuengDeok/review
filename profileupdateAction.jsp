<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
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
    			
    			User user = new UserDAO().getUser(userID);
    			
    			if (!userID.equals(user.getUserID())) {
    				PrintWriter script = response.getWriter();
    				script.println("<script>");
    				script.println("alert('권한이 없습니다.')");
    				script.println("location.href = 'profileupdate.jsp'");
    				script.println("</script>");
    			} else {
    				
    			if (request.getParameter("userName") == null || request.getParameter("userJumin") == null || request.getParameter("userJumin2") == null 
    					|| request.getParameter("userID") == null || request.getParameter("userPassword") == null
    					|| request.getParameter("quiz") == null || request.getParameter("quiz2") == null || request.getParameter("userEmail") == null
    					|| request.getParameter("userPhone") == null || request.getParameter("userPhone2") == null || request.getParameter("userPhone3") == null
    					|| request.getParameter("userName").equals("") || request.getParameter("userJumin").equals("") || request.getParameter("userJumin2").equals("") 
    					|| request.getParameter("userID").equals("") || request.getParameter("userPassword").equals("")
    					|| request.getParameter("quiz").equals("") || request.getParameter("quiz2").equals("") || request.getParameter("userEmail").equals("")
    					|| request.getParameter("userPhone").equals("") || request.getParameter("userPhone2").equals("") || request.getParameter("userPhone3").equals("")) {
    					PrintWriter script = response.getWriter();
    					script.println("<script>");
    					script.println("alert('입력이 안된 사항이 있습니다.')");
    					script.println("history.back()");
    					script.println("</script>");
    				} else {
    					
    					
    					UserDAO userDAO = new UserDAO();
    					int result = userDAO.profileUpdate(request.getParameter("userName"),request.getParameter("userJumin"),request.getParameter("userJumin2"), userID ,request.getParameter("userPassword")
    							,request.getParameter("quiz"),request.getParameter("quiz2"),request.getParameter("userEmail"),request.getParameter("userPhone")
    							,request.getParameter("userPhone2"),request.getParameter("userPhone3"));
    					
    					if (result == -1) {
    						PrintWriter script = response.getWriter();
    						script.println("<script>");
    						script.println("alert('회원정보 수정에 실패했습니다. 비밀번호가 틀렸습니다.')");
    						script.println("history.back()");
    						script.println("</script>");
    					}
    					else {
    						PrintWriter script = response.getWriter();
    						script.println("<script>");
    						script.println("alert('회원정보 수정에 성공하였습니다.')");
    						script.println("location.href = 'profileformal.jsp'");
    						script.println("</script>");
    					}
    					
    				}
    			}
    	%>

</body>
</html>