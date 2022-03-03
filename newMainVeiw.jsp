<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="mainRiveiw.mainRiveiw" %>
<%@ page import="mainRiveiw.mainRiveiwDAO" %>
<%@ page import="comment.comment" %>
<%@ page import="comment.commentDAO" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 shrink-to-fit=no">
    <title>요리보고 저리뷰 고</title>
    <script src="./js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href= "./css/star.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type = "text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type = "text/css" href="./css/riveiw.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="./js/star2.js"></script>
    
    
    <style>
    	#star {
  			display: flex;
			}

		.star {
  			font-size: 2rem;
  			margin: 10px 0;
  			cursor: pointer;
			}

		.star:not(.on) {
  			color: #ccc;
			}

		.star.on {
  			color: orange;
			}
    </style>
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
		script.println("location.href = 'newriveiw.jsp'");
		script.println("</script>");
	}
	mainRiveiw mainRiveiw = new mainRiveiwDAO().getMainRiveiw(mainRiveiwID);
%>

<div class="btn3">
        <span class="fas fa-bars"></span>
    </div>
<nav class="sidebar">
    <div class="text">Menu</div>
        <ul>
            <li><a href="main.jsp">Home</a></li>
            <li><a href="#" class="info-btn">내 정보
                <span class="fas fa-caret-down first"></span>
            </a>
            <ul class="info-show">
                <li><a href="#">내 정보</a></li>
                <li><a href="#">내 즐겨찾기</a></li>
                <li class="active"><a href="#">내 게시글</a></li>
            </ul>
            </li>
            <li><a href="map.jsp" target="_blank">지도</a></li>
            <li><a href="#" class="s-btn">설정
                <span class="fas fa-caret-down second"></span>
            </a>
            <ul class="s-show">
                <li><a href="#">알림</a></li>
                <li><a href="#">보안</a></li>
                <li><a href="customer.jsp" target="_blank">고객센터</a></li>
            </ul>
            </li>
        </ul>
    
</nav>

<script>
    $('.btn3').click(function(){
        $(this).toggleClass("click");
        $('.sidebar').toggleClass("show");
    });
    $('.info-btn3').click(function(){
        $('nav ul .info-show').toggleClass("show");
        $('nav ul .first').toggleClass("rotate");
    });
    $('.s-btn3').click(function(){
        $('nav ul .s-show').toggleClass("show1");
        $('nav ul .second').toggleClass("rotate");
    });
    $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
    });
</script>
	
	<div class="container">
		<form action="commentWriteAction.jsp" method="post">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">리뷰 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width">이미지</td>
							<td colspan="2"><img src="${pageContext.request.contextPath}/upload/<%= mainRiveiw.getReg_img() %>" width="300" height="300"></td>
						</tr>
						<tr>
							<td>리뷰 번호</td>
							<td colspan="2" style="min-height: 200px; text-glign: left;"><%= mainRiveiwID %><input name="mainRiveiwID" value="<%= mainRiveiwID %>" hidden="hidden"></td>
						<tr>
						<tr>
							<td>카테고리</td>
							<td colspan="2"><%= mainRiveiw.getKategori() %></td>
						</tr>
						<tr>
							<td>리뷰 내용</td>
							<td colspan="2" style="min-height: 200px; text-glign: left;"><%= mainRiveiw.getMainCentent() %></td>
						<tr>
						<tr>
							<td>조회수</td>
							<td colspan="2"><%= mainRiveiw.getBbsCount() +1%></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td><%= mainRiveiw.getReg_date().substring(0, 11) + mainRiveiw.getReg_date().substring(11, 13) + "시" + mainRiveiw.getReg_date().substring(14, 16) + "분" %></td>
						</tr>
						<tr>
							<td colspan="2"><textarea class="form-control" placeholder="댓글을 작성하세요." name="commentText" maxlength="100"></textarea>
							<div class="starpoint_wrap">
  							<div class="starpoint_box">
    							<label for="starpoint_1" class="label_star" title="1"><span class="blind">1점</span></label>
    							<label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
							    <label for="starpoint_3" class="label_star" title="2"><span class="blind">2점</span></label>
							    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
							    <label for="starpoint_5" class="label_star" title="3"><span class="blind">3점</span></label>
							    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
							    <label for="starpoint_7" class="label_star" title="4"><span class="blind">4점</span></label>
							    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
							    <label for="starpoint_9" class="label_star" title="5"><span class="blind">5점</span></label>
							    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
							    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
							    <input type="radio" name="star1" id="starpoint_2" class="star_radio" value="★">
							    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
							    <input type="radio" name="star1" id="starpoint_4" class="star_radio" value="★★">
							    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
							    <input type="radio" name="star1" id="starpoint_6" class="star_radio" value="★★★">
							    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
							    <input type="radio" name="star1" id="starpoint_8" class="star_radio" value="★★★★">
							    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
							    <input type="radio" name="star1" id="starpoint_10" class="star_radio" value="★★★★★">
							    <span class="starpoint_bg"></span>
							  </div>
							</div>				
							<input type="submit" value="작성"></td>
							
						
						</tr>
					</tbody>				
				</table>
				<table>
					<%
						commentDAO commentDAO = new commentDAO();
						ArrayList<comment> list = commentDAO.getList(mainRiveiwID);
						for(int i = 0; i < list.size(); i++){
					%>
						<tr>
							<td>댓글내용 : <%=list.get(i).getCommentText() %>&nbsp;</td>
							<td>작성자 : <%=list.get(i).getUserID() %>&nbsp;</td>
							<td>작성일 : <%=list.get(i).getReg_date() %>&nbsp;</td>
							<td>별점 : <%=list.get(i).getStar1() %>&nbsp;</td>
						</tr>
					<%} %>
				</table>
				<a href="newriveiw.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(mainRiveiw.getUserID())) {
				%>
						<a href="mainUpdate.jsp?mainRiveiwID=<%= mainRiveiwID %>" class="btn btn-primary">수정</a>
						<a onclick="return confirm('이 내용을 삭제하시겠습니까?')" href="mainDeleteAction.jsp?mainRiveiwID=<%= mainRiveiwID %>" class="btn btn-primary">삭제</a>
				<%
					}
				%>
				
			</div>
		</form>
	</div>

	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.js"></script>
</body>
</html>