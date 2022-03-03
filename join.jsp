<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" type = "text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type = "text/css" href="./css/joinn.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

	<div class="container">
		<header>
			<p><font size="5px">저리뷰 고</font></p>
			<ul>
				<li><a href="index.jsp">home</a></li>
				<li><a href="riveiw.jsp">게시판</a></li>
				<li><a href="customer.jsp">고객센터</a></li>
			</ul>
		</header>
	</div>

	<h1>
        <span>회</span> <span>원</span> <span>가</span> <span>입</span>
    </h1>

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
</script>

<form action="joinAction.jsp" method="post">
        <hr>
        <table align="center">
            <tr>
                <td colspan="2">
                    <h3>
                        아래의 있는 내용들을 입력하여 회원가입 하시길 바랍니다.
                        <br>(* 표시는 필수입력 사항 입니다.) 
                    </h3>
                </td>
            </tr>
        </table>
        <hr>
        <br>
    <table align="center" id="b">
    <br>
    <tr height="5" bgcolor="#fbbc05">
    <td colspan="2"></td>
    </tr>
    <tr>
    <th class ="pad"> 이름 </th>
    <td id="a"><input type="text" name="userName" id="name"> *</td>
    </tr>
    <tr>
    <th class ="pad"> 주민등록번호 </th>
    <td><input type="text" maxlength="6" name="userJumin" id="juminnum"> - <input type="password" maxlength="7" name="userJumin2" id="juminnum2"></td>
    </tr>
    <tr>
    <th class ="pad"> 아이디 </th>
    <td id="a"><input type="text" name="userID" id="id"> * 영문/숫자 (7~12자)</td>
    </tr>
    <tr>
    <th class ="pad"> 패스워드 </th>
        <td id="a"><input type="password" name="userPassword" id="password"> *</td>
    </tr>
    <tr>
    <th class ="pad">본인 질문</th>
        <td>
           <select name="quiz">
            <option value="" checked> 원하는 질문을 선택하세요.</option>
            <option value="당신이 태어난 지역은?">당신이 태어난 지역은?</option>
            <option value="당신이 좋아하는 음식은?">당신이 좋아하는 음식은?</option>
            <option value="당신이 좋아하는 선수는?">당신이 좋아하는 선수는?</option>
            <option value="당신의 초등학교는?">당신의 초등학교는?</option>
        </select>
        </td>
    </tr>
    <tr>
        <th class="pad">본인 질문 답변</th>
        <td><input type="text" name="quiz2"></td>
    </tr>
    <tr>
    <th class ="pad"> E-mail </th>
    <td><input type="text" name="userEmail" id="userEmail"></td>
    </tr>
    <tr>
    <th class ="pad"> 휴대폰 번호 </th>
    <td>
    	<select  name="userPhone" id="phonenum1">
    		<option value=""> 직접입력 </option>
   			<option value="010"> 010 </option>
    		<option value="011"> 011 </option></select>
    	<input type="text" size="5" maxlength="4" name="userPhone2" id="phonenum2">-<input type="text" maxlength="4" size="5" name="userPhone3" id="phonenum3">
    </td>
    </tr>
    <tr height="5" bgcolor="#fbbc05">
    <td colspan="2">
    </td>
    </tr>
    <tr>
    <th colspan="2" class="pad">저희 저리뷰 고 이용에 대해 매우 감사드립니다.</th>
    </tr>
    <tr height="5" bgcolor="#fbbc05">
    <td colspan="2">
    </td>
    </tr>
    <tr>
    <td colspan="2" align="center" class="pad">
    <input type="submit"  value="회원가입">
    <input type="button" onclick="location.href='index.jsp'" value="취소">
    <input type="reset" value="다시쓰기">
    </td>
    </tr>
    </table>
    </form>


 	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>