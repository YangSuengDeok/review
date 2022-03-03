<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr");%>
<%
String userName= request.getParameter("userName");
String userJumin= request.getParameter("userJumin");
String userJumin2= request.getParameter("userJumin2");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RIVEIW?serverTimezone=UTC","root","root");

String sql = "SELECT userID FROM USER WHERE userName=? and userJumin=? and userJumin2=?";
PreparedStatement pstmt= con.prepareStatement(sql);
pstmt.setString(1, userName);
pstmt.setString(2, userJumin);
pstmt.setString(3, userJumin2);
ResultSet rs = pstmt.executeQuery();
if(rs.next()){
	String ruserID = rs.getString("userID");
	out.println(userName + " 님의 아이디는 " + ruserID + " 입니다.");
}
else
	out.println("실패");
rs.close();
pstmt.close();
con.close();

%>