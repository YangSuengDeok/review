<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr");%>
<%
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");
String usernewPassword1 = request.getParameter("usernewPassword1");
String usernewPassword2 = request.getParameter("usernewPassword2");


Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RIVEIW?serverTimezone=UTC","root","21811028");

String sql = "SELECT userID, userPassword FROM USER WHERE userID=? and userPassword=?";
PreparedStatement pstmt= conn.prepareStatement(sql);
pstmt.setString(1, userID);
pstmt.setString(2, userPassword);
ResultSet rs = pstmt.executeQuery();

if(rs.next()){
	String ruserID = rs.getString("userID");
	String ruserPassword = rs.getString("userPassword");
	
	if(userID.equals(ruserID)&&userPassword.equals(ruserPassword)){
		if(usernewPassword1.equals(usernewPassword2)){
			sql = "UPDATE USER SET userPassword=? WHERE userID=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, usernewPassword1);
			pstmt.setString(2, userID);
			pstmt.executeUpdate();
			out.println("비밀번호가 변경되었습니다.");
		}
		else{
			out.println("새 비밀번호가 일치하지 않습니다.");
		}
	}
	else{
		out.println("아이디와 현재 비밀번호가 일치하지 않습니다.");
	}
}
rs.close();
pstmt.close();
conn.close();
		
%>