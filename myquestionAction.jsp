<%@ page import="java.sql.*" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String quiz=request.getParameter("quiz");
	String quiz2=request.getParameter("quiz2");
	String userID=request.getParameter("userID");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RIVEIW?serverTimezone=UTC","root","21811028");

	String sql = "SELECT userPassword FROM USER WHERE userID=? and quiz2=?";
	PreparedStatement pstmt= con.prepareStatement(sql);
	pstmt.setString(1, userID);
	pstmt.setString(2, quiz2);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		String ruserPassword = rs.getString("userPassword");
		
	
		out.println("��й�ȣ�� [" + ruserPassword + "] �Դϴ�.");
		
		}
	else
		out.println("����");
	rs.close();
	pstmt.close();
	con.close();



%>