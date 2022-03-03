<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
    <title>요리보고 저리뷰 고</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" type = "text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type = "text/css" href="./css/newIndex.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

   <div class="btn">
        <span class="fas fa-bars"></span>
    </div>
<nav class="sidebar">
    <div class="text">Menu</div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#profile.jsp" class="info-btn">내 정보
                <span class="fas fa-caret-down first"></span>
            </a>
            <ul class="info-show">
                <li><a href="profile.jsp">프로필</a></li>
                <li><a href="profileformal.jsp">프로필 설정</a></li>
                <li><a href="riveiw.jsp">내 게시글</a></li>
            </ul>
            </li>
            <li><a href="map2.html" target="_blank">지도</a></li>
            <li><a href="#" class="s-btn">설정
                <span class="fas fa-caret-down second"></span>
            </a>
            <ul class="s-show">
                <li><a href="#">알림</a></li>
                <li><a href="customer.jsp">고객센터</a></li>
            </ul>
            </li>
        </ul>
    
</nav>

<div class="categorybtn">
        <span class="fas fa-search"></span>
    </div>
<nav class="categorysidebar">
    <div class="categorytext">Category</div>
        <ul>
                
                <li><a href=""><i class="fas fa-shopping-basket"></i>&nbsp;편의점/마트</a></li>
                <li><a href=""><i class="fas fa-store"></i>&nbsp;음식점</a></li>
                <li><a href=""><i class="fas fa-walking"></i>&nbsp;&nbsp;운동</a></li>
                <li><a href=""><i class="fas fa-home"></i>&nbsp;문화시설</a></li>
                <li><a href=""><i class="fas fa-train"></i>&nbsp;&nbsp;교통</a></li>
                <li><a href=""><i class="fas fa-kiwi-bird"></i>&nbsp;기타</a></li>
               
                
        </ul>
    
</nav>
<script>
    $('.btn').click(function(){
        $(this).toggleClass("click");
        $('.sidebar').toggleClass("show");
    });
    $('.info-btn').click(function(){
        $('nav ul .info-show').toggleClass("show");
        $('nav ul .first').toggleClass("rotate");
    });
    $('.s-btn').click(function(){
        $('nav ul .s-show').toggleClass("show1");
        $('nav ul .second').toggleClass("rotate");
    });
    $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
    });
    
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
			<p>저리뷰 고</p>
			<ul>
				<li><a href="index.jsp">home</a></li>
				<li><a href="riveiw.jsp">게시판</a></li>
				<li><a href="customer.jsp">고객센터</a></li>
			</ul>
		</header>
		<hr size ="5" width="100%" align="center" color="black" id="h">
	
    <table class="wi">
        <tr>
        	<td>
        		<input class="wibtn1" type="button" value="리뷰게시판" onclick="location.href='newriveiw.jsp'">&nbsp;
        	</td>
        	<td>
        		<input class="wibtn2" type="button" value="리뷰쓰기" onclick="location.href='mainWrite.jsp'">&nbsp;
        	</td>
            <td>
                <h6 class="active"><a href="login.jsp"> 로그인 </a></h6>
            </td>
            <td>
                <h6 class="active1"><a href="join.jsp"> 회원가입 </a></h6>
            </td>
        </tr>
    </table>
    
    
	
    
   
    	<table class="reviewbox">
    	<tr>
    	<td>
    		<table class="reviewbox1">
    		<tr  class="reviewtext1">
    		<td>최신 리뷰</td>
    		</tr>
    		<%
  			Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RIVEIW?serverTimezone=UTC","root","root");
    		
    		String sql = "select * from mainriveiw order by reg_date desc;";
    		PreparedStatement pstmt= con.prepareStatement(sql);
    		ResultSet rs = pstmt.executeQuery();
  
    			for(int i=0; i<3; i++){	
    				if(rs.next()){
    					String rreg_img = rs.getString("reg_img");
    					String ruserID = rs.getString("userID");
    					String rkategori = rs.getString("kategori");
    					String rmainCentent = rs.getString("mainCentent");
    					String rreg_date =rs.getString("reg_date");
    					String rbbsCount = rs.getString("bbsCount");    
			%>
    		<tr class="reviewarea">
    				<td ><img class="reviewimg" src="${pageContext.request.contextPath}/upload/<%=rreg_img %>"></td>
    				<td class="reviewtext2">
    				&nbsp;&nbsp;아이디 : <%= ruserID %><br> 
    				&nbsp;&nbsp;카테고리 : <%= rkategori %> <br> 
    				&nbsp;&nbsp;내용 : <%= rmainCentent %> <br><br> <br> <br> <br> <br> <br> <br>  
    				&nbsp;&nbsp;업로드 : <%= rreg_date %> &nbsp;&nbsp;조회수 : <%= rbbsCount %>
    				</td>
    		</tr>
    		<%		}
    			}
    		%>
    	</table>
    	</td>
    		
    		<td>
    			<table class="reviewbox1">
    			<tr class="reviewtext1">
    			<td>조회수 높은 리뷰</td>
    			</tr>
    			<%
    			sql = "select * from mainriveiw order by bbsCount desc;";
    			pstmt= con.prepareStatement(sql);
    			rs = pstmt.executeQuery();
    			for(int i=0; i<3; i++){	
    			if(rs.next()){
    			String treg_img = rs.getString("reg_img");
    			String tuserID = rs.getString("userID");
    			String tkategori = rs.getString("kategori");
    			String tmainCentent = rs.getString("mainCentent");
    			String treg_date =rs.getString("reg_date");
    			String tbbsCount = rs.getString("bbsCount");%>
    			<tr class="reviewarea">
    				<td ><img class="reviewimg" src="${pageContext.request.contextPath}/upload/<%=treg_img %>"></td>
    				<td class="reviewtext2">
    				&nbsp;&nbsp;아이디 : <%= tuserID %><br> 
    				&nbsp;&nbsp;카테고리 : <%= tkategori %> <br> 
    				&nbsp;&nbsp;내용 : <%= tmainCentent %> <br><br> <br> <br> <br> <br> <br> <br> <br>  
    				&nbsp;&nbsp;업로드 : <%= treg_date %> &nbsp;&nbsp;조회수 : <%= tbbsCount %>
    				</td>
    			</tr>
    			<%		} 
    			}
    			%>
    		</table>
    	</td>
    	</tr>	
    	</table>
    
  <% 
    	rs.close();
    	pstmt.close();
    	con.close();
   %>
    
    <script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>