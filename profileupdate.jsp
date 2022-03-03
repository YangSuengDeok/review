<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type = "text/css" href="css/join.css">   
<script	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
    
<title>회원정보수정 양식 </title>
</head>
<script type="text/javascript">

// 비밀번호 일치
function passwordCheckFunction() {
	var userPassword1 = $('#userPassword1').val();
	var userPassword2 = $('#userPassword2').val();
	if(userPassword1 != userPassword2) {
		$('#passwordCheckMessage').html('비밀번호가 서로 일치 하지 않습니다.');
	} else {
		$('#passwordCheckMessage').html('');
	}
}

//특수 문자 체크 
function checkSpecial(userID) { 
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;
    if(pattern_spc.test(userID)) {
        return true;
    } else {
        return false;
    }
}
function checkSpecial(userName) { 
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;
    if(pattern_spc.test(userName)) {
        return true;
    } else {
        return false;
    }
}

function join(){
	var userID = document.getElementById("userID").value;
	var userName = document.getElementById("userName").value;
	var userJumin = document.getElementById("userJumin").value;
	var userJumin2 = document.getElementById("userJumin2").value;
	var userPhone = document.getElementById("userPhone").value;
	var userPhone2 = document.getElementById("userPhone2").value;
	var userPhone3 = document.getElementById("userPhone3").value;
	var userPassword = document.getElementById("userPassword").value;
	
	if(checkSpecial(userID)){
		//특수문자있음
		alert("ID에 특수문자가 있습니다.");
		document.getElementById("userID").focus();
		return;
	}
	if(checkSpecial(userName)){
		//특수문자있음
		alert("이름에 특수문자가 있습니다.");
		document.getElementById("userName").focus();
		return;
	}
	
	if(isNaN(userJumin)){
		alert("주민번호는 숫자만 입력해주세요.");
		document.getElementById("userJumin").focus();
		return;
	}
	if(isNaN(userJumin2)){
		alert("주민번호는 숫자만 입력해주세요.");
		document.getElementById("userJumin2").focus();
		return;
	}
	if(isNaN(userPhone)){
		alert("핸드폰번호는 숫자만 입력해주세요.1");
		document.getElementById("userPhone").focus();
		return;
	}
	if(isNaN(userPhone2)){
		alert("핸드폰번호는 숫자만 입력해주세요.2");
		document.getElementById("userPhone2").focus();
		return;
	}
	if(isNaN(userPhone3)){
		alert("핸드폰번호는 숫자만 입력해주세요.3");
		document.getElementById("userPhone3").focus();
		return;
	}
	
	document.getElementById("userPassword").value = sha256(userPassword);
    var joinForm = document.joinForm;
    joinForm.submit();
}
</script>
<body>

<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}else if (session.getAttribute("userID") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		User user = new UserDAO().getUser(userID);
	%>

    <h1>
        <span>회</span> <span>원</span> <span>정</span> <span>보</span> <span>수</span> <span>정</span> <span>양</span> <span>식</span>
    </h1>
    <form action="profileupdateAction.jsp" method="post"> <!-- ./userUpdate -->
        <hr>
        <table align="center">
            <tr>
                <td colspan="2">
                    <h3>
                        아이디와 비밀번호가 일치 시 수정이 됩니다.
                        <br>(유의하십시오.) 
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
    <td><input type="text" name="userName" id="name" value="<%=user.getUserName()%>"> <span id="a">*</span></td>
    </tr>
    <tr>
    <th class ="pad"> 주민등록번호 </th>
    <td><input type="text" maxlength="6" name="userJumin" id="juminnum" value="<%=user.getUserJumin() %>"> 
    - <input type="password" maxlength="7" name="userJumin2" id="juminnum2" value="<%=user.getUserJumin2() %>"></td>
    </tr>
    <tr>
    <th class ="pad"> 아이디 </th>
    <td><h5>
    	<%= user.getUserID() %></h5>
    	<input type="hidden" name="userID" value="<%= user.getUserID() %>" readonly>
	</td>
    <!--  <td id="a"><input type="text" name="userID" id="id"> * 영문/숫자 (7~12자)</td> -->
    </tr>
    <tr>
    <th class ="pad"> 패스워드 </th>
        <td><input type="password" name="userPassword" id="password"> <span id="a">*</span></td>
    </tr>
    <tr>
    <th class ="pad">본인 질문</th>
        <td>
           <select name="quiz"  value="<%=user.getQuiz() %>">
            <option value="" selected > 원하는 질문을 선택하세요.</option>
            <option value="당신이 태어난 지역은?">당신이 태어난 지역은?</option>
            <option value="당신이 좋아하는 음식은?">당신이 좋아하는 음식은?</option>
            <option value="당신이 좋아하는 선수는?">당신이 좋아하는 선수는?</option>
            <option value="당신의 초등학교는?">당신의 초등학교는?</option>
        </select>
        </td>
    </tr>
    <tr>
        <th class="pad">본인 질문 답변</th>
        <td><input type="text" name="quiz2" value="<%=user.getQuiz2() %>"></td>
    </tr>
    <tr>
    <th class ="pad"> E-mail </th>
    <td><input type="text" name="userEmail" id="email" value="<%=user.getUserEmail() %>"> </td>
    </tr>
    <tr>
    <th class ="pad"> 휴대폰 번호 </th>
    <td>
    	<select  name="userPhone" id="phonenum1" value="<%=user.getUserPhone() %>">
    		<option value=""> 직접입력 </option>
   			<option value="010"> 010 </option>
    		<option value="011"> 011 </option></select>
    	<input type="text" size="5" maxlength="4" name="userPhone2" id="phonenum2" value="<%=user.getUserPhone2() %>">-
    	<input type="text" maxlength="4" size="5" name="userPhone3" id="phonenum3" value="<%=user.getUserPhone3() %>">
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
    <input type="submit"  value="수정">
    <input type="button" onclick="location.href='index.jsp'" value="취소">
    <input type="reset" value="다시쓰기">
    </td>
    </tr>
    </table>
    </form>
</body>
</html>