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
			<p><font size="5px">������ ��</font></p>
			<ul>
				<li><a href="index.jsp">home</a></li>
				<li><a href="riveiw.jsp">�Խ���</a></li>
				<li><a href="customer.jsp">������</a></li>
			</ul>
		</header>
	</div>

	<h1>
        <span>ȸ</span> <span>��</span> <span>��</span> <span>��</span>
    </h1>

	<div class="btn">
        <span class="fas fa-bars"></span>
    </div>
<nav class="sidebar">
    <div class="text">Menu</div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#profile.jsp" class="info-btn">�� ����
                <span class="fas fa-caret-down first"></span>
            </a>
            <ul class="info-show">
                <li><a href="profile.jsp">������</a></li>
                <li><a href="profileformal.jsp">������ ����</a></li>
                <li><a href="riveiw.jsp">�� �Խñ�</a></li>
            </ul>
            </li>
            <li><a href="map2.html" target="_blank">����</a></li>
            <li><a href="#" class="s-btn">����
                <span class="fas fa-caret-down second"></span>
            </a>
            <ul class="s-show">
                <li><a href="#">�˸�</a></li>
                <li><a href="customer.jsp">������</a></li>
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
                        �Ʒ��� �ִ� ������� �Է��Ͽ� ȸ������ �Ͻñ� �ٶ��ϴ�.
                        <br>(* ǥ�ô� �ʼ��Է� ���� �Դϴ�.) 
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
    <th class ="pad"> �̸� </th>
    <td id="a"><input type="text" name="userName" id="name"> *</td>
    </tr>
    <tr>
    <th class ="pad"> �ֹε�Ϲ�ȣ </th>
    <td><input type="text" maxlength="6" name="userJumin" id="juminnum"> - <input type="password" maxlength="7" name="userJumin2" id="juminnum2"></td>
    </tr>
    <tr>
    <th class ="pad"> ���̵� </th>
    <td id="a"><input type="text" name="userID" id="id"> * ����/���� (7~12��)</td>
    </tr>
    <tr>
    <th class ="pad"> �н����� </th>
        <td id="a"><input type="password" name="userPassword" id="password"> *</td>
    </tr>
    <tr>
    <th class ="pad">���� ����</th>
        <td>
           <select name="quiz">
            <option value="" checked> ���ϴ� ������ �����ϼ���.</option>
            <option value="����� �¾ ������?">����� �¾ ������?</option>
            <option value="����� �����ϴ� ������?">����� �����ϴ� ������?</option>
            <option value="����� �����ϴ� ������?">����� �����ϴ� ������?</option>
            <option value="����� �ʵ��б���?">����� �ʵ��б���?</option>
        </select>
        </td>
    </tr>
    <tr>
        <th class="pad">���� ���� �亯</th>
        <td><input type="text" name="quiz2"></td>
    </tr>
    <tr>
    <th class ="pad"> E-mail </th>
    <td><input type="text" name="userEmail" id="userEmail"></td>
    </tr>
    <tr>
    <th class ="pad"> �޴��� ��ȣ </th>
    <td>
    	<select  name="userPhone" id="phonenum1">
    		<option value=""> �����Է� </option>
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
    <th colspan="2" class="pad">���� ������ �� �̿뿡 ���� �ſ� ����帳�ϴ�.</th>
    </tr>
    <tr height="5" bgcolor="#fbbc05">
    <td colspan="2">
    </td>
    </tr>
    <tr>
    <td colspan="2" align="center" class="pad">
    <input type="submit"  value="ȸ������">
    <input type="button" onclick="location.href='index.jsp'" value="���">
    <input type="reset" value="�ٽþ���">
    </td>
    </tr>
    </table>
    </form>


 	<script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>