<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�丮���� ������ ��</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/customerr.css">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>


<div class="btn5">
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
            <li><a href="#" class="s-btn5">����
                <span class="fas fa-caret-down second"></span>
            </a>
            <ul class="s-show">
                <li><a href="#">�˸�</a></li>
                <li><a href="customer.jsp">������</a></li>
            </ul>
            </li>
        </ul>
    
</nav>

	<div class="container">
		<header2>
			<p><font size="5px">������ ��</font></p>
			<ul>
				<li><a href="index.jsp">home</a></li>
				<li><a href="riveiw.jsp">�Խ���</a></li>
				<li><a href="customer.jsp">������</a></li>
			</ul>
		</header2>
		<hr size ="5" whidth="100%" align="center" color="black" id="h">
	
<script>
    $('.btn5').click(function(){
        $(this).toggleClass("click");
        $('.sidebar').toggleClass("show");
    });
    $('.info-btn').click(function(){
        $('nav ul .info-show').toggleClass("show");
        $('nav ul .first').toggleClass("rotate");
    });
    $('.s-btn5').click(function(){
        $('nav ul .s-show').toggleClass("show1");
        $('nav ul .second').toggleClass("rotate");
    });
    $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
    });
</script>

    <div class="box">
    
        <div class="header"> ������ </div>
        <form action="https://www.google.com/search" method="GET">
            <div class="mx-auto mt-5 search-bar input-group mb-3">
                <input name="q" type="text" class="rounded-pill form-control" placeholder="���� ���� ���� �˻��Ͻÿ�." aria-label="Recipient's username" aria-describedby="button-addon2">
            </div>
        </form>

    <div class="spot"><h3>��������</h3> <span><a href="index.jsp" align="left">Ȩ���� ���ư��ϴ�.</a></span></div><br>

    <div class="container">
    	<center>
        <h4 align="left">�ʿ��� ���񽺸� �����ϼ���.</h4>
        </center>
    </div>

    <div class="content" align="left">
        <span class="tit">���� ����</span> 
        <span class="tit_m">(�Ʒ��� ��ũ���� �̿����ּ���.)</span>
    </div>
    <div align="left">
        <ul>
            <li><a href="forgotID.jsp"> ������ ID/PW ã�� </a></li>
            <li><a href="Security.jsp"> PWADDWORD ���� </a></li>
            <li><a href="profileupdate.jsp"> ���� ���� </a></li>
        </ul>
    </div>

    <div class="content" align="left">
        <span class="tit">�Ű���</span> 
        <span class="tit_m">(���� �Ǵ� ħ�ؿ� ���� �Խù��� �߰� �� �Ű� ���ּ���.)</span>
    </div>
	<ul align="left">
		<a href="report.jsp"><button type="submit" class="btn btn-danger">�Ű��ϱ�</button></a>
		<!--
		<li><a href="report.jsp" name="���ع� ���� �Ű�"> ���ع� ���� �Ű� </a></li>
        <li><a href="#"> ���۱� ħ�� �Ű� </a></li>
        <li><a href="#"> �� �Ѽ� �Ű� </a></li>
        <li><a href="#"> ���� ���� �Ű� </a></li>
        -->
    </ul>
    </div>
            
    <script src="./js/jquery.min.js"></script>
    <script src="./js/pooper.js"></script>
    <script src="./js/bootstrap.min.js"></script>        
</body>
</html>